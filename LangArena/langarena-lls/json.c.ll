; ModuleID = 'c/src/json.c'
source_filename = "c/src/json.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.JsonGenerateData = type { ptr, i64, ptr, i32 }
%struct.Coord = type { double, double, double, [64 x i8], i32, i8 }
%struct.yyjson_mut_doc = type { ptr, %struct.yyjson_alc, %struct.yyjson_str_pool, %struct.yyjson_val_pool }
%struct.yyjson_alc = type { ptr, ptr, ptr, ptr }
%struct.yyjson_str_pool = type { ptr, ptr, i64, i64, ptr }
%struct.yyjson_val_pool = type { ptr, ptr, i64, i64, ptr }
%struct.yyjson_mut_val = type { i64, %union.yyjson_val_uni, ptr }
%union.yyjson_val_uni = type { i64 }
%struct.yyjson_val = type { i64, %union.yyjson_val_uni }
%struct.JsonParseDomData = type { ptr, i32, i64 }
%struct.yyjson_doc = type { ptr, %struct.yyjson_alc, i64, i64, ptr }
%struct.JsonParseMappingData = type { ptr, i32, i64 }

@.str = private unnamed_addr constant [8 x i8] c"%.7f %u\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"coordinates\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"opts\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@INFO_STR = internal global ptr @.str.14, align 8
@.str.9 = private unnamed_addr constant [16 x i8] c"{\22coordinates\22:\00", align 1
@.str.10 = private unnamed_addr constant [15 x i8] c"Json::Generate\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"coords\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Json::ParseDom\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Json::ParseMapping\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"some info\00", align 1

define dso_local void @JsonGenerate_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %18

12:                                               ; preds = %1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %16, i32 0, i32 0
  store ptr null, ptr %17, align 8
  br label %18

18:                                               ; preds = %12, %1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %29

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %26)
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %27, i32 0, i32 2
  store ptr null, ptr %28, align 8
  br label %29

29:                                               ; preds = %23, %18
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %30, i32 0, i32 1
  %32 = load i64, ptr %31, align 8
  %33 = mul i64 %32, 96
  %34 = call noalias ptr @malloc(i64 noundef %33)
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %35, i32 0, i32 0
  store ptr %34, ptr %36, align 8
  store i64 0, ptr %4, align 8
  br label %37

37:                                               ; preds = %90, %29
  %38 = load i64, ptr %4, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %39, i32 0, i32 1
  %41 = load i64, ptr %40, align 8
  %42 = icmp slt i64 %38, %41
  br i1 %42, label %43, label %93

43:                                               ; preds = %37
  %44 = call double @Helper_next_float(double noundef 1.000000e+00)
  %45 = call double @round_to_8_digits(double noundef %44)
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = load i64, ptr %4, align 8
  %50 = getelementptr inbounds %struct.Coord, ptr %48, i64 %49
  %51 = getelementptr inbounds nuw %struct.Coord, ptr %50, i32 0, i32 0
  store double %45, ptr %51, align 8
  %52 = call double @Helper_next_float(double noundef 1.000000e+00)
  %53 = call double @round_to_8_digits(double noundef %52)
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %54, i32 0, i32 0
  %56 = load ptr, ptr %55, align 8
  %57 = load i64, ptr %4, align 8
  %58 = getelementptr inbounds %struct.Coord, ptr %56, i64 %57
  %59 = getelementptr inbounds nuw %struct.Coord, ptr %58, i32 0, i32 1
  store double %53, ptr %59, align 8
  %60 = call double @Helper_next_float(double noundef 1.000000e+00)
  %61 = call double @round_to_8_digits(double noundef %60)
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i64, ptr %4, align 8
  %66 = getelementptr inbounds %struct.Coord, ptr %64, i64 %65
  %67 = getelementptr inbounds nuw %struct.Coord, ptr %66, i32 0, i32 2
  store double %61, ptr %67, align 8
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %68, i32 0, i32 0
  %70 = load ptr, ptr %69, align 8
  %71 = load i64, ptr %4, align 8
  %72 = getelementptr inbounds %struct.Coord, ptr %70, i64 %71
  %73 = getelementptr inbounds nuw %struct.Coord, ptr %72, i32 0, i32 3
  %74 = getelementptr inbounds [64 x i8], ptr %73, i64 0, i64 0
  %75 = call double @Helper_next_float(double noundef 1.000000e+00)
  %76 = call i32 @Helper_next_int(i32 noundef 10000)
  %77 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %74, i64 noundef 64, ptr noundef @.str, double noundef %75, i32 noundef %76)
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %78, i32 0, i32 0
  %80 = load ptr, ptr %79, align 8
  %81 = load i64, ptr %4, align 8
  %82 = getelementptr inbounds %struct.Coord, ptr %80, i64 %81
  %83 = getelementptr inbounds nuw %struct.Coord, ptr %82, i32 0, i32 4
  store i32 1, ptr %83, align 8
  %84 = load ptr, ptr %3, align 8
  %85 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %84, i32 0, i32 0
  %86 = load ptr, ptr %85, align 8
  %87 = load i64, ptr %4, align 8
  %88 = getelementptr inbounds %struct.Coord, ptr %86, i64 %87
  %89 = getelementptr inbounds nuw %struct.Coord, ptr %88, i32 0, i32 5
  store i8 1, ptr %89, align 4
  br label %90

90:                                               ; preds = %43
  %91 = load i64, ptr %4, align 8
  %92 = add nsw i64 %91, 1
  store i64 %92, ptr %4, align 8
  br label %37, !llvm.loop !6

93:                                               ; preds = %37
  %94 = load ptr, ptr %3, align 8
  %95 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %94, i32 0, i32 3
  store i32 0, ptr %95, align 8
  ret void
}

declare void @free(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define internal double @round_to_8_digits(double noundef %0) {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  %4 = fmul double %3, 1.000000e+08
  %5 = call double @llvm.round.f64(double %4)
  %6 = fdiv double %5, 1.000000e+08
  ret double %6
}

declare double @Helper_next_float(double noundef)

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare i32 @Helper_next_int(i32 noundef)

define dso_local void @JsonGenerate_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i8, align 1
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i64, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i8, align 1
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i8, align 1
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i8, align 1
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i8, align 1
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i8, align 1
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i64, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i64, align 8
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i64, align 8
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca ptr, align 8
  %67 = alloca i64, align 8
  %68 = alloca ptr, align 8
  %69 = alloca ptr, align 8
  %70 = alloca i8, align 1
  %71 = alloca i8, align 1
  %72 = alloca i64, align 8
  %73 = alloca i64, align 8
  %74 = alloca ptr, align 8
  %75 = alloca double, align 8
  %76 = alloca ptr, align 8
  %77 = alloca i8, align 1
  %78 = alloca i8, align 1
  %79 = alloca i64, align 8
  %80 = alloca i64, align 8
  %81 = alloca ptr, align 8
  %82 = alloca double, align 8
  %83 = alloca ptr, align 8
  %84 = alloca i8, align 1
  %85 = alloca i8, align 1
  %86 = alloca i64, align 8
  %87 = alloca i64, align 8
  %88 = alloca ptr, align 8
  %89 = alloca double, align 8
  %90 = alloca ptr, align 8
  %91 = alloca i8, align 1
  %92 = alloca i8, align 1
  %93 = alloca i64, align 8
  %94 = alloca i64, align 8
  %95 = alloca ptr, align 8
  %96 = alloca i8, align 1
  %97 = alloca i8, align 1
  %98 = alloca i64, align 8
  %99 = alloca i64, align 8
  %100 = alloca ptr, align 8
  %101 = alloca i8, align 1
  %102 = alloca i8, align 1
  %103 = alloca i64, align 8
  %104 = alloca i64, align 8
  %105 = alloca ptr, align 8
  %106 = alloca i8, align 1
  %107 = alloca i8, align 1
  %108 = alloca i64, align 8
  %109 = alloca i64, align 8
  %110 = alloca ptr, align 8
  %111 = alloca i8, align 1
  %112 = alloca i8, align 1
  %113 = alloca i64, align 8
  %114 = alloca i64, align 8
  %115 = alloca ptr, align 8
  %116 = alloca i8, align 1
  %117 = alloca i8, align 1
  %118 = alloca i64, align 8
  %119 = alloca i64, align 8
  %120 = alloca ptr, align 8
  %121 = alloca i8, align 1
  %122 = alloca i8, align 1
  %123 = alloca i64, align 8
  %124 = alloca i64, align 8
  %125 = alloca ptr, align 8
  %126 = alloca i8, align 1
  %127 = alloca i8, align 1
  %128 = alloca i64, align 8
  %129 = alloca i64, align 8
  %130 = alloca ptr, align 8
  %131 = alloca i8, align 1
  %132 = alloca i8, align 1
  %133 = alloca i64, align 8
  %134 = alloca i64, align 8
  %135 = alloca ptr, align 8
  %136 = alloca i8, align 1
  %137 = alloca i8, align 1
  %138 = alloca i64, align 8
  %139 = alloca i64, align 8
  %140 = alloca i1, align 1
  %141 = alloca ptr, align 8
  %142 = alloca i64, align 8
  %143 = alloca i8, align 1
  %144 = alloca i8, align 1
  %145 = alloca i8, align 1
  %146 = alloca i8, align 1
  %147 = alloca i8, align 1
  %148 = alloca i8, align 1
  %149 = alloca i8, align 1
  %150 = alloca i8, align 1
  %151 = alloca i8, align 1
  %152 = alloca i8, align 1
  %153 = alloca i8, align 1
  %154 = alloca i8, align 1
  %155 = alloca i8, align 1
  %156 = alloca i8, align 1
  %157 = alloca i8, align 1
  %158 = alloca i8, align 1
  %159 = alloca i8, align 1
  %160 = alloca i8, align 1
  %161 = alloca i8, align 1
  %162 = alloca i8, align 1
  %163 = alloca i8, align 1
  %164 = alloca i8, align 1
  %165 = alloca i8, align 1
  %166 = alloca i8, align 1
  %167 = alloca i8, align 1
  %168 = alloca i8, align 1
  %169 = alloca i8, align 1
  %170 = alloca i8, align 1
  %171 = alloca i8, align 1
  %172 = alloca i8, align 1
  %173 = alloca i8, align 1
  %174 = alloca i8, align 1
  %175 = alloca i1, align 1
  %176 = alloca ptr, align 8
  %177 = alloca i64, align 8
  %178 = alloca i8, align 1
  %179 = alloca i8, align 1
  %180 = alloca i8, align 1
  %181 = alloca i8, align 1
  %182 = alloca i8, align 1
  %183 = alloca i8, align 1
  %184 = alloca i8, align 1
  %185 = alloca i8, align 1
  %186 = alloca i8, align 1
  %187 = alloca i8, align 1
  %188 = alloca i8, align 1
  %189 = alloca i8, align 1
  %190 = alloca i8, align 1
  %191 = alloca i8, align 1
  %192 = alloca i8, align 1
  %193 = alloca i8, align 1
  %194 = alloca i8, align 1
  %195 = alloca i8, align 1
  %196 = alloca i8, align 1
  %197 = alloca i8, align 1
  %198 = alloca i8, align 1
  %199 = alloca i8, align 1
  %200 = alloca i8, align 1
  %201 = alloca i8, align 1
  %202 = alloca i8, align 1
  %203 = alloca i8, align 1
  %204 = alloca i8, align 1
  %205 = alloca i8, align 1
  %206 = alloca i8, align 1
  %207 = alloca i8, align 1
  %208 = alloca i8, align 1
  %209 = alloca i8, align 1
  %210 = alloca i1, align 1
  %211 = alloca ptr, align 8
  %212 = alloca i64, align 8
  %213 = alloca i8, align 1
  %214 = alloca i8, align 1
  %215 = alloca i8, align 1
  %216 = alloca i8, align 1
  %217 = alloca i8, align 1
  %218 = alloca i8, align 1
  %219 = alloca i8, align 1
  %220 = alloca i8, align 1
  %221 = alloca i8, align 1
  %222 = alloca i8, align 1
  %223 = alloca i8, align 1
  %224 = alloca i8, align 1
  %225 = alloca i8, align 1
  %226 = alloca i8, align 1
  %227 = alloca i8, align 1
  %228 = alloca i8, align 1
  %229 = alloca i8, align 1
  %230 = alloca i8, align 1
  %231 = alloca i8, align 1
  %232 = alloca i8, align 1
  %233 = alloca i8, align 1
  %234 = alloca i8, align 1
  %235 = alloca i8, align 1
  %236 = alloca i8, align 1
  %237 = alloca i8, align 1
  %238 = alloca i8, align 1
  %239 = alloca i8, align 1
  %240 = alloca i8, align 1
  %241 = alloca i8, align 1
  %242 = alloca i8, align 1
  %243 = alloca i8, align 1
  %244 = alloca i8, align 1
  %245 = alloca i1, align 1
  %246 = alloca ptr, align 8
  %247 = alloca i64, align 8
  %248 = alloca i8, align 1
  %249 = alloca i8, align 1
  %250 = alloca i8, align 1
  %251 = alloca i8, align 1
  %252 = alloca i8, align 1
  %253 = alloca i8, align 1
  %254 = alloca i8, align 1
  %255 = alloca i8, align 1
  %256 = alloca i8, align 1
  %257 = alloca i8, align 1
  %258 = alloca i8, align 1
  %259 = alloca i8, align 1
  %260 = alloca i8, align 1
  %261 = alloca i8, align 1
  %262 = alloca i8, align 1
  %263 = alloca i8, align 1
  %264 = alloca i8, align 1
  %265 = alloca i8, align 1
  %266 = alloca i8, align 1
  %267 = alloca i8, align 1
  %268 = alloca i8, align 1
  %269 = alloca i8, align 1
  %270 = alloca i8, align 1
  %271 = alloca i8, align 1
  %272 = alloca i8, align 1
  %273 = alloca i8, align 1
  %274 = alloca i8, align 1
  %275 = alloca i8, align 1
  %276 = alloca i8, align 1
  %277 = alloca i8, align 1
  %278 = alloca i8, align 1
  %279 = alloca i8, align 1
  %280 = alloca i1, align 1
  %281 = alloca ptr, align 8
  %282 = alloca i64, align 8
  %283 = alloca i8, align 1
  %284 = alloca i8, align 1
  %285 = alloca i8, align 1
  %286 = alloca i8, align 1
  %287 = alloca i8, align 1
  %288 = alloca i8, align 1
  %289 = alloca i8, align 1
  %290 = alloca i8, align 1
  %291 = alloca i8, align 1
  %292 = alloca i8, align 1
  %293 = alloca i8, align 1
  %294 = alloca i8, align 1
  %295 = alloca i8, align 1
  %296 = alloca i8, align 1
  %297 = alloca i8, align 1
  %298 = alloca i8, align 1
  %299 = alloca i8, align 1
  %300 = alloca i8, align 1
  %301 = alloca i8, align 1
  %302 = alloca i8, align 1
  %303 = alloca i8, align 1
  %304 = alloca i8, align 1
  %305 = alloca i8, align 1
  %306 = alloca i8, align 1
  %307 = alloca i8, align 1
  %308 = alloca i8, align 1
  %309 = alloca i8, align 1
  %310 = alloca i8, align 1
  %311 = alloca i8, align 1
  %312 = alloca i8, align 1
  %313 = alloca i8, align 1
  %314 = alloca i8, align 1
  %315 = alloca i1, align 1
  %316 = alloca ptr, align 8
  %317 = alloca i64, align 8
  %318 = alloca i8, align 1
  %319 = alloca i8, align 1
  %320 = alloca i8, align 1
  %321 = alloca i8, align 1
  %322 = alloca i8, align 1
  %323 = alloca i8, align 1
  %324 = alloca i8, align 1
  %325 = alloca i8, align 1
  %326 = alloca i8, align 1
  %327 = alloca i8, align 1
  %328 = alloca i8, align 1
  %329 = alloca i8, align 1
  %330 = alloca i8, align 1
  %331 = alloca i8, align 1
  %332 = alloca i8, align 1
  %333 = alloca i8, align 1
  %334 = alloca i8, align 1
  %335 = alloca i8, align 1
  %336 = alloca i8, align 1
  %337 = alloca i8, align 1
  %338 = alloca i8, align 1
  %339 = alloca i8, align 1
  %340 = alloca i8, align 1
  %341 = alloca i8, align 1
  %342 = alloca i8, align 1
  %343 = alloca i8, align 1
  %344 = alloca i8, align 1
  %345 = alloca i8, align 1
  %346 = alloca i8, align 1
  %347 = alloca i8, align 1
  %348 = alloca i8, align 1
  %349 = alloca i8, align 1
  %350 = alloca i1, align 1
  %351 = alloca ptr, align 8
  %352 = alloca i64, align 8
  %353 = alloca i8, align 1
  %354 = alloca i8, align 1
  %355 = alloca i8, align 1
  %356 = alloca i8, align 1
  %357 = alloca i8, align 1
  %358 = alloca i8, align 1
  %359 = alloca i8, align 1
  %360 = alloca i8, align 1
  %361 = alloca i8, align 1
  %362 = alloca i8, align 1
  %363 = alloca i8, align 1
  %364 = alloca i8, align 1
  %365 = alloca i8, align 1
  %366 = alloca i8, align 1
  %367 = alloca i8, align 1
  %368 = alloca i8, align 1
  %369 = alloca i8, align 1
  %370 = alloca i8, align 1
  %371 = alloca i8, align 1
  %372 = alloca i8, align 1
  %373 = alloca i8, align 1
  %374 = alloca i8, align 1
  %375 = alloca i8, align 1
  %376 = alloca i8, align 1
  %377 = alloca i8, align 1
  %378 = alloca i8, align 1
  %379 = alloca i8, align 1
  %380 = alloca i8, align 1
  %381 = alloca i8, align 1
  %382 = alloca i8, align 1
  %383 = alloca i8, align 1
  %384 = alloca i8, align 1
  %385 = alloca i1, align 1
  %386 = alloca ptr, align 8
  %387 = alloca i64, align 8
  %388 = alloca i8, align 1
  %389 = alloca i8, align 1
  %390 = alloca i8, align 1
  %391 = alloca i8, align 1
  %392 = alloca i8, align 1
  %393 = alloca i8, align 1
  %394 = alloca i8, align 1
  %395 = alloca i8, align 1
  %396 = alloca i8, align 1
  %397 = alloca i8, align 1
  %398 = alloca i8, align 1
  %399 = alloca i8, align 1
  %400 = alloca i8, align 1
  %401 = alloca i8, align 1
  %402 = alloca i8, align 1
  %403 = alloca i8, align 1
  %404 = alloca i8, align 1
  %405 = alloca i8, align 1
  %406 = alloca i8, align 1
  %407 = alloca i8, align 1
  %408 = alloca i8, align 1
  %409 = alloca i8, align 1
  %410 = alloca i8, align 1
  %411 = alloca i8, align 1
  %412 = alloca i8, align 1
  %413 = alloca i8, align 1
  %414 = alloca i8, align 1
  %415 = alloca i8, align 1
  %416 = alloca i8, align 1
  %417 = alloca i8, align 1
  %418 = alloca i8, align 1
  %419 = alloca i8, align 1
  %420 = alloca i1, align 1
  %421 = alloca ptr, align 8
  %422 = alloca i64, align 8
  %423 = alloca i8, align 1
  %424 = alloca i8, align 1
  %425 = alloca i8, align 1
  %426 = alloca i8, align 1
  %427 = alloca i8, align 1
  %428 = alloca i8, align 1
  %429 = alloca i8, align 1
  %430 = alloca i8, align 1
  %431 = alloca i8, align 1
  %432 = alloca i8, align 1
  %433 = alloca i8, align 1
  %434 = alloca i8, align 1
  %435 = alloca i8, align 1
  %436 = alloca i8, align 1
  %437 = alloca i8, align 1
  %438 = alloca i8, align 1
  %439 = alloca i8, align 1
  %440 = alloca i8, align 1
  %441 = alloca i8, align 1
  %442 = alloca i8, align 1
  %443 = alloca i8, align 1
  %444 = alloca i8, align 1
  %445 = alloca i8, align 1
  %446 = alloca i8, align 1
  %447 = alloca i8, align 1
  %448 = alloca i8, align 1
  %449 = alloca i8, align 1
  %450 = alloca i8, align 1
  %451 = alloca i8, align 1
  %452 = alloca i8, align 1
  %453 = alloca i8, align 1
  %454 = alloca i8, align 1
  %455 = alloca i1, align 1
  %456 = alloca ptr, align 8
  %457 = alloca i64, align 8
  %458 = alloca i8, align 1
  %459 = alloca i8, align 1
  %460 = alloca i8, align 1
  %461 = alloca i8, align 1
  %462 = alloca i8, align 1
  %463 = alloca i8, align 1
  %464 = alloca i8, align 1
  %465 = alloca i8, align 1
  %466 = alloca i8, align 1
  %467 = alloca i8, align 1
  %468 = alloca i8, align 1
  %469 = alloca i8, align 1
  %470 = alloca i8, align 1
  %471 = alloca i8, align 1
  %472 = alloca i8, align 1
  %473 = alloca i8, align 1
  %474 = alloca i8, align 1
  %475 = alloca i8, align 1
  %476 = alloca i8, align 1
  %477 = alloca i8, align 1
  %478 = alloca i8, align 1
  %479 = alloca i8, align 1
  %480 = alloca i8, align 1
  %481 = alloca i8, align 1
  %482 = alloca i8, align 1
  %483 = alloca i8, align 1
  %484 = alloca i8, align 1
  %485 = alloca i8, align 1
  %486 = alloca i8, align 1
  %487 = alloca i8, align 1
  %488 = alloca i8, align 1
  %489 = alloca i8, align 1
  %490 = alloca ptr, align 8
  %491 = alloca ptr, align 8
  %492 = alloca i64, align 8
  %493 = alloca i8, align 1
  %494 = alloca i8, align 1
  %495 = alloca ptr, align 8
  %496 = alloca ptr, align 8
  %497 = alloca i64, align 8
  %498 = alloca i8, align 1
  %499 = alloca i8, align 1
  %500 = alloca ptr, align 8
  %501 = alloca ptr, align 8
  %502 = alloca i64, align 8
  %503 = alloca i8, align 1
  %504 = alloca i8, align 1
  %505 = alloca ptr, align 8
  %506 = alloca ptr, align 8
  %507 = alloca i64, align 8
  %508 = alloca i8, align 1
  %509 = alloca i8, align 1
  %510 = alloca ptr, align 8
  %511 = alloca ptr, align 8
  %512 = alloca i64, align 8
  %513 = alloca i8, align 1
  %514 = alloca i8, align 1
  %515 = alloca ptr, align 8
  %516 = alloca ptr, align 8
  %517 = alloca i64, align 8
  %518 = alloca i8, align 1
  %519 = alloca i8, align 1
  %520 = alloca ptr, align 8
  %521 = alloca ptr, align 8
  %522 = alloca i64, align 8
  %523 = alloca i8, align 1
  %524 = alloca i8, align 1
  %525 = alloca ptr, align 8
  %526 = alloca ptr, align 8
  %527 = alloca i64, align 8
  %528 = alloca i8, align 1
  %529 = alloca i8, align 1
  %530 = alloca ptr, align 8
  %531 = alloca ptr, align 8
  %532 = alloca i64, align 8
  %533 = alloca i8, align 1
  %534 = alloca i8, align 1
  %535 = alloca ptr, align 8
  %536 = alloca i64, align 8
  %537 = alloca i64, align 8
  %538 = alloca ptr, align 8
  %539 = alloca i64, align 8
  %540 = alloca i64, align 8
  %541 = alloca ptr, align 8
  %542 = alloca i64, align 8
  %543 = alloca i64, align 8
  %544 = alloca ptr, align 8
  %545 = alloca i64, align 8
  %546 = alloca i64, align 8
  %547 = alloca ptr, align 8
  %548 = alloca i64, align 8
  %549 = alloca i64, align 8
  %550 = alloca ptr, align 8
  %551 = alloca i64, align 8
  %552 = alloca i64, align 8
  %553 = alloca ptr, align 8
  %554 = alloca i64, align 8
  %555 = alloca i64, align 8
  %556 = alloca ptr, align 8
  %557 = alloca i64, align 8
  %558 = alloca i64, align 8
  %559 = alloca ptr, align 8
  %560 = alloca i64, align 8
  %561 = alloca i64, align 8
  %562 = alloca ptr, align 8
  %563 = alloca i64, align 8
  %564 = alloca i64, align 8
  %565 = alloca ptr, align 8
  %566 = alloca i64, align 8
  %567 = alloca i64, align 8
  %568 = alloca ptr, align 8
  %569 = alloca i8, align 1
  %570 = alloca ptr, align 8
  %571 = alloca ptr, align 8
  %572 = alloca i8, align 1
  %573 = alloca ptr, align 8
  %574 = alloca ptr, align 8
  %575 = alloca i8, align 1
  %576 = alloca ptr, align 8
  %577 = alloca ptr, align 8
  %578 = alloca i8, align 1
  %579 = alloca ptr, align 8
  %580 = alloca ptr, align 8
  %581 = alloca i8, align 1
  %582 = alloca ptr, align 8
  %583 = alloca ptr, align 8
  %584 = alloca i8, align 1
  %585 = alloca ptr, align 8
  %586 = alloca ptr, align 8
  %587 = alloca i8, align 1
  %588 = alloca ptr, align 8
  %589 = alloca ptr, align 8
  %590 = alloca i8, align 1
  %591 = alloca ptr, align 8
  %592 = alloca ptr, align 8
  %593 = alloca i8, align 1
  %594 = alloca ptr, align 8
  %595 = alloca i8, align 1
  %596 = alloca ptr, align 8
  %597 = alloca i8, align 1
  %598 = alloca ptr, align 8
  %599 = alloca i8, align 1
  %600 = alloca ptr, align 8
  %601 = alloca i8, align 1
  %602 = alloca ptr, align 8
  %603 = alloca i8, align 1
  %604 = alloca ptr, align 8
  %605 = alloca i8, align 1
  %606 = alloca ptr, align 8
  %607 = alloca i8, align 1
  %608 = alloca ptr, align 8
  %609 = alloca ptr, align 8
  %610 = alloca ptr, align 8
  %611 = alloca ptr, align 8
  %612 = alloca ptr, align 8
  %613 = alloca ptr, align 8
  %614 = alloca ptr, align 8
  %615 = alloca ptr, align 8
  %616 = alloca ptr, align 8
  %617 = alloca ptr, align 8
  %618 = alloca ptr, align 8
  %619 = alloca ptr, align 8
  %620 = alloca ptr, align 8
  %621 = alloca ptr, align 8
  %622 = alloca ptr, align 8
  %623 = alloca ptr, align 8
  %624 = alloca ptr, align 8
  %625 = alloca ptr, align 8
  %626 = alloca ptr, align 8
  %627 = alloca ptr, align 8
  %628 = alloca ptr, align 8
  %629 = alloca ptr, align 8
  %630 = alloca i64, align 8
  %631 = alloca ptr, align 8
  %632 = alloca ptr, align 8
  %633 = alloca ptr, align 8
  %634 = alloca ptr, align 8
  %635 = alloca ptr, align 8
  %636 = alloca i64, align 8
  %637 = alloca ptr, align 8
  %638 = alloca ptr, align 8
  %639 = alloca ptr, align 8
  %640 = alloca ptr, align 8
  %641 = alloca ptr, align 8
  %642 = alloca i64, align 8
  %643 = alloca ptr, align 8
  %644 = alloca ptr, align 8
  %645 = alloca ptr, align 8
  %646 = alloca ptr, align 8
  %647 = alloca ptr, align 8
  %648 = alloca i64, align 8
  %649 = alloca ptr, align 8
  %650 = alloca ptr, align 8
  %651 = alloca ptr, align 8
  %652 = alloca ptr, align 8
  %653 = alloca ptr, align 8
  %654 = alloca i64, align 8
  %655 = alloca ptr, align 8
  %656 = alloca ptr, align 8
  %657 = alloca ptr, align 8
  %658 = alloca ptr, align 8
  %659 = alloca ptr, align 8
  %660 = alloca i64, align 8
  %661 = alloca ptr, align 8
  %662 = alloca ptr, align 8
  %663 = alloca ptr, align 8
  %664 = alloca ptr, align 8
  %665 = alloca ptr, align 8
  %666 = alloca i64, align 8
  %667 = alloca ptr, align 8
  %668 = alloca ptr, align 8
  %669 = alloca ptr, align 8
  %670 = alloca ptr, align 8
  %671 = alloca ptr, align 8
  %672 = alloca i64, align 8
  %673 = alloca ptr, align 8
  %674 = alloca ptr, align 8
  %675 = alloca ptr, align 8
  %676 = alloca ptr, align 8
  %677 = alloca ptr, align 8
  %678 = alloca ptr, align 8
  %679 = alloca ptr, align 8
  %680 = alloca ptr, align 8
  %681 = alloca ptr, align 8
  %682 = alloca ptr, align 8
  %683 = alloca ptr, align 8
  %684 = alloca ptr, align 8
  %685 = alloca ptr, align 8
  %686 = alloca ptr, align 8
  %687 = alloca ptr, align 8
  %688 = alloca ptr, align 8
  %689 = alloca ptr, align 8
  %690 = alloca ptr, align 8
  %691 = alloca ptr, align 8
  %692 = alloca ptr, align 8
  %693 = alloca i64, align 8
  %694 = alloca ptr, align 8
  %695 = alloca ptr, align 8
  %696 = alloca ptr, align 8
  %697 = alloca ptr, align 8
  %698 = alloca ptr, align 8
  %699 = alloca i64, align 8
  %700 = alloca ptr, align 8
  %701 = alloca ptr, align 8
  %702 = alloca ptr, align 8
  %703 = alloca ptr, align 8
  %704 = alloca ptr, align 8
  %705 = alloca i64, align 8
  %706 = alloca ptr, align 8
  %707 = alloca ptr, align 8
  %708 = alloca ptr, align 8
  %709 = alloca ptr, align 8
  %710 = alloca ptr, align 8
  %711 = alloca i64, align 8
  %712 = alloca ptr, align 8
  %713 = alloca ptr, align 8
  %714 = alloca ptr, align 8
  %715 = alloca ptr, align 8
  %716 = alloca ptr, align 8
  %717 = alloca i64, align 8
  %718 = alloca ptr, align 8
  %719 = alloca ptr, align 8
  %720 = alloca ptr, align 8
  %721 = alloca ptr, align 8
  %722 = alloca ptr, align 8
  %723 = alloca i64, align 8
  %724 = alloca ptr, align 8
  %725 = alloca ptr, align 8
  %726 = alloca ptr, align 8
  %727 = alloca ptr, align 8
  %728 = alloca ptr, align 8
  %729 = alloca i64, align 8
  %730 = alloca ptr, align 8
  %731 = alloca ptr, align 8
  %732 = alloca ptr, align 8
  %733 = alloca ptr, align 8
  %734 = alloca ptr, align 8
  %735 = alloca i64, align 8
  %736 = alloca ptr, align 8
  %737 = alloca ptr, align 8
  %738 = alloca ptr, align 8
  %739 = alloca ptr, align 8
  %740 = alloca ptr, align 8
  %741 = alloca i64, align 8
  %742 = alloca ptr, align 8
  %743 = alloca ptr, align 8
  %744 = alloca ptr, align 8
  %745 = alloca ptr, align 8
  %746 = alloca ptr, align 8
  %747 = alloca i64, align 8
  %748 = alloca ptr, align 8
  %749 = alloca ptr, align 8
  %750 = alloca ptr, align 8
  %751 = alloca ptr, align 8
  %752 = alloca ptr, align 8
  %753 = alloca i64, align 8
  %754 = alloca ptr, align 8
  %755 = alloca ptr, align 8
  %756 = alloca ptr, align 8
  %757 = alloca ptr, align 8
  %758 = alloca ptr, align 8
  %759 = alloca i64, align 8
  %760 = alloca ptr, align 8
  %761 = alloca ptr, align 8
  %762 = alloca ptr, align 8
  %763 = alloca ptr, align 8
  %764 = alloca ptr, align 8
  %765 = alloca i64, align 8
  %766 = alloca ptr, align 8
  %767 = alloca ptr, align 8
  %768 = alloca ptr, align 8
  %769 = alloca ptr, align 8
  %770 = alloca ptr, align 8
  %771 = alloca i64, align 8
  %772 = alloca ptr, align 8
  %773 = alloca ptr, align 8
  %774 = alloca ptr, align 8
  %775 = alloca ptr, align 8
  %776 = alloca ptr, align 8
  %777 = alloca i64, align 8
  %778 = alloca ptr, align 8
  %779 = alloca ptr, align 8
  %780 = alloca ptr, align 8
  %781 = alloca ptr, align 8
  %782 = alloca ptr, align 8
  %783 = alloca i64, align 8
  %784 = alloca ptr, align 8
  %785 = alloca ptr, align 8
  %786 = alloca ptr, align 8
  %787 = alloca ptr, align 8
  %788 = alloca ptr, align 8
  %789 = alloca i64, align 8
  %790 = alloca ptr, align 8
  %791 = alloca ptr, align 8
  %792 = alloca ptr, align 8
  %793 = alloca ptr, align 8
  %794 = alloca ptr, align 8
  %795 = alloca i64, align 8
  %796 = alloca ptr, align 8
  %797 = alloca ptr, align 8
  %798 = alloca ptr, align 8
  %799 = alloca ptr, align 8
  %800 = alloca i32, align 4
  %801 = alloca ptr, align 8
  %802 = alloca i1, align 1
  %803 = alloca ptr, align 8
  %804 = alloca ptr, align 8
  %805 = alloca i64, align 8
  %806 = alloca ptr, align 8
  %807 = alloca ptr, align 8
  %808 = alloca i1, align 1
  %809 = alloca ptr, align 8
  %810 = alloca ptr, align 8
  %811 = alloca i64, align 8
  %812 = alloca ptr, align 8
  %813 = alloca ptr, align 8
  %814 = alloca i1, align 1
  %815 = alloca ptr, align 8
  %816 = alloca ptr, align 8
  %817 = alloca i64, align 8
  %818 = alloca ptr, align 8
  %819 = alloca ptr, align 8
  %820 = alloca i1, align 1
  %821 = alloca ptr, align 8
  %822 = alloca ptr, align 8
  %823 = alloca i8, align 1
  %824 = alloca ptr, align 8
  %825 = alloca i1, align 1
  %826 = alloca ptr, align 8
  %827 = alloca ptr, align 8
  %828 = alloca i64, align 8
  %829 = alloca ptr, align 8
  %830 = alloca ptr, align 8
  %831 = alloca ptr, align 8
  %832 = alloca ptr, align 8
  %833 = alloca ptr, align 8
  %834 = alloca i64, align 8
  %835 = alloca i8, align 1
  %836 = alloca i8, align 1
  %837 = alloca ptr, align 8
  %838 = alloca ptr, align 8
  %839 = alloca ptr, align 8
  %840 = alloca double, align 8
  %841 = alloca ptr, align 8
  %842 = alloca ptr, align 8
  %843 = alloca ptr, align 8
  %844 = alloca double, align 8
  %845 = alloca ptr, align 8
  %846 = alloca ptr, align 8
  %847 = alloca ptr, align 8
  %848 = alloca double, align 8
  %849 = alloca ptr, align 8
  %850 = alloca ptr, align 8
  %851 = alloca ptr, align 8
  %852 = alloca ptr, align 8
  %853 = alloca ptr, align 8
  %854 = alloca ptr, align 8
  %855 = alloca ptr, align 8
  %856 = alloca ptr, align 8
  %857 = alloca ptr, align 8
  %858 = alloca ptr, align 8
  %859 = alloca ptr, align 8
  %860 = alloca ptr, align 8
  %861 = alloca ptr, align 8
  %862 = alloca ptr, align 8
  %863 = alloca ptr, align 8
  %864 = alloca ptr, align 8
  %865 = alloca ptr, align 8
  %866 = alloca ptr, align 8
  %867 = alloca ptr, align 8
  %868 = alloca ptr, align 8
  %869 = alloca ptr, align 8
  %870 = alloca ptr, align 8
  %871 = alloca ptr, align 8
  %872 = alloca ptr, align 8
  %873 = alloca ptr, align 8
  %874 = alloca ptr, align 8
  %875 = alloca ptr, align 8
  %876 = alloca ptr, align 8
  %877 = alloca ptr, align 8
  %878 = alloca ptr, align 8
  %879 = alloca ptr, align 8
  %880 = alloca ptr, align 8
  %881 = alloca ptr, align 8
  %882 = alloca ptr, align 8
  %883 = alloca ptr, align 8
  %884 = alloca ptr, align 8
  %885 = alloca ptr, align 8
  %886 = alloca i1, align 1
  %887 = alloca ptr, align 8
  %888 = alloca ptr, align 8
  %889 = alloca ptr, align 8
  %890 = alloca i1, align 1
  %891 = alloca ptr, align 8
  %892 = alloca ptr, align 8
  %893 = alloca ptr, align 8
  %894 = alloca i1, align 1
  %895 = alloca ptr, align 8
  %896 = alloca ptr, align 8
  %897 = alloca ptr, align 8
  %898 = alloca i1, align 1
  %899 = alloca ptr, align 8
  %900 = alloca ptr, align 8
  %901 = alloca ptr, align 8
  %902 = alloca i1, align 1
  %903 = alloca ptr, align 8
  %904 = alloca ptr, align 8
  %905 = alloca ptr, align 8
  %906 = alloca i1, align 1
  %907 = alloca ptr, align 8
  %908 = alloca ptr, align 8
  %909 = alloca ptr, align 8
  %910 = alloca i1, align 1
  %911 = alloca ptr, align 8
  %912 = alloca ptr, align 8
  %913 = alloca ptr, align 8
  %914 = alloca i1, align 1
  %915 = alloca ptr, align 8
  %916 = alloca ptr, align 8
  %917 = alloca ptr, align 8
  %918 = alloca ptr, align 8
  %919 = alloca ptr, align 8
  %920 = alloca ptr, align 8
  %921 = alloca ptr, align 8
  %922 = alloca ptr, align 8
  %923 = alloca ptr, align 8
  %924 = alloca ptr, align 8
  %925 = alloca ptr, align 8
  %926 = alloca ptr, align 8
  %927 = alloca ptr, align 8
  %928 = alloca ptr, align 8
  %929 = alloca ptr, align 8
  %930 = alloca ptr, align 8
  %931 = alloca ptr, align 8
  %932 = alloca ptr, align 8
  %933 = alloca ptr, align 8
  %934 = alloca ptr, align 8
  %935 = alloca ptr, align 8
  %936 = alloca i32, align 4
  %937 = alloca ptr, align 8
  %938 = alloca ptr, align 8
  %939 = alloca ptr, align 8
  %940 = alloca ptr, align 8
  %941 = alloca i64, align 8
  %942 = alloca ptr, align 8
  %943 = alloca ptr, align 8
  %944 = alloca ptr, align 8
  %945 = alloca ptr, align 8
  store ptr %0, ptr %935, align 8
  store i32 %1, ptr %936, align 4
  %946 = load i32, ptr %936, align 4
  %947 = load ptr, ptr %935, align 8
  %948 = getelementptr inbounds nuw %struct.Benchmark, ptr %947, i32 0, i32 11
  %949 = load ptr, ptr %948, align 8
  store ptr %949, ptr %937, align 8
  %950 = load ptr, ptr %937, align 8
  %951 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %950, i32 0, i32 2
  %952 = load ptr, ptr %951, align 8
  %953 = icmp ne ptr %952, null
  br i1 %953, label %954, label %960

954:                                              ; preds = %2
  %955 = load ptr, ptr %937, align 8
  %956 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %955, i32 0, i32 2
  %957 = load ptr, ptr %956, align 8
  call void @free(ptr noundef %957)
  %958 = load ptr, ptr %937, align 8
  %959 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %958, i32 0, i32 2
  store ptr null, ptr %959, align 8
  br label %960

960:                                              ; preds = %954, %2
  %961 = call ptr @yyjson_mut_doc_new(ptr noundef null)
  store ptr %961, ptr %938, align 8
  %962 = load ptr, ptr %938, align 8
  %963 = icmp ne ptr %962, null
  br i1 %963, label %965, label %964

964:                                              ; preds = %960
  br label %11613

965:                                              ; preds = %960
  %966 = load ptr, ptr %938, align 8
  store ptr %966, ptr %927, align 8
  %967 = load ptr, ptr %927, align 8
  %968 = icmp ne ptr %967, null
  %969 = xor i1 %968, true
  %970 = zext i1 %968 to i32
  %971 = sext i32 %970 to i64
  br i1 %968, label %972, label %1022

972:                                              ; preds = %965
  %973 = load ptr, ptr %927, align 8
  store ptr %973, ptr %704, align 8
  store i64 1, ptr %705, align 8
  %974 = load ptr, ptr %704, align 8
  %975 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %974, i32 0, i32 1
  store ptr %975, ptr %707, align 8
  %976 = load ptr, ptr %704, align 8
  %977 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %976, i32 0, i32 3
  store ptr %977, ptr %708, align 8
  %978 = load ptr, ptr %708, align 8
  %979 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %978, i32 0, i32 1
  %980 = load ptr, ptr %979, align 8
  %981 = load ptr, ptr %708, align 8
  %982 = load ptr, ptr %981, align 8
  %983 = ptrtoint ptr %980 to i64
  %984 = ptrtoint ptr %982 to i64
  %985 = sub i64 %983, %984
  %986 = sdiv exact i64 %985, 24
  %987 = load i64, ptr %705, align 8
  %988 = icmp ult i64 %986, %987
  %989 = xor i1 %988, true
  %990 = zext i1 %988 to i32
  %991 = sext i32 %990 to i64
  br i1 %988, label %992, label %1003

992:                                              ; preds = %972
  %993 = load ptr, ptr %708, align 8
  %994 = load ptr, ptr %707, align 8
  %995 = load i64, ptr %705, align 8
  %996 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %993, ptr noundef %994, i64 noundef %995)
  %997 = xor i1 %996, true
  %998 = xor i1 %996, true
  %999 = zext i1 %998 to i32
  %1000 = sext i32 %999 to i64
  br i1 %998, label %1001, label %1002

1001:                                             ; preds = %992
  store ptr null, ptr %703, align 8
  br label %1011

1002:                                             ; preds = %992
  br label %1003

1003:                                             ; preds = %1002, %972
  %1004 = load ptr, ptr %708, align 8
  %1005 = load ptr, ptr %1004, align 8
  store ptr %1005, ptr %706, align 8
  %1006 = load i64, ptr %705, align 8
  %1007 = load ptr, ptr %708, align 8
  %1008 = load ptr, ptr %1007, align 8
  %1009 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %1008, i64 %1006
  store ptr %1009, ptr %1007, align 8
  %1010 = load ptr, ptr %706, align 8
  store ptr %1010, ptr %703, align 8
  br label %1011

1011:                                             ; preds = %1001, %1003
  %1012 = load ptr, ptr %703, align 8
  store ptr %1012, ptr %928, align 8
  %1013 = load ptr, ptr %928, align 8
  %1014 = icmp ne ptr %1013, null
  %1015 = xor i1 %1014, true
  %1016 = zext i1 %1014 to i32
  %1017 = sext i32 %1016 to i64
  br i1 %1014, label %1018, label %1021

1018:                                             ; preds = %1011
  %1019 = load ptr, ptr %928, align 8
  store i64 7, ptr %1019, align 8
  %1020 = load ptr, ptr %928, align 8
  store ptr %1020, ptr %926, align 8
  br label %1023

1021:                                             ; preds = %1011
  br label %1022

1022:                                             ; preds = %1021, %965
  store ptr null, ptr %926, align 8
  br label %1023

1023:                                             ; preds = %1018, %1022
  %1024 = load ptr, ptr %926, align 8
  store ptr %1024, ptr %939, align 8
  %1025 = load ptr, ptr %938, align 8
  %1026 = load ptr, ptr %939, align 8
  store ptr %1025, ptr %924, align 8
  store ptr %1026, ptr %925, align 8
  %1027 = load ptr, ptr %924, align 8
  %1028 = icmp ne ptr %1027, null
  br i1 %1028, label %1029, label %1032

1029:                                             ; preds = %1023
  %1030 = load ptr, ptr %925, align 8
  %1031 = load ptr, ptr %924, align 8
  store ptr %1030, ptr %1031, align 8
  br label %1032

1032:                                             ; preds = %1023, %1029
  %1033 = load ptr, ptr %938, align 8
  store ptr %1033, ptr %919, align 8
  %1034 = load ptr, ptr %919, align 8
  %1035 = icmp ne ptr %1034, null
  %1036 = xor i1 %1035, true
  %1037 = zext i1 %1035 to i32
  %1038 = sext i32 %1037 to i64
  br i1 %1035, label %1039, label %1089

1039:                                             ; preds = %1032
  %1040 = load ptr, ptr %919, align 8
  store ptr %1040, ptr %716, align 8
  store i64 1, ptr %717, align 8
  %1041 = load ptr, ptr %716, align 8
  %1042 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %1041, i32 0, i32 1
  store ptr %1042, ptr %719, align 8
  %1043 = load ptr, ptr %716, align 8
  %1044 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %1043, i32 0, i32 3
  store ptr %1044, ptr %720, align 8
  %1045 = load ptr, ptr %720, align 8
  %1046 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %1045, i32 0, i32 1
  %1047 = load ptr, ptr %1046, align 8
  %1048 = load ptr, ptr %720, align 8
  %1049 = load ptr, ptr %1048, align 8
  %1050 = ptrtoint ptr %1047 to i64
  %1051 = ptrtoint ptr %1049 to i64
  %1052 = sub i64 %1050, %1051
  %1053 = sdiv exact i64 %1052, 24
  %1054 = load i64, ptr %717, align 8
  %1055 = icmp ult i64 %1053, %1054
  %1056 = xor i1 %1055, true
  %1057 = zext i1 %1055 to i32
  %1058 = sext i32 %1057 to i64
  br i1 %1055, label %1059, label %1070

1059:                                             ; preds = %1039
  %1060 = load ptr, ptr %720, align 8
  %1061 = load ptr, ptr %719, align 8
  %1062 = load i64, ptr %717, align 8
  %1063 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %1060, ptr noundef %1061, i64 noundef %1062)
  %1064 = xor i1 %1063, true
  %1065 = xor i1 %1063, true
  %1066 = zext i1 %1065 to i32
  %1067 = sext i32 %1066 to i64
  br i1 %1065, label %1068, label %1069

1068:                                             ; preds = %1059
  store ptr null, ptr %715, align 8
  br label %1078

1069:                                             ; preds = %1059
  br label %1070

1070:                                             ; preds = %1069, %1039
  %1071 = load ptr, ptr %720, align 8
  %1072 = load ptr, ptr %1071, align 8
  store ptr %1072, ptr %718, align 8
  %1073 = load i64, ptr %717, align 8
  %1074 = load ptr, ptr %720, align 8
  %1075 = load ptr, ptr %1074, align 8
  %1076 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %1075, i64 %1073
  store ptr %1076, ptr %1074, align 8
  %1077 = load ptr, ptr %718, align 8
  store ptr %1077, ptr %715, align 8
  br label %1078

1078:                                             ; preds = %1068, %1070
  %1079 = load ptr, ptr %715, align 8
  store ptr %1079, ptr %920, align 8
  %1080 = load ptr, ptr %920, align 8
  %1081 = icmp ne ptr %1080, null
  %1082 = xor i1 %1081, true
  %1083 = zext i1 %1081 to i32
  %1084 = sext i32 %1083 to i64
  br i1 %1081, label %1085, label %1088

1085:                                             ; preds = %1078
  %1086 = load ptr, ptr %920, align 8
  store i64 6, ptr %1086, align 8
  %1087 = load ptr, ptr %920, align 8
  store ptr %1087, ptr %918, align 8
  br label %1090

1088:                                             ; preds = %1078
  br label %1089

1089:                                             ; preds = %1088, %1032
  store ptr null, ptr %918, align 8
  br label %1090

1090:                                             ; preds = %1085, %1089
  %1091 = load ptr, ptr %918, align 8
  store ptr %1091, ptr %940, align 8
  %1092 = load ptr, ptr %939, align 8
  %1093 = load ptr, ptr %938, align 8
  store ptr %1093, ptr %851, align 8
  store ptr @.str.1, ptr %852, align 8
  %1094 = load ptr, ptr %851, align 8
  %1095 = icmp ne ptr %1094, null
  br i1 %1095, label %1096, label %1099

1096:                                             ; preds = %1090
  %1097 = load ptr, ptr %852, align 8
  %1098 = icmp ne ptr %1097, null
  br label %1099

1099:                                             ; preds = %1096, %1090
  %1100 = phi i1 [ false, %1090 ], [ %1098, %1096 ]
  %1101 = xor i1 %1100, true
  %1102 = zext i1 %1100 to i32
  %1103 = sext i32 %1102 to i64
  br i1 %1100, label %1104, label %1959

1104:                                             ; preds = %1099
  %1105 = load ptr, ptr %851, align 8
  store ptr %1105, ptr %770, align 8
  store i64 1, ptr %771, align 8
  %1106 = load ptr, ptr %770, align 8
  %1107 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %1106, i32 0, i32 1
  store ptr %1107, ptr %773, align 8
  %1108 = load ptr, ptr %770, align 8
  %1109 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %1108, i32 0, i32 3
  store ptr %1109, ptr %774, align 8
  %1110 = load ptr, ptr %774, align 8
  %1111 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %1110, i32 0, i32 1
  %1112 = load ptr, ptr %1111, align 8
  %1113 = load ptr, ptr %774, align 8
  %1114 = load ptr, ptr %1113, align 8
  %1115 = ptrtoint ptr %1112 to i64
  %1116 = ptrtoint ptr %1114 to i64
  %1117 = sub i64 %1115, %1116
  %1118 = sdiv exact i64 %1117, 24
  %1119 = load i64, ptr %771, align 8
  %1120 = icmp ult i64 %1118, %1119
  %1121 = xor i1 %1120, true
  %1122 = zext i1 %1120 to i32
  %1123 = sext i32 %1122 to i64
  br i1 %1120, label %1124, label %1135

1124:                                             ; preds = %1104
  %1125 = load ptr, ptr %774, align 8
  %1126 = load ptr, ptr %773, align 8
  %1127 = load i64, ptr %771, align 8
  %1128 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %1125, ptr noundef %1126, i64 noundef %1127)
  %1129 = xor i1 %1128, true
  %1130 = xor i1 %1128, true
  %1131 = zext i1 %1130 to i32
  %1132 = sext i32 %1131 to i64
  br i1 %1130, label %1133, label %1134

1133:                                             ; preds = %1124
  store ptr null, ptr %769, align 8
  br label %1143

1134:                                             ; preds = %1124
  br label %1135

1135:                                             ; preds = %1134, %1104
  %1136 = load ptr, ptr %774, align 8
  %1137 = load ptr, ptr %1136, align 8
  store ptr %1137, ptr %772, align 8
  %1138 = load i64, ptr %771, align 8
  %1139 = load ptr, ptr %774, align 8
  %1140 = load ptr, ptr %1139, align 8
  %1141 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %1140, i64 %1138
  store ptr %1141, ptr %1139, align 8
  %1142 = load ptr, ptr %772, align 8
  store ptr %1142, ptr %769, align 8
  br label %1143

1143:                                             ; preds = %1133, %1135
  %1144 = load ptr, ptr %769, align 8
  store ptr %1144, ptr %853, align 8
  %1145 = load ptr, ptr %853, align 8
  %1146 = icmp ne ptr %1145, null
  %1147 = xor i1 %1146, true
  %1148 = zext i1 %1146 to i32
  %1149 = sext i32 %1148 to i64
  br i1 %1146, label %1150, label %1958

1150:                                             ; preds = %1143
  %1151 = load ptr, ptr %853, align 8
  %1152 = load ptr, ptr %852, align 8
  store ptr %1151, ptr %530, align 8
  store ptr %1152, ptr %531, align 8
  %1153 = load ptr, ptr %531, align 8
  %1154 = call i64 @strlen(ptr noundef %1153)
  store i64 %1154, ptr %532, align 8
  %1155 = load ptr, ptr %531, align 8
  %1156 = load i64, ptr %532, align 8
  store ptr %1155, ptr %176, align 8
  store i64 %1156, ptr %177, align 8
  %1157 = load i64, ptr %177, align 8
  %1158 = call i1 @llvm.is.constant.i64(i64 %1157)
  br i1 %1158, label %1159, label %1930

1159:                                             ; preds = %1150
  %1160 = load i64, ptr %177, align 8
  %1161 = icmp ule i64 %1160, 32
  br i1 %1161, label %1162, label %1930

1162:                                             ; preds = %1159
  %1163 = load i64, ptr %177, align 8
  %1164 = icmp ult i64 0, %1163
  br i1 %1164, label %1165, label %1185

1165:                                             ; preds = %1162
  %1166 = load ptr, ptr %176, align 8
  %1167 = load i8, ptr %1166, align 1
  store i8 %1167, ptr %178, align 1
  %1168 = load i8, ptr %178, align 1
  %1169 = sext i8 %1168 to i32
  %1170 = icmp slt i32 %1169, 32
  br i1 %1170, label %1183, label %1171

1171:                                             ; preds = %1165
  %1172 = load i8, ptr %178, align 1
  %1173 = sext i8 %1172 to i32
  %1174 = icmp sgt i32 %1173, 126
  br i1 %1174, label %1183, label %1175

1175:                                             ; preds = %1171
  %1176 = load i8, ptr %178, align 1
  %1177 = sext i8 %1176 to i32
  %1178 = icmp eq i32 %1177, 34
  br i1 %1178, label %1183, label %1179

1179:                                             ; preds = %1175
  %1180 = load i8, ptr %178, align 1
  %1181 = sext i8 %1180 to i32
  %1182 = icmp eq i32 %1181, 92
  br i1 %1182, label %1183, label %1184

1183:                                             ; preds = %1179, %1175, %1171, %1165
  store i1 false, ptr %175, align 1
  br label %1931

1184:                                             ; preds = %1179
  br label %1185

1185:                                             ; preds = %1184, %1162
  %1186 = load i64, ptr %177, align 8
  %1187 = icmp ult i64 1, %1186
  br i1 %1187, label %1188, label %1209

1188:                                             ; preds = %1185
  %1189 = load ptr, ptr %176, align 8
  %1190 = getelementptr inbounds i8, ptr %1189, i64 1
  %1191 = load i8, ptr %1190, align 1
  store i8 %1191, ptr %179, align 1
  %1192 = load i8, ptr %179, align 1
  %1193 = sext i8 %1192 to i32
  %1194 = icmp slt i32 %1193, 32
  br i1 %1194, label %1207, label %1195

1195:                                             ; preds = %1188
  %1196 = load i8, ptr %179, align 1
  %1197 = sext i8 %1196 to i32
  %1198 = icmp sgt i32 %1197, 126
  br i1 %1198, label %1207, label %1199

1199:                                             ; preds = %1195
  %1200 = load i8, ptr %179, align 1
  %1201 = sext i8 %1200 to i32
  %1202 = icmp eq i32 %1201, 34
  br i1 %1202, label %1207, label %1203

1203:                                             ; preds = %1199
  %1204 = load i8, ptr %179, align 1
  %1205 = sext i8 %1204 to i32
  %1206 = icmp eq i32 %1205, 92
  br i1 %1206, label %1207, label %1208

1207:                                             ; preds = %1203, %1199, %1195, %1188
  store i1 false, ptr %175, align 1
  br label %1931

1208:                                             ; preds = %1203
  br label %1209

1209:                                             ; preds = %1208, %1185
  %1210 = load i64, ptr %177, align 8
  %1211 = icmp ult i64 2, %1210
  br i1 %1211, label %1212, label %1233

1212:                                             ; preds = %1209
  %1213 = load ptr, ptr %176, align 8
  %1214 = getelementptr inbounds i8, ptr %1213, i64 2
  %1215 = load i8, ptr %1214, align 1
  store i8 %1215, ptr %180, align 1
  %1216 = load i8, ptr %180, align 1
  %1217 = sext i8 %1216 to i32
  %1218 = icmp slt i32 %1217, 32
  br i1 %1218, label %1231, label %1219

1219:                                             ; preds = %1212
  %1220 = load i8, ptr %180, align 1
  %1221 = sext i8 %1220 to i32
  %1222 = icmp sgt i32 %1221, 126
  br i1 %1222, label %1231, label %1223

1223:                                             ; preds = %1219
  %1224 = load i8, ptr %180, align 1
  %1225 = sext i8 %1224 to i32
  %1226 = icmp eq i32 %1225, 34
  br i1 %1226, label %1231, label %1227

1227:                                             ; preds = %1223
  %1228 = load i8, ptr %180, align 1
  %1229 = sext i8 %1228 to i32
  %1230 = icmp eq i32 %1229, 92
  br i1 %1230, label %1231, label %1232

1231:                                             ; preds = %1227, %1223, %1219, %1212
  store i1 false, ptr %175, align 1
  br label %1931

1232:                                             ; preds = %1227
  br label %1233

1233:                                             ; preds = %1232, %1209
  %1234 = load i64, ptr %177, align 8
  %1235 = icmp ult i64 3, %1234
  br i1 %1235, label %1236, label %1257

1236:                                             ; preds = %1233
  %1237 = load ptr, ptr %176, align 8
  %1238 = getelementptr inbounds i8, ptr %1237, i64 3
  %1239 = load i8, ptr %1238, align 1
  store i8 %1239, ptr %181, align 1
  %1240 = load i8, ptr %181, align 1
  %1241 = sext i8 %1240 to i32
  %1242 = icmp slt i32 %1241, 32
  br i1 %1242, label %1255, label %1243

1243:                                             ; preds = %1236
  %1244 = load i8, ptr %181, align 1
  %1245 = sext i8 %1244 to i32
  %1246 = icmp sgt i32 %1245, 126
  br i1 %1246, label %1255, label %1247

1247:                                             ; preds = %1243
  %1248 = load i8, ptr %181, align 1
  %1249 = sext i8 %1248 to i32
  %1250 = icmp eq i32 %1249, 34
  br i1 %1250, label %1255, label %1251

1251:                                             ; preds = %1247
  %1252 = load i8, ptr %181, align 1
  %1253 = sext i8 %1252 to i32
  %1254 = icmp eq i32 %1253, 92
  br i1 %1254, label %1255, label %1256

1255:                                             ; preds = %1251, %1247, %1243, %1236
  store i1 false, ptr %175, align 1
  br label %1931

1256:                                             ; preds = %1251
  br label %1257

1257:                                             ; preds = %1256, %1233
  %1258 = load i64, ptr %177, align 8
  %1259 = icmp ult i64 4, %1258
  br i1 %1259, label %1260, label %1281

1260:                                             ; preds = %1257
  %1261 = load ptr, ptr %176, align 8
  %1262 = getelementptr inbounds i8, ptr %1261, i64 4
  %1263 = load i8, ptr %1262, align 1
  store i8 %1263, ptr %182, align 1
  %1264 = load i8, ptr %182, align 1
  %1265 = sext i8 %1264 to i32
  %1266 = icmp slt i32 %1265, 32
  br i1 %1266, label %1279, label %1267

1267:                                             ; preds = %1260
  %1268 = load i8, ptr %182, align 1
  %1269 = sext i8 %1268 to i32
  %1270 = icmp sgt i32 %1269, 126
  br i1 %1270, label %1279, label %1271

1271:                                             ; preds = %1267
  %1272 = load i8, ptr %182, align 1
  %1273 = sext i8 %1272 to i32
  %1274 = icmp eq i32 %1273, 34
  br i1 %1274, label %1279, label %1275

1275:                                             ; preds = %1271
  %1276 = load i8, ptr %182, align 1
  %1277 = sext i8 %1276 to i32
  %1278 = icmp eq i32 %1277, 92
  br i1 %1278, label %1279, label %1280

1279:                                             ; preds = %1275, %1271, %1267, %1260
  store i1 false, ptr %175, align 1
  br label %1931

1280:                                             ; preds = %1275
  br label %1281

1281:                                             ; preds = %1280, %1257
  %1282 = load i64, ptr %177, align 8
  %1283 = icmp ult i64 5, %1282
  br i1 %1283, label %1284, label %1305

1284:                                             ; preds = %1281
  %1285 = load ptr, ptr %176, align 8
  %1286 = getelementptr inbounds i8, ptr %1285, i64 5
  %1287 = load i8, ptr %1286, align 1
  store i8 %1287, ptr %183, align 1
  %1288 = load i8, ptr %183, align 1
  %1289 = sext i8 %1288 to i32
  %1290 = icmp slt i32 %1289, 32
  br i1 %1290, label %1303, label %1291

1291:                                             ; preds = %1284
  %1292 = load i8, ptr %183, align 1
  %1293 = sext i8 %1292 to i32
  %1294 = icmp sgt i32 %1293, 126
  br i1 %1294, label %1303, label %1295

1295:                                             ; preds = %1291
  %1296 = load i8, ptr %183, align 1
  %1297 = sext i8 %1296 to i32
  %1298 = icmp eq i32 %1297, 34
  br i1 %1298, label %1303, label %1299

1299:                                             ; preds = %1295
  %1300 = load i8, ptr %183, align 1
  %1301 = sext i8 %1300 to i32
  %1302 = icmp eq i32 %1301, 92
  br i1 %1302, label %1303, label %1304

1303:                                             ; preds = %1299, %1295, %1291, %1284
  store i1 false, ptr %175, align 1
  br label %1931

1304:                                             ; preds = %1299
  br label %1305

1305:                                             ; preds = %1304, %1281
  %1306 = load i64, ptr %177, align 8
  %1307 = icmp ult i64 6, %1306
  br i1 %1307, label %1308, label %1329

1308:                                             ; preds = %1305
  %1309 = load ptr, ptr %176, align 8
  %1310 = getelementptr inbounds i8, ptr %1309, i64 6
  %1311 = load i8, ptr %1310, align 1
  store i8 %1311, ptr %184, align 1
  %1312 = load i8, ptr %184, align 1
  %1313 = sext i8 %1312 to i32
  %1314 = icmp slt i32 %1313, 32
  br i1 %1314, label %1327, label %1315

1315:                                             ; preds = %1308
  %1316 = load i8, ptr %184, align 1
  %1317 = sext i8 %1316 to i32
  %1318 = icmp sgt i32 %1317, 126
  br i1 %1318, label %1327, label %1319

1319:                                             ; preds = %1315
  %1320 = load i8, ptr %184, align 1
  %1321 = sext i8 %1320 to i32
  %1322 = icmp eq i32 %1321, 34
  br i1 %1322, label %1327, label %1323

1323:                                             ; preds = %1319
  %1324 = load i8, ptr %184, align 1
  %1325 = sext i8 %1324 to i32
  %1326 = icmp eq i32 %1325, 92
  br i1 %1326, label %1327, label %1328

1327:                                             ; preds = %1323, %1319, %1315, %1308
  store i1 false, ptr %175, align 1
  br label %1931

1328:                                             ; preds = %1323
  br label %1329

1329:                                             ; preds = %1328, %1305
  %1330 = load i64, ptr %177, align 8
  %1331 = icmp ult i64 7, %1330
  br i1 %1331, label %1332, label %1353

1332:                                             ; preds = %1329
  %1333 = load ptr, ptr %176, align 8
  %1334 = getelementptr inbounds i8, ptr %1333, i64 7
  %1335 = load i8, ptr %1334, align 1
  store i8 %1335, ptr %185, align 1
  %1336 = load i8, ptr %185, align 1
  %1337 = sext i8 %1336 to i32
  %1338 = icmp slt i32 %1337, 32
  br i1 %1338, label %1351, label %1339

1339:                                             ; preds = %1332
  %1340 = load i8, ptr %185, align 1
  %1341 = sext i8 %1340 to i32
  %1342 = icmp sgt i32 %1341, 126
  br i1 %1342, label %1351, label %1343

1343:                                             ; preds = %1339
  %1344 = load i8, ptr %185, align 1
  %1345 = sext i8 %1344 to i32
  %1346 = icmp eq i32 %1345, 34
  br i1 %1346, label %1351, label %1347

1347:                                             ; preds = %1343
  %1348 = load i8, ptr %185, align 1
  %1349 = sext i8 %1348 to i32
  %1350 = icmp eq i32 %1349, 92
  br i1 %1350, label %1351, label %1352

1351:                                             ; preds = %1347, %1343, %1339, %1332
  store i1 false, ptr %175, align 1
  br label %1931

1352:                                             ; preds = %1347
  br label %1353

1353:                                             ; preds = %1352, %1329
  %1354 = load i64, ptr %177, align 8
  %1355 = icmp ult i64 8, %1354
  br i1 %1355, label %1356, label %1377

1356:                                             ; preds = %1353
  %1357 = load ptr, ptr %176, align 8
  %1358 = getelementptr inbounds i8, ptr %1357, i64 8
  %1359 = load i8, ptr %1358, align 1
  store i8 %1359, ptr %186, align 1
  %1360 = load i8, ptr %186, align 1
  %1361 = sext i8 %1360 to i32
  %1362 = icmp slt i32 %1361, 32
  br i1 %1362, label %1375, label %1363

1363:                                             ; preds = %1356
  %1364 = load i8, ptr %186, align 1
  %1365 = sext i8 %1364 to i32
  %1366 = icmp sgt i32 %1365, 126
  br i1 %1366, label %1375, label %1367

1367:                                             ; preds = %1363
  %1368 = load i8, ptr %186, align 1
  %1369 = sext i8 %1368 to i32
  %1370 = icmp eq i32 %1369, 34
  br i1 %1370, label %1375, label %1371

1371:                                             ; preds = %1367
  %1372 = load i8, ptr %186, align 1
  %1373 = sext i8 %1372 to i32
  %1374 = icmp eq i32 %1373, 92
  br i1 %1374, label %1375, label %1376

1375:                                             ; preds = %1371, %1367, %1363, %1356
  store i1 false, ptr %175, align 1
  br label %1931

1376:                                             ; preds = %1371
  br label %1377

1377:                                             ; preds = %1376, %1353
  %1378 = load i64, ptr %177, align 8
  %1379 = icmp ult i64 9, %1378
  br i1 %1379, label %1380, label %1401

1380:                                             ; preds = %1377
  %1381 = load ptr, ptr %176, align 8
  %1382 = getelementptr inbounds i8, ptr %1381, i64 9
  %1383 = load i8, ptr %1382, align 1
  store i8 %1383, ptr %187, align 1
  %1384 = load i8, ptr %187, align 1
  %1385 = sext i8 %1384 to i32
  %1386 = icmp slt i32 %1385, 32
  br i1 %1386, label %1399, label %1387

1387:                                             ; preds = %1380
  %1388 = load i8, ptr %187, align 1
  %1389 = sext i8 %1388 to i32
  %1390 = icmp sgt i32 %1389, 126
  br i1 %1390, label %1399, label %1391

1391:                                             ; preds = %1387
  %1392 = load i8, ptr %187, align 1
  %1393 = sext i8 %1392 to i32
  %1394 = icmp eq i32 %1393, 34
  br i1 %1394, label %1399, label %1395

1395:                                             ; preds = %1391
  %1396 = load i8, ptr %187, align 1
  %1397 = sext i8 %1396 to i32
  %1398 = icmp eq i32 %1397, 92
  br i1 %1398, label %1399, label %1400

1399:                                             ; preds = %1395, %1391, %1387, %1380
  store i1 false, ptr %175, align 1
  br label %1931

1400:                                             ; preds = %1395
  br label %1401

1401:                                             ; preds = %1400, %1377
  %1402 = load i64, ptr %177, align 8
  %1403 = icmp ult i64 10, %1402
  br i1 %1403, label %1404, label %1425

1404:                                             ; preds = %1401
  %1405 = load ptr, ptr %176, align 8
  %1406 = getelementptr inbounds i8, ptr %1405, i64 10
  %1407 = load i8, ptr %1406, align 1
  store i8 %1407, ptr %188, align 1
  %1408 = load i8, ptr %188, align 1
  %1409 = sext i8 %1408 to i32
  %1410 = icmp slt i32 %1409, 32
  br i1 %1410, label %1423, label %1411

1411:                                             ; preds = %1404
  %1412 = load i8, ptr %188, align 1
  %1413 = sext i8 %1412 to i32
  %1414 = icmp sgt i32 %1413, 126
  br i1 %1414, label %1423, label %1415

1415:                                             ; preds = %1411
  %1416 = load i8, ptr %188, align 1
  %1417 = sext i8 %1416 to i32
  %1418 = icmp eq i32 %1417, 34
  br i1 %1418, label %1423, label %1419

1419:                                             ; preds = %1415
  %1420 = load i8, ptr %188, align 1
  %1421 = sext i8 %1420 to i32
  %1422 = icmp eq i32 %1421, 92
  br i1 %1422, label %1423, label %1424

1423:                                             ; preds = %1419, %1415, %1411, %1404
  store i1 false, ptr %175, align 1
  br label %1931

1424:                                             ; preds = %1419
  br label %1425

1425:                                             ; preds = %1424, %1401
  %1426 = load i64, ptr %177, align 8
  %1427 = icmp ult i64 11, %1426
  br i1 %1427, label %1428, label %1449

1428:                                             ; preds = %1425
  %1429 = load ptr, ptr %176, align 8
  %1430 = getelementptr inbounds i8, ptr %1429, i64 11
  %1431 = load i8, ptr %1430, align 1
  store i8 %1431, ptr %189, align 1
  %1432 = load i8, ptr %189, align 1
  %1433 = sext i8 %1432 to i32
  %1434 = icmp slt i32 %1433, 32
  br i1 %1434, label %1447, label %1435

1435:                                             ; preds = %1428
  %1436 = load i8, ptr %189, align 1
  %1437 = sext i8 %1436 to i32
  %1438 = icmp sgt i32 %1437, 126
  br i1 %1438, label %1447, label %1439

1439:                                             ; preds = %1435
  %1440 = load i8, ptr %189, align 1
  %1441 = sext i8 %1440 to i32
  %1442 = icmp eq i32 %1441, 34
  br i1 %1442, label %1447, label %1443

1443:                                             ; preds = %1439
  %1444 = load i8, ptr %189, align 1
  %1445 = sext i8 %1444 to i32
  %1446 = icmp eq i32 %1445, 92
  br i1 %1446, label %1447, label %1448

1447:                                             ; preds = %1443, %1439, %1435, %1428
  store i1 false, ptr %175, align 1
  br label %1931

1448:                                             ; preds = %1443
  br label %1449

1449:                                             ; preds = %1448, %1425
  %1450 = load i64, ptr %177, align 8
  %1451 = icmp ult i64 12, %1450
  br i1 %1451, label %1452, label %1473

1452:                                             ; preds = %1449
  %1453 = load ptr, ptr %176, align 8
  %1454 = getelementptr inbounds i8, ptr %1453, i64 12
  %1455 = load i8, ptr %1454, align 1
  store i8 %1455, ptr %190, align 1
  %1456 = load i8, ptr %190, align 1
  %1457 = sext i8 %1456 to i32
  %1458 = icmp slt i32 %1457, 32
  br i1 %1458, label %1471, label %1459

1459:                                             ; preds = %1452
  %1460 = load i8, ptr %190, align 1
  %1461 = sext i8 %1460 to i32
  %1462 = icmp sgt i32 %1461, 126
  br i1 %1462, label %1471, label %1463

1463:                                             ; preds = %1459
  %1464 = load i8, ptr %190, align 1
  %1465 = sext i8 %1464 to i32
  %1466 = icmp eq i32 %1465, 34
  br i1 %1466, label %1471, label %1467

1467:                                             ; preds = %1463
  %1468 = load i8, ptr %190, align 1
  %1469 = sext i8 %1468 to i32
  %1470 = icmp eq i32 %1469, 92
  br i1 %1470, label %1471, label %1472

1471:                                             ; preds = %1467, %1463, %1459, %1452
  store i1 false, ptr %175, align 1
  br label %1931

1472:                                             ; preds = %1467
  br label %1473

1473:                                             ; preds = %1472, %1449
  %1474 = load i64, ptr %177, align 8
  %1475 = icmp ult i64 13, %1474
  br i1 %1475, label %1476, label %1497

1476:                                             ; preds = %1473
  %1477 = load ptr, ptr %176, align 8
  %1478 = getelementptr inbounds i8, ptr %1477, i64 13
  %1479 = load i8, ptr %1478, align 1
  store i8 %1479, ptr %191, align 1
  %1480 = load i8, ptr %191, align 1
  %1481 = sext i8 %1480 to i32
  %1482 = icmp slt i32 %1481, 32
  br i1 %1482, label %1495, label %1483

1483:                                             ; preds = %1476
  %1484 = load i8, ptr %191, align 1
  %1485 = sext i8 %1484 to i32
  %1486 = icmp sgt i32 %1485, 126
  br i1 %1486, label %1495, label %1487

1487:                                             ; preds = %1483
  %1488 = load i8, ptr %191, align 1
  %1489 = sext i8 %1488 to i32
  %1490 = icmp eq i32 %1489, 34
  br i1 %1490, label %1495, label %1491

1491:                                             ; preds = %1487
  %1492 = load i8, ptr %191, align 1
  %1493 = sext i8 %1492 to i32
  %1494 = icmp eq i32 %1493, 92
  br i1 %1494, label %1495, label %1496

1495:                                             ; preds = %1491, %1487, %1483, %1476
  store i1 false, ptr %175, align 1
  br label %1931

1496:                                             ; preds = %1491
  br label %1497

1497:                                             ; preds = %1496, %1473
  %1498 = load i64, ptr %177, align 8
  %1499 = icmp ult i64 14, %1498
  br i1 %1499, label %1500, label %1521

1500:                                             ; preds = %1497
  %1501 = load ptr, ptr %176, align 8
  %1502 = getelementptr inbounds i8, ptr %1501, i64 14
  %1503 = load i8, ptr %1502, align 1
  store i8 %1503, ptr %192, align 1
  %1504 = load i8, ptr %192, align 1
  %1505 = sext i8 %1504 to i32
  %1506 = icmp slt i32 %1505, 32
  br i1 %1506, label %1519, label %1507

1507:                                             ; preds = %1500
  %1508 = load i8, ptr %192, align 1
  %1509 = sext i8 %1508 to i32
  %1510 = icmp sgt i32 %1509, 126
  br i1 %1510, label %1519, label %1511

1511:                                             ; preds = %1507
  %1512 = load i8, ptr %192, align 1
  %1513 = sext i8 %1512 to i32
  %1514 = icmp eq i32 %1513, 34
  br i1 %1514, label %1519, label %1515

1515:                                             ; preds = %1511
  %1516 = load i8, ptr %192, align 1
  %1517 = sext i8 %1516 to i32
  %1518 = icmp eq i32 %1517, 92
  br i1 %1518, label %1519, label %1520

1519:                                             ; preds = %1515, %1511, %1507, %1500
  store i1 false, ptr %175, align 1
  br label %1931

1520:                                             ; preds = %1515
  br label %1521

1521:                                             ; preds = %1520, %1497
  %1522 = load i64, ptr %177, align 8
  %1523 = icmp ult i64 15, %1522
  br i1 %1523, label %1524, label %1545

1524:                                             ; preds = %1521
  %1525 = load ptr, ptr %176, align 8
  %1526 = getelementptr inbounds i8, ptr %1525, i64 15
  %1527 = load i8, ptr %1526, align 1
  store i8 %1527, ptr %193, align 1
  %1528 = load i8, ptr %193, align 1
  %1529 = sext i8 %1528 to i32
  %1530 = icmp slt i32 %1529, 32
  br i1 %1530, label %1543, label %1531

1531:                                             ; preds = %1524
  %1532 = load i8, ptr %193, align 1
  %1533 = sext i8 %1532 to i32
  %1534 = icmp sgt i32 %1533, 126
  br i1 %1534, label %1543, label %1535

1535:                                             ; preds = %1531
  %1536 = load i8, ptr %193, align 1
  %1537 = sext i8 %1536 to i32
  %1538 = icmp eq i32 %1537, 34
  br i1 %1538, label %1543, label %1539

1539:                                             ; preds = %1535
  %1540 = load i8, ptr %193, align 1
  %1541 = sext i8 %1540 to i32
  %1542 = icmp eq i32 %1541, 92
  br i1 %1542, label %1543, label %1544

1543:                                             ; preds = %1539, %1535, %1531, %1524
  store i1 false, ptr %175, align 1
  br label %1931

1544:                                             ; preds = %1539
  br label %1545

1545:                                             ; preds = %1544, %1521
  %1546 = load i64, ptr %177, align 8
  %1547 = icmp ult i64 16, %1546
  br i1 %1547, label %1548, label %1569

1548:                                             ; preds = %1545
  %1549 = load ptr, ptr %176, align 8
  %1550 = getelementptr inbounds i8, ptr %1549, i64 16
  %1551 = load i8, ptr %1550, align 1
  store i8 %1551, ptr %194, align 1
  %1552 = load i8, ptr %194, align 1
  %1553 = sext i8 %1552 to i32
  %1554 = icmp slt i32 %1553, 32
  br i1 %1554, label %1567, label %1555

1555:                                             ; preds = %1548
  %1556 = load i8, ptr %194, align 1
  %1557 = sext i8 %1556 to i32
  %1558 = icmp sgt i32 %1557, 126
  br i1 %1558, label %1567, label %1559

1559:                                             ; preds = %1555
  %1560 = load i8, ptr %194, align 1
  %1561 = sext i8 %1560 to i32
  %1562 = icmp eq i32 %1561, 34
  br i1 %1562, label %1567, label %1563

1563:                                             ; preds = %1559
  %1564 = load i8, ptr %194, align 1
  %1565 = sext i8 %1564 to i32
  %1566 = icmp eq i32 %1565, 92
  br i1 %1566, label %1567, label %1568

1567:                                             ; preds = %1563, %1559, %1555, %1548
  store i1 false, ptr %175, align 1
  br label %1931

1568:                                             ; preds = %1563
  br label %1569

1569:                                             ; preds = %1568, %1545
  %1570 = load i64, ptr %177, align 8
  %1571 = icmp ult i64 17, %1570
  br i1 %1571, label %1572, label %1593

1572:                                             ; preds = %1569
  %1573 = load ptr, ptr %176, align 8
  %1574 = getelementptr inbounds i8, ptr %1573, i64 17
  %1575 = load i8, ptr %1574, align 1
  store i8 %1575, ptr %195, align 1
  %1576 = load i8, ptr %195, align 1
  %1577 = sext i8 %1576 to i32
  %1578 = icmp slt i32 %1577, 32
  br i1 %1578, label %1591, label %1579

1579:                                             ; preds = %1572
  %1580 = load i8, ptr %195, align 1
  %1581 = sext i8 %1580 to i32
  %1582 = icmp sgt i32 %1581, 126
  br i1 %1582, label %1591, label %1583

1583:                                             ; preds = %1579
  %1584 = load i8, ptr %195, align 1
  %1585 = sext i8 %1584 to i32
  %1586 = icmp eq i32 %1585, 34
  br i1 %1586, label %1591, label %1587

1587:                                             ; preds = %1583
  %1588 = load i8, ptr %195, align 1
  %1589 = sext i8 %1588 to i32
  %1590 = icmp eq i32 %1589, 92
  br i1 %1590, label %1591, label %1592

1591:                                             ; preds = %1587, %1583, %1579, %1572
  store i1 false, ptr %175, align 1
  br label %1931

1592:                                             ; preds = %1587
  br label %1593

1593:                                             ; preds = %1592, %1569
  %1594 = load i64, ptr %177, align 8
  %1595 = icmp ult i64 18, %1594
  br i1 %1595, label %1596, label %1617

1596:                                             ; preds = %1593
  %1597 = load ptr, ptr %176, align 8
  %1598 = getelementptr inbounds i8, ptr %1597, i64 18
  %1599 = load i8, ptr %1598, align 1
  store i8 %1599, ptr %196, align 1
  %1600 = load i8, ptr %196, align 1
  %1601 = sext i8 %1600 to i32
  %1602 = icmp slt i32 %1601, 32
  br i1 %1602, label %1615, label %1603

1603:                                             ; preds = %1596
  %1604 = load i8, ptr %196, align 1
  %1605 = sext i8 %1604 to i32
  %1606 = icmp sgt i32 %1605, 126
  br i1 %1606, label %1615, label %1607

1607:                                             ; preds = %1603
  %1608 = load i8, ptr %196, align 1
  %1609 = sext i8 %1608 to i32
  %1610 = icmp eq i32 %1609, 34
  br i1 %1610, label %1615, label %1611

1611:                                             ; preds = %1607
  %1612 = load i8, ptr %196, align 1
  %1613 = sext i8 %1612 to i32
  %1614 = icmp eq i32 %1613, 92
  br i1 %1614, label %1615, label %1616

1615:                                             ; preds = %1611, %1607, %1603, %1596
  store i1 false, ptr %175, align 1
  br label %1931

1616:                                             ; preds = %1611
  br label %1617

1617:                                             ; preds = %1616, %1593
  %1618 = load i64, ptr %177, align 8
  %1619 = icmp ult i64 19, %1618
  br i1 %1619, label %1620, label %1641

1620:                                             ; preds = %1617
  %1621 = load ptr, ptr %176, align 8
  %1622 = getelementptr inbounds i8, ptr %1621, i64 19
  %1623 = load i8, ptr %1622, align 1
  store i8 %1623, ptr %197, align 1
  %1624 = load i8, ptr %197, align 1
  %1625 = sext i8 %1624 to i32
  %1626 = icmp slt i32 %1625, 32
  br i1 %1626, label %1639, label %1627

1627:                                             ; preds = %1620
  %1628 = load i8, ptr %197, align 1
  %1629 = sext i8 %1628 to i32
  %1630 = icmp sgt i32 %1629, 126
  br i1 %1630, label %1639, label %1631

1631:                                             ; preds = %1627
  %1632 = load i8, ptr %197, align 1
  %1633 = sext i8 %1632 to i32
  %1634 = icmp eq i32 %1633, 34
  br i1 %1634, label %1639, label %1635

1635:                                             ; preds = %1631
  %1636 = load i8, ptr %197, align 1
  %1637 = sext i8 %1636 to i32
  %1638 = icmp eq i32 %1637, 92
  br i1 %1638, label %1639, label %1640

1639:                                             ; preds = %1635, %1631, %1627, %1620
  store i1 false, ptr %175, align 1
  br label %1931

1640:                                             ; preds = %1635
  br label %1641

1641:                                             ; preds = %1640, %1617
  %1642 = load i64, ptr %177, align 8
  %1643 = icmp ult i64 20, %1642
  br i1 %1643, label %1644, label %1665

1644:                                             ; preds = %1641
  %1645 = load ptr, ptr %176, align 8
  %1646 = getelementptr inbounds i8, ptr %1645, i64 20
  %1647 = load i8, ptr %1646, align 1
  store i8 %1647, ptr %198, align 1
  %1648 = load i8, ptr %198, align 1
  %1649 = sext i8 %1648 to i32
  %1650 = icmp slt i32 %1649, 32
  br i1 %1650, label %1663, label %1651

1651:                                             ; preds = %1644
  %1652 = load i8, ptr %198, align 1
  %1653 = sext i8 %1652 to i32
  %1654 = icmp sgt i32 %1653, 126
  br i1 %1654, label %1663, label %1655

1655:                                             ; preds = %1651
  %1656 = load i8, ptr %198, align 1
  %1657 = sext i8 %1656 to i32
  %1658 = icmp eq i32 %1657, 34
  br i1 %1658, label %1663, label %1659

1659:                                             ; preds = %1655
  %1660 = load i8, ptr %198, align 1
  %1661 = sext i8 %1660 to i32
  %1662 = icmp eq i32 %1661, 92
  br i1 %1662, label %1663, label %1664

1663:                                             ; preds = %1659, %1655, %1651, %1644
  store i1 false, ptr %175, align 1
  br label %1931

1664:                                             ; preds = %1659
  br label %1665

1665:                                             ; preds = %1664, %1641
  %1666 = load i64, ptr %177, align 8
  %1667 = icmp ult i64 21, %1666
  br i1 %1667, label %1668, label %1689

1668:                                             ; preds = %1665
  %1669 = load ptr, ptr %176, align 8
  %1670 = getelementptr inbounds i8, ptr %1669, i64 21
  %1671 = load i8, ptr %1670, align 1
  store i8 %1671, ptr %199, align 1
  %1672 = load i8, ptr %199, align 1
  %1673 = sext i8 %1672 to i32
  %1674 = icmp slt i32 %1673, 32
  br i1 %1674, label %1687, label %1675

1675:                                             ; preds = %1668
  %1676 = load i8, ptr %199, align 1
  %1677 = sext i8 %1676 to i32
  %1678 = icmp sgt i32 %1677, 126
  br i1 %1678, label %1687, label %1679

1679:                                             ; preds = %1675
  %1680 = load i8, ptr %199, align 1
  %1681 = sext i8 %1680 to i32
  %1682 = icmp eq i32 %1681, 34
  br i1 %1682, label %1687, label %1683

1683:                                             ; preds = %1679
  %1684 = load i8, ptr %199, align 1
  %1685 = sext i8 %1684 to i32
  %1686 = icmp eq i32 %1685, 92
  br i1 %1686, label %1687, label %1688

1687:                                             ; preds = %1683, %1679, %1675, %1668
  store i1 false, ptr %175, align 1
  br label %1931

1688:                                             ; preds = %1683
  br label %1689

1689:                                             ; preds = %1688, %1665
  %1690 = load i64, ptr %177, align 8
  %1691 = icmp ult i64 22, %1690
  br i1 %1691, label %1692, label %1713

1692:                                             ; preds = %1689
  %1693 = load ptr, ptr %176, align 8
  %1694 = getelementptr inbounds i8, ptr %1693, i64 22
  %1695 = load i8, ptr %1694, align 1
  store i8 %1695, ptr %200, align 1
  %1696 = load i8, ptr %200, align 1
  %1697 = sext i8 %1696 to i32
  %1698 = icmp slt i32 %1697, 32
  br i1 %1698, label %1711, label %1699

1699:                                             ; preds = %1692
  %1700 = load i8, ptr %200, align 1
  %1701 = sext i8 %1700 to i32
  %1702 = icmp sgt i32 %1701, 126
  br i1 %1702, label %1711, label %1703

1703:                                             ; preds = %1699
  %1704 = load i8, ptr %200, align 1
  %1705 = sext i8 %1704 to i32
  %1706 = icmp eq i32 %1705, 34
  br i1 %1706, label %1711, label %1707

1707:                                             ; preds = %1703
  %1708 = load i8, ptr %200, align 1
  %1709 = sext i8 %1708 to i32
  %1710 = icmp eq i32 %1709, 92
  br i1 %1710, label %1711, label %1712

1711:                                             ; preds = %1707, %1703, %1699, %1692
  store i1 false, ptr %175, align 1
  br label %1931

1712:                                             ; preds = %1707
  br label %1713

1713:                                             ; preds = %1712, %1689
  %1714 = load i64, ptr %177, align 8
  %1715 = icmp ult i64 23, %1714
  br i1 %1715, label %1716, label %1737

1716:                                             ; preds = %1713
  %1717 = load ptr, ptr %176, align 8
  %1718 = getelementptr inbounds i8, ptr %1717, i64 23
  %1719 = load i8, ptr %1718, align 1
  store i8 %1719, ptr %201, align 1
  %1720 = load i8, ptr %201, align 1
  %1721 = sext i8 %1720 to i32
  %1722 = icmp slt i32 %1721, 32
  br i1 %1722, label %1735, label %1723

1723:                                             ; preds = %1716
  %1724 = load i8, ptr %201, align 1
  %1725 = sext i8 %1724 to i32
  %1726 = icmp sgt i32 %1725, 126
  br i1 %1726, label %1735, label %1727

1727:                                             ; preds = %1723
  %1728 = load i8, ptr %201, align 1
  %1729 = sext i8 %1728 to i32
  %1730 = icmp eq i32 %1729, 34
  br i1 %1730, label %1735, label %1731

1731:                                             ; preds = %1727
  %1732 = load i8, ptr %201, align 1
  %1733 = sext i8 %1732 to i32
  %1734 = icmp eq i32 %1733, 92
  br i1 %1734, label %1735, label %1736

1735:                                             ; preds = %1731, %1727, %1723, %1716
  store i1 false, ptr %175, align 1
  br label %1931

1736:                                             ; preds = %1731
  br label %1737

1737:                                             ; preds = %1736, %1713
  %1738 = load i64, ptr %177, align 8
  %1739 = icmp ult i64 24, %1738
  br i1 %1739, label %1740, label %1761

1740:                                             ; preds = %1737
  %1741 = load ptr, ptr %176, align 8
  %1742 = getelementptr inbounds i8, ptr %1741, i64 24
  %1743 = load i8, ptr %1742, align 1
  store i8 %1743, ptr %202, align 1
  %1744 = load i8, ptr %202, align 1
  %1745 = sext i8 %1744 to i32
  %1746 = icmp slt i32 %1745, 32
  br i1 %1746, label %1759, label %1747

1747:                                             ; preds = %1740
  %1748 = load i8, ptr %202, align 1
  %1749 = sext i8 %1748 to i32
  %1750 = icmp sgt i32 %1749, 126
  br i1 %1750, label %1759, label %1751

1751:                                             ; preds = %1747
  %1752 = load i8, ptr %202, align 1
  %1753 = sext i8 %1752 to i32
  %1754 = icmp eq i32 %1753, 34
  br i1 %1754, label %1759, label %1755

1755:                                             ; preds = %1751
  %1756 = load i8, ptr %202, align 1
  %1757 = sext i8 %1756 to i32
  %1758 = icmp eq i32 %1757, 92
  br i1 %1758, label %1759, label %1760

1759:                                             ; preds = %1755, %1751, %1747, %1740
  store i1 false, ptr %175, align 1
  br label %1931

1760:                                             ; preds = %1755
  br label %1761

1761:                                             ; preds = %1760, %1737
  %1762 = load i64, ptr %177, align 8
  %1763 = icmp ult i64 25, %1762
  br i1 %1763, label %1764, label %1785

1764:                                             ; preds = %1761
  %1765 = load ptr, ptr %176, align 8
  %1766 = getelementptr inbounds i8, ptr %1765, i64 25
  %1767 = load i8, ptr %1766, align 1
  store i8 %1767, ptr %203, align 1
  %1768 = load i8, ptr %203, align 1
  %1769 = sext i8 %1768 to i32
  %1770 = icmp slt i32 %1769, 32
  br i1 %1770, label %1783, label %1771

1771:                                             ; preds = %1764
  %1772 = load i8, ptr %203, align 1
  %1773 = sext i8 %1772 to i32
  %1774 = icmp sgt i32 %1773, 126
  br i1 %1774, label %1783, label %1775

1775:                                             ; preds = %1771
  %1776 = load i8, ptr %203, align 1
  %1777 = sext i8 %1776 to i32
  %1778 = icmp eq i32 %1777, 34
  br i1 %1778, label %1783, label %1779

1779:                                             ; preds = %1775
  %1780 = load i8, ptr %203, align 1
  %1781 = sext i8 %1780 to i32
  %1782 = icmp eq i32 %1781, 92
  br i1 %1782, label %1783, label %1784

1783:                                             ; preds = %1779, %1775, %1771, %1764
  store i1 false, ptr %175, align 1
  br label %1931

1784:                                             ; preds = %1779
  br label %1785

1785:                                             ; preds = %1784, %1761
  %1786 = load i64, ptr %177, align 8
  %1787 = icmp ult i64 26, %1786
  br i1 %1787, label %1788, label %1809

1788:                                             ; preds = %1785
  %1789 = load ptr, ptr %176, align 8
  %1790 = getelementptr inbounds i8, ptr %1789, i64 26
  %1791 = load i8, ptr %1790, align 1
  store i8 %1791, ptr %204, align 1
  %1792 = load i8, ptr %204, align 1
  %1793 = sext i8 %1792 to i32
  %1794 = icmp slt i32 %1793, 32
  br i1 %1794, label %1807, label %1795

1795:                                             ; preds = %1788
  %1796 = load i8, ptr %204, align 1
  %1797 = sext i8 %1796 to i32
  %1798 = icmp sgt i32 %1797, 126
  br i1 %1798, label %1807, label %1799

1799:                                             ; preds = %1795
  %1800 = load i8, ptr %204, align 1
  %1801 = sext i8 %1800 to i32
  %1802 = icmp eq i32 %1801, 34
  br i1 %1802, label %1807, label %1803

1803:                                             ; preds = %1799
  %1804 = load i8, ptr %204, align 1
  %1805 = sext i8 %1804 to i32
  %1806 = icmp eq i32 %1805, 92
  br i1 %1806, label %1807, label %1808

1807:                                             ; preds = %1803, %1799, %1795, %1788
  store i1 false, ptr %175, align 1
  br label %1931

1808:                                             ; preds = %1803
  br label %1809

1809:                                             ; preds = %1808, %1785
  %1810 = load i64, ptr %177, align 8
  %1811 = icmp ult i64 27, %1810
  br i1 %1811, label %1812, label %1833

1812:                                             ; preds = %1809
  %1813 = load ptr, ptr %176, align 8
  %1814 = getelementptr inbounds i8, ptr %1813, i64 27
  %1815 = load i8, ptr %1814, align 1
  store i8 %1815, ptr %205, align 1
  %1816 = load i8, ptr %205, align 1
  %1817 = sext i8 %1816 to i32
  %1818 = icmp slt i32 %1817, 32
  br i1 %1818, label %1831, label %1819

1819:                                             ; preds = %1812
  %1820 = load i8, ptr %205, align 1
  %1821 = sext i8 %1820 to i32
  %1822 = icmp sgt i32 %1821, 126
  br i1 %1822, label %1831, label %1823

1823:                                             ; preds = %1819
  %1824 = load i8, ptr %205, align 1
  %1825 = sext i8 %1824 to i32
  %1826 = icmp eq i32 %1825, 34
  br i1 %1826, label %1831, label %1827

1827:                                             ; preds = %1823
  %1828 = load i8, ptr %205, align 1
  %1829 = sext i8 %1828 to i32
  %1830 = icmp eq i32 %1829, 92
  br i1 %1830, label %1831, label %1832

1831:                                             ; preds = %1827, %1823, %1819, %1812
  store i1 false, ptr %175, align 1
  br label %1931

1832:                                             ; preds = %1827
  br label %1833

1833:                                             ; preds = %1832, %1809
  %1834 = load i64, ptr %177, align 8
  %1835 = icmp ult i64 28, %1834
  br i1 %1835, label %1836, label %1857

1836:                                             ; preds = %1833
  %1837 = load ptr, ptr %176, align 8
  %1838 = getelementptr inbounds i8, ptr %1837, i64 28
  %1839 = load i8, ptr %1838, align 1
  store i8 %1839, ptr %206, align 1
  %1840 = load i8, ptr %206, align 1
  %1841 = sext i8 %1840 to i32
  %1842 = icmp slt i32 %1841, 32
  br i1 %1842, label %1855, label %1843

1843:                                             ; preds = %1836
  %1844 = load i8, ptr %206, align 1
  %1845 = sext i8 %1844 to i32
  %1846 = icmp sgt i32 %1845, 126
  br i1 %1846, label %1855, label %1847

1847:                                             ; preds = %1843
  %1848 = load i8, ptr %206, align 1
  %1849 = sext i8 %1848 to i32
  %1850 = icmp eq i32 %1849, 34
  br i1 %1850, label %1855, label %1851

1851:                                             ; preds = %1847
  %1852 = load i8, ptr %206, align 1
  %1853 = sext i8 %1852 to i32
  %1854 = icmp eq i32 %1853, 92
  br i1 %1854, label %1855, label %1856

1855:                                             ; preds = %1851, %1847, %1843, %1836
  store i1 false, ptr %175, align 1
  br label %1931

1856:                                             ; preds = %1851
  br label %1857

1857:                                             ; preds = %1856, %1833
  %1858 = load i64, ptr %177, align 8
  %1859 = icmp ult i64 29, %1858
  br i1 %1859, label %1860, label %1881

1860:                                             ; preds = %1857
  %1861 = load ptr, ptr %176, align 8
  %1862 = getelementptr inbounds i8, ptr %1861, i64 29
  %1863 = load i8, ptr %1862, align 1
  store i8 %1863, ptr %207, align 1
  %1864 = load i8, ptr %207, align 1
  %1865 = sext i8 %1864 to i32
  %1866 = icmp slt i32 %1865, 32
  br i1 %1866, label %1879, label %1867

1867:                                             ; preds = %1860
  %1868 = load i8, ptr %207, align 1
  %1869 = sext i8 %1868 to i32
  %1870 = icmp sgt i32 %1869, 126
  br i1 %1870, label %1879, label %1871

1871:                                             ; preds = %1867
  %1872 = load i8, ptr %207, align 1
  %1873 = sext i8 %1872 to i32
  %1874 = icmp eq i32 %1873, 34
  br i1 %1874, label %1879, label %1875

1875:                                             ; preds = %1871
  %1876 = load i8, ptr %207, align 1
  %1877 = sext i8 %1876 to i32
  %1878 = icmp eq i32 %1877, 92
  br i1 %1878, label %1879, label %1880

1879:                                             ; preds = %1875, %1871, %1867, %1860
  store i1 false, ptr %175, align 1
  br label %1931

1880:                                             ; preds = %1875
  br label %1881

1881:                                             ; preds = %1880, %1857
  %1882 = load i64, ptr %177, align 8
  %1883 = icmp ult i64 30, %1882
  br i1 %1883, label %1884, label %1905

1884:                                             ; preds = %1881
  %1885 = load ptr, ptr %176, align 8
  %1886 = getelementptr inbounds i8, ptr %1885, i64 30
  %1887 = load i8, ptr %1886, align 1
  store i8 %1887, ptr %208, align 1
  %1888 = load i8, ptr %208, align 1
  %1889 = sext i8 %1888 to i32
  %1890 = icmp slt i32 %1889, 32
  br i1 %1890, label %1903, label %1891

1891:                                             ; preds = %1884
  %1892 = load i8, ptr %208, align 1
  %1893 = sext i8 %1892 to i32
  %1894 = icmp sgt i32 %1893, 126
  br i1 %1894, label %1903, label %1895

1895:                                             ; preds = %1891
  %1896 = load i8, ptr %208, align 1
  %1897 = sext i8 %1896 to i32
  %1898 = icmp eq i32 %1897, 34
  br i1 %1898, label %1903, label %1899

1899:                                             ; preds = %1895
  %1900 = load i8, ptr %208, align 1
  %1901 = sext i8 %1900 to i32
  %1902 = icmp eq i32 %1901, 92
  br i1 %1902, label %1903, label %1904

1903:                                             ; preds = %1899, %1895, %1891, %1884
  store i1 false, ptr %175, align 1
  br label %1931

1904:                                             ; preds = %1899
  br label %1905

1905:                                             ; preds = %1904, %1881
  %1906 = load i64, ptr %177, align 8
  %1907 = icmp ult i64 31, %1906
  br i1 %1907, label %1908, label %1929

1908:                                             ; preds = %1905
  %1909 = load ptr, ptr %176, align 8
  %1910 = getelementptr inbounds i8, ptr %1909, i64 31
  %1911 = load i8, ptr %1910, align 1
  store i8 %1911, ptr %209, align 1
  %1912 = load i8, ptr %209, align 1
  %1913 = sext i8 %1912 to i32
  %1914 = icmp slt i32 %1913, 32
  br i1 %1914, label %1927, label %1915

1915:                                             ; preds = %1908
  %1916 = load i8, ptr %209, align 1
  %1917 = sext i8 %1916 to i32
  %1918 = icmp sgt i32 %1917, 126
  br i1 %1918, label %1927, label %1919

1919:                                             ; preds = %1915
  %1920 = load i8, ptr %209, align 1
  %1921 = sext i8 %1920 to i32
  %1922 = icmp eq i32 %1921, 34
  br i1 %1922, label %1927, label %1923

1923:                                             ; preds = %1919
  %1924 = load i8, ptr %209, align 1
  %1925 = sext i8 %1924 to i32
  %1926 = icmp eq i32 %1925, 92
  br i1 %1926, label %1927, label %1928

1927:                                             ; preds = %1923, %1919, %1915, %1908
  store i1 false, ptr %175, align 1
  br label %1931

1928:                                             ; preds = %1923
  br label %1929

1929:                                             ; preds = %1928, %1905
  store i1 true, ptr %175, align 1
  br label %1931

1930:                                             ; preds = %1159, %1150
  store i1 false, ptr %175, align 1
  br label %1931

1931:                                             ; preds = %1183, %1207, %1231, %1255, %1279, %1303, %1327, %1351, %1375, %1399, %1423, %1447, %1471, %1495, %1519, %1543, %1567, %1591, %1615, %1639, %1663, %1687, %1711, %1735, %1759, %1783, %1807, %1831, %1855, %1879, %1903, %1927, %1929, %1930
  %1932 = load i1, ptr %175, align 1
  %1933 = zext i1 %1932 to i8
  store i8 %1933, ptr %533, align 1
  %1934 = load i8, ptr %533, align 1
  %1935 = trunc i8 %1934 to i1
  %1936 = zext i1 %1935 to i64
  %1937 = select i1 %1935, i32 8, i32 0
  %1938 = trunc i32 %1937 to i8
  store i8 %1938, ptr %534, align 1
  %1939 = load ptr, ptr %530, align 8
  %1940 = load i8, ptr %534, align 1
  %1941 = load i64, ptr %532, align 8
  store ptr %1939, ptr %95, align 8
  store i8 5, ptr %96, align 1
  store i8 %1940, ptr %97, align 1
  store i64 %1941, ptr %98, align 8
  %1942 = load i64, ptr %98, align 8
  %1943 = shl i64 %1942, 8
  store i64 %1943, ptr %99, align 8
  %1944 = load i8, ptr %96, align 1
  %1945 = zext i8 %1944 to i32
  %1946 = load i8, ptr %97, align 1
  %1947 = zext i8 %1946 to i32
  %1948 = or i32 %1945, %1947
  %1949 = sext i32 %1948 to i64
  %1950 = load i64, ptr %99, align 8
  %1951 = or i64 %1950, %1949
  store i64 %1951, ptr %99, align 8
  %1952 = load i64, ptr %99, align 8
  %1953 = load ptr, ptr %95, align 8
  store i64 %1952, ptr %1953, align 8
  %1954 = load ptr, ptr %531, align 8
  %1955 = load ptr, ptr %530, align 8
  %1956 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1955, i32 0, i32 1
  store ptr %1954, ptr %1956, align 8
  %1957 = load ptr, ptr %853, align 8
  store ptr %1957, ptr %850, align 8
  br label %1960

1958:                                             ; preds = %1143
  br label %1959

1959:                                             ; preds = %1958, %1099
  store ptr null, ptr %850, align 8
  br label %1960

1960:                                             ; preds = %1931, %1959
  %1961 = load ptr, ptr %850, align 8
  %1962 = load ptr, ptr %940, align 8
  store ptr %1092, ptr %887, align 8
  store ptr %1961, ptr %888, align 8
  store ptr %1962, ptr %889, align 8
  %1963 = load ptr, ptr %887, align 8
  store ptr %1963, ptr %690, align 8
  %1964 = load ptr, ptr %690, align 8
  %1965 = icmp ne ptr %1964, null
  br i1 %1965, label %1966, label %1979

1966:                                             ; preds = %1960
  %1967 = load ptr, ptr %690, align 8
  store ptr %1967, ptr %608, align 8
  %1968 = load ptr, ptr %608, align 8
  store ptr %1968, ptr %606, align 8
  %1969 = load ptr, ptr %606, align 8
  %1970 = load i64, ptr %1969, align 8
  %1971 = trunc i64 %1970 to i8
  store i8 %1971, ptr %607, align 1
  %1972 = load i8, ptr %607, align 1
  %1973 = zext i8 %1972 to i32
  %1974 = and i32 %1973, 7
  %1975 = trunc i32 %1974 to i8
  %1976 = zext i8 %1975 to i32
  %1977 = icmp eq i32 %1976, 7
  %1978 = zext i1 %1977 to i32
  br label %1980

1979:                                             ; preds = %1960
  br label %1980

1980:                                             ; preds = %1966, %1979
  %1981 = phi i32 [ %1978, %1966 ], [ 0, %1979 ]
  %1982 = icmp ne i32 %1981, 0
  br i1 %1982, label %1983, label %2007

1983:                                             ; preds = %1980
  %1984 = load ptr, ptr %888, align 8
  store ptr %1984, ptr %682, align 8
  %1985 = load ptr, ptr %682, align 8
  %1986 = icmp ne ptr %1985, null
  br i1 %1986, label %1987, label %2000

1987:                                             ; preds = %1983
  %1988 = load ptr, ptr %682, align 8
  store ptr %1988, ptr %570, align 8
  %1989 = load ptr, ptr %570, align 8
  store ptr %1989, ptr %568, align 8
  %1990 = load ptr, ptr %568, align 8
  %1991 = load i64, ptr %1990, align 8
  %1992 = trunc i64 %1991 to i8
  store i8 %1992, ptr %569, align 1
  %1993 = load i8, ptr %569, align 1
  %1994 = zext i8 %1993 to i32
  %1995 = and i32 %1994, 7
  %1996 = trunc i32 %1995 to i8
  %1997 = zext i8 %1996 to i32
  %1998 = icmp eq i32 %1997, 5
  %1999 = zext i1 %1998 to i32
  br label %2001

2000:                                             ; preds = %1983
  br label %2001

2001:                                             ; preds = %1987, %2000
  %2002 = phi i32 [ %1999, %1987 ], [ 0, %2000 ]
  %2003 = icmp ne i32 %2002, 0
  br i1 %2003, label %2004, label %2007

2004:                                             ; preds = %2001
  %2005 = load ptr, ptr %889, align 8
  %2006 = icmp ne ptr %2005, null
  br label %2007

2007:                                             ; preds = %2004, %2001, %1980
  %2008 = phi i1 [ false, %2001 ], [ false, %1980 ], [ %2006, %2004 ]
  %2009 = xor i1 %2008, true
  %2010 = zext i1 %2008 to i32
  %2011 = sext i32 %2010 to i64
  br i1 %2008, label %2012, label %2063

2012:                                             ; preds = %2007
  %2013 = load ptr, ptr %887, align 8
  %2014 = load ptr, ptr %888, align 8
  %2015 = load ptr, ptr %889, align 8
  %2016 = load ptr, ptr %887, align 8
  store ptr %2016, ptr %623, align 8
  %2017 = load ptr, ptr %623, align 8
  %2018 = load i64, ptr %2017, align 8
  %2019 = lshr i64 %2018, 8
  store ptr %2013, ptr %669, align 8
  store ptr %2014, ptr %670, align 8
  store ptr %2015, ptr %671, align 8
  store i64 %2019, ptr %672, align 8
  %2020 = load i64, ptr %672, align 8
  %2021 = icmp ne i64 %2020, 0
  %2022 = xor i1 %2021, true
  %2023 = zext i1 %2021 to i32
  %2024 = sext i32 %2023 to i64
  br i1 %2021, label %2025, label %2040

2025:                                             ; preds = %2012
  %2026 = load ptr, ptr %669, align 8
  %2027 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2026, i32 0, i32 1
  %2028 = load ptr, ptr %2027, align 8
  %2029 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2028, i32 0, i32 2
  %2030 = load ptr, ptr %2029, align 8
  store ptr %2030, ptr %673, align 8
  %2031 = load ptr, ptr %673, align 8
  %2032 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2031, i32 0, i32 2
  %2033 = load ptr, ptr %2032, align 8
  store ptr %2033, ptr %674, align 8
  %2034 = load ptr, ptr %670, align 8
  %2035 = load ptr, ptr %673, align 8
  %2036 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2035, i32 0, i32 2
  store ptr %2034, ptr %2036, align 8
  %2037 = load ptr, ptr %674, align 8
  %2038 = load ptr, ptr %671, align 8
  %2039 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2038, i32 0, i32 2
  store ptr %2037, ptr %2039, align 8
  br label %2044

2040:                                             ; preds = %2012
  %2041 = load ptr, ptr %670, align 8
  %2042 = load ptr, ptr %671, align 8
  %2043 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2042, i32 0, i32 2
  store ptr %2041, ptr %2043, align 8
  br label %2044

2044:                                             ; preds = %2025, %2040
  %2045 = load ptr, ptr %671, align 8
  %2046 = load ptr, ptr %670, align 8
  %2047 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2046, i32 0, i32 2
  store ptr %2045, ptr %2047, align 8
  %2048 = load ptr, ptr %670, align 8
  %2049 = load ptr, ptr %669, align 8
  %2050 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2049, i32 0, i32 1
  store ptr %2048, ptr %2050, align 8
  %2051 = load ptr, ptr %669, align 8
  %2052 = load i64, ptr %672, align 8
  %2053 = add i64 %2052, 1
  store ptr %2051, ptr %544, align 8
  store i64 %2053, ptr %545, align 8
  %2054 = load ptr, ptr %544, align 8
  %2055 = load i64, ptr %2054, align 8
  %2056 = and i64 %2055, 255
  store i64 %2056, ptr %546, align 8
  %2057 = load i64, ptr %545, align 8
  %2058 = shl i64 %2057, 8
  %2059 = load i64, ptr %546, align 8
  %2060 = or i64 %2059, %2058
  store i64 %2060, ptr %546, align 8
  %2061 = load i64, ptr %546, align 8
  %2062 = load ptr, ptr %544, align 8
  store i64 %2061, ptr %2062, align 8
  store i1 true, ptr %886, align 1
  br label %2064

2063:                                             ; preds = %2007
  store i1 false, ptr %886, align 1
  br label %2064

2064:                                             ; preds = %2044, %2063
  %2065 = load i1, ptr %886, align 1
  store i64 0, ptr %941, align 8
  br label %2066

2066:                                             ; preds = %9736, %2064
  %2067 = load i64, ptr %941, align 8
  %2068 = load ptr, ptr %937, align 8
  %2069 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %2068, i32 0, i32 1
  %2070 = load i64, ptr %2069, align 8
  %2071 = icmp slt i64 %2067, %2070
  br i1 %2071, label %2072, label %9739

2072:                                             ; preds = %2066
  %2073 = load ptr, ptr %937, align 8
  %2074 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %2073, i32 0, i32 0
  %2075 = load ptr, ptr %2074, align 8
  %2076 = load i64, ptr %941, align 8
  %2077 = getelementptr inbounds %struct.Coord, ptr %2075, i64 %2076
  store ptr %2077, ptr %942, align 8
  %2078 = load ptr, ptr %938, align 8
  store ptr %2078, ptr %930, align 8
  %2079 = load ptr, ptr %930, align 8
  %2080 = icmp ne ptr %2079, null
  %2081 = xor i1 %2080, true
  %2082 = zext i1 %2080 to i32
  %2083 = sext i32 %2082 to i64
  br i1 %2080, label %2084, label %2134

2084:                                             ; preds = %2072
  %2085 = load ptr, ptr %930, align 8
  store ptr %2085, ptr %698, align 8
  store i64 1, ptr %699, align 8
  %2086 = load ptr, ptr %698, align 8
  %2087 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %2086, i32 0, i32 1
  store ptr %2087, ptr %701, align 8
  %2088 = load ptr, ptr %698, align 8
  %2089 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %2088, i32 0, i32 3
  store ptr %2089, ptr %702, align 8
  %2090 = load ptr, ptr %702, align 8
  %2091 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %2090, i32 0, i32 1
  %2092 = load ptr, ptr %2091, align 8
  %2093 = load ptr, ptr %702, align 8
  %2094 = load ptr, ptr %2093, align 8
  %2095 = ptrtoint ptr %2092 to i64
  %2096 = ptrtoint ptr %2094 to i64
  %2097 = sub i64 %2095, %2096
  %2098 = sdiv exact i64 %2097, 24
  %2099 = load i64, ptr %699, align 8
  %2100 = icmp ult i64 %2098, %2099
  %2101 = xor i1 %2100, true
  %2102 = zext i1 %2100 to i32
  %2103 = sext i32 %2102 to i64
  br i1 %2100, label %2104, label %2115

2104:                                             ; preds = %2084
  %2105 = load ptr, ptr %702, align 8
  %2106 = load ptr, ptr %701, align 8
  %2107 = load i64, ptr %699, align 8
  %2108 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %2105, ptr noundef %2106, i64 noundef %2107)
  %2109 = xor i1 %2108, true
  %2110 = xor i1 %2108, true
  %2111 = zext i1 %2110 to i32
  %2112 = sext i32 %2111 to i64
  br i1 %2110, label %2113, label %2114

2113:                                             ; preds = %2104
  store ptr null, ptr %697, align 8
  br label %2123

2114:                                             ; preds = %2104
  br label %2115

2115:                                             ; preds = %2114, %2084
  %2116 = load ptr, ptr %702, align 8
  %2117 = load ptr, ptr %2116, align 8
  store ptr %2117, ptr %700, align 8
  %2118 = load i64, ptr %699, align 8
  %2119 = load ptr, ptr %702, align 8
  %2120 = load ptr, ptr %2119, align 8
  %2121 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2120, i64 %2118
  store ptr %2121, ptr %2119, align 8
  %2122 = load ptr, ptr %700, align 8
  store ptr %2122, ptr %697, align 8
  br label %2123

2123:                                             ; preds = %2113, %2115
  %2124 = load ptr, ptr %697, align 8
  store ptr %2124, ptr %931, align 8
  %2125 = load ptr, ptr %931, align 8
  %2126 = icmp ne ptr %2125, null
  %2127 = xor i1 %2126, true
  %2128 = zext i1 %2126 to i32
  %2129 = sext i32 %2128 to i64
  br i1 %2126, label %2130, label %2133

2130:                                             ; preds = %2123
  %2131 = load ptr, ptr %931, align 8
  store i64 7, ptr %2131, align 8
  %2132 = load ptr, ptr %931, align 8
  store ptr %2132, ptr %929, align 8
  br label %2135

2133:                                             ; preds = %2123
  br label %2134

2134:                                             ; preds = %2133, %2072
  store ptr null, ptr %929, align 8
  br label %2135

2135:                                             ; preds = %2130, %2134
  %2136 = load ptr, ptr %929, align 8
  store ptr %2136, ptr %943, align 8
  %2137 = load ptr, ptr %943, align 8
  %2138 = load ptr, ptr %938, align 8
  store ptr %2138, ptr %855, align 8
  store ptr @.str.2, ptr %856, align 8
  %2139 = load ptr, ptr %855, align 8
  %2140 = icmp ne ptr %2139, null
  br i1 %2140, label %2141, label %2144

2141:                                             ; preds = %2135
  %2142 = load ptr, ptr %856, align 8
  %2143 = icmp ne ptr %2142, null
  br label %2144

2144:                                             ; preds = %2141, %2135
  %2145 = phi i1 [ false, %2135 ], [ %2143, %2141 ]
  %2146 = xor i1 %2145, true
  %2147 = zext i1 %2145 to i32
  %2148 = sext i32 %2147 to i64
  br i1 %2145, label %2149, label %3004

2149:                                             ; preds = %2144
  %2150 = load ptr, ptr %855, align 8
  store ptr %2150, ptr %764, align 8
  store i64 1, ptr %765, align 8
  %2151 = load ptr, ptr %764, align 8
  %2152 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %2151, i32 0, i32 1
  store ptr %2152, ptr %767, align 8
  %2153 = load ptr, ptr %764, align 8
  %2154 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %2153, i32 0, i32 3
  store ptr %2154, ptr %768, align 8
  %2155 = load ptr, ptr %768, align 8
  %2156 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %2155, i32 0, i32 1
  %2157 = load ptr, ptr %2156, align 8
  %2158 = load ptr, ptr %768, align 8
  %2159 = load ptr, ptr %2158, align 8
  %2160 = ptrtoint ptr %2157 to i64
  %2161 = ptrtoint ptr %2159 to i64
  %2162 = sub i64 %2160, %2161
  %2163 = sdiv exact i64 %2162, 24
  %2164 = load i64, ptr %765, align 8
  %2165 = icmp ult i64 %2163, %2164
  %2166 = xor i1 %2165, true
  %2167 = zext i1 %2165 to i32
  %2168 = sext i32 %2167 to i64
  br i1 %2165, label %2169, label %2180

2169:                                             ; preds = %2149
  %2170 = load ptr, ptr %768, align 8
  %2171 = load ptr, ptr %767, align 8
  %2172 = load i64, ptr %765, align 8
  %2173 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %2170, ptr noundef %2171, i64 noundef %2172)
  %2174 = xor i1 %2173, true
  %2175 = xor i1 %2173, true
  %2176 = zext i1 %2175 to i32
  %2177 = sext i32 %2176 to i64
  br i1 %2175, label %2178, label %2179

2178:                                             ; preds = %2169
  store ptr null, ptr %763, align 8
  br label %2188

2179:                                             ; preds = %2169
  br label %2180

2180:                                             ; preds = %2179, %2149
  %2181 = load ptr, ptr %768, align 8
  %2182 = load ptr, ptr %2181, align 8
  store ptr %2182, ptr %766, align 8
  %2183 = load i64, ptr %765, align 8
  %2184 = load ptr, ptr %768, align 8
  %2185 = load ptr, ptr %2184, align 8
  %2186 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %2185, i64 %2183
  store ptr %2186, ptr %2184, align 8
  %2187 = load ptr, ptr %766, align 8
  store ptr %2187, ptr %763, align 8
  br label %2188

2188:                                             ; preds = %2178, %2180
  %2189 = load ptr, ptr %763, align 8
  store ptr %2189, ptr %857, align 8
  %2190 = load ptr, ptr %857, align 8
  %2191 = icmp ne ptr %2190, null
  %2192 = xor i1 %2191, true
  %2193 = zext i1 %2191 to i32
  %2194 = sext i32 %2193 to i64
  br i1 %2191, label %2195, label %3003

2195:                                             ; preds = %2188
  %2196 = load ptr, ptr %857, align 8
  %2197 = load ptr, ptr %856, align 8
  store ptr %2196, ptr %525, align 8
  store ptr %2197, ptr %526, align 8
  %2198 = load ptr, ptr %526, align 8
  %2199 = call i64 @strlen(ptr noundef %2198)
  store i64 %2199, ptr %527, align 8
  %2200 = load ptr, ptr %526, align 8
  %2201 = load i64, ptr %527, align 8
  store ptr %2200, ptr %211, align 8
  store i64 %2201, ptr %212, align 8
  %2202 = load i64, ptr %212, align 8
  %2203 = call i1 @llvm.is.constant.i64(i64 %2202)
  br i1 %2203, label %2204, label %2975

2204:                                             ; preds = %2195
  %2205 = load i64, ptr %212, align 8
  %2206 = icmp ule i64 %2205, 32
  br i1 %2206, label %2207, label %2975

2207:                                             ; preds = %2204
  %2208 = load i64, ptr %212, align 8
  %2209 = icmp ult i64 0, %2208
  br i1 %2209, label %2210, label %2230

2210:                                             ; preds = %2207
  %2211 = load ptr, ptr %211, align 8
  %2212 = load i8, ptr %2211, align 1
  store i8 %2212, ptr %213, align 1
  %2213 = load i8, ptr %213, align 1
  %2214 = sext i8 %2213 to i32
  %2215 = icmp slt i32 %2214, 32
  br i1 %2215, label %2228, label %2216

2216:                                             ; preds = %2210
  %2217 = load i8, ptr %213, align 1
  %2218 = sext i8 %2217 to i32
  %2219 = icmp sgt i32 %2218, 126
  br i1 %2219, label %2228, label %2220

2220:                                             ; preds = %2216
  %2221 = load i8, ptr %213, align 1
  %2222 = sext i8 %2221 to i32
  %2223 = icmp eq i32 %2222, 34
  br i1 %2223, label %2228, label %2224

2224:                                             ; preds = %2220
  %2225 = load i8, ptr %213, align 1
  %2226 = sext i8 %2225 to i32
  %2227 = icmp eq i32 %2226, 92
  br i1 %2227, label %2228, label %2229

2228:                                             ; preds = %2224, %2220, %2216, %2210
  store i1 false, ptr %210, align 1
  br label %2976

2229:                                             ; preds = %2224
  br label %2230

2230:                                             ; preds = %2229, %2207
  %2231 = load i64, ptr %212, align 8
  %2232 = icmp ult i64 1, %2231
  br i1 %2232, label %2233, label %2254

2233:                                             ; preds = %2230
  %2234 = load ptr, ptr %211, align 8
  %2235 = getelementptr inbounds i8, ptr %2234, i64 1
  %2236 = load i8, ptr %2235, align 1
  store i8 %2236, ptr %214, align 1
  %2237 = load i8, ptr %214, align 1
  %2238 = sext i8 %2237 to i32
  %2239 = icmp slt i32 %2238, 32
  br i1 %2239, label %2252, label %2240

2240:                                             ; preds = %2233
  %2241 = load i8, ptr %214, align 1
  %2242 = sext i8 %2241 to i32
  %2243 = icmp sgt i32 %2242, 126
  br i1 %2243, label %2252, label %2244

2244:                                             ; preds = %2240
  %2245 = load i8, ptr %214, align 1
  %2246 = sext i8 %2245 to i32
  %2247 = icmp eq i32 %2246, 34
  br i1 %2247, label %2252, label %2248

2248:                                             ; preds = %2244
  %2249 = load i8, ptr %214, align 1
  %2250 = sext i8 %2249 to i32
  %2251 = icmp eq i32 %2250, 92
  br i1 %2251, label %2252, label %2253

2252:                                             ; preds = %2248, %2244, %2240, %2233
  store i1 false, ptr %210, align 1
  br label %2976

2253:                                             ; preds = %2248
  br label %2254

2254:                                             ; preds = %2253, %2230
  %2255 = load i64, ptr %212, align 8
  %2256 = icmp ult i64 2, %2255
  br i1 %2256, label %2257, label %2278

2257:                                             ; preds = %2254
  %2258 = load ptr, ptr %211, align 8
  %2259 = getelementptr inbounds i8, ptr %2258, i64 2
  %2260 = load i8, ptr %2259, align 1
  store i8 %2260, ptr %215, align 1
  %2261 = load i8, ptr %215, align 1
  %2262 = sext i8 %2261 to i32
  %2263 = icmp slt i32 %2262, 32
  br i1 %2263, label %2276, label %2264

2264:                                             ; preds = %2257
  %2265 = load i8, ptr %215, align 1
  %2266 = sext i8 %2265 to i32
  %2267 = icmp sgt i32 %2266, 126
  br i1 %2267, label %2276, label %2268

2268:                                             ; preds = %2264
  %2269 = load i8, ptr %215, align 1
  %2270 = sext i8 %2269 to i32
  %2271 = icmp eq i32 %2270, 34
  br i1 %2271, label %2276, label %2272

2272:                                             ; preds = %2268
  %2273 = load i8, ptr %215, align 1
  %2274 = sext i8 %2273 to i32
  %2275 = icmp eq i32 %2274, 92
  br i1 %2275, label %2276, label %2277

2276:                                             ; preds = %2272, %2268, %2264, %2257
  store i1 false, ptr %210, align 1
  br label %2976

2277:                                             ; preds = %2272
  br label %2278

2278:                                             ; preds = %2277, %2254
  %2279 = load i64, ptr %212, align 8
  %2280 = icmp ult i64 3, %2279
  br i1 %2280, label %2281, label %2302

2281:                                             ; preds = %2278
  %2282 = load ptr, ptr %211, align 8
  %2283 = getelementptr inbounds i8, ptr %2282, i64 3
  %2284 = load i8, ptr %2283, align 1
  store i8 %2284, ptr %216, align 1
  %2285 = load i8, ptr %216, align 1
  %2286 = sext i8 %2285 to i32
  %2287 = icmp slt i32 %2286, 32
  br i1 %2287, label %2300, label %2288

2288:                                             ; preds = %2281
  %2289 = load i8, ptr %216, align 1
  %2290 = sext i8 %2289 to i32
  %2291 = icmp sgt i32 %2290, 126
  br i1 %2291, label %2300, label %2292

2292:                                             ; preds = %2288
  %2293 = load i8, ptr %216, align 1
  %2294 = sext i8 %2293 to i32
  %2295 = icmp eq i32 %2294, 34
  br i1 %2295, label %2300, label %2296

2296:                                             ; preds = %2292
  %2297 = load i8, ptr %216, align 1
  %2298 = sext i8 %2297 to i32
  %2299 = icmp eq i32 %2298, 92
  br i1 %2299, label %2300, label %2301

2300:                                             ; preds = %2296, %2292, %2288, %2281
  store i1 false, ptr %210, align 1
  br label %2976

2301:                                             ; preds = %2296
  br label %2302

2302:                                             ; preds = %2301, %2278
  %2303 = load i64, ptr %212, align 8
  %2304 = icmp ult i64 4, %2303
  br i1 %2304, label %2305, label %2326

2305:                                             ; preds = %2302
  %2306 = load ptr, ptr %211, align 8
  %2307 = getelementptr inbounds i8, ptr %2306, i64 4
  %2308 = load i8, ptr %2307, align 1
  store i8 %2308, ptr %217, align 1
  %2309 = load i8, ptr %217, align 1
  %2310 = sext i8 %2309 to i32
  %2311 = icmp slt i32 %2310, 32
  br i1 %2311, label %2324, label %2312

2312:                                             ; preds = %2305
  %2313 = load i8, ptr %217, align 1
  %2314 = sext i8 %2313 to i32
  %2315 = icmp sgt i32 %2314, 126
  br i1 %2315, label %2324, label %2316

2316:                                             ; preds = %2312
  %2317 = load i8, ptr %217, align 1
  %2318 = sext i8 %2317 to i32
  %2319 = icmp eq i32 %2318, 34
  br i1 %2319, label %2324, label %2320

2320:                                             ; preds = %2316
  %2321 = load i8, ptr %217, align 1
  %2322 = sext i8 %2321 to i32
  %2323 = icmp eq i32 %2322, 92
  br i1 %2323, label %2324, label %2325

2324:                                             ; preds = %2320, %2316, %2312, %2305
  store i1 false, ptr %210, align 1
  br label %2976

2325:                                             ; preds = %2320
  br label %2326

2326:                                             ; preds = %2325, %2302
  %2327 = load i64, ptr %212, align 8
  %2328 = icmp ult i64 5, %2327
  br i1 %2328, label %2329, label %2350

2329:                                             ; preds = %2326
  %2330 = load ptr, ptr %211, align 8
  %2331 = getelementptr inbounds i8, ptr %2330, i64 5
  %2332 = load i8, ptr %2331, align 1
  store i8 %2332, ptr %218, align 1
  %2333 = load i8, ptr %218, align 1
  %2334 = sext i8 %2333 to i32
  %2335 = icmp slt i32 %2334, 32
  br i1 %2335, label %2348, label %2336

2336:                                             ; preds = %2329
  %2337 = load i8, ptr %218, align 1
  %2338 = sext i8 %2337 to i32
  %2339 = icmp sgt i32 %2338, 126
  br i1 %2339, label %2348, label %2340

2340:                                             ; preds = %2336
  %2341 = load i8, ptr %218, align 1
  %2342 = sext i8 %2341 to i32
  %2343 = icmp eq i32 %2342, 34
  br i1 %2343, label %2348, label %2344

2344:                                             ; preds = %2340
  %2345 = load i8, ptr %218, align 1
  %2346 = sext i8 %2345 to i32
  %2347 = icmp eq i32 %2346, 92
  br i1 %2347, label %2348, label %2349

2348:                                             ; preds = %2344, %2340, %2336, %2329
  store i1 false, ptr %210, align 1
  br label %2976

2349:                                             ; preds = %2344
  br label %2350

2350:                                             ; preds = %2349, %2326
  %2351 = load i64, ptr %212, align 8
  %2352 = icmp ult i64 6, %2351
  br i1 %2352, label %2353, label %2374

2353:                                             ; preds = %2350
  %2354 = load ptr, ptr %211, align 8
  %2355 = getelementptr inbounds i8, ptr %2354, i64 6
  %2356 = load i8, ptr %2355, align 1
  store i8 %2356, ptr %219, align 1
  %2357 = load i8, ptr %219, align 1
  %2358 = sext i8 %2357 to i32
  %2359 = icmp slt i32 %2358, 32
  br i1 %2359, label %2372, label %2360

2360:                                             ; preds = %2353
  %2361 = load i8, ptr %219, align 1
  %2362 = sext i8 %2361 to i32
  %2363 = icmp sgt i32 %2362, 126
  br i1 %2363, label %2372, label %2364

2364:                                             ; preds = %2360
  %2365 = load i8, ptr %219, align 1
  %2366 = sext i8 %2365 to i32
  %2367 = icmp eq i32 %2366, 34
  br i1 %2367, label %2372, label %2368

2368:                                             ; preds = %2364
  %2369 = load i8, ptr %219, align 1
  %2370 = sext i8 %2369 to i32
  %2371 = icmp eq i32 %2370, 92
  br i1 %2371, label %2372, label %2373

2372:                                             ; preds = %2368, %2364, %2360, %2353
  store i1 false, ptr %210, align 1
  br label %2976

2373:                                             ; preds = %2368
  br label %2374

2374:                                             ; preds = %2373, %2350
  %2375 = load i64, ptr %212, align 8
  %2376 = icmp ult i64 7, %2375
  br i1 %2376, label %2377, label %2398

2377:                                             ; preds = %2374
  %2378 = load ptr, ptr %211, align 8
  %2379 = getelementptr inbounds i8, ptr %2378, i64 7
  %2380 = load i8, ptr %2379, align 1
  store i8 %2380, ptr %220, align 1
  %2381 = load i8, ptr %220, align 1
  %2382 = sext i8 %2381 to i32
  %2383 = icmp slt i32 %2382, 32
  br i1 %2383, label %2396, label %2384

2384:                                             ; preds = %2377
  %2385 = load i8, ptr %220, align 1
  %2386 = sext i8 %2385 to i32
  %2387 = icmp sgt i32 %2386, 126
  br i1 %2387, label %2396, label %2388

2388:                                             ; preds = %2384
  %2389 = load i8, ptr %220, align 1
  %2390 = sext i8 %2389 to i32
  %2391 = icmp eq i32 %2390, 34
  br i1 %2391, label %2396, label %2392

2392:                                             ; preds = %2388
  %2393 = load i8, ptr %220, align 1
  %2394 = sext i8 %2393 to i32
  %2395 = icmp eq i32 %2394, 92
  br i1 %2395, label %2396, label %2397

2396:                                             ; preds = %2392, %2388, %2384, %2377
  store i1 false, ptr %210, align 1
  br label %2976

2397:                                             ; preds = %2392
  br label %2398

2398:                                             ; preds = %2397, %2374
  %2399 = load i64, ptr %212, align 8
  %2400 = icmp ult i64 8, %2399
  br i1 %2400, label %2401, label %2422

2401:                                             ; preds = %2398
  %2402 = load ptr, ptr %211, align 8
  %2403 = getelementptr inbounds i8, ptr %2402, i64 8
  %2404 = load i8, ptr %2403, align 1
  store i8 %2404, ptr %221, align 1
  %2405 = load i8, ptr %221, align 1
  %2406 = sext i8 %2405 to i32
  %2407 = icmp slt i32 %2406, 32
  br i1 %2407, label %2420, label %2408

2408:                                             ; preds = %2401
  %2409 = load i8, ptr %221, align 1
  %2410 = sext i8 %2409 to i32
  %2411 = icmp sgt i32 %2410, 126
  br i1 %2411, label %2420, label %2412

2412:                                             ; preds = %2408
  %2413 = load i8, ptr %221, align 1
  %2414 = sext i8 %2413 to i32
  %2415 = icmp eq i32 %2414, 34
  br i1 %2415, label %2420, label %2416

2416:                                             ; preds = %2412
  %2417 = load i8, ptr %221, align 1
  %2418 = sext i8 %2417 to i32
  %2419 = icmp eq i32 %2418, 92
  br i1 %2419, label %2420, label %2421

2420:                                             ; preds = %2416, %2412, %2408, %2401
  store i1 false, ptr %210, align 1
  br label %2976

2421:                                             ; preds = %2416
  br label %2422

2422:                                             ; preds = %2421, %2398
  %2423 = load i64, ptr %212, align 8
  %2424 = icmp ult i64 9, %2423
  br i1 %2424, label %2425, label %2446

2425:                                             ; preds = %2422
  %2426 = load ptr, ptr %211, align 8
  %2427 = getelementptr inbounds i8, ptr %2426, i64 9
  %2428 = load i8, ptr %2427, align 1
  store i8 %2428, ptr %222, align 1
  %2429 = load i8, ptr %222, align 1
  %2430 = sext i8 %2429 to i32
  %2431 = icmp slt i32 %2430, 32
  br i1 %2431, label %2444, label %2432

2432:                                             ; preds = %2425
  %2433 = load i8, ptr %222, align 1
  %2434 = sext i8 %2433 to i32
  %2435 = icmp sgt i32 %2434, 126
  br i1 %2435, label %2444, label %2436

2436:                                             ; preds = %2432
  %2437 = load i8, ptr %222, align 1
  %2438 = sext i8 %2437 to i32
  %2439 = icmp eq i32 %2438, 34
  br i1 %2439, label %2444, label %2440

2440:                                             ; preds = %2436
  %2441 = load i8, ptr %222, align 1
  %2442 = sext i8 %2441 to i32
  %2443 = icmp eq i32 %2442, 92
  br i1 %2443, label %2444, label %2445

2444:                                             ; preds = %2440, %2436, %2432, %2425
  store i1 false, ptr %210, align 1
  br label %2976

2445:                                             ; preds = %2440
  br label %2446

2446:                                             ; preds = %2445, %2422
  %2447 = load i64, ptr %212, align 8
  %2448 = icmp ult i64 10, %2447
  br i1 %2448, label %2449, label %2470

2449:                                             ; preds = %2446
  %2450 = load ptr, ptr %211, align 8
  %2451 = getelementptr inbounds i8, ptr %2450, i64 10
  %2452 = load i8, ptr %2451, align 1
  store i8 %2452, ptr %223, align 1
  %2453 = load i8, ptr %223, align 1
  %2454 = sext i8 %2453 to i32
  %2455 = icmp slt i32 %2454, 32
  br i1 %2455, label %2468, label %2456

2456:                                             ; preds = %2449
  %2457 = load i8, ptr %223, align 1
  %2458 = sext i8 %2457 to i32
  %2459 = icmp sgt i32 %2458, 126
  br i1 %2459, label %2468, label %2460

2460:                                             ; preds = %2456
  %2461 = load i8, ptr %223, align 1
  %2462 = sext i8 %2461 to i32
  %2463 = icmp eq i32 %2462, 34
  br i1 %2463, label %2468, label %2464

2464:                                             ; preds = %2460
  %2465 = load i8, ptr %223, align 1
  %2466 = sext i8 %2465 to i32
  %2467 = icmp eq i32 %2466, 92
  br i1 %2467, label %2468, label %2469

2468:                                             ; preds = %2464, %2460, %2456, %2449
  store i1 false, ptr %210, align 1
  br label %2976

2469:                                             ; preds = %2464
  br label %2470

2470:                                             ; preds = %2469, %2446
  %2471 = load i64, ptr %212, align 8
  %2472 = icmp ult i64 11, %2471
  br i1 %2472, label %2473, label %2494

2473:                                             ; preds = %2470
  %2474 = load ptr, ptr %211, align 8
  %2475 = getelementptr inbounds i8, ptr %2474, i64 11
  %2476 = load i8, ptr %2475, align 1
  store i8 %2476, ptr %224, align 1
  %2477 = load i8, ptr %224, align 1
  %2478 = sext i8 %2477 to i32
  %2479 = icmp slt i32 %2478, 32
  br i1 %2479, label %2492, label %2480

2480:                                             ; preds = %2473
  %2481 = load i8, ptr %224, align 1
  %2482 = sext i8 %2481 to i32
  %2483 = icmp sgt i32 %2482, 126
  br i1 %2483, label %2492, label %2484

2484:                                             ; preds = %2480
  %2485 = load i8, ptr %224, align 1
  %2486 = sext i8 %2485 to i32
  %2487 = icmp eq i32 %2486, 34
  br i1 %2487, label %2492, label %2488

2488:                                             ; preds = %2484
  %2489 = load i8, ptr %224, align 1
  %2490 = sext i8 %2489 to i32
  %2491 = icmp eq i32 %2490, 92
  br i1 %2491, label %2492, label %2493

2492:                                             ; preds = %2488, %2484, %2480, %2473
  store i1 false, ptr %210, align 1
  br label %2976

2493:                                             ; preds = %2488
  br label %2494

2494:                                             ; preds = %2493, %2470
  %2495 = load i64, ptr %212, align 8
  %2496 = icmp ult i64 12, %2495
  br i1 %2496, label %2497, label %2518

2497:                                             ; preds = %2494
  %2498 = load ptr, ptr %211, align 8
  %2499 = getelementptr inbounds i8, ptr %2498, i64 12
  %2500 = load i8, ptr %2499, align 1
  store i8 %2500, ptr %225, align 1
  %2501 = load i8, ptr %225, align 1
  %2502 = sext i8 %2501 to i32
  %2503 = icmp slt i32 %2502, 32
  br i1 %2503, label %2516, label %2504

2504:                                             ; preds = %2497
  %2505 = load i8, ptr %225, align 1
  %2506 = sext i8 %2505 to i32
  %2507 = icmp sgt i32 %2506, 126
  br i1 %2507, label %2516, label %2508

2508:                                             ; preds = %2504
  %2509 = load i8, ptr %225, align 1
  %2510 = sext i8 %2509 to i32
  %2511 = icmp eq i32 %2510, 34
  br i1 %2511, label %2516, label %2512

2512:                                             ; preds = %2508
  %2513 = load i8, ptr %225, align 1
  %2514 = sext i8 %2513 to i32
  %2515 = icmp eq i32 %2514, 92
  br i1 %2515, label %2516, label %2517

2516:                                             ; preds = %2512, %2508, %2504, %2497
  store i1 false, ptr %210, align 1
  br label %2976

2517:                                             ; preds = %2512
  br label %2518

2518:                                             ; preds = %2517, %2494
  %2519 = load i64, ptr %212, align 8
  %2520 = icmp ult i64 13, %2519
  br i1 %2520, label %2521, label %2542

2521:                                             ; preds = %2518
  %2522 = load ptr, ptr %211, align 8
  %2523 = getelementptr inbounds i8, ptr %2522, i64 13
  %2524 = load i8, ptr %2523, align 1
  store i8 %2524, ptr %226, align 1
  %2525 = load i8, ptr %226, align 1
  %2526 = sext i8 %2525 to i32
  %2527 = icmp slt i32 %2526, 32
  br i1 %2527, label %2540, label %2528

2528:                                             ; preds = %2521
  %2529 = load i8, ptr %226, align 1
  %2530 = sext i8 %2529 to i32
  %2531 = icmp sgt i32 %2530, 126
  br i1 %2531, label %2540, label %2532

2532:                                             ; preds = %2528
  %2533 = load i8, ptr %226, align 1
  %2534 = sext i8 %2533 to i32
  %2535 = icmp eq i32 %2534, 34
  br i1 %2535, label %2540, label %2536

2536:                                             ; preds = %2532
  %2537 = load i8, ptr %226, align 1
  %2538 = sext i8 %2537 to i32
  %2539 = icmp eq i32 %2538, 92
  br i1 %2539, label %2540, label %2541

2540:                                             ; preds = %2536, %2532, %2528, %2521
  store i1 false, ptr %210, align 1
  br label %2976

2541:                                             ; preds = %2536
  br label %2542

2542:                                             ; preds = %2541, %2518
  %2543 = load i64, ptr %212, align 8
  %2544 = icmp ult i64 14, %2543
  br i1 %2544, label %2545, label %2566

2545:                                             ; preds = %2542
  %2546 = load ptr, ptr %211, align 8
  %2547 = getelementptr inbounds i8, ptr %2546, i64 14
  %2548 = load i8, ptr %2547, align 1
  store i8 %2548, ptr %227, align 1
  %2549 = load i8, ptr %227, align 1
  %2550 = sext i8 %2549 to i32
  %2551 = icmp slt i32 %2550, 32
  br i1 %2551, label %2564, label %2552

2552:                                             ; preds = %2545
  %2553 = load i8, ptr %227, align 1
  %2554 = sext i8 %2553 to i32
  %2555 = icmp sgt i32 %2554, 126
  br i1 %2555, label %2564, label %2556

2556:                                             ; preds = %2552
  %2557 = load i8, ptr %227, align 1
  %2558 = sext i8 %2557 to i32
  %2559 = icmp eq i32 %2558, 34
  br i1 %2559, label %2564, label %2560

2560:                                             ; preds = %2556
  %2561 = load i8, ptr %227, align 1
  %2562 = sext i8 %2561 to i32
  %2563 = icmp eq i32 %2562, 92
  br i1 %2563, label %2564, label %2565

2564:                                             ; preds = %2560, %2556, %2552, %2545
  store i1 false, ptr %210, align 1
  br label %2976

2565:                                             ; preds = %2560
  br label %2566

2566:                                             ; preds = %2565, %2542
  %2567 = load i64, ptr %212, align 8
  %2568 = icmp ult i64 15, %2567
  br i1 %2568, label %2569, label %2590

2569:                                             ; preds = %2566
  %2570 = load ptr, ptr %211, align 8
  %2571 = getelementptr inbounds i8, ptr %2570, i64 15
  %2572 = load i8, ptr %2571, align 1
  store i8 %2572, ptr %228, align 1
  %2573 = load i8, ptr %228, align 1
  %2574 = sext i8 %2573 to i32
  %2575 = icmp slt i32 %2574, 32
  br i1 %2575, label %2588, label %2576

2576:                                             ; preds = %2569
  %2577 = load i8, ptr %228, align 1
  %2578 = sext i8 %2577 to i32
  %2579 = icmp sgt i32 %2578, 126
  br i1 %2579, label %2588, label %2580

2580:                                             ; preds = %2576
  %2581 = load i8, ptr %228, align 1
  %2582 = sext i8 %2581 to i32
  %2583 = icmp eq i32 %2582, 34
  br i1 %2583, label %2588, label %2584

2584:                                             ; preds = %2580
  %2585 = load i8, ptr %228, align 1
  %2586 = sext i8 %2585 to i32
  %2587 = icmp eq i32 %2586, 92
  br i1 %2587, label %2588, label %2589

2588:                                             ; preds = %2584, %2580, %2576, %2569
  store i1 false, ptr %210, align 1
  br label %2976

2589:                                             ; preds = %2584
  br label %2590

2590:                                             ; preds = %2589, %2566
  %2591 = load i64, ptr %212, align 8
  %2592 = icmp ult i64 16, %2591
  br i1 %2592, label %2593, label %2614

2593:                                             ; preds = %2590
  %2594 = load ptr, ptr %211, align 8
  %2595 = getelementptr inbounds i8, ptr %2594, i64 16
  %2596 = load i8, ptr %2595, align 1
  store i8 %2596, ptr %229, align 1
  %2597 = load i8, ptr %229, align 1
  %2598 = sext i8 %2597 to i32
  %2599 = icmp slt i32 %2598, 32
  br i1 %2599, label %2612, label %2600

2600:                                             ; preds = %2593
  %2601 = load i8, ptr %229, align 1
  %2602 = sext i8 %2601 to i32
  %2603 = icmp sgt i32 %2602, 126
  br i1 %2603, label %2612, label %2604

2604:                                             ; preds = %2600
  %2605 = load i8, ptr %229, align 1
  %2606 = sext i8 %2605 to i32
  %2607 = icmp eq i32 %2606, 34
  br i1 %2607, label %2612, label %2608

2608:                                             ; preds = %2604
  %2609 = load i8, ptr %229, align 1
  %2610 = sext i8 %2609 to i32
  %2611 = icmp eq i32 %2610, 92
  br i1 %2611, label %2612, label %2613

2612:                                             ; preds = %2608, %2604, %2600, %2593
  store i1 false, ptr %210, align 1
  br label %2976

2613:                                             ; preds = %2608
  br label %2614

2614:                                             ; preds = %2613, %2590
  %2615 = load i64, ptr %212, align 8
  %2616 = icmp ult i64 17, %2615
  br i1 %2616, label %2617, label %2638

2617:                                             ; preds = %2614
  %2618 = load ptr, ptr %211, align 8
  %2619 = getelementptr inbounds i8, ptr %2618, i64 17
  %2620 = load i8, ptr %2619, align 1
  store i8 %2620, ptr %230, align 1
  %2621 = load i8, ptr %230, align 1
  %2622 = sext i8 %2621 to i32
  %2623 = icmp slt i32 %2622, 32
  br i1 %2623, label %2636, label %2624

2624:                                             ; preds = %2617
  %2625 = load i8, ptr %230, align 1
  %2626 = sext i8 %2625 to i32
  %2627 = icmp sgt i32 %2626, 126
  br i1 %2627, label %2636, label %2628

2628:                                             ; preds = %2624
  %2629 = load i8, ptr %230, align 1
  %2630 = sext i8 %2629 to i32
  %2631 = icmp eq i32 %2630, 34
  br i1 %2631, label %2636, label %2632

2632:                                             ; preds = %2628
  %2633 = load i8, ptr %230, align 1
  %2634 = sext i8 %2633 to i32
  %2635 = icmp eq i32 %2634, 92
  br i1 %2635, label %2636, label %2637

2636:                                             ; preds = %2632, %2628, %2624, %2617
  store i1 false, ptr %210, align 1
  br label %2976

2637:                                             ; preds = %2632
  br label %2638

2638:                                             ; preds = %2637, %2614
  %2639 = load i64, ptr %212, align 8
  %2640 = icmp ult i64 18, %2639
  br i1 %2640, label %2641, label %2662

2641:                                             ; preds = %2638
  %2642 = load ptr, ptr %211, align 8
  %2643 = getelementptr inbounds i8, ptr %2642, i64 18
  %2644 = load i8, ptr %2643, align 1
  store i8 %2644, ptr %231, align 1
  %2645 = load i8, ptr %231, align 1
  %2646 = sext i8 %2645 to i32
  %2647 = icmp slt i32 %2646, 32
  br i1 %2647, label %2660, label %2648

2648:                                             ; preds = %2641
  %2649 = load i8, ptr %231, align 1
  %2650 = sext i8 %2649 to i32
  %2651 = icmp sgt i32 %2650, 126
  br i1 %2651, label %2660, label %2652

2652:                                             ; preds = %2648
  %2653 = load i8, ptr %231, align 1
  %2654 = sext i8 %2653 to i32
  %2655 = icmp eq i32 %2654, 34
  br i1 %2655, label %2660, label %2656

2656:                                             ; preds = %2652
  %2657 = load i8, ptr %231, align 1
  %2658 = sext i8 %2657 to i32
  %2659 = icmp eq i32 %2658, 92
  br i1 %2659, label %2660, label %2661

2660:                                             ; preds = %2656, %2652, %2648, %2641
  store i1 false, ptr %210, align 1
  br label %2976

2661:                                             ; preds = %2656
  br label %2662

2662:                                             ; preds = %2661, %2638
  %2663 = load i64, ptr %212, align 8
  %2664 = icmp ult i64 19, %2663
  br i1 %2664, label %2665, label %2686

2665:                                             ; preds = %2662
  %2666 = load ptr, ptr %211, align 8
  %2667 = getelementptr inbounds i8, ptr %2666, i64 19
  %2668 = load i8, ptr %2667, align 1
  store i8 %2668, ptr %232, align 1
  %2669 = load i8, ptr %232, align 1
  %2670 = sext i8 %2669 to i32
  %2671 = icmp slt i32 %2670, 32
  br i1 %2671, label %2684, label %2672

2672:                                             ; preds = %2665
  %2673 = load i8, ptr %232, align 1
  %2674 = sext i8 %2673 to i32
  %2675 = icmp sgt i32 %2674, 126
  br i1 %2675, label %2684, label %2676

2676:                                             ; preds = %2672
  %2677 = load i8, ptr %232, align 1
  %2678 = sext i8 %2677 to i32
  %2679 = icmp eq i32 %2678, 34
  br i1 %2679, label %2684, label %2680

2680:                                             ; preds = %2676
  %2681 = load i8, ptr %232, align 1
  %2682 = sext i8 %2681 to i32
  %2683 = icmp eq i32 %2682, 92
  br i1 %2683, label %2684, label %2685

2684:                                             ; preds = %2680, %2676, %2672, %2665
  store i1 false, ptr %210, align 1
  br label %2976

2685:                                             ; preds = %2680
  br label %2686

2686:                                             ; preds = %2685, %2662
  %2687 = load i64, ptr %212, align 8
  %2688 = icmp ult i64 20, %2687
  br i1 %2688, label %2689, label %2710

2689:                                             ; preds = %2686
  %2690 = load ptr, ptr %211, align 8
  %2691 = getelementptr inbounds i8, ptr %2690, i64 20
  %2692 = load i8, ptr %2691, align 1
  store i8 %2692, ptr %233, align 1
  %2693 = load i8, ptr %233, align 1
  %2694 = sext i8 %2693 to i32
  %2695 = icmp slt i32 %2694, 32
  br i1 %2695, label %2708, label %2696

2696:                                             ; preds = %2689
  %2697 = load i8, ptr %233, align 1
  %2698 = sext i8 %2697 to i32
  %2699 = icmp sgt i32 %2698, 126
  br i1 %2699, label %2708, label %2700

2700:                                             ; preds = %2696
  %2701 = load i8, ptr %233, align 1
  %2702 = sext i8 %2701 to i32
  %2703 = icmp eq i32 %2702, 34
  br i1 %2703, label %2708, label %2704

2704:                                             ; preds = %2700
  %2705 = load i8, ptr %233, align 1
  %2706 = sext i8 %2705 to i32
  %2707 = icmp eq i32 %2706, 92
  br i1 %2707, label %2708, label %2709

2708:                                             ; preds = %2704, %2700, %2696, %2689
  store i1 false, ptr %210, align 1
  br label %2976

2709:                                             ; preds = %2704
  br label %2710

2710:                                             ; preds = %2709, %2686
  %2711 = load i64, ptr %212, align 8
  %2712 = icmp ult i64 21, %2711
  br i1 %2712, label %2713, label %2734

2713:                                             ; preds = %2710
  %2714 = load ptr, ptr %211, align 8
  %2715 = getelementptr inbounds i8, ptr %2714, i64 21
  %2716 = load i8, ptr %2715, align 1
  store i8 %2716, ptr %234, align 1
  %2717 = load i8, ptr %234, align 1
  %2718 = sext i8 %2717 to i32
  %2719 = icmp slt i32 %2718, 32
  br i1 %2719, label %2732, label %2720

2720:                                             ; preds = %2713
  %2721 = load i8, ptr %234, align 1
  %2722 = sext i8 %2721 to i32
  %2723 = icmp sgt i32 %2722, 126
  br i1 %2723, label %2732, label %2724

2724:                                             ; preds = %2720
  %2725 = load i8, ptr %234, align 1
  %2726 = sext i8 %2725 to i32
  %2727 = icmp eq i32 %2726, 34
  br i1 %2727, label %2732, label %2728

2728:                                             ; preds = %2724
  %2729 = load i8, ptr %234, align 1
  %2730 = sext i8 %2729 to i32
  %2731 = icmp eq i32 %2730, 92
  br i1 %2731, label %2732, label %2733

2732:                                             ; preds = %2728, %2724, %2720, %2713
  store i1 false, ptr %210, align 1
  br label %2976

2733:                                             ; preds = %2728
  br label %2734

2734:                                             ; preds = %2733, %2710
  %2735 = load i64, ptr %212, align 8
  %2736 = icmp ult i64 22, %2735
  br i1 %2736, label %2737, label %2758

2737:                                             ; preds = %2734
  %2738 = load ptr, ptr %211, align 8
  %2739 = getelementptr inbounds i8, ptr %2738, i64 22
  %2740 = load i8, ptr %2739, align 1
  store i8 %2740, ptr %235, align 1
  %2741 = load i8, ptr %235, align 1
  %2742 = sext i8 %2741 to i32
  %2743 = icmp slt i32 %2742, 32
  br i1 %2743, label %2756, label %2744

2744:                                             ; preds = %2737
  %2745 = load i8, ptr %235, align 1
  %2746 = sext i8 %2745 to i32
  %2747 = icmp sgt i32 %2746, 126
  br i1 %2747, label %2756, label %2748

2748:                                             ; preds = %2744
  %2749 = load i8, ptr %235, align 1
  %2750 = sext i8 %2749 to i32
  %2751 = icmp eq i32 %2750, 34
  br i1 %2751, label %2756, label %2752

2752:                                             ; preds = %2748
  %2753 = load i8, ptr %235, align 1
  %2754 = sext i8 %2753 to i32
  %2755 = icmp eq i32 %2754, 92
  br i1 %2755, label %2756, label %2757

2756:                                             ; preds = %2752, %2748, %2744, %2737
  store i1 false, ptr %210, align 1
  br label %2976

2757:                                             ; preds = %2752
  br label %2758

2758:                                             ; preds = %2757, %2734
  %2759 = load i64, ptr %212, align 8
  %2760 = icmp ult i64 23, %2759
  br i1 %2760, label %2761, label %2782

2761:                                             ; preds = %2758
  %2762 = load ptr, ptr %211, align 8
  %2763 = getelementptr inbounds i8, ptr %2762, i64 23
  %2764 = load i8, ptr %2763, align 1
  store i8 %2764, ptr %236, align 1
  %2765 = load i8, ptr %236, align 1
  %2766 = sext i8 %2765 to i32
  %2767 = icmp slt i32 %2766, 32
  br i1 %2767, label %2780, label %2768

2768:                                             ; preds = %2761
  %2769 = load i8, ptr %236, align 1
  %2770 = sext i8 %2769 to i32
  %2771 = icmp sgt i32 %2770, 126
  br i1 %2771, label %2780, label %2772

2772:                                             ; preds = %2768
  %2773 = load i8, ptr %236, align 1
  %2774 = sext i8 %2773 to i32
  %2775 = icmp eq i32 %2774, 34
  br i1 %2775, label %2780, label %2776

2776:                                             ; preds = %2772
  %2777 = load i8, ptr %236, align 1
  %2778 = sext i8 %2777 to i32
  %2779 = icmp eq i32 %2778, 92
  br i1 %2779, label %2780, label %2781

2780:                                             ; preds = %2776, %2772, %2768, %2761
  store i1 false, ptr %210, align 1
  br label %2976

2781:                                             ; preds = %2776
  br label %2782

2782:                                             ; preds = %2781, %2758
  %2783 = load i64, ptr %212, align 8
  %2784 = icmp ult i64 24, %2783
  br i1 %2784, label %2785, label %2806

2785:                                             ; preds = %2782
  %2786 = load ptr, ptr %211, align 8
  %2787 = getelementptr inbounds i8, ptr %2786, i64 24
  %2788 = load i8, ptr %2787, align 1
  store i8 %2788, ptr %237, align 1
  %2789 = load i8, ptr %237, align 1
  %2790 = sext i8 %2789 to i32
  %2791 = icmp slt i32 %2790, 32
  br i1 %2791, label %2804, label %2792

2792:                                             ; preds = %2785
  %2793 = load i8, ptr %237, align 1
  %2794 = sext i8 %2793 to i32
  %2795 = icmp sgt i32 %2794, 126
  br i1 %2795, label %2804, label %2796

2796:                                             ; preds = %2792
  %2797 = load i8, ptr %237, align 1
  %2798 = sext i8 %2797 to i32
  %2799 = icmp eq i32 %2798, 34
  br i1 %2799, label %2804, label %2800

2800:                                             ; preds = %2796
  %2801 = load i8, ptr %237, align 1
  %2802 = sext i8 %2801 to i32
  %2803 = icmp eq i32 %2802, 92
  br i1 %2803, label %2804, label %2805

2804:                                             ; preds = %2800, %2796, %2792, %2785
  store i1 false, ptr %210, align 1
  br label %2976

2805:                                             ; preds = %2800
  br label %2806

2806:                                             ; preds = %2805, %2782
  %2807 = load i64, ptr %212, align 8
  %2808 = icmp ult i64 25, %2807
  br i1 %2808, label %2809, label %2830

2809:                                             ; preds = %2806
  %2810 = load ptr, ptr %211, align 8
  %2811 = getelementptr inbounds i8, ptr %2810, i64 25
  %2812 = load i8, ptr %2811, align 1
  store i8 %2812, ptr %238, align 1
  %2813 = load i8, ptr %238, align 1
  %2814 = sext i8 %2813 to i32
  %2815 = icmp slt i32 %2814, 32
  br i1 %2815, label %2828, label %2816

2816:                                             ; preds = %2809
  %2817 = load i8, ptr %238, align 1
  %2818 = sext i8 %2817 to i32
  %2819 = icmp sgt i32 %2818, 126
  br i1 %2819, label %2828, label %2820

2820:                                             ; preds = %2816
  %2821 = load i8, ptr %238, align 1
  %2822 = sext i8 %2821 to i32
  %2823 = icmp eq i32 %2822, 34
  br i1 %2823, label %2828, label %2824

2824:                                             ; preds = %2820
  %2825 = load i8, ptr %238, align 1
  %2826 = sext i8 %2825 to i32
  %2827 = icmp eq i32 %2826, 92
  br i1 %2827, label %2828, label %2829

2828:                                             ; preds = %2824, %2820, %2816, %2809
  store i1 false, ptr %210, align 1
  br label %2976

2829:                                             ; preds = %2824
  br label %2830

2830:                                             ; preds = %2829, %2806
  %2831 = load i64, ptr %212, align 8
  %2832 = icmp ult i64 26, %2831
  br i1 %2832, label %2833, label %2854

2833:                                             ; preds = %2830
  %2834 = load ptr, ptr %211, align 8
  %2835 = getelementptr inbounds i8, ptr %2834, i64 26
  %2836 = load i8, ptr %2835, align 1
  store i8 %2836, ptr %239, align 1
  %2837 = load i8, ptr %239, align 1
  %2838 = sext i8 %2837 to i32
  %2839 = icmp slt i32 %2838, 32
  br i1 %2839, label %2852, label %2840

2840:                                             ; preds = %2833
  %2841 = load i8, ptr %239, align 1
  %2842 = sext i8 %2841 to i32
  %2843 = icmp sgt i32 %2842, 126
  br i1 %2843, label %2852, label %2844

2844:                                             ; preds = %2840
  %2845 = load i8, ptr %239, align 1
  %2846 = sext i8 %2845 to i32
  %2847 = icmp eq i32 %2846, 34
  br i1 %2847, label %2852, label %2848

2848:                                             ; preds = %2844
  %2849 = load i8, ptr %239, align 1
  %2850 = sext i8 %2849 to i32
  %2851 = icmp eq i32 %2850, 92
  br i1 %2851, label %2852, label %2853

2852:                                             ; preds = %2848, %2844, %2840, %2833
  store i1 false, ptr %210, align 1
  br label %2976

2853:                                             ; preds = %2848
  br label %2854

2854:                                             ; preds = %2853, %2830
  %2855 = load i64, ptr %212, align 8
  %2856 = icmp ult i64 27, %2855
  br i1 %2856, label %2857, label %2878

2857:                                             ; preds = %2854
  %2858 = load ptr, ptr %211, align 8
  %2859 = getelementptr inbounds i8, ptr %2858, i64 27
  %2860 = load i8, ptr %2859, align 1
  store i8 %2860, ptr %240, align 1
  %2861 = load i8, ptr %240, align 1
  %2862 = sext i8 %2861 to i32
  %2863 = icmp slt i32 %2862, 32
  br i1 %2863, label %2876, label %2864

2864:                                             ; preds = %2857
  %2865 = load i8, ptr %240, align 1
  %2866 = sext i8 %2865 to i32
  %2867 = icmp sgt i32 %2866, 126
  br i1 %2867, label %2876, label %2868

2868:                                             ; preds = %2864
  %2869 = load i8, ptr %240, align 1
  %2870 = sext i8 %2869 to i32
  %2871 = icmp eq i32 %2870, 34
  br i1 %2871, label %2876, label %2872

2872:                                             ; preds = %2868
  %2873 = load i8, ptr %240, align 1
  %2874 = sext i8 %2873 to i32
  %2875 = icmp eq i32 %2874, 92
  br i1 %2875, label %2876, label %2877

2876:                                             ; preds = %2872, %2868, %2864, %2857
  store i1 false, ptr %210, align 1
  br label %2976

2877:                                             ; preds = %2872
  br label %2878

2878:                                             ; preds = %2877, %2854
  %2879 = load i64, ptr %212, align 8
  %2880 = icmp ult i64 28, %2879
  br i1 %2880, label %2881, label %2902

2881:                                             ; preds = %2878
  %2882 = load ptr, ptr %211, align 8
  %2883 = getelementptr inbounds i8, ptr %2882, i64 28
  %2884 = load i8, ptr %2883, align 1
  store i8 %2884, ptr %241, align 1
  %2885 = load i8, ptr %241, align 1
  %2886 = sext i8 %2885 to i32
  %2887 = icmp slt i32 %2886, 32
  br i1 %2887, label %2900, label %2888

2888:                                             ; preds = %2881
  %2889 = load i8, ptr %241, align 1
  %2890 = sext i8 %2889 to i32
  %2891 = icmp sgt i32 %2890, 126
  br i1 %2891, label %2900, label %2892

2892:                                             ; preds = %2888
  %2893 = load i8, ptr %241, align 1
  %2894 = sext i8 %2893 to i32
  %2895 = icmp eq i32 %2894, 34
  br i1 %2895, label %2900, label %2896

2896:                                             ; preds = %2892
  %2897 = load i8, ptr %241, align 1
  %2898 = sext i8 %2897 to i32
  %2899 = icmp eq i32 %2898, 92
  br i1 %2899, label %2900, label %2901

2900:                                             ; preds = %2896, %2892, %2888, %2881
  store i1 false, ptr %210, align 1
  br label %2976

2901:                                             ; preds = %2896
  br label %2902

2902:                                             ; preds = %2901, %2878
  %2903 = load i64, ptr %212, align 8
  %2904 = icmp ult i64 29, %2903
  br i1 %2904, label %2905, label %2926

2905:                                             ; preds = %2902
  %2906 = load ptr, ptr %211, align 8
  %2907 = getelementptr inbounds i8, ptr %2906, i64 29
  %2908 = load i8, ptr %2907, align 1
  store i8 %2908, ptr %242, align 1
  %2909 = load i8, ptr %242, align 1
  %2910 = sext i8 %2909 to i32
  %2911 = icmp slt i32 %2910, 32
  br i1 %2911, label %2924, label %2912

2912:                                             ; preds = %2905
  %2913 = load i8, ptr %242, align 1
  %2914 = sext i8 %2913 to i32
  %2915 = icmp sgt i32 %2914, 126
  br i1 %2915, label %2924, label %2916

2916:                                             ; preds = %2912
  %2917 = load i8, ptr %242, align 1
  %2918 = sext i8 %2917 to i32
  %2919 = icmp eq i32 %2918, 34
  br i1 %2919, label %2924, label %2920

2920:                                             ; preds = %2916
  %2921 = load i8, ptr %242, align 1
  %2922 = sext i8 %2921 to i32
  %2923 = icmp eq i32 %2922, 92
  br i1 %2923, label %2924, label %2925

2924:                                             ; preds = %2920, %2916, %2912, %2905
  store i1 false, ptr %210, align 1
  br label %2976

2925:                                             ; preds = %2920
  br label %2926

2926:                                             ; preds = %2925, %2902
  %2927 = load i64, ptr %212, align 8
  %2928 = icmp ult i64 30, %2927
  br i1 %2928, label %2929, label %2950

2929:                                             ; preds = %2926
  %2930 = load ptr, ptr %211, align 8
  %2931 = getelementptr inbounds i8, ptr %2930, i64 30
  %2932 = load i8, ptr %2931, align 1
  store i8 %2932, ptr %243, align 1
  %2933 = load i8, ptr %243, align 1
  %2934 = sext i8 %2933 to i32
  %2935 = icmp slt i32 %2934, 32
  br i1 %2935, label %2948, label %2936

2936:                                             ; preds = %2929
  %2937 = load i8, ptr %243, align 1
  %2938 = sext i8 %2937 to i32
  %2939 = icmp sgt i32 %2938, 126
  br i1 %2939, label %2948, label %2940

2940:                                             ; preds = %2936
  %2941 = load i8, ptr %243, align 1
  %2942 = sext i8 %2941 to i32
  %2943 = icmp eq i32 %2942, 34
  br i1 %2943, label %2948, label %2944

2944:                                             ; preds = %2940
  %2945 = load i8, ptr %243, align 1
  %2946 = sext i8 %2945 to i32
  %2947 = icmp eq i32 %2946, 92
  br i1 %2947, label %2948, label %2949

2948:                                             ; preds = %2944, %2940, %2936, %2929
  store i1 false, ptr %210, align 1
  br label %2976

2949:                                             ; preds = %2944
  br label %2950

2950:                                             ; preds = %2949, %2926
  %2951 = load i64, ptr %212, align 8
  %2952 = icmp ult i64 31, %2951
  br i1 %2952, label %2953, label %2974

2953:                                             ; preds = %2950
  %2954 = load ptr, ptr %211, align 8
  %2955 = getelementptr inbounds i8, ptr %2954, i64 31
  %2956 = load i8, ptr %2955, align 1
  store i8 %2956, ptr %244, align 1
  %2957 = load i8, ptr %244, align 1
  %2958 = sext i8 %2957 to i32
  %2959 = icmp slt i32 %2958, 32
  br i1 %2959, label %2972, label %2960

2960:                                             ; preds = %2953
  %2961 = load i8, ptr %244, align 1
  %2962 = sext i8 %2961 to i32
  %2963 = icmp sgt i32 %2962, 126
  br i1 %2963, label %2972, label %2964

2964:                                             ; preds = %2960
  %2965 = load i8, ptr %244, align 1
  %2966 = sext i8 %2965 to i32
  %2967 = icmp eq i32 %2966, 34
  br i1 %2967, label %2972, label %2968

2968:                                             ; preds = %2964
  %2969 = load i8, ptr %244, align 1
  %2970 = sext i8 %2969 to i32
  %2971 = icmp eq i32 %2970, 92
  br i1 %2971, label %2972, label %2973

2972:                                             ; preds = %2968, %2964, %2960, %2953
  store i1 false, ptr %210, align 1
  br label %2976

2973:                                             ; preds = %2968
  br label %2974

2974:                                             ; preds = %2973, %2950
  store i1 true, ptr %210, align 1
  br label %2976

2975:                                             ; preds = %2204, %2195
  store i1 false, ptr %210, align 1
  br label %2976

2976:                                             ; preds = %2228, %2252, %2276, %2300, %2324, %2348, %2372, %2396, %2420, %2444, %2468, %2492, %2516, %2540, %2564, %2588, %2612, %2636, %2660, %2684, %2708, %2732, %2756, %2780, %2804, %2828, %2852, %2876, %2900, %2924, %2948, %2972, %2974, %2975
  %2977 = load i1, ptr %210, align 1
  %2978 = zext i1 %2977 to i8
  store i8 %2978, ptr %528, align 1
  %2979 = load i8, ptr %528, align 1
  %2980 = trunc i8 %2979 to i1
  %2981 = zext i1 %2980 to i64
  %2982 = select i1 %2980, i32 8, i32 0
  %2983 = trunc i32 %2982 to i8
  store i8 %2983, ptr %529, align 1
  %2984 = load ptr, ptr %525, align 8
  %2985 = load i8, ptr %529, align 1
  %2986 = load i64, ptr %527, align 8
  store ptr %2984, ptr %100, align 8
  store i8 5, ptr %101, align 1
  store i8 %2985, ptr %102, align 1
  store i64 %2986, ptr %103, align 8
  %2987 = load i64, ptr %103, align 8
  %2988 = shl i64 %2987, 8
  store i64 %2988, ptr %104, align 8
  %2989 = load i8, ptr %101, align 1
  %2990 = zext i8 %2989 to i32
  %2991 = load i8, ptr %102, align 1
  %2992 = zext i8 %2991 to i32
  %2993 = or i32 %2990, %2992
  %2994 = sext i32 %2993 to i64
  %2995 = load i64, ptr %104, align 8
  %2996 = or i64 %2995, %2994
  store i64 %2996, ptr %104, align 8
  %2997 = load i64, ptr %104, align 8
  %2998 = load ptr, ptr %100, align 8
  store i64 %2997, ptr %2998, align 8
  %2999 = load ptr, ptr %526, align 8
  %3000 = load ptr, ptr %525, align 8
  %3001 = getelementptr inbounds nuw %struct.yyjson_val, ptr %3000, i32 0, i32 1
  store ptr %2999, ptr %3001, align 8
  %3002 = load ptr, ptr %857, align 8
  store ptr %3002, ptr %854, align 8
  br label %3005

3003:                                             ; preds = %2188
  br label %3004

3004:                                             ; preds = %3003, %2144
  store ptr null, ptr %854, align 8
  br label %3005

3005:                                             ; preds = %2976, %3004
  %3006 = load ptr, ptr %854, align 8
  %3007 = load ptr, ptr %938, align 8
  %3008 = load ptr, ptr %942, align 8
  %3009 = getelementptr inbounds nuw %struct.Coord, ptr %3008, i32 0, i32 0
  %3010 = load double, ptr %3009, align 8
  store ptr %3007, ptr %839, align 8
  store double %3010, ptr %840, align 8
  %3011 = load ptr, ptr %839, align 8
  %3012 = icmp ne ptr %3011, null
  %3013 = xor i1 %3012, true
  %3014 = zext i1 %3012 to i32
  %3015 = sext i32 %3014 to i64
  br i1 %3012, label %3016, label %3083

3016:                                             ; preds = %3005
  %3017 = load ptr, ptr %839, align 8
  store ptr %3017, ptr %788, align 8
  store i64 1, ptr %789, align 8
  %3018 = load ptr, ptr %788, align 8
  %3019 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %3018, i32 0, i32 1
  store ptr %3019, ptr %791, align 8
  %3020 = load ptr, ptr %788, align 8
  %3021 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %3020, i32 0, i32 3
  store ptr %3021, ptr %792, align 8
  %3022 = load ptr, ptr %792, align 8
  %3023 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %3022, i32 0, i32 1
  %3024 = load ptr, ptr %3023, align 8
  %3025 = load ptr, ptr %792, align 8
  %3026 = load ptr, ptr %3025, align 8
  %3027 = ptrtoint ptr %3024 to i64
  %3028 = ptrtoint ptr %3026 to i64
  %3029 = sub i64 %3027, %3028
  %3030 = sdiv exact i64 %3029, 24
  %3031 = load i64, ptr %789, align 8
  %3032 = icmp ult i64 %3030, %3031
  %3033 = xor i1 %3032, true
  %3034 = zext i1 %3032 to i32
  %3035 = sext i32 %3034 to i64
  br i1 %3032, label %3036, label %3047

3036:                                             ; preds = %3016
  %3037 = load ptr, ptr %792, align 8
  %3038 = load ptr, ptr %791, align 8
  %3039 = load i64, ptr %789, align 8
  %3040 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %3037, ptr noundef %3038, i64 noundef %3039)
  %3041 = xor i1 %3040, true
  %3042 = xor i1 %3040, true
  %3043 = zext i1 %3042 to i32
  %3044 = sext i32 %3043 to i64
  br i1 %3042, label %3045, label %3046

3045:                                             ; preds = %3036
  store ptr null, ptr %787, align 8
  br label %3055

3046:                                             ; preds = %3036
  br label %3047

3047:                                             ; preds = %3046, %3016
  %3048 = load ptr, ptr %792, align 8
  %3049 = load ptr, ptr %3048, align 8
  store ptr %3049, ptr %790, align 8
  %3050 = load i64, ptr %789, align 8
  %3051 = load ptr, ptr %792, align 8
  %3052 = load ptr, ptr %3051, align 8
  %3053 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3052, i64 %3050
  store ptr %3053, ptr %3051, align 8
  %3054 = load ptr, ptr %790, align 8
  store ptr %3054, ptr %787, align 8
  br label %3055

3055:                                             ; preds = %3045, %3047
  %3056 = load ptr, ptr %787, align 8
  store ptr %3056, ptr %841, align 8
  %3057 = load ptr, ptr %841, align 8
  %3058 = icmp ne ptr %3057, null
  %3059 = xor i1 %3058, true
  %3060 = zext i1 %3058 to i32
  %3061 = sext i32 %3060 to i64
  br i1 %3058, label %3062, label %3082

3062:                                             ; preds = %3055
  %3063 = load ptr, ptr %841, align 8
  %3064 = load double, ptr %840, align 8
  store ptr %3063, ptr %88, align 8
  store double %3064, ptr %89, align 8
  %3065 = load ptr, ptr %88, align 8
  store ptr %3065, ptr %83, align 8
  store i8 4, ptr %84, align 1
  store i8 16, ptr %85, align 1
  store i64 0, ptr %86, align 8
  %3066 = load i64, ptr %86, align 8
  %3067 = shl i64 %3066, 8
  store i64 %3067, ptr %87, align 8
  %3068 = load i8, ptr %84, align 1
  %3069 = zext i8 %3068 to i32
  %3070 = load i8, ptr %85, align 1
  %3071 = zext i8 %3070 to i32
  %3072 = or i32 %3069, %3071
  %3073 = sext i32 %3072 to i64
  %3074 = load i64, ptr %87, align 8
  %3075 = or i64 %3074, %3073
  store i64 %3075, ptr %87, align 8
  %3076 = load i64, ptr %87, align 8
  %3077 = load ptr, ptr %83, align 8
  store i64 %3076, ptr %3077, align 8
  %3078 = load double, ptr %89, align 8
  %3079 = load ptr, ptr %88, align 8
  %3080 = getelementptr inbounds nuw %struct.yyjson_val, ptr %3079, i32 0, i32 1
  store double %3078, ptr %3080, align 8
  %3081 = load ptr, ptr %841, align 8
  store ptr %3081, ptr %838, align 8
  br label %3084

3082:                                             ; preds = %3055
  br label %3083

3083:                                             ; preds = %3082, %3005
  store ptr null, ptr %838, align 8
  br label %3084

3084:                                             ; preds = %3062, %3083
  %3085 = load ptr, ptr %838, align 8
  store ptr %2137, ptr %891, align 8
  store ptr %3006, ptr %892, align 8
  store ptr %3085, ptr %893, align 8
  %3086 = load ptr, ptr %891, align 8
  store ptr %3086, ptr %689, align 8
  %3087 = load ptr, ptr %689, align 8
  %3088 = icmp ne ptr %3087, null
  br i1 %3088, label %3089, label %3102

3089:                                             ; preds = %3084
  %3090 = load ptr, ptr %689, align 8
  store ptr %3090, ptr %609, align 8
  %3091 = load ptr, ptr %609, align 8
  store ptr %3091, ptr %604, align 8
  %3092 = load ptr, ptr %604, align 8
  %3093 = load i64, ptr %3092, align 8
  %3094 = trunc i64 %3093 to i8
  store i8 %3094, ptr %605, align 1
  %3095 = load i8, ptr %605, align 1
  %3096 = zext i8 %3095 to i32
  %3097 = and i32 %3096, 7
  %3098 = trunc i32 %3097 to i8
  %3099 = zext i8 %3098 to i32
  %3100 = icmp eq i32 %3099, 7
  %3101 = zext i1 %3100 to i32
  br label %3103

3102:                                             ; preds = %3084
  br label %3103

3103:                                             ; preds = %3089, %3102
  %3104 = phi i32 [ %3101, %3089 ], [ 0, %3102 ]
  %3105 = icmp ne i32 %3104, 0
  br i1 %3105, label %3106, label %3130

3106:                                             ; preds = %3103
  %3107 = load ptr, ptr %892, align 8
  store ptr %3107, ptr %681, align 8
  %3108 = load ptr, ptr %681, align 8
  %3109 = icmp ne ptr %3108, null
  br i1 %3109, label %3110, label %3123

3110:                                             ; preds = %3106
  %3111 = load ptr, ptr %681, align 8
  store ptr %3111, ptr %573, align 8
  %3112 = load ptr, ptr %573, align 8
  store ptr %3112, ptr %571, align 8
  %3113 = load ptr, ptr %571, align 8
  %3114 = load i64, ptr %3113, align 8
  %3115 = trunc i64 %3114 to i8
  store i8 %3115, ptr %572, align 1
  %3116 = load i8, ptr %572, align 1
  %3117 = zext i8 %3116 to i32
  %3118 = and i32 %3117, 7
  %3119 = trunc i32 %3118 to i8
  %3120 = zext i8 %3119 to i32
  %3121 = icmp eq i32 %3120, 5
  %3122 = zext i1 %3121 to i32
  br label %3124

3123:                                             ; preds = %3106
  br label %3124

3124:                                             ; preds = %3110, %3123
  %3125 = phi i32 [ %3122, %3110 ], [ 0, %3123 ]
  %3126 = icmp ne i32 %3125, 0
  br i1 %3126, label %3127, label %3130

3127:                                             ; preds = %3124
  %3128 = load ptr, ptr %893, align 8
  %3129 = icmp ne ptr %3128, null
  br label %3130

3130:                                             ; preds = %3127, %3124, %3103
  %3131 = phi i1 [ false, %3124 ], [ false, %3103 ], [ %3129, %3127 ]
  %3132 = xor i1 %3131, true
  %3133 = zext i1 %3131 to i32
  %3134 = sext i32 %3133 to i64
  br i1 %3131, label %3135, label %3186

3135:                                             ; preds = %3130
  %3136 = load ptr, ptr %891, align 8
  %3137 = load ptr, ptr %892, align 8
  %3138 = load ptr, ptr %893, align 8
  %3139 = load ptr, ptr %891, align 8
  store ptr %3139, ptr %622, align 8
  %3140 = load ptr, ptr %622, align 8
  %3141 = load i64, ptr %3140, align 8
  %3142 = lshr i64 %3141, 8
  store ptr %3136, ptr %663, align 8
  store ptr %3137, ptr %664, align 8
  store ptr %3138, ptr %665, align 8
  store i64 %3142, ptr %666, align 8
  %3143 = load i64, ptr %666, align 8
  %3144 = icmp ne i64 %3143, 0
  %3145 = xor i1 %3144, true
  %3146 = zext i1 %3144 to i32
  %3147 = sext i32 %3146 to i64
  br i1 %3144, label %3148, label %3163

3148:                                             ; preds = %3135
  %3149 = load ptr, ptr %663, align 8
  %3150 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3149, i32 0, i32 1
  %3151 = load ptr, ptr %3150, align 8
  %3152 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3151, i32 0, i32 2
  %3153 = load ptr, ptr %3152, align 8
  store ptr %3153, ptr %667, align 8
  %3154 = load ptr, ptr %667, align 8
  %3155 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3154, i32 0, i32 2
  %3156 = load ptr, ptr %3155, align 8
  store ptr %3156, ptr %668, align 8
  %3157 = load ptr, ptr %664, align 8
  %3158 = load ptr, ptr %667, align 8
  %3159 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3158, i32 0, i32 2
  store ptr %3157, ptr %3159, align 8
  %3160 = load ptr, ptr %668, align 8
  %3161 = load ptr, ptr %665, align 8
  %3162 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3161, i32 0, i32 2
  store ptr %3160, ptr %3162, align 8
  br label %3167

3163:                                             ; preds = %3135
  %3164 = load ptr, ptr %664, align 8
  %3165 = load ptr, ptr %665, align 8
  %3166 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3165, i32 0, i32 2
  store ptr %3164, ptr %3166, align 8
  br label %3167

3167:                                             ; preds = %3148, %3163
  %3168 = load ptr, ptr %665, align 8
  %3169 = load ptr, ptr %664, align 8
  %3170 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3169, i32 0, i32 2
  store ptr %3168, ptr %3170, align 8
  %3171 = load ptr, ptr %664, align 8
  %3172 = load ptr, ptr %663, align 8
  %3173 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3172, i32 0, i32 1
  store ptr %3171, ptr %3173, align 8
  %3174 = load ptr, ptr %663, align 8
  %3175 = load i64, ptr %666, align 8
  %3176 = add i64 %3175, 1
  store ptr %3174, ptr %547, align 8
  store i64 %3176, ptr %548, align 8
  %3177 = load ptr, ptr %547, align 8
  %3178 = load i64, ptr %3177, align 8
  %3179 = and i64 %3178, 255
  store i64 %3179, ptr %549, align 8
  %3180 = load i64, ptr %548, align 8
  %3181 = shl i64 %3180, 8
  %3182 = load i64, ptr %549, align 8
  %3183 = or i64 %3182, %3181
  store i64 %3183, ptr %549, align 8
  %3184 = load i64, ptr %549, align 8
  %3185 = load ptr, ptr %547, align 8
  store i64 %3184, ptr %3185, align 8
  store i1 true, ptr %890, align 1
  br label %3187

3186:                                             ; preds = %3130
  store i1 false, ptr %890, align 1
  br label %3187

3187:                                             ; preds = %3167, %3186
  %3188 = load i1, ptr %890, align 1
  %3189 = load ptr, ptr %943, align 8
  %3190 = load ptr, ptr %938, align 8
  store ptr %3190, ptr %859, align 8
  store ptr @.str.3, ptr %860, align 8
  %3191 = load ptr, ptr %859, align 8
  %3192 = icmp ne ptr %3191, null
  br i1 %3192, label %3193, label %3196

3193:                                             ; preds = %3187
  %3194 = load ptr, ptr %860, align 8
  %3195 = icmp ne ptr %3194, null
  br label %3196

3196:                                             ; preds = %3193, %3187
  %3197 = phi i1 [ false, %3187 ], [ %3195, %3193 ]
  %3198 = xor i1 %3197, true
  %3199 = zext i1 %3197 to i32
  %3200 = sext i32 %3199 to i64
  br i1 %3197, label %3201, label %4056

3201:                                             ; preds = %3196
  %3202 = load ptr, ptr %859, align 8
  store ptr %3202, ptr %758, align 8
  store i64 1, ptr %759, align 8
  %3203 = load ptr, ptr %758, align 8
  %3204 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %3203, i32 0, i32 1
  store ptr %3204, ptr %761, align 8
  %3205 = load ptr, ptr %758, align 8
  %3206 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %3205, i32 0, i32 3
  store ptr %3206, ptr %762, align 8
  %3207 = load ptr, ptr %762, align 8
  %3208 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %3207, i32 0, i32 1
  %3209 = load ptr, ptr %3208, align 8
  %3210 = load ptr, ptr %762, align 8
  %3211 = load ptr, ptr %3210, align 8
  %3212 = ptrtoint ptr %3209 to i64
  %3213 = ptrtoint ptr %3211 to i64
  %3214 = sub i64 %3212, %3213
  %3215 = sdiv exact i64 %3214, 24
  %3216 = load i64, ptr %759, align 8
  %3217 = icmp ult i64 %3215, %3216
  %3218 = xor i1 %3217, true
  %3219 = zext i1 %3217 to i32
  %3220 = sext i32 %3219 to i64
  br i1 %3217, label %3221, label %3232

3221:                                             ; preds = %3201
  %3222 = load ptr, ptr %762, align 8
  %3223 = load ptr, ptr %761, align 8
  %3224 = load i64, ptr %759, align 8
  %3225 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %3222, ptr noundef %3223, i64 noundef %3224)
  %3226 = xor i1 %3225, true
  %3227 = xor i1 %3225, true
  %3228 = zext i1 %3227 to i32
  %3229 = sext i32 %3228 to i64
  br i1 %3227, label %3230, label %3231

3230:                                             ; preds = %3221
  store ptr null, ptr %757, align 8
  br label %3240

3231:                                             ; preds = %3221
  br label %3232

3232:                                             ; preds = %3231, %3201
  %3233 = load ptr, ptr %762, align 8
  %3234 = load ptr, ptr %3233, align 8
  store ptr %3234, ptr %760, align 8
  %3235 = load i64, ptr %759, align 8
  %3236 = load ptr, ptr %762, align 8
  %3237 = load ptr, ptr %3236, align 8
  %3238 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %3237, i64 %3235
  store ptr %3238, ptr %3236, align 8
  %3239 = load ptr, ptr %760, align 8
  store ptr %3239, ptr %757, align 8
  br label %3240

3240:                                             ; preds = %3230, %3232
  %3241 = load ptr, ptr %757, align 8
  store ptr %3241, ptr %861, align 8
  %3242 = load ptr, ptr %861, align 8
  %3243 = icmp ne ptr %3242, null
  %3244 = xor i1 %3243, true
  %3245 = zext i1 %3243 to i32
  %3246 = sext i32 %3245 to i64
  br i1 %3243, label %3247, label %4055

3247:                                             ; preds = %3240
  %3248 = load ptr, ptr %861, align 8
  %3249 = load ptr, ptr %860, align 8
  store ptr %3248, ptr %520, align 8
  store ptr %3249, ptr %521, align 8
  %3250 = load ptr, ptr %521, align 8
  %3251 = call i64 @strlen(ptr noundef %3250)
  store i64 %3251, ptr %522, align 8
  %3252 = load ptr, ptr %521, align 8
  %3253 = load i64, ptr %522, align 8
  store ptr %3252, ptr %246, align 8
  store i64 %3253, ptr %247, align 8
  %3254 = load i64, ptr %247, align 8
  %3255 = call i1 @llvm.is.constant.i64(i64 %3254)
  br i1 %3255, label %3256, label %4027

3256:                                             ; preds = %3247
  %3257 = load i64, ptr %247, align 8
  %3258 = icmp ule i64 %3257, 32
  br i1 %3258, label %3259, label %4027

3259:                                             ; preds = %3256
  %3260 = load i64, ptr %247, align 8
  %3261 = icmp ult i64 0, %3260
  br i1 %3261, label %3262, label %3282

3262:                                             ; preds = %3259
  %3263 = load ptr, ptr %246, align 8
  %3264 = load i8, ptr %3263, align 1
  store i8 %3264, ptr %248, align 1
  %3265 = load i8, ptr %248, align 1
  %3266 = sext i8 %3265 to i32
  %3267 = icmp slt i32 %3266, 32
  br i1 %3267, label %3280, label %3268

3268:                                             ; preds = %3262
  %3269 = load i8, ptr %248, align 1
  %3270 = sext i8 %3269 to i32
  %3271 = icmp sgt i32 %3270, 126
  br i1 %3271, label %3280, label %3272

3272:                                             ; preds = %3268
  %3273 = load i8, ptr %248, align 1
  %3274 = sext i8 %3273 to i32
  %3275 = icmp eq i32 %3274, 34
  br i1 %3275, label %3280, label %3276

3276:                                             ; preds = %3272
  %3277 = load i8, ptr %248, align 1
  %3278 = sext i8 %3277 to i32
  %3279 = icmp eq i32 %3278, 92
  br i1 %3279, label %3280, label %3281

3280:                                             ; preds = %3276, %3272, %3268, %3262
  store i1 false, ptr %245, align 1
  br label %4028

3281:                                             ; preds = %3276
  br label %3282

3282:                                             ; preds = %3281, %3259
  %3283 = load i64, ptr %247, align 8
  %3284 = icmp ult i64 1, %3283
  br i1 %3284, label %3285, label %3306

3285:                                             ; preds = %3282
  %3286 = load ptr, ptr %246, align 8
  %3287 = getelementptr inbounds i8, ptr %3286, i64 1
  %3288 = load i8, ptr %3287, align 1
  store i8 %3288, ptr %249, align 1
  %3289 = load i8, ptr %249, align 1
  %3290 = sext i8 %3289 to i32
  %3291 = icmp slt i32 %3290, 32
  br i1 %3291, label %3304, label %3292

3292:                                             ; preds = %3285
  %3293 = load i8, ptr %249, align 1
  %3294 = sext i8 %3293 to i32
  %3295 = icmp sgt i32 %3294, 126
  br i1 %3295, label %3304, label %3296

3296:                                             ; preds = %3292
  %3297 = load i8, ptr %249, align 1
  %3298 = sext i8 %3297 to i32
  %3299 = icmp eq i32 %3298, 34
  br i1 %3299, label %3304, label %3300

3300:                                             ; preds = %3296
  %3301 = load i8, ptr %249, align 1
  %3302 = sext i8 %3301 to i32
  %3303 = icmp eq i32 %3302, 92
  br i1 %3303, label %3304, label %3305

3304:                                             ; preds = %3300, %3296, %3292, %3285
  store i1 false, ptr %245, align 1
  br label %4028

3305:                                             ; preds = %3300
  br label %3306

3306:                                             ; preds = %3305, %3282
  %3307 = load i64, ptr %247, align 8
  %3308 = icmp ult i64 2, %3307
  br i1 %3308, label %3309, label %3330

3309:                                             ; preds = %3306
  %3310 = load ptr, ptr %246, align 8
  %3311 = getelementptr inbounds i8, ptr %3310, i64 2
  %3312 = load i8, ptr %3311, align 1
  store i8 %3312, ptr %250, align 1
  %3313 = load i8, ptr %250, align 1
  %3314 = sext i8 %3313 to i32
  %3315 = icmp slt i32 %3314, 32
  br i1 %3315, label %3328, label %3316

3316:                                             ; preds = %3309
  %3317 = load i8, ptr %250, align 1
  %3318 = sext i8 %3317 to i32
  %3319 = icmp sgt i32 %3318, 126
  br i1 %3319, label %3328, label %3320

3320:                                             ; preds = %3316
  %3321 = load i8, ptr %250, align 1
  %3322 = sext i8 %3321 to i32
  %3323 = icmp eq i32 %3322, 34
  br i1 %3323, label %3328, label %3324

3324:                                             ; preds = %3320
  %3325 = load i8, ptr %250, align 1
  %3326 = sext i8 %3325 to i32
  %3327 = icmp eq i32 %3326, 92
  br i1 %3327, label %3328, label %3329

3328:                                             ; preds = %3324, %3320, %3316, %3309
  store i1 false, ptr %245, align 1
  br label %4028

3329:                                             ; preds = %3324
  br label %3330

3330:                                             ; preds = %3329, %3306
  %3331 = load i64, ptr %247, align 8
  %3332 = icmp ult i64 3, %3331
  br i1 %3332, label %3333, label %3354

3333:                                             ; preds = %3330
  %3334 = load ptr, ptr %246, align 8
  %3335 = getelementptr inbounds i8, ptr %3334, i64 3
  %3336 = load i8, ptr %3335, align 1
  store i8 %3336, ptr %251, align 1
  %3337 = load i8, ptr %251, align 1
  %3338 = sext i8 %3337 to i32
  %3339 = icmp slt i32 %3338, 32
  br i1 %3339, label %3352, label %3340

3340:                                             ; preds = %3333
  %3341 = load i8, ptr %251, align 1
  %3342 = sext i8 %3341 to i32
  %3343 = icmp sgt i32 %3342, 126
  br i1 %3343, label %3352, label %3344

3344:                                             ; preds = %3340
  %3345 = load i8, ptr %251, align 1
  %3346 = sext i8 %3345 to i32
  %3347 = icmp eq i32 %3346, 34
  br i1 %3347, label %3352, label %3348

3348:                                             ; preds = %3344
  %3349 = load i8, ptr %251, align 1
  %3350 = sext i8 %3349 to i32
  %3351 = icmp eq i32 %3350, 92
  br i1 %3351, label %3352, label %3353

3352:                                             ; preds = %3348, %3344, %3340, %3333
  store i1 false, ptr %245, align 1
  br label %4028

3353:                                             ; preds = %3348
  br label %3354

3354:                                             ; preds = %3353, %3330
  %3355 = load i64, ptr %247, align 8
  %3356 = icmp ult i64 4, %3355
  br i1 %3356, label %3357, label %3378

3357:                                             ; preds = %3354
  %3358 = load ptr, ptr %246, align 8
  %3359 = getelementptr inbounds i8, ptr %3358, i64 4
  %3360 = load i8, ptr %3359, align 1
  store i8 %3360, ptr %252, align 1
  %3361 = load i8, ptr %252, align 1
  %3362 = sext i8 %3361 to i32
  %3363 = icmp slt i32 %3362, 32
  br i1 %3363, label %3376, label %3364

3364:                                             ; preds = %3357
  %3365 = load i8, ptr %252, align 1
  %3366 = sext i8 %3365 to i32
  %3367 = icmp sgt i32 %3366, 126
  br i1 %3367, label %3376, label %3368

3368:                                             ; preds = %3364
  %3369 = load i8, ptr %252, align 1
  %3370 = sext i8 %3369 to i32
  %3371 = icmp eq i32 %3370, 34
  br i1 %3371, label %3376, label %3372

3372:                                             ; preds = %3368
  %3373 = load i8, ptr %252, align 1
  %3374 = sext i8 %3373 to i32
  %3375 = icmp eq i32 %3374, 92
  br i1 %3375, label %3376, label %3377

3376:                                             ; preds = %3372, %3368, %3364, %3357
  store i1 false, ptr %245, align 1
  br label %4028

3377:                                             ; preds = %3372
  br label %3378

3378:                                             ; preds = %3377, %3354
  %3379 = load i64, ptr %247, align 8
  %3380 = icmp ult i64 5, %3379
  br i1 %3380, label %3381, label %3402

3381:                                             ; preds = %3378
  %3382 = load ptr, ptr %246, align 8
  %3383 = getelementptr inbounds i8, ptr %3382, i64 5
  %3384 = load i8, ptr %3383, align 1
  store i8 %3384, ptr %253, align 1
  %3385 = load i8, ptr %253, align 1
  %3386 = sext i8 %3385 to i32
  %3387 = icmp slt i32 %3386, 32
  br i1 %3387, label %3400, label %3388

3388:                                             ; preds = %3381
  %3389 = load i8, ptr %253, align 1
  %3390 = sext i8 %3389 to i32
  %3391 = icmp sgt i32 %3390, 126
  br i1 %3391, label %3400, label %3392

3392:                                             ; preds = %3388
  %3393 = load i8, ptr %253, align 1
  %3394 = sext i8 %3393 to i32
  %3395 = icmp eq i32 %3394, 34
  br i1 %3395, label %3400, label %3396

3396:                                             ; preds = %3392
  %3397 = load i8, ptr %253, align 1
  %3398 = sext i8 %3397 to i32
  %3399 = icmp eq i32 %3398, 92
  br i1 %3399, label %3400, label %3401

3400:                                             ; preds = %3396, %3392, %3388, %3381
  store i1 false, ptr %245, align 1
  br label %4028

3401:                                             ; preds = %3396
  br label %3402

3402:                                             ; preds = %3401, %3378
  %3403 = load i64, ptr %247, align 8
  %3404 = icmp ult i64 6, %3403
  br i1 %3404, label %3405, label %3426

3405:                                             ; preds = %3402
  %3406 = load ptr, ptr %246, align 8
  %3407 = getelementptr inbounds i8, ptr %3406, i64 6
  %3408 = load i8, ptr %3407, align 1
  store i8 %3408, ptr %254, align 1
  %3409 = load i8, ptr %254, align 1
  %3410 = sext i8 %3409 to i32
  %3411 = icmp slt i32 %3410, 32
  br i1 %3411, label %3424, label %3412

3412:                                             ; preds = %3405
  %3413 = load i8, ptr %254, align 1
  %3414 = sext i8 %3413 to i32
  %3415 = icmp sgt i32 %3414, 126
  br i1 %3415, label %3424, label %3416

3416:                                             ; preds = %3412
  %3417 = load i8, ptr %254, align 1
  %3418 = sext i8 %3417 to i32
  %3419 = icmp eq i32 %3418, 34
  br i1 %3419, label %3424, label %3420

3420:                                             ; preds = %3416
  %3421 = load i8, ptr %254, align 1
  %3422 = sext i8 %3421 to i32
  %3423 = icmp eq i32 %3422, 92
  br i1 %3423, label %3424, label %3425

3424:                                             ; preds = %3420, %3416, %3412, %3405
  store i1 false, ptr %245, align 1
  br label %4028

3425:                                             ; preds = %3420
  br label %3426

3426:                                             ; preds = %3425, %3402
  %3427 = load i64, ptr %247, align 8
  %3428 = icmp ult i64 7, %3427
  br i1 %3428, label %3429, label %3450

3429:                                             ; preds = %3426
  %3430 = load ptr, ptr %246, align 8
  %3431 = getelementptr inbounds i8, ptr %3430, i64 7
  %3432 = load i8, ptr %3431, align 1
  store i8 %3432, ptr %255, align 1
  %3433 = load i8, ptr %255, align 1
  %3434 = sext i8 %3433 to i32
  %3435 = icmp slt i32 %3434, 32
  br i1 %3435, label %3448, label %3436

3436:                                             ; preds = %3429
  %3437 = load i8, ptr %255, align 1
  %3438 = sext i8 %3437 to i32
  %3439 = icmp sgt i32 %3438, 126
  br i1 %3439, label %3448, label %3440

3440:                                             ; preds = %3436
  %3441 = load i8, ptr %255, align 1
  %3442 = sext i8 %3441 to i32
  %3443 = icmp eq i32 %3442, 34
  br i1 %3443, label %3448, label %3444

3444:                                             ; preds = %3440
  %3445 = load i8, ptr %255, align 1
  %3446 = sext i8 %3445 to i32
  %3447 = icmp eq i32 %3446, 92
  br i1 %3447, label %3448, label %3449

3448:                                             ; preds = %3444, %3440, %3436, %3429
  store i1 false, ptr %245, align 1
  br label %4028

3449:                                             ; preds = %3444
  br label %3450

3450:                                             ; preds = %3449, %3426
  %3451 = load i64, ptr %247, align 8
  %3452 = icmp ult i64 8, %3451
  br i1 %3452, label %3453, label %3474

3453:                                             ; preds = %3450
  %3454 = load ptr, ptr %246, align 8
  %3455 = getelementptr inbounds i8, ptr %3454, i64 8
  %3456 = load i8, ptr %3455, align 1
  store i8 %3456, ptr %256, align 1
  %3457 = load i8, ptr %256, align 1
  %3458 = sext i8 %3457 to i32
  %3459 = icmp slt i32 %3458, 32
  br i1 %3459, label %3472, label %3460

3460:                                             ; preds = %3453
  %3461 = load i8, ptr %256, align 1
  %3462 = sext i8 %3461 to i32
  %3463 = icmp sgt i32 %3462, 126
  br i1 %3463, label %3472, label %3464

3464:                                             ; preds = %3460
  %3465 = load i8, ptr %256, align 1
  %3466 = sext i8 %3465 to i32
  %3467 = icmp eq i32 %3466, 34
  br i1 %3467, label %3472, label %3468

3468:                                             ; preds = %3464
  %3469 = load i8, ptr %256, align 1
  %3470 = sext i8 %3469 to i32
  %3471 = icmp eq i32 %3470, 92
  br i1 %3471, label %3472, label %3473

3472:                                             ; preds = %3468, %3464, %3460, %3453
  store i1 false, ptr %245, align 1
  br label %4028

3473:                                             ; preds = %3468
  br label %3474

3474:                                             ; preds = %3473, %3450
  %3475 = load i64, ptr %247, align 8
  %3476 = icmp ult i64 9, %3475
  br i1 %3476, label %3477, label %3498

3477:                                             ; preds = %3474
  %3478 = load ptr, ptr %246, align 8
  %3479 = getelementptr inbounds i8, ptr %3478, i64 9
  %3480 = load i8, ptr %3479, align 1
  store i8 %3480, ptr %257, align 1
  %3481 = load i8, ptr %257, align 1
  %3482 = sext i8 %3481 to i32
  %3483 = icmp slt i32 %3482, 32
  br i1 %3483, label %3496, label %3484

3484:                                             ; preds = %3477
  %3485 = load i8, ptr %257, align 1
  %3486 = sext i8 %3485 to i32
  %3487 = icmp sgt i32 %3486, 126
  br i1 %3487, label %3496, label %3488

3488:                                             ; preds = %3484
  %3489 = load i8, ptr %257, align 1
  %3490 = sext i8 %3489 to i32
  %3491 = icmp eq i32 %3490, 34
  br i1 %3491, label %3496, label %3492

3492:                                             ; preds = %3488
  %3493 = load i8, ptr %257, align 1
  %3494 = sext i8 %3493 to i32
  %3495 = icmp eq i32 %3494, 92
  br i1 %3495, label %3496, label %3497

3496:                                             ; preds = %3492, %3488, %3484, %3477
  store i1 false, ptr %245, align 1
  br label %4028

3497:                                             ; preds = %3492
  br label %3498

3498:                                             ; preds = %3497, %3474
  %3499 = load i64, ptr %247, align 8
  %3500 = icmp ult i64 10, %3499
  br i1 %3500, label %3501, label %3522

3501:                                             ; preds = %3498
  %3502 = load ptr, ptr %246, align 8
  %3503 = getelementptr inbounds i8, ptr %3502, i64 10
  %3504 = load i8, ptr %3503, align 1
  store i8 %3504, ptr %258, align 1
  %3505 = load i8, ptr %258, align 1
  %3506 = sext i8 %3505 to i32
  %3507 = icmp slt i32 %3506, 32
  br i1 %3507, label %3520, label %3508

3508:                                             ; preds = %3501
  %3509 = load i8, ptr %258, align 1
  %3510 = sext i8 %3509 to i32
  %3511 = icmp sgt i32 %3510, 126
  br i1 %3511, label %3520, label %3512

3512:                                             ; preds = %3508
  %3513 = load i8, ptr %258, align 1
  %3514 = sext i8 %3513 to i32
  %3515 = icmp eq i32 %3514, 34
  br i1 %3515, label %3520, label %3516

3516:                                             ; preds = %3512
  %3517 = load i8, ptr %258, align 1
  %3518 = sext i8 %3517 to i32
  %3519 = icmp eq i32 %3518, 92
  br i1 %3519, label %3520, label %3521

3520:                                             ; preds = %3516, %3512, %3508, %3501
  store i1 false, ptr %245, align 1
  br label %4028

3521:                                             ; preds = %3516
  br label %3522

3522:                                             ; preds = %3521, %3498
  %3523 = load i64, ptr %247, align 8
  %3524 = icmp ult i64 11, %3523
  br i1 %3524, label %3525, label %3546

3525:                                             ; preds = %3522
  %3526 = load ptr, ptr %246, align 8
  %3527 = getelementptr inbounds i8, ptr %3526, i64 11
  %3528 = load i8, ptr %3527, align 1
  store i8 %3528, ptr %259, align 1
  %3529 = load i8, ptr %259, align 1
  %3530 = sext i8 %3529 to i32
  %3531 = icmp slt i32 %3530, 32
  br i1 %3531, label %3544, label %3532

3532:                                             ; preds = %3525
  %3533 = load i8, ptr %259, align 1
  %3534 = sext i8 %3533 to i32
  %3535 = icmp sgt i32 %3534, 126
  br i1 %3535, label %3544, label %3536

3536:                                             ; preds = %3532
  %3537 = load i8, ptr %259, align 1
  %3538 = sext i8 %3537 to i32
  %3539 = icmp eq i32 %3538, 34
  br i1 %3539, label %3544, label %3540

3540:                                             ; preds = %3536
  %3541 = load i8, ptr %259, align 1
  %3542 = sext i8 %3541 to i32
  %3543 = icmp eq i32 %3542, 92
  br i1 %3543, label %3544, label %3545

3544:                                             ; preds = %3540, %3536, %3532, %3525
  store i1 false, ptr %245, align 1
  br label %4028

3545:                                             ; preds = %3540
  br label %3546

3546:                                             ; preds = %3545, %3522
  %3547 = load i64, ptr %247, align 8
  %3548 = icmp ult i64 12, %3547
  br i1 %3548, label %3549, label %3570

3549:                                             ; preds = %3546
  %3550 = load ptr, ptr %246, align 8
  %3551 = getelementptr inbounds i8, ptr %3550, i64 12
  %3552 = load i8, ptr %3551, align 1
  store i8 %3552, ptr %260, align 1
  %3553 = load i8, ptr %260, align 1
  %3554 = sext i8 %3553 to i32
  %3555 = icmp slt i32 %3554, 32
  br i1 %3555, label %3568, label %3556

3556:                                             ; preds = %3549
  %3557 = load i8, ptr %260, align 1
  %3558 = sext i8 %3557 to i32
  %3559 = icmp sgt i32 %3558, 126
  br i1 %3559, label %3568, label %3560

3560:                                             ; preds = %3556
  %3561 = load i8, ptr %260, align 1
  %3562 = sext i8 %3561 to i32
  %3563 = icmp eq i32 %3562, 34
  br i1 %3563, label %3568, label %3564

3564:                                             ; preds = %3560
  %3565 = load i8, ptr %260, align 1
  %3566 = sext i8 %3565 to i32
  %3567 = icmp eq i32 %3566, 92
  br i1 %3567, label %3568, label %3569

3568:                                             ; preds = %3564, %3560, %3556, %3549
  store i1 false, ptr %245, align 1
  br label %4028

3569:                                             ; preds = %3564
  br label %3570

3570:                                             ; preds = %3569, %3546
  %3571 = load i64, ptr %247, align 8
  %3572 = icmp ult i64 13, %3571
  br i1 %3572, label %3573, label %3594

3573:                                             ; preds = %3570
  %3574 = load ptr, ptr %246, align 8
  %3575 = getelementptr inbounds i8, ptr %3574, i64 13
  %3576 = load i8, ptr %3575, align 1
  store i8 %3576, ptr %261, align 1
  %3577 = load i8, ptr %261, align 1
  %3578 = sext i8 %3577 to i32
  %3579 = icmp slt i32 %3578, 32
  br i1 %3579, label %3592, label %3580

3580:                                             ; preds = %3573
  %3581 = load i8, ptr %261, align 1
  %3582 = sext i8 %3581 to i32
  %3583 = icmp sgt i32 %3582, 126
  br i1 %3583, label %3592, label %3584

3584:                                             ; preds = %3580
  %3585 = load i8, ptr %261, align 1
  %3586 = sext i8 %3585 to i32
  %3587 = icmp eq i32 %3586, 34
  br i1 %3587, label %3592, label %3588

3588:                                             ; preds = %3584
  %3589 = load i8, ptr %261, align 1
  %3590 = sext i8 %3589 to i32
  %3591 = icmp eq i32 %3590, 92
  br i1 %3591, label %3592, label %3593

3592:                                             ; preds = %3588, %3584, %3580, %3573
  store i1 false, ptr %245, align 1
  br label %4028

3593:                                             ; preds = %3588
  br label %3594

3594:                                             ; preds = %3593, %3570
  %3595 = load i64, ptr %247, align 8
  %3596 = icmp ult i64 14, %3595
  br i1 %3596, label %3597, label %3618

3597:                                             ; preds = %3594
  %3598 = load ptr, ptr %246, align 8
  %3599 = getelementptr inbounds i8, ptr %3598, i64 14
  %3600 = load i8, ptr %3599, align 1
  store i8 %3600, ptr %262, align 1
  %3601 = load i8, ptr %262, align 1
  %3602 = sext i8 %3601 to i32
  %3603 = icmp slt i32 %3602, 32
  br i1 %3603, label %3616, label %3604

3604:                                             ; preds = %3597
  %3605 = load i8, ptr %262, align 1
  %3606 = sext i8 %3605 to i32
  %3607 = icmp sgt i32 %3606, 126
  br i1 %3607, label %3616, label %3608

3608:                                             ; preds = %3604
  %3609 = load i8, ptr %262, align 1
  %3610 = sext i8 %3609 to i32
  %3611 = icmp eq i32 %3610, 34
  br i1 %3611, label %3616, label %3612

3612:                                             ; preds = %3608
  %3613 = load i8, ptr %262, align 1
  %3614 = sext i8 %3613 to i32
  %3615 = icmp eq i32 %3614, 92
  br i1 %3615, label %3616, label %3617

3616:                                             ; preds = %3612, %3608, %3604, %3597
  store i1 false, ptr %245, align 1
  br label %4028

3617:                                             ; preds = %3612
  br label %3618

3618:                                             ; preds = %3617, %3594
  %3619 = load i64, ptr %247, align 8
  %3620 = icmp ult i64 15, %3619
  br i1 %3620, label %3621, label %3642

3621:                                             ; preds = %3618
  %3622 = load ptr, ptr %246, align 8
  %3623 = getelementptr inbounds i8, ptr %3622, i64 15
  %3624 = load i8, ptr %3623, align 1
  store i8 %3624, ptr %263, align 1
  %3625 = load i8, ptr %263, align 1
  %3626 = sext i8 %3625 to i32
  %3627 = icmp slt i32 %3626, 32
  br i1 %3627, label %3640, label %3628

3628:                                             ; preds = %3621
  %3629 = load i8, ptr %263, align 1
  %3630 = sext i8 %3629 to i32
  %3631 = icmp sgt i32 %3630, 126
  br i1 %3631, label %3640, label %3632

3632:                                             ; preds = %3628
  %3633 = load i8, ptr %263, align 1
  %3634 = sext i8 %3633 to i32
  %3635 = icmp eq i32 %3634, 34
  br i1 %3635, label %3640, label %3636

3636:                                             ; preds = %3632
  %3637 = load i8, ptr %263, align 1
  %3638 = sext i8 %3637 to i32
  %3639 = icmp eq i32 %3638, 92
  br i1 %3639, label %3640, label %3641

3640:                                             ; preds = %3636, %3632, %3628, %3621
  store i1 false, ptr %245, align 1
  br label %4028

3641:                                             ; preds = %3636
  br label %3642

3642:                                             ; preds = %3641, %3618
  %3643 = load i64, ptr %247, align 8
  %3644 = icmp ult i64 16, %3643
  br i1 %3644, label %3645, label %3666

3645:                                             ; preds = %3642
  %3646 = load ptr, ptr %246, align 8
  %3647 = getelementptr inbounds i8, ptr %3646, i64 16
  %3648 = load i8, ptr %3647, align 1
  store i8 %3648, ptr %264, align 1
  %3649 = load i8, ptr %264, align 1
  %3650 = sext i8 %3649 to i32
  %3651 = icmp slt i32 %3650, 32
  br i1 %3651, label %3664, label %3652

3652:                                             ; preds = %3645
  %3653 = load i8, ptr %264, align 1
  %3654 = sext i8 %3653 to i32
  %3655 = icmp sgt i32 %3654, 126
  br i1 %3655, label %3664, label %3656

3656:                                             ; preds = %3652
  %3657 = load i8, ptr %264, align 1
  %3658 = sext i8 %3657 to i32
  %3659 = icmp eq i32 %3658, 34
  br i1 %3659, label %3664, label %3660

3660:                                             ; preds = %3656
  %3661 = load i8, ptr %264, align 1
  %3662 = sext i8 %3661 to i32
  %3663 = icmp eq i32 %3662, 92
  br i1 %3663, label %3664, label %3665

3664:                                             ; preds = %3660, %3656, %3652, %3645
  store i1 false, ptr %245, align 1
  br label %4028

3665:                                             ; preds = %3660
  br label %3666

3666:                                             ; preds = %3665, %3642
  %3667 = load i64, ptr %247, align 8
  %3668 = icmp ult i64 17, %3667
  br i1 %3668, label %3669, label %3690

3669:                                             ; preds = %3666
  %3670 = load ptr, ptr %246, align 8
  %3671 = getelementptr inbounds i8, ptr %3670, i64 17
  %3672 = load i8, ptr %3671, align 1
  store i8 %3672, ptr %265, align 1
  %3673 = load i8, ptr %265, align 1
  %3674 = sext i8 %3673 to i32
  %3675 = icmp slt i32 %3674, 32
  br i1 %3675, label %3688, label %3676

3676:                                             ; preds = %3669
  %3677 = load i8, ptr %265, align 1
  %3678 = sext i8 %3677 to i32
  %3679 = icmp sgt i32 %3678, 126
  br i1 %3679, label %3688, label %3680

3680:                                             ; preds = %3676
  %3681 = load i8, ptr %265, align 1
  %3682 = sext i8 %3681 to i32
  %3683 = icmp eq i32 %3682, 34
  br i1 %3683, label %3688, label %3684

3684:                                             ; preds = %3680
  %3685 = load i8, ptr %265, align 1
  %3686 = sext i8 %3685 to i32
  %3687 = icmp eq i32 %3686, 92
  br i1 %3687, label %3688, label %3689

3688:                                             ; preds = %3684, %3680, %3676, %3669
  store i1 false, ptr %245, align 1
  br label %4028

3689:                                             ; preds = %3684
  br label %3690

3690:                                             ; preds = %3689, %3666
  %3691 = load i64, ptr %247, align 8
  %3692 = icmp ult i64 18, %3691
  br i1 %3692, label %3693, label %3714

3693:                                             ; preds = %3690
  %3694 = load ptr, ptr %246, align 8
  %3695 = getelementptr inbounds i8, ptr %3694, i64 18
  %3696 = load i8, ptr %3695, align 1
  store i8 %3696, ptr %266, align 1
  %3697 = load i8, ptr %266, align 1
  %3698 = sext i8 %3697 to i32
  %3699 = icmp slt i32 %3698, 32
  br i1 %3699, label %3712, label %3700

3700:                                             ; preds = %3693
  %3701 = load i8, ptr %266, align 1
  %3702 = sext i8 %3701 to i32
  %3703 = icmp sgt i32 %3702, 126
  br i1 %3703, label %3712, label %3704

3704:                                             ; preds = %3700
  %3705 = load i8, ptr %266, align 1
  %3706 = sext i8 %3705 to i32
  %3707 = icmp eq i32 %3706, 34
  br i1 %3707, label %3712, label %3708

3708:                                             ; preds = %3704
  %3709 = load i8, ptr %266, align 1
  %3710 = sext i8 %3709 to i32
  %3711 = icmp eq i32 %3710, 92
  br i1 %3711, label %3712, label %3713

3712:                                             ; preds = %3708, %3704, %3700, %3693
  store i1 false, ptr %245, align 1
  br label %4028

3713:                                             ; preds = %3708
  br label %3714

3714:                                             ; preds = %3713, %3690
  %3715 = load i64, ptr %247, align 8
  %3716 = icmp ult i64 19, %3715
  br i1 %3716, label %3717, label %3738

3717:                                             ; preds = %3714
  %3718 = load ptr, ptr %246, align 8
  %3719 = getelementptr inbounds i8, ptr %3718, i64 19
  %3720 = load i8, ptr %3719, align 1
  store i8 %3720, ptr %267, align 1
  %3721 = load i8, ptr %267, align 1
  %3722 = sext i8 %3721 to i32
  %3723 = icmp slt i32 %3722, 32
  br i1 %3723, label %3736, label %3724

3724:                                             ; preds = %3717
  %3725 = load i8, ptr %267, align 1
  %3726 = sext i8 %3725 to i32
  %3727 = icmp sgt i32 %3726, 126
  br i1 %3727, label %3736, label %3728

3728:                                             ; preds = %3724
  %3729 = load i8, ptr %267, align 1
  %3730 = sext i8 %3729 to i32
  %3731 = icmp eq i32 %3730, 34
  br i1 %3731, label %3736, label %3732

3732:                                             ; preds = %3728
  %3733 = load i8, ptr %267, align 1
  %3734 = sext i8 %3733 to i32
  %3735 = icmp eq i32 %3734, 92
  br i1 %3735, label %3736, label %3737

3736:                                             ; preds = %3732, %3728, %3724, %3717
  store i1 false, ptr %245, align 1
  br label %4028

3737:                                             ; preds = %3732
  br label %3738

3738:                                             ; preds = %3737, %3714
  %3739 = load i64, ptr %247, align 8
  %3740 = icmp ult i64 20, %3739
  br i1 %3740, label %3741, label %3762

3741:                                             ; preds = %3738
  %3742 = load ptr, ptr %246, align 8
  %3743 = getelementptr inbounds i8, ptr %3742, i64 20
  %3744 = load i8, ptr %3743, align 1
  store i8 %3744, ptr %268, align 1
  %3745 = load i8, ptr %268, align 1
  %3746 = sext i8 %3745 to i32
  %3747 = icmp slt i32 %3746, 32
  br i1 %3747, label %3760, label %3748

3748:                                             ; preds = %3741
  %3749 = load i8, ptr %268, align 1
  %3750 = sext i8 %3749 to i32
  %3751 = icmp sgt i32 %3750, 126
  br i1 %3751, label %3760, label %3752

3752:                                             ; preds = %3748
  %3753 = load i8, ptr %268, align 1
  %3754 = sext i8 %3753 to i32
  %3755 = icmp eq i32 %3754, 34
  br i1 %3755, label %3760, label %3756

3756:                                             ; preds = %3752
  %3757 = load i8, ptr %268, align 1
  %3758 = sext i8 %3757 to i32
  %3759 = icmp eq i32 %3758, 92
  br i1 %3759, label %3760, label %3761

3760:                                             ; preds = %3756, %3752, %3748, %3741
  store i1 false, ptr %245, align 1
  br label %4028

3761:                                             ; preds = %3756
  br label %3762

3762:                                             ; preds = %3761, %3738
  %3763 = load i64, ptr %247, align 8
  %3764 = icmp ult i64 21, %3763
  br i1 %3764, label %3765, label %3786

3765:                                             ; preds = %3762
  %3766 = load ptr, ptr %246, align 8
  %3767 = getelementptr inbounds i8, ptr %3766, i64 21
  %3768 = load i8, ptr %3767, align 1
  store i8 %3768, ptr %269, align 1
  %3769 = load i8, ptr %269, align 1
  %3770 = sext i8 %3769 to i32
  %3771 = icmp slt i32 %3770, 32
  br i1 %3771, label %3784, label %3772

3772:                                             ; preds = %3765
  %3773 = load i8, ptr %269, align 1
  %3774 = sext i8 %3773 to i32
  %3775 = icmp sgt i32 %3774, 126
  br i1 %3775, label %3784, label %3776

3776:                                             ; preds = %3772
  %3777 = load i8, ptr %269, align 1
  %3778 = sext i8 %3777 to i32
  %3779 = icmp eq i32 %3778, 34
  br i1 %3779, label %3784, label %3780

3780:                                             ; preds = %3776
  %3781 = load i8, ptr %269, align 1
  %3782 = sext i8 %3781 to i32
  %3783 = icmp eq i32 %3782, 92
  br i1 %3783, label %3784, label %3785

3784:                                             ; preds = %3780, %3776, %3772, %3765
  store i1 false, ptr %245, align 1
  br label %4028

3785:                                             ; preds = %3780
  br label %3786

3786:                                             ; preds = %3785, %3762
  %3787 = load i64, ptr %247, align 8
  %3788 = icmp ult i64 22, %3787
  br i1 %3788, label %3789, label %3810

3789:                                             ; preds = %3786
  %3790 = load ptr, ptr %246, align 8
  %3791 = getelementptr inbounds i8, ptr %3790, i64 22
  %3792 = load i8, ptr %3791, align 1
  store i8 %3792, ptr %270, align 1
  %3793 = load i8, ptr %270, align 1
  %3794 = sext i8 %3793 to i32
  %3795 = icmp slt i32 %3794, 32
  br i1 %3795, label %3808, label %3796

3796:                                             ; preds = %3789
  %3797 = load i8, ptr %270, align 1
  %3798 = sext i8 %3797 to i32
  %3799 = icmp sgt i32 %3798, 126
  br i1 %3799, label %3808, label %3800

3800:                                             ; preds = %3796
  %3801 = load i8, ptr %270, align 1
  %3802 = sext i8 %3801 to i32
  %3803 = icmp eq i32 %3802, 34
  br i1 %3803, label %3808, label %3804

3804:                                             ; preds = %3800
  %3805 = load i8, ptr %270, align 1
  %3806 = sext i8 %3805 to i32
  %3807 = icmp eq i32 %3806, 92
  br i1 %3807, label %3808, label %3809

3808:                                             ; preds = %3804, %3800, %3796, %3789
  store i1 false, ptr %245, align 1
  br label %4028

3809:                                             ; preds = %3804
  br label %3810

3810:                                             ; preds = %3809, %3786
  %3811 = load i64, ptr %247, align 8
  %3812 = icmp ult i64 23, %3811
  br i1 %3812, label %3813, label %3834

3813:                                             ; preds = %3810
  %3814 = load ptr, ptr %246, align 8
  %3815 = getelementptr inbounds i8, ptr %3814, i64 23
  %3816 = load i8, ptr %3815, align 1
  store i8 %3816, ptr %271, align 1
  %3817 = load i8, ptr %271, align 1
  %3818 = sext i8 %3817 to i32
  %3819 = icmp slt i32 %3818, 32
  br i1 %3819, label %3832, label %3820

3820:                                             ; preds = %3813
  %3821 = load i8, ptr %271, align 1
  %3822 = sext i8 %3821 to i32
  %3823 = icmp sgt i32 %3822, 126
  br i1 %3823, label %3832, label %3824

3824:                                             ; preds = %3820
  %3825 = load i8, ptr %271, align 1
  %3826 = sext i8 %3825 to i32
  %3827 = icmp eq i32 %3826, 34
  br i1 %3827, label %3832, label %3828

3828:                                             ; preds = %3824
  %3829 = load i8, ptr %271, align 1
  %3830 = sext i8 %3829 to i32
  %3831 = icmp eq i32 %3830, 92
  br i1 %3831, label %3832, label %3833

3832:                                             ; preds = %3828, %3824, %3820, %3813
  store i1 false, ptr %245, align 1
  br label %4028

3833:                                             ; preds = %3828
  br label %3834

3834:                                             ; preds = %3833, %3810
  %3835 = load i64, ptr %247, align 8
  %3836 = icmp ult i64 24, %3835
  br i1 %3836, label %3837, label %3858

3837:                                             ; preds = %3834
  %3838 = load ptr, ptr %246, align 8
  %3839 = getelementptr inbounds i8, ptr %3838, i64 24
  %3840 = load i8, ptr %3839, align 1
  store i8 %3840, ptr %272, align 1
  %3841 = load i8, ptr %272, align 1
  %3842 = sext i8 %3841 to i32
  %3843 = icmp slt i32 %3842, 32
  br i1 %3843, label %3856, label %3844

3844:                                             ; preds = %3837
  %3845 = load i8, ptr %272, align 1
  %3846 = sext i8 %3845 to i32
  %3847 = icmp sgt i32 %3846, 126
  br i1 %3847, label %3856, label %3848

3848:                                             ; preds = %3844
  %3849 = load i8, ptr %272, align 1
  %3850 = sext i8 %3849 to i32
  %3851 = icmp eq i32 %3850, 34
  br i1 %3851, label %3856, label %3852

3852:                                             ; preds = %3848
  %3853 = load i8, ptr %272, align 1
  %3854 = sext i8 %3853 to i32
  %3855 = icmp eq i32 %3854, 92
  br i1 %3855, label %3856, label %3857

3856:                                             ; preds = %3852, %3848, %3844, %3837
  store i1 false, ptr %245, align 1
  br label %4028

3857:                                             ; preds = %3852
  br label %3858

3858:                                             ; preds = %3857, %3834
  %3859 = load i64, ptr %247, align 8
  %3860 = icmp ult i64 25, %3859
  br i1 %3860, label %3861, label %3882

3861:                                             ; preds = %3858
  %3862 = load ptr, ptr %246, align 8
  %3863 = getelementptr inbounds i8, ptr %3862, i64 25
  %3864 = load i8, ptr %3863, align 1
  store i8 %3864, ptr %273, align 1
  %3865 = load i8, ptr %273, align 1
  %3866 = sext i8 %3865 to i32
  %3867 = icmp slt i32 %3866, 32
  br i1 %3867, label %3880, label %3868

3868:                                             ; preds = %3861
  %3869 = load i8, ptr %273, align 1
  %3870 = sext i8 %3869 to i32
  %3871 = icmp sgt i32 %3870, 126
  br i1 %3871, label %3880, label %3872

3872:                                             ; preds = %3868
  %3873 = load i8, ptr %273, align 1
  %3874 = sext i8 %3873 to i32
  %3875 = icmp eq i32 %3874, 34
  br i1 %3875, label %3880, label %3876

3876:                                             ; preds = %3872
  %3877 = load i8, ptr %273, align 1
  %3878 = sext i8 %3877 to i32
  %3879 = icmp eq i32 %3878, 92
  br i1 %3879, label %3880, label %3881

3880:                                             ; preds = %3876, %3872, %3868, %3861
  store i1 false, ptr %245, align 1
  br label %4028

3881:                                             ; preds = %3876
  br label %3882

3882:                                             ; preds = %3881, %3858
  %3883 = load i64, ptr %247, align 8
  %3884 = icmp ult i64 26, %3883
  br i1 %3884, label %3885, label %3906

3885:                                             ; preds = %3882
  %3886 = load ptr, ptr %246, align 8
  %3887 = getelementptr inbounds i8, ptr %3886, i64 26
  %3888 = load i8, ptr %3887, align 1
  store i8 %3888, ptr %274, align 1
  %3889 = load i8, ptr %274, align 1
  %3890 = sext i8 %3889 to i32
  %3891 = icmp slt i32 %3890, 32
  br i1 %3891, label %3904, label %3892

3892:                                             ; preds = %3885
  %3893 = load i8, ptr %274, align 1
  %3894 = sext i8 %3893 to i32
  %3895 = icmp sgt i32 %3894, 126
  br i1 %3895, label %3904, label %3896

3896:                                             ; preds = %3892
  %3897 = load i8, ptr %274, align 1
  %3898 = sext i8 %3897 to i32
  %3899 = icmp eq i32 %3898, 34
  br i1 %3899, label %3904, label %3900

3900:                                             ; preds = %3896
  %3901 = load i8, ptr %274, align 1
  %3902 = sext i8 %3901 to i32
  %3903 = icmp eq i32 %3902, 92
  br i1 %3903, label %3904, label %3905

3904:                                             ; preds = %3900, %3896, %3892, %3885
  store i1 false, ptr %245, align 1
  br label %4028

3905:                                             ; preds = %3900
  br label %3906

3906:                                             ; preds = %3905, %3882
  %3907 = load i64, ptr %247, align 8
  %3908 = icmp ult i64 27, %3907
  br i1 %3908, label %3909, label %3930

3909:                                             ; preds = %3906
  %3910 = load ptr, ptr %246, align 8
  %3911 = getelementptr inbounds i8, ptr %3910, i64 27
  %3912 = load i8, ptr %3911, align 1
  store i8 %3912, ptr %275, align 1
  %3913 = load i8, ptr %275, align 1
  %3914 = sext i8 %3913 to i32
  %3915 = icmp slt i32 %3914, 32
  br i1 %3915, label %3928, label %3916

3916:                                             ; preds = %3909
  %3917 = load i8, ptr %275, align 1
  %3918 = sext i8 %3917 to i32
  %3919 = icmp sgt i32 %3918, 126
  br i1 %3919, label %3928, label %3920

3920:                                             ; preds = %3916
  %3921 = load i8, ptr %275, align 1
  %3922 = sext i8 %3921 to i32
  %3923 = icmp eq i32 %3922, 34
  br i1 %3923, label %3928, label %3924

3924:                                             ; preds = %3920
  %3925 = load i8, ptr %275, align 1
  %3926 = sext i8 %3925 to i32
  %3927 = icmp eq i32 %3926, 92
  br i1 %3927, label %3928, label %3929

3928:                                             ; preds = %3924, %3920, %3916, %3909
  store i1 false, ptr %245, align 1
  br label %4028

3929:                                             ; preds = %3924
  br label %3930

3930:                                             ; preds = %3929, %3906
  %3931 = load i64, ptr %247, align 8
  %3932 = icmp ult i64 28, %3931
  br i1 %3932, label %3933, label %3954

3933:                                             ; preds = %3930
  %3934 = load ptr, ptr %246, align 8
  %3935 = getelementptr inbounds i8, ptr %3934, i64 28
  %3936 = load i8, ptr %3935, align 1
  store i8 %3936, ptr %276, align 1
  %3937 = load i8, ptr %276, align 1
  %3938 = sext i8 %3937 to i32
  %3939 = icmp slt i32 %3938, 32
  br i1 %3939, label %3952, label %3940

3940:                                             ; preds = %3933
  %3941 = load i8, ptr %276, align 1
  %3942 = sext i8 %3941 to i32
  %3943 = icmp sgt i32 %3942, 126
  br i1 %3943, label %3952, label %3944

3944:                                             ; preds = %3940
  %3945 = load i8, ptr %276, align 1
  %3946 = sext i8 %3945 to i32
  %3947 = icmp eq i32 %3946, 34
  br i1 %3947, label %3952, label %3948

3948:                                             ; preds = %3944
  %3949 = load i8, ptr %276, align 1
  %3950 = sext i8 %3949 to i32
  %3951 = icmp eq i32 %3950, 92
  br i1 %3951, label %3952, label %3953

3952:                                             ; preds = %3948, %3944, %3940, %3933
  store i1 false, ptr %245, align 1
  br label %4028

3953:                                             ; preds = %3948
  br label %3954

3954:                                             ; preds = %3953, %3930
  %3955 = load i64, ptr %247, align 8
  %3956 = icmp ult i64 29, %3955
  br i1 %3956, label %3957, label %3978

3957:                                             ; preds = %3954
  %3958 = load ptr, ptr %246, align 8
  %3959 = getelementptr inbounds i8, ptr %3958, i64 29
  %3960 = load i8, ptr %3959, align 1
  store i8 %3960, ptr %277, align 1
  %3961 = load i8, ptr %277, align 1
  %3962 = sext i8 %3961 to i32
  %3963 = icmp slt i32 %3962, 32
  br i1 %3963, label %3976, label %3964

3964:                                             ; preds = %3957
  %3965 = load i8, ptr %277, align 1
  %3966 = sext i8 %3965 to i32
  %3967 = icmp sgt i32 %3966, 126
  br i1 %3967, label %3976, label %3968

3968:                                             ; preds = %3964
  %3969 = load i8, ptr %277, align 1
  %3970 = sext i8 %3969 to i32
  %3971 = icmp eq i32 %3970, 34
  br i1 %3971, label %3976, label %3972

3972:                                             ; preds = %3968
  %3973 = load i8, ptr %277, align 1
  %3974 = sext i8 %3973 to i32
  %3975 = icmp eq i32 %3974, 92
  br i1 %3975, label %3976, label %3977

3976:                                             ; preds = %3972, %3968, %3964, %3957
  store i1 false, ptr %245, align 1
  br label %4028

3977:                                             ; preds = %3972
  br label %3978

3978:                                             ; preds = %3977, %3954
  %3979 = load i64, ptr %247, align 8
  %3980 = icmp ult i64 30, %3979
  br i1 %3980, label %3981, label %4002

3981:                                             ; preds = %3978
  %3982 = load ptr, ptr %246, align 8
  %3983 = getelementptr inbounds i8, ptr %3982, i64 30
  %3984 = load i8, ptr %3983, align 1
  store i8 %3984, ptr %278, align 1
  %3985 = load i8, ptr %278, align 1
  %3986 = sext i8 %3985 to i32
  %3987 = icmp slt i32 %3986, 32
  br i1 %3987, label %4000, label %3988

3988:                                             ; preds = %3981
  %3989 = load i8, ptr %278, align 1
  %3990 = sext i8 %3989 to i32
  %3991 = icmp sgt i32 %3990, 126
  br i1 %3991, label %4000, label %3992

3992:                                             ; preds = %3988
  %3993 = load i8, ptr %278, align 1
  %3994 = sext i8 %3993 to i32
  %3995 = icmp eq i32 %3994, 34
  br i1 %3995, label %4000, label %3996

3996:                                             ; preds = %3992
  %3997 = load i8, ptr %278, align 1
  %3998 = sext i8 %3997 to i32
  %3999 = icmp eq i32 %3998, 92
  br i1 %3999, label %4000, label %4001

4000:                                             ; preds = %3996, %3992, %3988, %3981
  store i1 false, ptr %245, align 1
  br label %4028

4001:                                             ; preds = %3996
  br label %4002

4002:                                             ; preds = %4001, %3978
  %4003 = load i64, ptr %247, align 8
  %4004 = icmp ult i64 31, %4003
  br i1 %4004, label %4005, label %4026

4005:                                             ; preds = %4002
  %4006 = load ptr, ptr %246, align 8
  %4007 = getelementptr inbounds i8, ptr %4006, i64 31
  %4008 = load i8, ptr %4007, align 1
  store i8 %4008, ptr %279, align 1
  %4009 = load i8, ptr %279, align 1
  %4010 = sext i8 %4009 to i32
  %4011 = icmp slt i32 %4010, 32
  br i1 %4011, label %4024, label %4012

4012:                                             ; preds = %4005
  %4013 = load i8, ptr %279, align 1
  %4014 = sext i8 %4013 to i32
  %4015 = icmp sgt i32 %4014, 126
  br i1 %4015, label %4024, label %4016

4016:                                             ; preds = %4012
  %4017 = load i8, ptr %279, align 1
  %4018 = sext i8 %4017 to i32
  %4019 = icmp eq i32 %4018, 34
  br i1 %4019, label %4024, label %4020

4020:                                             ; preds = %4016
  %4021 = load i8, ptr %279, align 1
  %4022 = sext i8 %4021 to i32
  %4023 = icmp eq i32 %4022, 92
  br i1 %4023, label %4024, label %4025

4024:                                             ; preds = %4020, %4016, %4012, %4005
  store i1 false, ptr %245, align 1
  br label %4028

4025:                                             ; preds = %4020
  br label %4026

4026:                                             ; preds = %4025, %4002
  store i1 true, ptr %245, align 1
  br label %4028

4027:                                             ; preds = %3256, %3247
  store i1 false, ptr %245, align 1
  br label %4028

4028:                                             ; preds = %3280, %3304, %3328, %3352, %3376, %3400, %3424, %3448, %3472, %3496, %3520, %3544, %3568, %3592, %3616, %3640, %3664, %3688, %3712, %3736, %3760, %3784, %3808, %3832, %3856, %3880, %3904, %3928, %3952, %3976, %4000, %4024, %4026, %4027
  %4029 = load i1, ptr %245, align 1
  %4030 = zext i1 %4029 to i8
  store i8 %4030, ptr %523, align 1
  %4031 = load i8, ptr %523, align 1
  %4032 = trunc i8 %4031 to i1
  %4033 = zext i1 %4032 to i64
  %4034 = select i1 %4032, i32 8, i32 0
  %4035 = trunc i32 %4034 to i8
  store i8 %4035, ptr %524, align 1
  %4036 = load ptr, ptr %520, align 8
  %4037 = load i8, ptr %524, align 1
  %4038 = load i64, ptr %522, align 8
  store ptr %4036, ptr %105, align 8
  store i8 5, ptr %106, align 1
  store i8 %4037, ptr %107, align 1
  store i64 %4038, ptr %108, align 8
  %4039 = load i64, ptr %108, align 8
  %4040 = shl i64 %4039, 8
  store i64 %4040, ptr %109, align 8
  %4041 = load i8, ptr %106, align 1
  %4042 = zext i8 %4041 to i32
  %4043 = load i8, ptr %107, align 1
  %4044 = zext i8 %4043 to i32
  %4045 = or i32 %4042, %4044
  %4046 = sext i32 %4045 to i64
  %4047 = load i64, ptr %109, align 8
  %4048 = or i64 %4047, %4046
  store i64 %4048, ptr %109, align 8
  %4049 = load i64, ptr %109, align 8
  %4050 = load ptr, ptr %105, align 8
  store i64 %4049, ptr %4050, align 8
  %4051 = load ptr, ptr %521, align 8
  %4052 = load ptr, ptr %520, align 8
  %4053 = getelementptr inbounds nuw %struct.yyjson_val, ptr %4052, i32 0, i32 1
  store ptr %4051, ptr %4053, align 8
  %4054 = load ptr, ptr %861, align 8
  store ptr %4054, ptr %858, align 8
  br label %4057

4055:                                             ; preds = %3240
  br label %4056

4056:                                             ; preds = %4055, %3196
  store ptr null, ptr %858, align 8
  br label %4057

4057:                                             ; preds = %4028, %4056
  %4058 = load ptr, ptr %858, align 8
  %4059 = load ptr, ptr %938, align 8
  %4060 = load ptr, ptr %942, align 8
  %4061 = getelementptr inbounds nuw %struct.Coord, ptr %4060, i32 0, i32 1
  %4062 = load double, ptr %4061, align 8
  store ptr %4059, ptr %843, align 8
  store double %4062, ptr %844, align 8
  %4063 = load ptr, ptr %843, align 8
  %4064 = icmp ne ptr %4063, null
  %4065 = xor i1 %4064, true
  %4066 = zext i1 %4064 to i32
  %4067 = sext i32 %4066 to i64
  br i1 %4064, label %4068, label %4135

4068:                                             ; preds = %4057
  %4069 = load ptr, ptr %843, align 8
  store ptr %4069, ptr %782, align 8
  store i64 1, ptr %783, align 8
  %4070 = load ptr, ptr %782, align 8
  %4071 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %4070, i32 0, i32 1
  store ptr %4071, ptr %785, align 8
  %4072 = load ptr, ptr %782, align 8
  %4073 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %4072, i32 0, i32 3
  store ptr %4073, ptr %786, align 8
  %4074 = load ptr, ptr %786, align 8
  %4075 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %4074, i32 0, i32 1
  %4076 = load ptr, ptr %4075, align 8
  %4077 = load ptr, ptr %786, align 8
  %4078 = load ptr, ptr %4077, align 8
  %4079 = ptrtoint ptr %4076 to i64
  %4080 = ptrtoint ptr %4078 to i64
  %4081 = sub i64 %4079, %4080
  %4082 = sdiv exact i64 %4081, 24
  %4083 = load i64, ptr %783, align 8
  %4084 = icmp ult i64 %4082, %4083
  %4085 = xor i1 %4084, true
  %4086 = zext i1 %4084 to i32
  %4087 = sext i32 %4086 to i64
  br i1 %4084, label %4088, label %4099

4088:                                             ; preds = %4068
  %4089 = load ptr, ptr %786, align 8
  %4090 = load ptr, ptr %785, align 8
  %4091 = load i64, ptr %783, align 8
  %4092 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %4089, ptr noundef %4090, i64 noundef %4091)
  %4093 = xor i1 %4092, true
  %4094 = xor i1 %4092, true
  %4095 = zext i1 %4094 to i32
  %4096 = sext i32 %4095 to i64
  br i1 %4094, label %4097, label %4098

4097:                                             ; preds = %4088
  store ptr null, ptr %781, align 8
  br label %4107

4098:                                             ; preds = %4088
  br label %4099

4099:                                             ; preds = %4098, %4068
  %4100 = load ptr, ptr %786, align 8
  %4101 = load ptr, ptr %4100, align 8
  store ptr %4101, ptr %784, align 8
  %4102 = load i64, ptr %783, align 8
  %4103 = load ptr, ptr %786, align 8
  %4104 = load ptr, ptr %4103, align 8
  %4105 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4104, i64 %4102
  store ptr %4105, ptr %4103, align 8
  %4106 = load ptr, ptr %784, align 8
  store ptr %4106, ptr %781, align 8
  br label %4107

4107:                                             ; preds = %4097, %4099
  %4108 = load ptr, ptr %781, align 8
  store ptr %4108, ptr %845, align 8
  %4109 = load ptr, ptr %845, align 8
  %4110 = icmp ne ptr %4109, null
  %4111 = xor i1 %4110, true
  %4112 = zext i1 %4110 to i32
  %4113 = sext i32 %4112 to i64
  br i1 %4110, label %4114, label %4134

4114:                                             ; preds = %4107
  %4115 = load ptr, ptr %845, align 8
  %4116 = load double, ptr %844, align 8
  store ptr %4115, ptr %81, align 8
  store double %4116, ptr %82, align 8
  %4117 = load ptr, ptr %81, align 8
  store ptr %4117, ptr %76, align 8
  store i8 4, ptr %77, align 1
  store i8 16, ptr %78, align 1
  store i64 0, ptr %79, align 8
  %4118 = load i64, ptr %79, align 8
  %4119 = shl i64 %4118, 8
  store i64 %4119, ptr %80, align 8
  %4120 = load i8, ptr %77, align 1
  %4121 = zext i8 %4120 to i32
  %4122 = load i8, ptr %78, align 1
  %4123 = zext i8 %4122 to i32
  %4124 = or i32 %4121, %4123
  %4125 = sext i32 %4124 to i64
  %4126 = load i64, ptr %80, align 8
  %4127 = or i64 %4126, %4125
  store i64 %4127, ptr %80, align 8
  %4128 = load i64, ptr %80, align 8
  %4129 = load ptr, ptr %76, align 8
  store i64 %4128, ptr %4129, align 8
  %4130 = load double, ptr %82, align 8
  %4131 = load ptr, ptr %81, align 8
  %4132 = getelementptr inbounds nuw %struct.yyjson_val, ptr %4131, i32 0, i32 1
  store double %4130, ptr %4132, align 8
  %4133 = load ptr, ptr %845, align 8
  store ptr %4133, ptr %842, align 8
  br label %4136

4134:                                             ; preds = %4107
  br label %4135

4135:                                             ; preds = %4134, %4057
  store ptr null, ptr %842, align 8
  br label %4136

4136:                                             ; preds = %4114, %4135
  %4137 = load ptr, ptr %842, align 8
  store ptr %3189, ptr %895, align 8
  store ptr %4058, ptr %896, align 8
  store ptr %4137, ptr %897, align 8
  %4138 = load ptr, ptr %895, align 8
  store ptr %4138, ptr %688, align 8
  %4139 = load ptr, ptr %688, align 8
  %4140 = icmp ne ptr %4139, null
  br i1 %4140, label %4141, label %4154

4141:                                             ; preds = %4136
  %4142 = load ptr, ptr %688, align 8
  store ptr %4142, ptr %610, align 8
  %4143 = load ptr, ptr %610, align 8
  store ptr %4143, ptr %602, align 8
  %4144 = load ptr, ptr %602, align 8
  %4145 = load i64, ptr %4144, align 8
  %4146 = trunc i64 %4145 to i8
  store i8 %4146, ptr %603, align 1
  %4147 = load i8, ptr %603, align 1
  %4148 = zext i8 %4147 to i32
  %4149 = and i32 %4148, 7
  %4150 = trunc i32 %4149 to i8
  %4151 = zext i8 %4150 to i32
  %4152 = icmp eq i32 %4151, 7
  %4153 = zext i1 %4152 to i32
  br label %4155

4154:                                             ; preds = %4136
  br label %4155

4155:                                             ; preds = %4141, %4154
  %4156 = phi i32 [ %4153, %4141 ], [ 0, %4154 ]
  %4157 = icmp ne i32 %4156, 0
  br i1 %4157, label %4158, label %4182

4158:                                             ; preds = %4155
  %4159 = load ptr, ptr %896, align 8
  store ptr %4159, ptr %680, align 8
  %4160 = load ptr, ptr %680, align 8
  %4161 = icmp ne ptr %4160, null
  br i1 %4161, label %4162, label %4175

4162:                                             ; preds = %4158
  %4163 = load ptr, ptr %680, align 8
  store ptr %4163, ptr %576, align 8
  %4164 = load ptr, ptr %576, align 8
  store ptr %4164, ptr %574, align 8
  %4165 = load ptr, ptr %574, align 8
  %4166 = load i64, ptr %4165, align 8
  %4167 = trunc i64 %4166 to i8
  store i8 %4167, ptr %575, align 1
  %4168 = load i8, ptr %575, align 1
  %4169 = zext i8 %4168 to i32
  %4170 = and i32 %4169, 7
  %4171 = trunc i32 %4170 to i8
  %4172 = zext i8 %4171 to i32
  %4173 = icmp eq i32 %4172, 5
  %4174 = zext i1 %4173 to i32
  br label %4176

4175:                                             ; preds = %4158
  br label %4176

4176:                                             ; preds = %4162, %4175
  %4177 = phi i32 [ %4174, %4162 ], [ 0, %4175 ]
  %4178 = icmp ne i32 %4177, 0
  br i1 %4178, label %4179, label %4182

4179:                                             ; preds = %4176
  %4180 = load ptr, ptr %897, align 8
  %4181 = icmp ne ptr %4180, null
  br label %4182

4182:                                             ; preds = %4179, %4176, %4155
  %4183 = phi i1 [ false, %4176 ], [ false, %4155 ], [ %4181, %4179 ]
  %4184 = xor i1 %4183, true
  %4185 = zext i1 %4183 to i32
  %4186 = sext i32 %4185 to i64
  br i1 %4183, label %4187, label %4238

4187:                                             ; preds = %4182
  %4188 = load ptr, ptr %895, align 8
  %4189 = load ptr, ptr %896, align 8
  %4190 = load ptr, ptr %897, align 8
  %4191 = load ptr, ptr %895, align 8
  store ptr %4191, ptr %621, align 8
  %4192 = load ptr, ptr %621, align 8
  %4193 = load i64, ptr %4192, align 8
  %4194 = lshr i64 %4193, 8
  store ptr %4188, ptr %657, align 8
  store ptr %4189, ptr %658, align 8
  store ptr %4190, ptr %659, align 8
  store i64 %4194, ptr %660, align 8
  %4195 = load i64, ptr %660, align 8
  %4196 = icmp ne i64 %4195, 0
  %4197 = xor i1 %4196, true
  %4198 = zext i1 %4196 to i32
  %4199 = sext i32 %4198 to i64
  br i1 %4196, label %4200, label %4215

4200:                                             ; preds = %4187
  %4201 = load ptr, ptr %657, align 8
  %4202 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4201, i32 0, i32 1
  %4203 = load ptr, ptr %4202, align 8
  %4204 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4203, i32 0, i32 2
  %4205 = load ptr, ptr %4204, align 8
  store ptr %4205, ptr %661, align 8
  %4206 = load ptr, ptr %661, align 8
  %4207 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4206, i32 0, i32 2
  %4208 = load ptr, ptr %4207, align 8
  store ptr %4208, ptr %662, align 8
  %4209 = load ptr, ptr %658, align 8
  %4210 = load ptr, ptr %661, align 8
  %4211 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4210, i32 0, i32 2
  store ptr %4209, ptr %4211, align 8
  %4212 = load ptr, ptr %662, align 8
  %4213 = load ptr, ptr %659, align 8
  %4214 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4213, i32 0, i32 2
  store ptr %4212, ptr %4214, align 8
  br label %4219

4215:                                             ; preds = %4187
  %4216 = load ptr, ptr %658, align 8
  %4217 = load ptr, ptr %659, align 8
  %4218 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4217, i32 0, i32 2
  store ptr %4216, ptr %4218, align 8
  br label %4219

4219:                                             ; preds = %4200, %4215
  %4220 = load ptr, ptr %659, align 8
  %4221 = load ptr, ptr %658, align 8
  %4222 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4221, i32 0, i32 2
  store ptr %4220, ptr %4222, align 8
  %4223 = load ptr, ptr %658, align 8
  %4224 = load ptr, ptr %657, align 8
  %4225 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4224, i32 0, i32 1
  store ptr %4223, ptr %4225, align 8
  %4226 = load ptr, ptr %657, align 8
  %4227 = load i64, ptr %660, align 8
  %4228 = add i64 %4227, 1
  store ptr %4226, ptr %550, align 8
  store i64 %4228, ptr %551, align 8
  %4229 = load ptr, ptr %550, align 8
  %4230 = load i64, ptr %4229, align 8
  %4231 = and i64 %4230, 255
  store i64 %4231, ptr %552, align 8
  %4232 = load i64, ptr %551, align 8
  %4233 = shl i64 %4232, 8
  %4234 = load i64, ptr %552, align 8
  %4235 = or i64 %4234, %4233
  store i64 %4235, ptr %552, align 8
  %4236 = load i64, ptr %552, align 8
  %4237 = load ptr, ptr %550, align 8
  store i64 %4236, ptr %4237, align 8
  store i1 true, ptr %894, align 1
  br label %4239

4238:                                             ; preds = %4182
  store i1 false, ptr %894, align 1
  br label %4239

4239:                                             ; preds = %4219, %4238
  %4240 = load i1, ptr %894, align 1
  %4241 = load ptr, ptr %943, align 8
  %4242 = load ptr, ptr %938, align 8
  store ptr %4242, ptr %863, align 8
  store ptr @.str.4, ptr %864, align 8
  %4243 = load ptr, ptr %863, align 8
  %4244 = icmp ne ptr %4243, null
  br i1 %4244, label %4245, label %4248

4245:                                             ; preds = %4239
  %4246 = load ptr, ptr %864, align 8
  %4247 = icmp ne ptr %4246, null
  br label %4248

4248:                                             ; preds = %4245, %4239
  %4249 = phi i1 [ false, %4239 ], [ %4247, %4245 ]
  %4250 = xor i1 %4249, true
  %4251 = zext i1 %4249 to i32
  %4252 = sext i32 %4251 to i64
  br i1 %4249, label %4253, label %5108

4253:                                             ; preds = %4248
  %4254 = load ptr, ptr %863, align 8
  store ptr %4254, ptr %752, align 8
  store i64 1, ptr %753, align 8
  %4255 = load ptr, ptr %752, align 8
  %4256 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %4255, i32 0, i32 1
  store ptr %4256, ptr %755, align 8
  %4257 = load ptr, ptr %752, align 8
  %4258 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %4257, i32 0, i32 3
  store ptr %4258, ptr %756, align 8
  %4259 = load ptr, ptr %756, align 8
  %4260 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %4259, i32 0, i32 1
  %4261 = load ptr, ptr %4260, align 8
  %4262 = load ptr, ptr %756, align 8
  %4263 = load ptr, ptr %4262, align 8
  %4264 = ptrtoint ptr %4261 to i64
  %4265 = ptrtoint ptr %4263 to i64
  %4266 = sub i64 %4264, %4265
  %4267 = sdiv exact i64 %4266, 24
  %4268 = load i64, ptr %753, align 8
  %4269 = icmp ult i64 %4267, %4268
  %4270 = xor i1 %4269, true
  %4271 = zext i1 %4269 to i32
  %4272 = sext i32 %4271 to i64
  br i1 %4269, label %4273, label %4284

4273:                                             ; preds = %4253
  %4274 = load ptr, ptr %756, align 8
  %4275 = load ptr, ptr %755, align 8
  %4276 = load i64, ptr %753, align 8
  %4277 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %4274, ptr noundef %4275, i64 noundef %4276)
  %4278 = xor i1 %4277, true
  %4279 = xor i1 %4277, true
  %4280 = zext i1 %4279 to i32
  %4281 = sext i32 %4280 to i64
  br i1 %4279, label %4282, label %4283

4282:                                             ; preds = %4273
  store ptr null, ptr %751, align 8
  br label %4292

4283:                                             ; preds = %4273
  br label %4284

4284:                                             ; preds = %4283, %4253
  %4285 = load ptr, ptr %756, align 8
  %4286 = load ptr, ptr %4285, align 8
  store ptr %4286, ptr %754, align 8
  %4287 = load i64, ptr %753, align 8
  %4288 = load ptr, ptr %756, align 8
  %4289 = load ptr, ptr %4288, align 8
  %4290 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %4289, i64 %4287
  store ptr %4290, ptr %4288, align 8
  %4291 = load ptr, ptr %754, align 8
  store ptr %4291, ptr %751, align 8
  br label %4292

4292:                                             ; preds = %4282, %4284
  %4293 = load ptr, ptr %751, align 8
  store ptr %4293, ptr %865, align 8
  %4294 = load ptr, ptr %865, align 8
  %4295 = icmp ne ptr %4294, null
  %4296 = xor i1 %4295, true
  %4297 = zext i1 %4295 to i32
  %4298 = sext i32 %4297 to i64
  br i1 %4295, label %4299, label %5107

4299:                                             ; preds = %4292
  %4300 = load ptr, ptr %865, align 8
  %4301 = load ptr, ptr %864, align 8
  store ptr %4300, ptr %515, align 8
  store ptr %4301, ptr %516, align 8
  %4302 = load ptr, ptr %516, align 8
  %4303 = call i64 @strlen(ptr noundef %4302)
  store i64 %4303, ptr %517, align 8
  %4304 = load ptr, ptr %516, align 8
  %4305 = load i64, ptr %517, align 8
  store ptr %4304, ptr %281, align 8
  store i64 %4305, ptr %282, align 8
  %4306 = load i64, ptr %282, align 8
  %4307 = call i1 @llvm.is.constant.i64(i64 %4306)
  br i1 %4307, label %4308, label %5079

4308:                                             ; preds = %4299
  %4309 = load i64, ptr %282, align 8
  %4310 = icmp ule i64 %4309, 32
  br i1 %4310, label %4311, label %5079

4311:                                             ; preds = %4308
  %4312 = load i64, ptr %282, align 8
  %4313 = icmp ult i64 0, %4312
  br i1 %4313, label %4314, label %4334

4314:                                             ; preds = %4311
  %4315 = load ptr, ptr %281, align 8
  %4316 = load i8, ptr %4315, align 1
  store i8 %4316, ptr %283, align 1
  %4317 = load i8, ptr %283, align 1
  %4318 = sext i8 %4317 to i32
  %4319 = icmp slt i32 %4318, 32
  br i1 %4319, label %4332, label %4320

4320:                                             ; preds = %4314
  %4321 = load i8, ptr %283, align 1
  %4322 = sext i8 %4321 to i32
  %4323 = icmp sgt i32 %4322, 126
  br i1 %4323, label %4332, label %4324

4324:                                             ; preds = %4320
  %4325 = load i8, ptr %283, align 1
  %4326 = sext i8 %4325 to i32
  %4327 = icmp eq i32 %4326, 34
  br i1 %4327, label %4332, label %4328

4328:                                             ; preds = %4324
  %4329 = load i8, ptr %283, align 1
  %4330 = sext i8 %4329 to i32
  %4331 = icmp eq i32 %4330, 92
  br i1 %4331, label %4332, label %4333

4332:                                             ; preds = %4328, %4324, %4320, %4314
  store i1 false, ptr %280, align 1
  br label %5080

4333:                                             ; preds = %4328
  br label %4334

4334:                                             ; preds = %4333, %4311
  %4335 = load i64, ptr %282, align 8
  %4336 = icmp ult i64 1, %4335
  br i1 %4336, label %4337, label %4358

4337:                                             ; preds = %4334
  %4338 = load ptr, ptr %281, align 8
  %4339 = getelementptr inbounds i8, ptr %4338, i64 1
  %4340 = load i8, ptr %4339, align 1
  store i8 %4340, ptr %284, align 1
  %4341 = load i8, ptr %284, align 1
  %4342 = sext i8 %4341 to i32
  %4343 = icmp slt i32 %4342, 32
  br i1 %4343, label %4356, label %4344

4344:                                             ; preds = %4337
  %4345 = load i8, ptr %284, align 1
  %4346 = sext i8 %4345 to i32
  %4347 = icmp sgt i32 %4346, 126
  br i1 %4347, label %4356, label %4348

4348:                                             ; preds = %4344
  %4349 = load i8, ptr %284, align 1
  %4350 = sext i8 %4349 to i32
  %4351 = icmp eq i32 %4350, 34
  br i1 %4351, label %4356, label %4352

4352:                                             ; preds = %4348
  %4353 = load i8, ptr %284, align 1
  %4354 = sext i8 %4353 to i32
  %4355 = icmp eq i32 %4354, 92
  br i1 %4355, label %4356, label %4357

4356:                                             ; preds = %4352, %4348, %4344, %4337
  store i1 false, ptr %280, align 1
  br label %5080

4357:                                             ; preds = %4352
  br label %4358

4358:                                             ; preds = %4357, %4334
  %4359 = load i64, ptr %282, align 8
  %4360 = icmp ult i64 2, %4359
  br i1 %4360, label %4361, label %4382

4361:                                             ; preds = %4358
  %4362 = load ptr, ptr %281, align 8
  %4363 = getelementptr inbounds i8, ptr %4362, i64 2
  %4364 = load i8, ptr %4363, align 1
  store i8 %4364, ptr %285, align 1
  %4365 = load i8, ptr %285, align 1
  %4366 = sext i8 %4365 to i32
  %4367 = icmp slt i32 %4366, 32
  br i1 %4367, label %4380, label %4368

4368:                                             ; preds = %4361
  %4369 = load i8, ptr %285, align 1
  %4370 = sext i8 %4369 to i32
  %4371 = icmp sgt i32 %4370, 126
  br i1 %4371, label %4380, label %4372

4372:                                             ; preds = %4368
  %4373 = load i8, ptr %285, align 1
  %4374 = sext i8 %4373 to i32
  %4375 = icmp eq i32 %4374, 34
  br i1 %4375, label %4380, label %4376

4376:                                             ; preds = %4372
  %4377 = load i8, ptr %285, align 1
  %4378 = sext i8 %4377 to i32
  %4379 = icmp eq i32 %4378, 92
  br i1 %4379, label %4380, label %4381

4380:                                             ; preds = %4376, %4372, %4368, %4361
  store i1 false, ptr %280, align 1
  br label %5080

4381:                                             ; preds = %4376
  br label %4382

4382:                                             ; preds = %4381, %4358
  %4383 = load i64, ptr %282, align 8
  %4384 = icmp ult i64 3, %4383
  br i1 %4384, label %4385, label %4406

4385:                                             ; preds = %4382
  %4386 = load ptr, ptr %281, align 8
  %4387 = getelementptr inbounds i8, ptr %4386, i64 3
  %4388 = load i8, ptr %4387, align 1
  store i8 %4388, ptr %286, align 1
  %4389 = load i8, ptr %286, align 1
  %4390 = sext i8 %4389 to i32
  %4391 = icmp slt i32 %4390, 32
  br i1 %4391, label %4404, label %4392

4392:                                             ; preds = %4385
  %4393 = load i8, ptr %286, align 1
  %4394 = sext i8 %4393 to i32
  %4395 = icmp sgt i32 %4394, 126
  br i1 %4395, label %4404, label %4396

4396:                                             ; preds = %4392
  %4397 = load i8, ptr %286, align 1
  %4398 = sext i8 %4397 to i32
  %4399 = icmp eq i32 %4398, 34
  br i1 %4399, label %4404, label %4400

4400:                                             ; preds = %4396
  %4401 = load i8, ptr %286, align 1
  %4402 = sext i8 %4401 to i32
  %4403 = icmp eq i32 %4402, 92
  br i1 %4403, label %4404, label %4405

4404:                                             ; preds = %4400, %4396, %4392, %4385
  store i1 false, ptr %280, align 1
  br label %5080

4405:                                             ; preds = %4400
  br label %4406

4406:                                             ; preds = %4405, %4382
  %4407 = load i64, ptr %282, align 8
  %4408 = icmp ult i64 4, %4407
  br i1 %4408, label %4409, label %4430

4409:                                             ; preds = %4406
  %4410 = load ptr, ptr %281, align 8
  %4411 = getelementptr inbounds i8, ptr %4410, i64 4
  %4412 = load i8, ptr %4411, align 1
  store i8 %4412, ptr %287, align 1
  %4413 = load i8, ptr %287, align 1
  %4414 = sext i8 %4413 to i32
  %4415 = icmp slt i32 %4414, 32
  br i1 %4415, label %4428, label %4416

4416:                                             ; preds = %4409
  %4417 = load i8, ptr %287, align 1
  %4418 = sext i8 %4417 to i32
  %4419 = icmp sgt i32 %4418, 126
  br i1 %4419, label %4428, label %4420

4420:                                             ; preds = %4416
  %4421 = load i8, ptr %287, align 1
  %4422 = sext i8 %4421 to i32
  %4423 = icmp eq i32 %4422, 34
  br i1 %4423, label %4428, label %4424

4424:                                             ; preds = %4420
  %4425 = load i8, ptr %287, align 1
  %4426 = sext i8 %4425 to i32
  %4427 = icmp eq i32 %4426, 92
  br i1 %4427, label %4428, label %4429

4428:                                             ; preds = %4424, %4420, %4416, %4409
  store i1 false, ptr %280, align 1
  br label %5080

4429:                                             ; preds = %4424
  br label %4430

4430:                                             ; preds = %4429, %4406
  %4431 = load i64, ptr %282, align 8
  %4432 = icmp ult i64 5, %4431
  br i1 %4432, label %4433, label %4454

4433:                                             ; preds = %4430
  %4434 = load ptr, ptr %281, align 8
  %4435 = getelementptr inbounds i8, ptr %4434, i64 5
  %4436 = load i8, ptr %4435, align 1
  store i8 %4436, ptr %288, align 1
  %4437 = load i8, ptr %288, align 1
  %4438 = sext i8 %4437 to i32
  %4439 = icmp slt i32 %4438, 32
  br i1 %4439, label %4452, label %4440

4440:                                             ; preds = %4433
  %4441 = load i8, ptr %288, align 1
  %4442 = sext i8 %4441 to i32
  %4443 = icmp sgt i32 %4442, 126
  br i1 %4443, label %4452, label %4444

4444:                                             ; preds = %4440
  %4445 = load i8, ptr %288, align 1
  %4446 = sext i8 %4445 to i32
  %4447 = icmp eq i32 %4446, 34
  br i1 %4447, label %4452, label %4448

4448:                                             ; preds = %4444
  %4449 = load i8, ptr %288, align 1
  %4450 = sext i8 %4449 to i32
  %4451 = icmp eq i32 %4450, 92
  br i1 %4451, label %4452, label %4453

4452:                                             ; preds = %4448, %4444, %4440, %4433
  store i1 false, ptr %280, align 1
  br label %5080

4453:                                             ; preds = %4448
  br label %4454

4454:                                             ; preds = %4453, %4430
  %4455 = load i64, ptr %282, align 8
  %4456 = icmp ult i64 6, %4455
  br i1 %4456, label %4457, label %4478

4457:                                             ; preds = %4454
  %4458 = load ptr, ptr %281, align 8
  %4459 = getelementptr inbounds i8, ptr %4458, i64 6
  %4460 = load i8, ptr %4459, align 1
  store i8 %4460, ptr %289, align 1
  %4461 = load i8, ptr %289, align 1
  %4462 = sext i8 %4461 to i32
  %4463 = icmp slt i32 %4462, 32
  br i1 %4463, label %4476, label %4464

4464:                                             ; preds = %4457
  %4465 = load i8, ptr %289, align 1
  %4466 = sext i8 %4465 to i32
  %4467 = icmp sgt i32 %4466, 126
  br i1 %4467, label %4476, label %4468

4468:                                             ; preds = %4464
  %4469 = load i8, ptr %289, align 1
  %4470 = sext i8 %4469 to i32
  %4471 = icmp eq i32 %4470, 34
  br i1 %4471, label %4476, label %4472

4472:                                             ; preds = %4468
  %4473 = load i8, ptr %289, align 1
  %4474 = sext i8 %4473 to i32
  %4475 = icmp eq i32 %4474, 92
  br i1 %4475, label %4476, label %4477

4476:                                             ; preds = %4472, %4468, %4464, %4457
  store i1 false, ptr %280, align 1
  br label %5080

4477:                                             ; preds = %4472
  br label %4478

4478:                                             ; preds = %4477, %4454
  %4479 = load i64, ptr %282, align 8
  %4480 = icmp ult i64 7, %4479
  br i1 %4480, label %4481, label %4502

4481:                                             ; preds = %4478
  %4482 = load ptr, ptr %281, align 8
  %4483 = getelementptr inbounds i8, ptr %4482, i64 7
  %4484 = load i8, ptr %4483, align 1
  store i8 %4484, ptr %290, align 1
  %4485 = load i8, ptr %290, align 1
  %4486 = sext i8 %4485 to i32
  %4487 = icmp slt i32 %4486, 32
  br i1 %4487, label %4500, label %4488

4488:                                             ; preds = %4481
  %4489 = load i8, ptr %290, align 1
  %4490 = sext i8 %4489 to i32
  %4491 = icmp sgt i32 %4490, 126
  br i1 %4491, label %4500, label %4492

4492:                                             ; preds = %4488
  %4493 = load i8, ptr %290, align 1
  %4494 = sext i8 %4493 to i32
  %4495 = icmp eq i32 %4494, 34
  br i1 %4495, label %4500, label %4496

4496:                                             ; preds = %4492
  %4497 = load i8, ptr %290, align 1
  %4498 = sext i8 %4497 to i32
  %4499 = icmp eq i32 %4498, 92
  br i1 %4499, label %4500, label %4501

4500:                                             ; preds = %4496, %4492, %4488, %4481
  store i1 false, ptr %280, align 1
  br label %5080

4501:                                             ; preds = %4496
  br label %4502

4502:                                             ; preds = %4501, %4478
  %4503 = load i64, ptr %282, align 8
  %4504 = icmp ult i64 8, %4503
  br i1 %4504, label %4505, label %4526

4505:                                             ; preds = %4502
  %4506 = load ptr, ptr %281, align 8
  %4507 = getelementptr inbounds i8, ptr %4506, i64 8
  %4508 = load i8, ptr %4507, align 1
  store i8 %4508, ptr %291, align 1
  %4509 = load i8, ptr %291, align 1
  %4510 = sext i8 %4509 to i32
  %4511 = icmp slt i32 %4510, 32
  br i1 %4511, label %4524, label %4512

4512:                                             ; preds = %4505
  %4513 = load i8, ptr %291, align 1
  %4514 = sext i8 %4513 to i32
  %4515 = icmp sgt i32 %4514, 126
  br i1 %4515, label %4524, label %4516

4516:                                             ; preds = %4512
  %4517 = load i8, ptr %291, align 1
  %4518 = sext i8 %4517 to i32
  %4519 = icmp eq i32 %4518, 34
  br i1 %4519, label %4524, label %4520

4520:                                             ; preds = %4516
  %4521 = load i8, ptr %291, align 1
  %4522 = sext i8 %4521 to i32
  %4523 = icmp eq i32 %4522, 92
  br i1 %4523, label %4524, label %4525

4524:                                             ; preds = %4520, %4516, %4512, %4505
  store i1 false, ptr %280, align 1
  br label %5080

4525:                                             ; preds = %4520
  br label %4526

4526:                                             ; preds = %4525, %4502
  %4527 = load i64, ptr %282, align 8
  %4528 = icmp ult i64 9, %4527
  br i1 %4528, label %4529, label %4550

4529:                                             ; preds = %4526
  %4530 = load ptr, ptr %281, align 8
  %4531 = getelementptr inbounds i8, ptr %4530, i64 9
  %4532 = load i8, ptr %4531, align 1
  store i8 %4532, ptr %292, align 1
  %4533 = load i8, ptr %292, align 1
  %4534 = sext i8 %4533 to i32
  %4535 = icmp slt i32 %4534, 32
  br i1 %4535, label %4548, label %4536

4536:                                             ; preds = %4529
  %4537 = load i8, ptr %292, align 1
  %4538 = sext i8 %4537 to i32
  %4539 = icmp sgt i32 %4538, 126
  br i1 %4539, label %4548, label %4540

4540:                                             ; preds = %4536
  %4541 = load i8, ptr %292, align 1
  %4542 = sext i8 %4541 to i32
  %4543 = icmp eq i32 %4542, 34
  br i1 %4543, label %4548, label %4544

4544:                                             ; preds = %4540
  %4545 = load i8, ptr %292, align 1
  %4546 = sext i8 %4545 to i32
  %4547 = icmp eq i32 %4546, 92
  br i1 %4547, label %4548, label %4549

4548:                                             ; preds = %4544, %4540, %4536, %4529
  store i1 false, ptr %280, align 1
  br label %5080

4549:                                             ; preds = %4544
  br label %4550

4550:                                             ; preds = %4549, %4526
  %4551 = load i64, ptr %282, align 8
  %4552 = icmp ult i64 10, %4551
  br i1 %4552, label %4553, label %4574

4553:                                             ; preds = %4550
  %4554 = load ptr, ptr %281, align 8
  %4555 = getelementptr inbounds i8, ptr %4554, i64 10
  %4556 = load i8, ptr %4555, align 1
  store i8 %4556, ptr %293, align 1
  %4557 = load i8, ptr %293, align 1
  %4558 = sext i8 %4557 to i32
  %4559 = icmp slt i32 %4558, 32
  br i1 %4559, label %4572, label %4560

4560:                                             ; preds = %4553
  %4561 = load i8, ptr %293, align 1
  %4562 = sext i8 %4561 to i32
  %4563 = icmp sgt i32 %4562, 126
  br i1 %4563, label %4572, label %4564

4564:                                             ; preds = %4560
  %4565 = load i8, ptr %293, align 1
  %4566 = sext i8 %4565 to i32
  %4567 = icmp eq i32 %4566, 34
  br i1 %4567, label %4572, label %4568

4568:                                             ; preds = %4564
  %4569 = load i8, ptr %293, align 1
  %4570 = sext i8 %4569 to i32
  %4571 = icmp eq i32 %4570, 92
  br i1 %4571, label %4572, label %4573

4572:                                             ; preds = %4568, %4564, %4560, %4553
  store i1 false, ptr %280, align 1
  br label %5080

4573:                                             ; preds = %4568
  br label %4574

4574:                                             ; preds = %4573, %4550
  %4575 = load i64, ptr %282, align 8
  %4576 = icmp ult i64 11, %4575
  br i1 %4576, label %4577, label %4598

4577:                                             ; preds = %4574
  %4578 = load ptr, ptr %281, align 8
  %4579 = getelementptr inbounds i8, ptr %4578, i64 11
  %4580 = load i8, ptr %4579, align 1
  store i8 %4580, ptr %294, align 1
  %4581 = load i8, ptr %294, align 1
  %4582 = sext i8 %4581 to i32
  %4583 = icmp slt i32 %4582, 32
  br i1 %4583, label %4596, label %4584

4584:                                             ; preds = %4577
  %4585 = load i8, ptr %294, align 1
  %4586 = sext i8 %4585 to i32
  %4587 = icmp sgt i32 %4586, 126
  br i1 %4587, label %4596, label %4588

4588:                                             ; preds = %4584
  %4589 = load i8, ptr %294, align 1
  %4590 = sext i8 %4589 to i32
  %4591 = icmp eq i32 %4590, 34
  br i1 %4591, label %4596, label %4592

4592:                                             ; preds = %4588
  %4593 = load i8, ptr %294, align 1
  %4594 = sext i8 %4593 to i32
  %4595 = icmp eq i32 %4594, 92
  br i1 %4595, label %4596, label %4597

4596:                                             ; preds = %4592, %4588, %4584, %4577
  store i1 false, ptr %280, align 1
  br label %5080

4597:                                             ; preds = %4592
  br label %4598

4598:                                             ; preds = %4597, %4574
  %4599 = load i64, ptr %282, align 8
  %4600 = icmp ult i64 12, %4599
  br i1 %4600, label %4601, label %4622

4601:                                             ; preds = %4598
  %4602 = load ptr, ptr %281, align 8
  %4603 = getelementptr inbounds i8, ptr %4602, i64 12
  %4604 = load i8, ptr %4603, align 1
  store i8 %4604, ptr %295, align 1
  %4605 = load i8, ptr %295, align 1
  %4606 = sext i8 %4605 to i32
  %4607 = icmp slt i32 %4606, 32
  br i1 %4607, label %4620, label %4608

4608:                                             ; preds = %4601
  %4609 = load i8, ptr %295, align 1
  %4610 = sext i8 %4609 to i32
  %4611 = icmp sgt i32 %4610, 126
  br i1 %4611, label %4620, label %4612

4612:                                             ; preds = %4608
  %4613 = load i8, ptr %295, align 1
  %4614 = sext i8 %4613 to i32
  %4615 = icmp eq i32 %4614, 34
  br i1 %4615, label %4620, label %4616

4616:                                             ; preds = %4612
  %4617 = load i8, ptr %295, align 1
  %4618 = sext i8 %4617 to i32
  %4619 = icmp eq i32 %4618, 92
  br i1 %4619, label %4620, label %4621

4620:                                             ; preds = %4616, %4612, %4608, %4601
  store i1 false, ptr %280, align 1
  br label %5080

4621:                                             ; preds = %4616
  br label %4622

4622:                                             ; preds = %4621, %4598
  %4623 = load i64, ptr %282, align 8
  %4624 = icmp ult i64 13, %4623
  br i1 %4624, label %4625, label %4646

4625:                                             ; preds = %4622
  %4626 = load ptr, ptr %281, align 8
  %4627 = getelementptr inbounds i8, ptr %4626, i64 13
  %4628 = load i8, ptr %4627, align 1
  store i8 %4628, ptr %296, align 1
  %4629 = load i8, ptr %296, align 1
  %4630 = sext i8 %4629 to i32
  %4631 = icmp slt i32 %4630, 32
  br i1 %4631, label %4644, label %4632

4632:                                             ; preds = %4625
  %4633 = load i8, ptr %296, align 1
  %4634 = sext i8 %4633 to i32
  %4635 = icmp sgt i32 %4634, 126
  br i1 %4635, label %4644, label %4636

4636:                                             ; preds = %4632
  %4637 = load i8, ptr %296, align 1
  %4638 = sext i8 %4637 to i32
  %4639 = icmp eq i32 %4638, 34
  br i1 %4639, label %4644, label %4640

4640:                                             ; preds = %4636
  %4641 = load i8, ptr %296, align 1
  %4642 = sext i8 %4641 to i32
  %4643 = icmp eq i32 %4642, 92
  br i1 %4643, label %4644, label %4645

4644:                                             ; preds = %4640, %4636, %4632, %4625
  store i1 false, ptr %280, align 1
  br label %5080

4645:                                             ; preds = %4640
  br label %4646

4646:                                             ; preds = %4645, %4622
  %4647 = load i64, ptr %282, align 8
  %4648 = icmp ult i64 14, %4647
  br i1 %4648, label %4649, label %4670

4649:                                             ; preds = %4646
  %4650 = load ptr, ptr %281, align 8
  %4651 = getelementptr inbounds i8, ptr %4650, i64 14
  %4652 = load i8, ptr %4651, align 1
  store i8 %4652, ptr %297, align 1
  %4653 = load i8, ptr %297, align 1
  %4654 = sext i8 %4653 to i32
  %4655 = icmp slt i32 %4654, 32
  br i1 %4655, label %4668, label %4656

4656:                                             ; preds = %4649
  %4657 = load i8, ptr %297, align 1
  %4658 = sext i8 %4657 to i32
  %4659 = icmp sgt i32 %4658, 126
  br i1 %4659, label %4668, label %4660

4660:                                             ; preds = %4656
  %4661 = load i8, ptr %297, align 1
  %4662 = sext i8 %4661 to i32
  %4663 = icmp eq i32 %4662, 34
  br i1 %4663, label %4668, label %4664

4664:                                             ; preds = %4660
  %4665 = load i8, ptr %297, align 1
  %4666 = sext i8 %4665 to i32
  %4667 = icmp eq i32 %4666, 92
  br i1 %4667, label %4668, label %4669

4668:                                             ; preds = %4664, %4660, %4656, %4649
  store i1 false, ptr %280, align 1
  br label %5080

4669:                                             ; preds = %4664
  br label %4670

4670:                                             ; preds = %4669, %4646
  %4671 = load i64, ptr %282, align 8
  %4672 = icmp ult i64 15, %4671
  br i1 %4672, label %4673, label %4694

4673:                                             ; preds = %4670
  %4674 = load ptr, ptr %281, align 8
  %4675 = getelementptr inbounds i8, ptr %4674, i64 15
  %4676 = load i8, ptr %4675, align 1
  store i8 %4676, ptr %298, align 1
  %4677 = load i8, ptr %298, align 1
  %4678 = sext i8 %4677 to i32
  %4679 = icmp slt i32 %4678, 32
  br i1 %4679, label %4692, label %4680

4680:                                             ; preds = %4673
  %4681 = load i8, ptr %298, align 1
  %4682 = sext i8 %4681 to i32
  %4683 = icmp sgt i32 %4682, 126
  br i1 %4683, label %4692, label %4684

4684:                                             ; preds = %4680
  %4685 = load i8, ptr %298, align 1
  %4686 = sext i8 %4685 to i32
  %4687 = icmp eq i32 %4686, 34
  br i1 %4687, label %4692, label %4688

4688:                                             ; preds = %4684
  %4689 = load i8, ptr %298, align 1
  %4690 = sext i8 %4689 to i32
  %4691 = icmp eq i32 %4690, 92
  br i1 %4691, label %4692, label %4693

4692:                                             ; preds = %4688, %4684, %4680, %4673
  store i1 false, ptr %280, align 1
  br label %5080

4693:                                             ; preds = %4688
  br label %4694

4694:                                             ; preds = %4693, %4670
  %4695 = load i64, ptr %282, align 8
  %4696 = icmp ult i64 16, %4695
  br i1 %4696, label %4697, label %4718

4697:                                             ; preds = %4694
  %4698 = load ptr, ptr %281, align 8
  %4699 = getelementptr inbounds i8, ptr %4698, i64 16
  %4700 = load i8, ptr %4699, align 1
  store i8 %4700, ptr %299, align 1
  %4701 = load i8, ptr %299, align 1
  %4702 = sext i8 %4701 to i32
  %4703 = icmp slt i32 %4702, 32
  br i1 %4703, label %4716, label %4704

4704:                                             ; preds = %4697
  %4705 = load i8, ptr %299, align 1
  %4706 = sext i8 %4705 to i32
  %4707 = icmp sgt i32 %4706, 126
  br i1 %4707, label %4716, label %4708

4708:                                             ; preds = %4704
  %4709 = load i8, ptr %299, align 1
  %4710 = sext i8 %4709 to i32
  %4711 = icmp eq i32 %4710, 34
  br i1 %4711, label %4716, label %4712

4712:                                             ; preds = %4708
  %4713 = load i8, ptr %299, align 1
  %4714 = sext i8 %4713 to i32
  %4715 = icmp eq i32 %4714, 92
  br i1 %4715, label %4716, label %4717

4716:                                             ; preds = %4712, %4708, %4704, %4697
  store i1 false, ptr %280, align 1
  br label %5080

4717:                                             ; preds = %4712
  br label %4718

4718:                                             ; preds = %4717, %4694
  %4719 = load i64, ptr %282, align 8
  %4720 = icmp ult i64 17, %4719
  br i1 %4720, label %4721, label %4742

4721:                                             ; preds = %4718
  %4722 = load ptr, ptr %281, align 8
  %4723 = getelementptr inbounds i8, ptr %4722, i64 17
  %4724 = load i8, ptr %4723, align 1
  store i8 %4724, ptr %300, align 1
  %4725 = load i8, ptr %300, align 1
  %4726 = sext i8 %4725 to i32
  %4727 = icmp slt i32 %4726, 32
  br i1 %4727, label %4740, label %4728

4728:                                             ; preds = %4721
  %4729 = load i8, ptr %300, align 1
  %4730 = sext i8 %4729 to i32
  %4731 = icmp sgt i32 %4730, 126
  br i1 %4731, label %4740, label %4732

4732:                                             ; preds = %4728
  %4733 = load i8, ptr %300, align 1
  %4734 = sext i8 %4733 to i32
  %4735 = icmp eq i32 %4734, 34
  br i1 %4735, label %4740, label %4736

4736:                                             ; preds = %4732
  %4737 = load i8, ptr %300, align 1
  %4738 = sext i8 %4737 to i32
  %4739 = icmp eq i32 %4738, 92
  br i1 %4739, label %4740, label %4741

4740:                                             ; preds = %4736, %4732, %4728, %4721
  store i1 false, ptr %280, align 1
  br label %5080

4741:                                             ; preds = %4736
  br label %4742

4742:                                             ; preds = %4741, %4718
  %4743 = load i64, ptr %282, align 8
  %4744 = icmp ult i64 18, %4743
  br i1 %4744, label %4745, label %4766

4745:                                             ; preds = %4742
  %4746 = load ptr, ptr %281, align 8
  %4747 = getelementptr inbounds i8, ptr %4746, i64 18
  %4748 = load i8, ptr %4747, align 1
  store i8 %4748, ptr %301, align 1
  %4749 = load i8, ptr %301, align 1
  %4750 = sext i8 %4749 to i32
  %4751 = icmp slt i32 %4750, 32
  br i1 %4751, label %4764, label %4752

4752:                                             ; preds = %4745
  %4753 = load i8, ptr %301, align 1
  %4754 = sext i8 %4753 to i32
  %4755 = icmp sgt i32 %4754, 126
  br i1 %4755, label %4764, label %4756

4756:                                             ; preds = %4752
  %4757 = load i8, ptr %301, align 1
  %4758 = sext i8 %4757 to i32
  %4759 = icmp eq i32 %4758, 34
  br i1 %4759, label %4764, label %4760

4760:                                             ; preds = %4756
  %4761 = load i8, ptr %301, align 1
  %4762 = sext i8 %4761 to i32
  %4763 = icmp eq i32 %4762, 92
  br i1 %4763, label %4764, label %4765

4764:                                             ; preds = %4760, %4756, %4752, %4745
  store i1 false, ptr %280, align 1
  br label %5080

4765:                                             ; preds = %4760
  br label %4766

4766:                                             ; preds = %4765, %4742
  %4767 = load i64, ptr %282, align 8
  %4768 = icmp ult i64 19, %4767
  br i1 %4768, label %4769, label %4790

4769:                                             ; preds = %4766
  %4770 = load ptr, ptr %281, align 8
  %4771 = getelementptr inbounds i8, ptr %4770, i64 19
  %4772 = load i8, ptr %4771, align 1
  store i8 %4772, ptr %302, align 1
  %4773 = load i8, ptr %302, align 1
  %4774 = sext i8 %4773 to i32
  %4775 = icmp slt i32 %4774, 32
  br i1 %4775, label %4788, label %4776

4776:                                             ; preds = %4769
  %4777 = load i8, ptr %302, align 1
  %4778 = sext i8 %4777 to i32
  %4779 = icmp sgt i32 %4778, 126
  br i1 %4779, label %4788, label %4780

4780:                                             ; preds = %4776
  %4781 = load i8, ptr %302, align 1
  %4782 = sext i8 %4781 to i32
  %4783 = icmp eq i32 %4782, 34
  br i1 %4783, label %4788, label %4784

4784:                                             ; preds = %4780
  %4785 = load i8, ptr %302, align 1
  %4786 = sext i8 %4785 to i32
  %4787 = icmp eq i32 %4786, 92
  br i1 %4787, label %4788, label %4789

4788:                                             ; preds = %4784, %4780, %4776, %4769
  store i1 false, ptr %280, align 1
  br label %5080

4789:                                             ; preds = %4784
  br label %4790

4790:                                             ; preds = %4789, %4766
  %4791 = load i64, ptr %282, align 8
  %4792 = icmp ult i64 20, %4791
  br i1 %4792, label %4793, label %4814

4793:                                             ; preds = %4790
  %4794 = load ptr, ptr %281, align 8
  %4795 = getelementptr inbounds i8, ptr %4794, i64 20
  %4796 = load i8, ptr %4795, align 1
  store i8 %4796, ptr %303, align 1
  %4797 = load i8, ptr %303, align 1
  %4798 = sext i8 %4797 to i32
  %4799 = icmp slt i32 %4798, 32
  br i1 %4799, label %4812, label %4800

4800:                                             ; preds = %4793
  %4801 = load i8, ptr %303, align 1
  %4802 = sext i8 %4801 to i32
  %4803 = icmp sgt i32 %4802, 126
  br i1 %4803, label %4812, label %4804

4804:                                             ; preds = %4800
  %4805 = load i8, ptr %303, align 1
  %4806 = sext i8 %4805 to i32
  %4807 = icmp eq i32 %4806, 34
  br i1 %4807, label %4812, label %4808

4808:                                             ; preds = %4804
  %4809 = load i8, ptr %303, align 1
  %4810 = sext i8 %4809 to i32
  %4811 = icmp eq i32 %4810, 92
  br i1 %4811, label %4812, label %4813

4812:                                             ; preds = %4808, %4804, %4800, %4793
  store i1 false, ptr %280, align 1
  br label %5080

4813:                                             ; preds = %4808
  br label %4814

4814:                                             ; preds = %4813, %4790
  %4815 = load i64, ptr %282, align 8
  %4816 = icmp ult i64 21, %4815
  br i1 %4816, label %4817, label %4838

4817:                                             ; preds = %4814
  %4818 = load ptr, ptr %281, align 8
  %4819 = getelementptr inbounds i8, ptr %4818, i64 21
  %4820 = load i8, ptr %4819, align 1
  store i8 %4820, ptr %304, align 1
  %4821 = load i8, ptr %304, align 1
  %4822 = sext i8 %4821 to i32
  %4823 = icmp slt i32 %4822, 32
  br i1 %4823, label %4836, label %4824

4824:                                             ; preds = %4817
  %4825 = load i8, ptr %304, align 1
  %4826 = sext i8 %4825 to i32
  %4827 = icmp sgt i32 %4826, 126
  br i1 %4827, label %4836, label %4828

4828:                                             ; preds = %4824
  %4829 = load i8, ptr %304, align 1
  %4830 = sext i8 %4829 to i32
  %4831 = icmp eq i32 %4830, 34
  br i1 %4831, label %4836, label %4832

4832:                                             ; preds = %4828
  %4833 = load i8, ptr %304, align 1
  %4834 = sext i8 %4833 to i32
  %4835 = icmp eq i32 %4834, 92
  br i1 %4835, label %4836, label %4837

4836:                                             ; preds = %4832, %4828, %4824, %4817
  store i1 false, ptr %280, align 1
  br label %5080

4837:                                             ; preds = %4832
  br label %4838

4838:                                             ; preds = %4837, %4814
  %4839 = load i64, ptr %282, align 8
  %4840 = icmp ult i64 22, %4839
  br i1 %4840, label %4841, label %4862

4841:                                             ; preds = %4838
  %4842 = load ptr, ptr %281, align 8
  %4843 = getelementptr inbounds i8, ptr %4842, i64 22
  %4844 = load i8, ptr %4843, align 1
  store i8 %4844, ptr %305, align 1
  %4845 = load i8, ptr %305, align 1
  %4846 = sext i8 %4845 to i32
  %4847 = icmp slt i32 %4846, 32
  br i1 %4847, label %4860, label %4848

4848:                                             ; preds = %4841
  %4849 = load i8, ptr %305, align 1
  %4850 = sext i8 %4849 to i32
  %4851 = icmp sgt i32 %4850, 126
  br i1 %4851, label %4860, label %4852

4852:                                             ; preds = %4848
  %4853 = load i8, ptr %305, align 1
  %4854 = sext i8 %4853 to i32
  %4855 = icmp eq i32 %4854, 34
  br i1 %4855, label %4860, label %4856

4856:                                             ; preds = %4852
  %4857 = load i8, ptr %305, align 1
  %4858 = sext i8 %4857 to i32
  %4859 = icmp eq i32 %4858, 92
  br i1 %4859, label %4860, label %4861

4860:                                             ; preds = %4856, %4852, %4848, %4841
  store i1 false, ptr %280, align 1
  br label %5080

4861:                                             ; preds = %4856
  br label %4862

4862:                                             ; preds = %4861, %4838
  %4863 = load i64, ptr %282, align 8
  %4864 = icmp ult i64 23, %4863
  br i1 %4864, label %4865, label %4886

4865:                                             ; preds = %4862
  %4866 = load ptr, ptr %281, align 8
  %4867 = getelementptr inbounds i8, ptr %4866, i64 23
  %4868 = load i8, ptr %4867, align 1
  store i8 %4868, ptr %306, align 1
  %4869 = load i8, ptr %306, align 1
  %4870 = sext i8 %4869 to i32
  %4871 = icmp slt i32 %4870, 32
  br i1 %4871, label %4884, label %4872

4872:                                             ; preds = %4865
  %4873 = load i8, ptr %306, align 1
  %4874 = sext i8 %4873 to i32
  %4875 = icmp sgt i32 %4874, 126
  br i1 %4875, label %4884, label %4876

4876:                                             ; preds = %4872
  %4877 = load i8, ptr %306, align 1
  %4878 = sext i8 %4877 to i32
  %4879 = icmp eq i32 %4878, 34
  br i1 %4879, label %4884, label %4880

4880:                                             ; preds = %4876
  %4881 = load i8, ptr %306, align 1
  %4882 = sext i8 %4881 to i32
  %4883 = icmp eq i32 %4882, 92
  br i1 %4883, label %4884, label %4885

4884:                                             ; preds = %4880, %4876, %4872, %4865
  store i1 false, ptr %280, align 1
  br label %5080

4885:                                             ; preds = %4880
  br label %4886

4886:                                             ; preds = %4885, %4862
  %4887 = load i64, ptr %282, align 8
  %4888 = icmp ult i64 24, %4887
  br i1 %4888, label %4889, label %4910

4889:                                             ; preds = %4886
  %4890 = load ptr, ptr %281, align 8
  %4891 = getelementptr inbounds i8, ptr %4890, i64 24
  %4892 = load i8, ptr %4891, align 1
  store i8 %4892, ptr %307, align 1
  %4893 = load i8, ptr %307, align 1
  %4894 = sext i8 %4893 to i32
  %4895 = icmp slt i32 %4894, 32
  br i1 %4895, label %4908, label %4896

4896:                                             ; preds = %4889
  %4897 = load i8, ptr %307, align 1
  %4898 = sext i8 %4897 to i32
  %4899 = icmp sgt i32 %4898, 126
  br i1 %4899, label %4908, label %4900

4900:                                             ; preds = %4896
  %4901 = load i8, ptr %307, align 1
  %4902 = sext i8 %4901 to i32
  %4903 = icmp eq i32 %4902, 34
  br i1 %4903, label %4908, label %4904

4904:                                             ; preds = %4900
  %4905 = load i8, ptr %307, align 1
  %4906 = sext i8 %4905 to i32
  %4907 = icmp eq i32 %4906, 92
  br i1 %4907, label %4908, label %4909

4908:                                             ; preds = %4904, %4900, %4896, %4889
  store i1 false, ptr %280, align 1
  br label %5080

4909:                                             ; preds = %4904
  br label %4910

4910:                                             ; preds = %4909, %4886
  %4911 = load i64, ptr %282, align 8
  %4912 = icmp ult i64 25, %4911
  br i1 %4912, label %4913, label %4934

4913:                                             ; preds = %4910
  %4914 = load ptr, ptr %281, align 8
  %4915 = getelementptr inbounds i8, ptr %4914, i64 25
  %4916 = load i8, ptr %4915, align 1
  store i8 %4916, ptr %308, align 1
  %4917 = load i8, ptr %308, align 1
  %4918 = sext i8 %4917 to i32
  %4919 = icmp slt i32 %4918, 32
  br i1 %4919, label %4932, label %4920

4920:                                             ; preds = %4913
  %4921 = load i8, ptr %308, align 1
  %4922 = sext i8 %4921 to i32
  %4923 = icmp sgt i32 %4922, 126
  br i1 %4923, label %4932, label %4924

4924:                                             ; preds = %4920
  %4925 = load i8, ptr %308, align 1
  %4926 = sext i8 %4925 to i32
  %4927 = icmp eq i32 %4926, 34
  br i1 %4927, label %4932, label %4928

4928:                                             ; preds = %4924
  %4929 = load i8, ptr %308, align 1
  %4930 = sext i8 %4929 to i32
  %4931 = icmp eq i32 %4930, 92
  br i1 %4931, label %4932, label %4933

4932:                                             ; preds = %4928, %4924, %4920, %4913
  store i1 false, ptr %280, align 1
  br label %5080

4933:                                             ; preds = %4928
  br label %4934

4934:                                             ; preds = %4933, %4910
  %4935 = load i64, ptr %282, align 8
  %4936 = icmp ult i64 26, %4935
  br i1 %4936, label %4937, label %4958

4937:                                             ; preds = %4934
  %4938 = load ptr, ptr %281, align 8
  %4939 = getelementptr inbounds i8, ptr %4938, i64 26
  %4940 = load i8, ptr %4939, align 1
  store i8 %4940, ptr %309, align 1
  %4941 = load i8, ptr %309, align 1
  %4942 = sext i8 %4941 to i32
  %4943 = icmp slt i32 %4942, 32
  br i1 %4943, label %4956, label %4944

4944:                                             ; preds = %4937
  %4945 = load i8, ptr %309, align 1
  %4946 = sext i8 %4945 to i32
  %4947 = icmp sgt i32 %4946, 126
  br i1 %4947, label %4956, label %4948

4948:                                             ; preds = %4944
  %4949 = load i8, ptr %309, align 1
  %4950 = sext i8 %4949 to i32
  %4951 = icmp eq i32 %4950, 34
  br i1 %4951, label %4956, label %4952

4952:                                             ; preds = %4948
  %4953 = load i8, ptr %309, align 1
  %4954 = sext i8 %4953 to i32
  %4955 = icmp eq i32 %4954, 92
  br i1 %4955, label %4956, label %4957

4956:                                             ; preds = %4952, %4948, %4944, %4937
  store i1 false, ptr %280, align 1
  br label %5080

4957:                                             ; preds = %4952
  br label %4958

4958:                                             ; preds = %4957, %4934
  %4959 = load i64, ptr %282, align 8
  %4960 = icmp ult i64 27, %4959
  br i1 %4960, label %4961, label %4982

4961:                                             ; preds = %4958
  %4962 = load ptr, ptr %281, align 8
  %4963 = getelementptr inbounds i8, ptr %4962, i64 27
  %4964 = load i8, ptr %4963, align 1
  store i8 %4964, ptr %310, align 1
  %4965 = load i8, ptr %310, align 1
  %4966 = sext i8 %4965 to i32
  %4967 = icmp slt i32 %4966, 32
  br i1 %4967, label %4980, label %4968

4968:                                             ; preds = %4961
  %4969 = load i8, ptr %310, align 1
  %4970 = sext i8 %4969 to i32
  %4971 = icmp sgt i32 %4970, 126
  br i1 %4971, label %4980, label %4972

4972:                                             ; preds = %4968
  %4973 = load i8, ptr %310, align 1
  %4974 = sext i8 %4973 to i32
  %4975 = icmp eq i32 %4974, 34
  br i1 %4975, label %4980, label %4976

4976:                                             ; preds = %4972
  %4977 = load i8, ptr %310, align 1
  %4978 = sext i8 %4977 to i32
  %4979 = icmp eq i32 %4978, 92
  br i1 %4979, label %4980, label %4981

4980:                                             ; preds = %4976, %4972, %4968, %4961
  store i1 false, ptr %280, align 1
  br label %5080

4981:                                             ; preds = %4976
  br label %4982

4982:                                             ; preds = %4981, %4958
  %4983 = load i64, ptr %282, align 8
  %4984 = icmp ult i64 28, %4983
  br i1 %4984, label %4985, label %5006

4985:                                             ; preds = %4982
  %4986 = load ptr, ptr %281, align 8
  %4987 = getelementptr inbounds i8, ptr %4986, i64 28
  %4988 = load i8, ptr %4987, align 1
  store i8 %4988, ptr %311, align 1
  %4989 = load i8, ptr %311, align 1
  %4990 = sext i8 %4989 to i32
  %4991 = icmp slt i32 %4990, 32
  br i1 %4991, label %5004, label %4992

4992:                                             ; preds = %4985
  %4993 = load i8, ptr %311, align 1
  %4994 = sext i8 %4993 to i32
  %4995 = icmp sgt i32 %4994, 126
  br i1 %4995, label %5004, label %4996

4996:                                             ; preds = %4992
  %4997 = load i8, ptr %311, align 1
  %4998 = sext i8 %4997 to i32
  %4999 = icmp eq i32 %4998, 34
  br i1 %4999, label %5004, label %5000

5000:                                             ; preds = %4996
  %5001 = load i8, ptr %311, align 1
  %5002 = sext i8 %5001 to i32
  %5003 = icmp eq i32 %5002, 92
  br i1 %5003, label %5004, label %5005

5004:                                             ; preds = %5000, %4996, %4992, %4985
  store i1 false, ptr %280, align 1
  br label %5080

5005:                                             ; preds = %5000
  br label %5006

5006:                                             ; preds = %5005, %4982
  %5007 = load i64, ptr %282, align 8
  %5008 = icmp ult i64 29, %5007
  br i1 %5008, label %5009, label %5030

5009:                                             ; preds = %5006
  %5010 = load ptr, ptr %281, align 8
  %5011 = getelementptr inbounds i8, ptr %5010, i64 29
  %5012 = load i8, ptr %5011, align 1
  store i8 %5012, ptr %312, align 1
  %5013 = load i8, ptr %312, align 1
  %5014 = sext i8 %5013 to i32
  %5015 = icmp slt i32 %5014, 32
  br i1 %5015, label %5028, label %5016

5016:                                             ; preds = %5009
  %5017 = load i8, ptr %312, align 1
  %5018 = sext i8 %5017 to i32
  %5019 = icmp sgt i32 %5018, 126
  br i1 %5019, label %5028, label %5020

5020:                                             ; preds = %5016
  %5021 = load i8, ptr %312, align 1
  %5022 = sext i8 %5021 to i32
  %5023 = icmp eq i32 %5022, 34
  br i1 %5023, label %5028, label %5024

5024:                                             ; preds = %5020
  %5025 = load i8, ptr %312, align 1
  %5026 = sext i8 %5025 to i32
  %5027 = icmp eq i32 %5026, 92
  br i1 %5027, label %5028, label %5029

5028:                                             ; preds = %5024, %5020, %5016, %5009
  store i1 false, ptr %280, align 1
  br label %5080

5029:                                             ; preds = %5024
  br label %5030

5030:                                             ; preds = %5029, %5006
  %5031 = load i64, ptr %282, align 8
  %5032 = icmp ult i64 30, %5031
  br i1 %5032, label %5033, label %5054

5033:                                             ; preds = %5030
  %5034 = load ptr, ptr %281, align 8
  %5035 = getelementptr inbounds i8, ptr %5034, i64 30
  %5036 = load i8, ptr %5035, align 1
  store i8 %5036, ptr %313, align 1
  %5037 = load i8, ptr %313, align 1
  %5038 = sext i8 %5037 to i32
  %5039 = icmp slt i32 %5038, 32
  br i1 %5039, label %5052, label %5040

5040:                                             ; preds = %5033
  %5041 = load i8, ptr %313, align 1
  %5042 = sext i8 %5041 to i32
  %5043 = icmp sgt i32 %5042, 126
  br i1 %5043, label %5052, label %5044

5044:                                             ; preds = %5040
  %5045 = load i8, ptr %313, align 1
  %5046 = sext i8 %5045 to i32
  %5047 = icmp eq i32 %5046, 34
  br i1 %5047, label %5052, label %5048

5048:                                             ; preds = %5044
  %5049 = load i8, ptr %313, align 1
  %5050 = sext i8 %5049 to i32
  %5051 = icmp eq i32 %5050, 92
  br i1 %5051, label %5052, label %5053

5052:                                             ; preds = %5048, %5044, %5040, %5033
  store i1 false, ptr %280, align 1
  br label %5080

5053:                                             ; preds = %5048
  br label %5054

5054:                                             ; preds = %5053, %5030
  %5055 = load i64, ptr %282, align 8
  %5056 = icmp ult i64 31, %5055
  br i1 %5056, label %5057, label %5078

5057:                                             ; preds = %5054
  %5058 = load ptr, ptr %281, align 8
  %5059 = getelementptr inbounds i8, ptr %5058, i64 31
  %5060 = load i8, ptr %5059, align 1
  store i8 %5060, ptr %314, align 1
  %5061 = load i8, ptr %314, align 1
  %5062 = sext i8 %5061 to i32
  %5063 = icmp slt i32 %5062, 32
  br i1 %5063, label %5076, label %5064

5064:                                             ; preds = %5057
  %5065 = load i8, ptr %314, align 1
  %5066 = sext i8 %5065 to i32
  %5067 = icmp sgt i32 %5066, 126
  br i1 %5067, label %5076, label %5068

5068:                                             ; preds = %5064
  %5069 = load i8, ptr %314, align 1
  %5070 = sext i8 %5069 to i32
  %5071 = icmp eq i32 %5070, 34
  br i1 %5071, label %5076, label %5072

5072:                                             ; preds = %5068
  %5073 = load i8, ptr %314, align 1
  %5074 = sext i8 %5073 to i32
  %5075 = icmp eq i32 %5074, 92
  br i1 %5075, label %5076, label %5077

5076:                                             ; preds = %5072, %5068, %5064, %5057
  store i1 false, ptr %280, align 1
  br label %5080

5077:                                             ; preds = %5072
  br label %5078

5078:                                             ; preds = %5077, %5054
  store i1 true, ptr %280, align 1
  br label %5080

5079:                                             ; preds = %4308, %4299
  store i1 false, ptr %280, align 1
  br label %5080

5080:                                             ; preds = %4332, %4356, %4380, %4404, %4428, %4452, %4476, %4500, %4524, %4548, %4572, %4596, %4620, %4644, %4668, %4692, %4716, %4740, %4764, %4788, %4812, %4836, %4860, %4884, %4908, %4932, %4956, %4980, %5004, %5028, %5052, %5076, %5078, %5079
  %5081 = load i1, ptr %280, align 1
  %5082 = zext i1 %5081 to i8
  store i8 %5082, ptr %518, align 1
  %5083 = load i8, ptr %518, align 1
  %5084 = trunc i8 %5083 to i1
  %5085 = zext i1 %5084 to i64
  %5086 = select i1 %5084, i32 8, i32 0
  %5087 = trunc i32 %5086 to i8
  store i8 %5087, ptr %519, align 1
  %5088 = load ptr, ptr %515, align 8
  %5089 = load i8, ptr %519, align 1
  %5090 = load i64, ptr %517, align 8
  store ptr %5088, ptr %110, align 8
  store i8 5, ptr %111, align 1
  store i8 %5089, ptr %112, align 1
  store i64 %5090, ptr %113, align 8
  %5091 = load i64, ptr %113, align 8
  %5092 = shl i64 %5091, 8
  store i64 %5092, ptr %114, align 8
  %5093 = load i8, ptr %111, align 1
  %5094 = zext i8 %5093 to i32
  %5095 = load i8, ptr %112, align 1
  %5096 = zext i8 %5095 to i32
  %5097 = or i32 %5094, %5096
  %5098 = sext i32 %5097 to i64
  %5099 = load i64, ptr %114, align 8
  %5100 = or i64 %5099, %5098
  store i64 %5100, ptr %114, align 8
  %5101 = load i64, ptr %114, align 8
  %5102 = load ptr, ptr %110, align 8
  store i64 %5101, ptr %5102, align 8
  %5103 = load ptr, ptr %516, align 8
  %5104 = load ptr, ptr %515, align 8
  %5105 = getelementptr inbounds nuw %struct.yyjson_val, ptr %5104, i32 0, i32 1
  store ptr %5103, ptr %5105, align 8
  %5106 = load ptr, ptr %865, align 8
  store ptr %5106, ptr %862, align 8
  br label %5109

5107:                                             ; preds = %4292
  br label %5108

5108:                                             ; preds = %5107, %4248
  store ptr null, ptr %862, align 8
  br label %5109

5109:                                             ; preds = %5080, %5108
  %5110 = load ptr, ptr %862, align 8
  %5111 = load ptr, ptr %938, align 8
  %5112 = load ptr, ptr %942, align 8
  %5113 = getelementptr inbounds nuw %struct.Coord, ptr %5112, i32 0, i32 2
  %5114 = load double, ptr %5113, align 8
  store ptr %5111, ptr %847, align 8
  store double %5114, ptr %848, align 8
  %5115 = load ptr, ptr %847, align 8
  %5116 = icmp ne ptr %5115, null
  %5117 = xor i1 %5116, true
  %5118 = zext i1 %5116 to i32
  %5119 = sext i32 %5118 to i64
  br i1 %5116, label %5120, label %5187

5120:                                             ; preds = %5109
  %5121 = load ptr, ptr %847, align 8
  store ptr %5121, ptr %776, align 8
  store i64 1, ptr %777, align 8
  %5122 = load ptr, ptr %776, align 8
  %5123 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %5122, i32 0, i32 1
  store ptr %5123, ptr %779, align 8
  %5124 = load ptr, ptr %776, align 8
  %5125 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %5124, i32 0, i32 3
  store ptr %5125, ptr %780, align 8
  %5126 = load ptr, ptr %780, align 8
  %5127 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %5126, i32 0, i32 1
  %5128 = load ptr, ptr %5127, align 8
  %5129 = load ptr, ptr %780, align 8
  %5130 = load ptr, ptr %5129, align 8
  %5131 = ptrtoint ptr %5128 to i64
  %5132 = ptrtoint ptr %5130 to i64
  %5133 = sub i64 %5131, %5132
  %5134 = sdiv exact i64 %5133, 24
  %5135 = load i64, ptr %777, align 8
  %5136 = icmp ult i64 %5134, %5135
  %5137 = xor i1 %5136, true
  %5138 = zext i1 %5136 to i32
  %5139 = sext i32 %5138 to i64
  br i1 %5136, label %5140, label %5151

5140:                                             ; preds = %5120
  %5141 = load ptr, ptr %780, align 8
  %5142 = load ptr, ptr %779, align 8
  %5143 = load i64, ptr %777, align 8
  %5144 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %5141, ptr noundef %5142, i64 noundef %5143)
  %5145 = xor i1 %5144, true
  %5146 = xor i1 %5144, true
  %5147 = zext i1 %5146 to i32
  %5148 = sext i32 %5147 to i64
  br i1 %5146, label %5149, label %5150

5149:                                             ; preds = %5140
  store ptr null, ptr %775, align 8
  br label %5159

5150:                                             ; preds = %5140
  br label %5151

5151:                                             ; preds = %5150, %5120
  %5152 = load ptr, ptr %780, align 8
  %5153 = load ptr, ptr %5152, align 8
  store ptr %5153, ptr %778, align 8
  %5154 = load i64, ptr %777, align 8
  %5155 = load ptr, ptr %780, align 8
  %5156 = load ptr, ptr %5155, align 8
  %5157 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5156, i64 %5154
  store ptr %5157, ptr %5155, align 8
  %5158 = load ptr, ptr %778, align 8
  store ptr %5158, ptr %775, align 8
  br label %5159

5159:                                             ; preds = %5149, %5151
  %5160 = load ptr, ptr %775, align 8
  store ptr %5160, ptr %849, align 8
  %5161 = load ptr, ptr %849, align 8
  %5162 = icmp ne ptr %5161, null
  %5163 = xor i1 %5162, true
  %5164 = zext i1 %5162 to i32
  %5165 = sext i32 %5164 to i64
  br i1 %5162, label %5166, label %5186

5166:                                             ; preds = %5159
  %5167 = load ptr, ptr %849, align 8
  %5168 = load double, ptr %848, align 8
  store ptr %5167, ptr %74, align 8
  store double %5168, ptr %75, align 8
  %5169 = load ptr, ptr %74, align 8
  store ptr %5169, ptr %69, align 8
  store i8 4, ptr %70, align 1
  store i8 16, ptr %71, align 1
  store i64 0, ptr %72, align 8
  %5170 = load i64, ptr %72, align 8
  %5171 = shl i64 %5170, 8
  store i64 %5171, ptr %73, align 8
  %5172 = load i8, ptr %70, align 1
  %5173 = zext i8 %5172 to i32
  %5174 = load i8, ptr %71, align 1
  %5175 = zext i8 %5174 to i32
  %5176 = or i32 %5173, %5175
  %5177 = sext i32 %5176 to i64
  %5178 = load i64, ptr %73, align 8
  %5179 = or i64 %5178, %5177
  store i64 %5179, ptr %73, align 8
  %5180 = load i64, ptr %73, align 8
  %5181 = load ptr, ptr %69, align 8
  store i64 %5180, ptr %5181, align 8
  %5182 = load double, ptr %75, align 8
  %5183 = load ptr, ptr %74, align 8
  %5184 = getelementptr inbounds nuw %struct.yyjson_val, ptr %5183, i32 0, i32 1
  store double %5182, ptr %5184, align 8
  %5185 = load ptr, ptr %849, align 8
  store ptr %5185, ptr %846, align 8
  br label %5188

5186:                                             ; preds = %5159
  br label %5187

5187:                                             ; preds = %5186, %5109
  store ptr null, ptr %846, align 8
  br label %5188

5188:                                             ; preds = %5166, %5187
  %5189 = load ptr, ptr %846, align 8
  store ptr %4241, ptr %899, align 8
  store ptr %5110, ptr %900, align 8
  store ptr %5189, ptr %901, align 8
  %5190 = load ptr, ptr %899, align 8
  store ptr %5190, ptr %687, align 8
  %5191 = load ptr, ptr %687, align 8
  %5192 = icmp ne ptr %5191, null
  br i1 %5192, label %5193, label %5206

5193:                                             ; preds = %5188
  %5194 = load ptr, ptr %687, align 8
  store ptr %5194, ptr %611, align 8
  %5195 = load ptr, ptr %611, align 8
  store ptr %5195, ptr %600, align 8
  %5196 = load ptr, ptr %600, align 8
  %5197 = load i64, ptr %5196, align 8
  %5198 = trunc i64 %5197 to i8
  store i8 %5198, ptr %601, align 1
  %5199 = load i8, ptr %601, align 1
  %5200 = zext i8 %5199 to i32
  %5201 = and i32 %5200, 7
  %5202 = trunc i32 %5201 to i8
  %5203 = zext i8 %5202 to i32
  %5204 = icmp eq i32 %5203, 7
  %5205 = zext i1 %5204 to i32
  br label %5207

5206:                                             ; preds = %5188
  br label %5207

5207:                                             ; preds = %5193, %5206
  %5208 = phi i32 [ %5205, %5193 ], [ 0, %5206 ]
  %5209 = icmp ne i32 %5208, 0
  br i1 %5209, label %5210, label %5234

5210:                                             ; preds = %5207
  %5211 = load ptr, ptr %900, align 8
  store ptr %5211, ptr %679, align 8
  %5212 = load ptr, ptr %679, align 8
  %5213 = icmp ne ptr %5212, null
  br i1 %5213, label %5214, label %5227

5214:                                             ; preds = %5210
  %5215 = load ptr, ptr %679, align 8
  store ptr %5215, ptr %579, align 8
  %5216 = load ptr, ptr %579, align 8
  store ptr %5216, ptr %577, align 8
  %5217 = load ptr, ptr %577, align 8
  %5218 = load i64, ptr %5217, align 8
  %5219 = trunc i64 %5218 to i8
  store i8 %5219, ptr %578, align 1
  %5220 = load i8, ptr %578, align 1
  %5221 = zext i8 %5220 to i32
  %5222 = and i32 %5221, 7
  %5223 = trunc i32 %5222 to i8
  %5224 = zext i8 %5223 to i32
  %5225 = icmp eq i32 %5224, 5
  %5226 = zext i1 %5225 to i32
  br label %5228

5227:                                             ; preds = %5210
  br label %5228

5228:                                             ; preds = %5214, %5227
  %5229 = phi i32 [ %5226, %5214 ], [ 0, %5227 ]
  %5230 = icmp ne i32 %5229, 0
  br i1 %5230, label %5231, label %5234

5231:                                             ; preds = %5228
  %5232 = load ptr, ptr %901, align 8
  %5233 = icmp ne ptr %5232, null
  br label %5234

5234:                                             ; preds = %5231, %5228, %5207
  %5235 = phi i1 [ false, %5228 ], [ false, %5207 ], [ %5233, %5231 ]
  %5236 = xor i1 %5235, true
  %5237 = zext i1 %5235 to i32
  %5238 = sext i32 %5237 to i64
  br i1 %5235, label %5239, label %5290

5239:                                             ; preds = %5234
  %5240 = load ptr, ptr %899, align 8
  %5241 = load ptr, ptr %900, align 8
  %5242 = load ptr, ptr %901, align 8
  %5243 = load ptr, ptr %899, align 8
  store ptr %5243, ptr %620, align 8
  %5244 = load ptr, ptr %620, align 8
  %5245 = load i64, ptr %5244, align 8
  %5246 = lshr i64 %5245, 8
  store ptr %5240, ptr %651, align 8
  store ptr %5241, ptr %652, align 8
  store ptr %5242, ptr %653, align 8
  store i64 %5246, ptr %654, align 8
  %5247 = load i64, ptr %654, align 8
  %5248 = icmp ne i64 %5247, 0
  %5249 = xor i1 %5248, true
  %5250 = zext i1 %5248 to i32
  %5251 = sext i32 %5250 to i64
  br i1 %5248, label %5252, label %5267

5252:                                             ; preds = %5239
  %5253 = load ptr, ptr %651, align 8
  %5254 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5253, i32 0, i32 1
  %5255 = load ptr, ptr %5254, align 8
  %5256 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5255, i32 0, i32 2
  %5257 = load ptr, ptr %5256, align 8
  store ptr %5257, ptr %655, align 8
  %5258 = load ptr, ptr %655, align 8
  %5259 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5258, i32 0, i32 2
  %5260 = load ptr, ptr %5259, align 8
  store ptr %5260, ptr %656, align 8
  %5261 = load ptr, ptr %652, align 8
  %5262 = load ptr, ptr %655, align 8
  %5263 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5262, i32 0, i32 2
  store ptr %5261, ptr %5263, align 8
  %5264 = load ptr, ptr %656, align 8
  %5265 = load ptr, ptr %653, align 8
  %5266 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5265, i32 0, i32 2
  store ptr %5264, ptr %5266, align 8
  br label %5271

5267:                                             ; preds = %5239
  %5268 = load ptr, ptr %652, align 8
  %5269 = load ptr, ptr %653, align 8
  %5270 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5269, i32 0, i32 2
  store ptr %5268, ptr %5270, align 8
  br label %5271

5271:                                             ; preds = %5252, %5267
  %5272 = load ptr, ptr %653, align 8
  %5273 = load ptr, ptr %652, align 8
  %5274 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5273, i32 0, i32 2
  store ptr %5272, ptr %5274, align 8
  %5275 = load ptr, ptr %652, align 8
  %5276 = load ptr, ptr %651, align 8
  %5277 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5276, i32 0, i32 1
  store ptr %5275, ptr %5277, align 8
  %5278 = load ptr, ptr %651, align 8
  %5279 = load i64, ptr %654, align 8
  %5280 = add i64 %5279, 1
  store ptr %5278, ptr %553, align 8
  store i64 %5280, ptr %554, align 8
  %5281 = load ptr, ptr %553, align 8
  %5282 = load i64, ptr %5281, align 8
  %5283 = and i64 %5282, 255
  store i64 %5283, ptr %555, align 8
  %5284 = load i64, ptr %554, align 8
  %5285 = shl i64 %5284, 8
  %5286 = load i64, ptr %555, align 8
  %5287 = or i64 %5286, %5285
  store i64 %5287, ptr %555, align 8
  %5288 = load i64, ptr %555, align 8
  %5289 = load ptr, ptr %553, align 8
  store i64 %5288, ptr %5289, align 8
  store i1 true, ptr %898, align 1
  br label %5291

5290:                                             ; preds = %5234
  store i1 false, ptr %898, align 1
  br label %5291

5291:                                             ; preds = %5271, %5290
  %5292 = load i1, ptr %898, align 1
  %5293 = load ptr, ptr %943, align 8
  %5294 = load ptr, ptr %938, align 8
  store ptr %5294, ptr %867, align 8
  store ptr @.str.5, ptr %868, align 8
  %5295 = load ptr, ptr %867, align 8
  %5296 = icmp ne ptr %5295, null
  br i1 %5296, label %5297, label %5300

5297:                                             ; preds = %5291
  %5298 = load ptr, ptr %868, align 8
  %5299 = icmp ne ptr %5298, null
  br label %5300

5300:                                             ; preds = %5297, %5291
  %5301 = phi i1 [ false, %5291 ], [ %5299, %5297 ]
  %5302 = xor i1 %5301, true
  %5303 = zext i1 %5301 to i32
  %5304 = sext i32 %5303 to i64
  br i1 %5301, label %5305, label %6160

5305:                                             ; preds = %5300
  %5306 = load ptr, ptr %867, align 8
  store ptr %5306, ptr %746, align 8
  store i64 1, ptr %747, align 8
  %5307 = load ptr, ptr %746, align 8
  %5308 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %5307, i32 0, i32 1
  store ptr %5308, ptr %749, align 8
  %5309 = load ptr, ptr %746, align 8
  %5310 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %5309, i32 0, i32 3
  store ptr %5310, ptr %750, align 8
  %5311 = load ptr, ptr %750, align 8
  %5312 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %5311, i32 0, i32 1
  %5313 = load ptr, ptr %5312, align 8
  %5314 = load ptr, ptr %750, align 8
  %5315 = load ptr, ptr %5314, align 8
  %5316 = ptrtoint ptr %5313 to i64
  %5317 = ptrtoint ptr %5315 to i64
  %5318 = sub i64 %5316, %5317
  %5319 = sdiv exact i64 %5318, 24
  %5320 = load i64, ptr %747, align 8
  %5321 = icmp ult i64 %5319, %5320
  %5322 = xor i1 %5321, true
  %5323 = zext i1 %5321 to i32
  %5324 = sext i32 %5323 to i64
  br i1 %5321, label %5325, label %5336

5325:                                             ; preds = %5305
  %5326 = load ptr, ptr %750, align 8
  %5327 = load ptr, ptr %749, align 8
  %5328 = load i64, ptr %747, align 8
  %5329 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %5326, ptr noundef %5327, i64 noundef %5328)
  %5330 = xor i1 %5329, true
  %5331 = xor i1 %5329, true
  %5332 = zext i1 %5331 to i32
  %5333 = sext i32 %5332 to i64
  br i1 %5331, label %5334, label %5335

5334:                                             ; preds = %5325
  store ptr null, ptr %745, align 8
  br label %5344

5335:                                             ; preds = %5325
  br label %5336

5336:                                             ; preds = %5335, %5305
  %5337 = load ptr, ptr %750, align 8
  %5338 = load ptr, ptr %5337, align 8
  store ptr %5338, ptr %748, align 8
  %5339 = load i64, ptr %747, align 8
  %5340 = load ptr, ptr %750, align 8
  %5341 = load ptr, ptr %5340, align 8
  %5342 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %5341, i64 %5339
  store ptr %5342, ptr %5340, align 8
  %5343 = load ptr, ptr %748, align 8
  store ptr %5343, ptr %745, align 8
  br label %5344

5344:                                             ; preds = %5334, %5336
  %5345 = load ptr, ptr %745, align 8
  store ptr %5345, ptr %869, align 8
  %5346 = load ptr, ptr %869, align 8
  %5347 = icmp ne ptr %5346, null
  %5348 = xor i1 %5347, true
  %5349 = zext i1 %5347 to i32
  %5350 = sext i32 %5349 to i64
  br i1 %5347, label %5351, label %6159

5351:                                             ; preds = %5344
  %5352 = load ptr, ptr %869, align 8
  %5353 = load ptr, ptr %868, align 8
  store ptr %5352, ptr %510, align 8
  store ptr %5353, ptr %511, align 8
  %5354 = load ptr, ptr %511, align 8
  %5355 = call i64 @strlen(ptr noundef %5354)
  store i64 %5355, ptr %512, align 8
  %5356 = load ptr, ptr %511, align 8
  %5357 = load i64, ptr %512, align 8
  store ptr %5356, ptr %316, align 8
  store i64 %5357, ptr %317, align 8
  %5358 = load i64, ptr %317, align 8
  %5359 = call i1 @llvm.is.constant.i64(i64 %5358)
  br i1 %5359, label %5360, label %6131

5360:                                             ; preds = %5351
  %5361 = load i64, ptr %317, align 8
  %5362 = icmp ule i64 %5361, 32
  br i1 %5362, label %5363, label %6131

5363:                                             ; preds = %5360
  %5364 = load i64, ptr %317, align 8
  %5365 = icmp ult i64 0, %5364
  br i1 %5365, label %5366, label %5386

5366:                                             ; preds = %5363
  %5367 = load ptr, ptr %316, align 8
  %5368 = load i8, ptr %5367, align 1
  store i8 %5368, ptr %318, align 1
  %5369 = load i8, ptr %318, align 1
  %5370 = sext i8 %5369 to i32
  %5371 = icmp slt i32 %5370, 32
  br i1 %5371, label %5384, label %5372

5372:                                             ; preds = %5366
  %5373 = load i8, ptr %318, align 1
  %5374 = sext i8 %5373 to i32
  %5375 = icmp sgt i32 %5374, 126
  br i1 %5375, label %5384, label %5376

5376:                                             ; preds = %5372
  %5377 = load i8, ptr %318, align 1
  %5378 = sext i8 %5377 to i32
  %5379 = icmp eq i32 %5378, 34
  br i1 %5379, label %5384, label %5380

5380:                                             ; preds = %5376
  %5381 = load i8, ptr %318, align 1
  %5382 = sext i8 %5381 to i32
  %5383 = icmp eq i32 %5382, 92
  br i1 %5383, label %5384, label %5385

5384:                                             ; preds = %5380, %5376, %5372, %5366
  store i1 false, ptr %315, align 1
  br label %6132

5385:                                             ; preds = %5380
  br label %5386

5386:                                             ; preds = %5385, %5363
  %5387 = load i64, ptr %317, align 8
  %5388 = icmp ult i64 1, %5387
  br i1 %5388, label %5389, label %5410

5389:                                             ; preds = %5386
  %5390 = load ptr, ptr %316, align 8
  %5391 = getelementptr inbounds i8, ptr %5390, i64 1
  %5392 = load i8, ptr %5391, align 1
  store i8 %5392, ptr %319, align 1
  %5393 = load i8, ptr %319, align 1
  %5394 = sext i8 %5393 to i32
  %5395 = icmp slt i32 %5394, 32
  br i1 %5395, label %5408, label %5396

5396:                                             ; preds = %5389
  %5397 = load i8, ptr %319, align 1
  %5398 = sext i8 %5397 to i32
  %5399 = icmp sgt i32 %5398, 126
  br i1 %5399, label %5408, label %5400

5400:                                             ; preds = %5396
  %5401 = load i8, ptr %319, align 1
  %5402 = sext i8 %5401 to i32
  %5403 = icmp eq i32 %5402, 34
  br i1 %5403, label %5408, label %5404

5404:                                             ; preds = %5400
  %5405 = load i8, ptr %319, align 1
  %5406 = sext i8 %5405 to i32
  %5407 = icmp eq i32 %5406, 92
  br i1 %5407, label %5408, label %5409

5408:                                             ; preds = %5404, %5400, %5396, %5389
  store i1 false, ptr %315, align 1
  br label %6132

5409:                                             ; preds = %5404
  br label %5410

5410:                                             ; preds = %5409, %5386
  %5411 = load i64, ptr %317, align 8
  %5412 = icmp ult i64 2, %5411
  br i1 %5412, label %5413, label %5434

5413:                                             ; preds = %5410
  %5414 = load ptr, ptr %316, align 8
  %5415 = getelementptr inbounds i8, ptr %5414, i64 2
  %5416 = load i8, ptr %5415, align 1
  store i8 %5416, ptr %320, align 1
  %5417 = load i8, ptr %320, align 1
  %5418 = sext i8 %5417 to i32
  %5419 = icmp slt i32 %5418, 32
  br i1 %5419, label %5432, label %5420

5420:                                             ; preds = %5413
  %5421 = load i8, ptr %320, align 1
  %5422 = sext i8 %5421 to i32
  %5423 = icmp sgt i32 %5422, 126
  br i1 %5423, label %5432, label %5424

5424:                                             ; preds = %5420
  %5425 = load i8, ptr %320, align 1
  %5426 = sext i8 %5425 to i32
  %5427 = icmp eq i32 %5426, 34
  br i1 %5427, label %5432, label %5428

5428:                                             ; preds = %5424
  %5429 = load i8, ptr %320, align 1
  %5430 = sext i8 %5429 to i32
  %5431 = icmp eq i32 %5430, 92
  br i1 %5431, label %5432, label %5433

5432:                                             ; preds = %5428, %5424, %5420, %5413
  store i1 false, ptr %315, align 1
  br label %6132

5433:                                             ; preds = %5428
  br label %5434

5434:                                             ; preds = %5433, %5410
  %5435 = load i64, ptr %317, align 8
  %5436 = icmp ult i64 3, %5435
  br i1 %5436, label %5437, label %5458

5437:                                             ; preds = %5434
  %5438 = load ptr, ptr %316, align 8
  %5439 = getelementptr inbounds i8, ptr %5438, i64 3
  %5440 = load i8, ptr %5439, align 1
  store i8 %5440, ptr %321, align 1
  %5441 = load i8, ptr %321, align 1
  %5442 = sext i8 %5441 to i32
  %5443 = icmp slt i32 %5442, 32
  br i1 %5443, label %5456, label %5444

5444:                                             ; preds = %5437
  %5445 = load i8, ptr %321, align 1
  %5446 = sext i8 %5445 to i32
  %5447 = icmp sgt i32 %5446, 126
  br i1 %5447, label %5456, label %5448

5448:                                             ; preds = %5444
  %5449 = load i8, ptr %321, align 1
  %5450 = sext i8 %5449 to i32
  %5451 = icmp eq i32 %5450, 34
  br i1 %5451, label %5456, label %5452

5452:                                             ; preds = %5448
  %5453 = load i8, ptr %321, align 1
  %5454 = sext i8 %5453 to i32
  %5455 = icmp eq i32 %5454, 92
  br i1 %5455, label %5456, label %5457

5456:                                             ; preds = %5452, %5448, %5444, %5437
  store i1 false, ptr %315, align 1
  br label %6132

5457:                                             ; preds = %5452
  br label %5458

5458:                                             ; preds = %5457, %5434
  %5459 = load i64, ptr %317, align 8
  %5460 = icmp ult i64 4, %5459
  br i1 %5460, label %5461, label %5482

5461:                                             ; preds = %5458
  %5462 = load ptr, ptr %316, align 8
  %5463 = getelementptr inbounds i8, ptr %5462, i64 4
  %5464 = load i8, ptr %5463, align 1
  store i8 %5464, ptr %322, align 1
  %5465 = load i8, ptr %322, align 1
  %5466 = sext i8 %5465 to i32
  %5467 = icmp slt i32 %5466, 32
  br i1 %5467, label %5480, label %5468

5468:                                             ; preds = %5461
  %5469 = load i8, ptr %322, align 1
  %5470 = sext i8 %5469 to i32
  %5471 = icmp sgt i32 %5470, 126
  br i1 %5471, label %5480, label %5472

5472:                                             ; preds = %5468
  %5473 = load i8, ptr %322, align 1
  %5474 = sext i8 %5473 to i32
  %5475 = icmp eq i32 %5474, 34
  br i1 %5475, label %5480, label %5476

5476:                                             ; preds = %5472
  %5477 = load i8, ptr %322, align 1
  %5478 = sext i8 %5477 to i32
  %5479 = icmp eq i32 %5478, 92
  br i1 %5479, label %5480, label %5481

5480:                                             ; preds = %5476, %5472, %5468, %5461
  store i1 false, ptr %315, align 1
  br label %6132

5481:                                             ; preds = %5476
  br label %5482

5482:                                             ; preds = %5481, %5458
  %5483 = load i64, ptr %317, align 8
  %5484 = icmp ult i64 5, %5483
  br i1 %5484, label %5485, label %5506

5485:                                             ; preds = %5482
  %5486 = load ptr, ptr %316, align 8
  %5487 = getelementptr inbounds i8, ptr %5486, i64 5
  %5488 = load i8, ptr %5487, align 1
  store i8 %5488, ptr %323, align 1
  %5489 = load i8, ptr %323, align 1
  %5490 = sext i8 %5489 to i32
  %5491 = icmp slt i32 %5490, 32
  br i1 %5491, label %5504, label %5492

5492:                                             ; preds = %5485
  %5493 = load i8, ptr %323, align 1
  %5494 = sext i8 %5493 to i32
  %5495 = icmp sgt i32 %5494, 126
  br i1 %5495, label %5504, label %5496

5496:                                             ; preds = %5492
  %5497 = load i8, ptr %323, align 1
  %5498 = sext i8 %5497 to i32
  %5499 = icmp eq i32 %5498, 34
  br i1 %5499, label %5504, label %5500

5500:                                             ; preds = %5496
  %5501 = load i8, ptr %323, align 1
  %5502 = sext i8 %5501 to i32
  %5503 = icmp eq i32 %5502, 92
  br i1 %5503, label %5504, label %5505

5504:                                             ; preds = %5500, %5496, %5492, %5485
  store i1 false, ptr %315, align 1
  br label %6132

5505:                                             ; preds = %5500
  br label %5506

5506:                                             ; preds = %5505, %5482
  %5507 = load i64, ptr %317, align 8
  %5508 = icmp ult i64 6, %5507
  br i1 %5508, label %5509, label %5530

5509:                                             ; preds = %5506
  %5510 = load ptr, ptr %316, align 8
  %5511 = getelementptr inbounds i8, ptr %5510, i64 6
  %5512 = load i8, ptr %5511, align 1
  store i8 %5512, ptr %324, align 1
  %5513 = load i8, ptr %324, align 1
  %5514 = sext i8 %5513 to i32
  %5515 = icmp slt i32 %5514, 32
  br i1 %5515, label %5528, label %5516

5516:                                             ; preds = %5509
  %5517 = load i8, ptr %324, align 1
  %5518 = sext i8 %5517 to i32
  %5519 = icmp sgt i32 %5518, 126
  br i1 %5519, label %5528, label %5520

5520:                                             ; preds = %5516
  %5521 = load i8, ptr %324, align 1
  %5522 = sext i8 %5521 to i32
  %5523 = icmp eq i32 %5522, 34
  br i1 %5523, label %5528, label %5524

5524:                                             ; preds = %5520
  %5525 = load i8, ptr %324, align 1
  %5526 = sext i8 %5525 to i32
  %5527 = icmp eq i32 %5526, 92
  br i1 %5527, label %5528, label %5529

5528:                                             ; preds = %5524, %5520, %5516, %5509
  store i1 false, ptr %315, align 1
  br label %6132

5529:                                             ; preds = %5524
  br label %5530

5530:                                             ; preds = %5529, %5506
  %5531 = load i64, ptr %317, align 8
  %5532 = icmp ult i64 7, %5531
  br i1 %5532, label %5533, label %5554

5533:                                             ; preds = %5530
  %5534 = load ptr, ptr %316, align 8
  %5535 = getelementptr inbounds i8, ptr %5534, i64 7
  %5536 = load i8, ptr %5535, align 1
  store i8 %5536, ptr %325, align 1
  %5537 = load i8, ptr %325, align 1
  %5538 = sext i8 %5537 to i32
  %5539 = icmp slt i32 %5538, 32
  br i1 %5539, label %5552, label %5540

5540:                                             ; preds = %5533
  %5541 = load i8, ptr %325, align 1
  %5542 = sext i8 %5541 to i32
  %5543 = icmp sgt i32 %5542, 126
  br i1 %5543, label %5552, label %5544

5544:                                             ; preds = %5540
  %5545 = load i8, ptr %325, align 1
  %5546 = sext i8 %5545 to i32
  %5547 = icmp eq i32 %5546, 34
  br i1 %5547, label %5552, label %5548

5548:                                             ; preds = %5544
  %5549 = load i8, ptr %325, align 1
  %5550 = sext i8 %5549 to i32
  %5551 = icmp eq i32 %5550, 92
  br i1 %5551, label %5552, label %5553

5552:                                             ; preds = %5548, %5544, %5540, %5533
  store i1 false, ptr %315, align 1
  br label %6132

5553:                                             ; preds = %5548
  br label %5554

5554:                                             ; preds = %5553, %5530
  %5555 = load i64, ptr %317, align 8
  %5556 = icmp ult i64 8, %5555
  br i1 %5556, label %5557, label %5578

5557:                                             ; preds = %5554
  %5558 = load ptr, ptr %316, align 8
  %5559 = getelementptr inbounds i8, ptr %5558, i64 8
  %5560 = load i8, ptr %5559, align 1
  store i8 %5560, ptr %326, align 1
  %5561 = load i8, ptr %326, align 1
  %5562 = sext i8 %5561 to i32
  %5563 = icmp slt i32 %5562, 32
  br i1 %5563, label %5576, label %5564

5564:                                             ; preds = %5557
  %5565 = load i8, ptr %326, align 1
  %5566 = sext i8 %5565 to i32
  %5567 = icmp sgt i32 %5566, 126
  br i1 %5567, label %5576, label %5568

5568:                                             ; preds = %5564
  %5569 = load i8, ptr %326, align 1
  %5570 = sext i8 %5569 to i32
  %5571 = icmp eq i32 %5570, 34
  br i1 %5571, label %5576, label %5572

5572:                                             ; preds = %5568
  %5573 = load i8, ptr %326, align 1
  %5574 = sext i8 %5573 to i32
  %5575 = icmp eq i32 %5574, 92
  br i1 %5575, label %5576, label %5577

5576:                                             ; preds = %5572, %5568, %5564, %5557
  store i1 false, ptr %315, align 1
  br label %6132

5577:                                             ; preds = %5572
  br label %5578

5578:                                             ; preds = %5577, %5554
  %5579 = load i64, ptr %317, align 8
  %5580 = icmp ult i64 9, %5579
  br i1 %5580, label %5581, label %5602

5581:                                             ; preds = %5578
  %5582 = load ptr, ptr %316, align 8
  %5583 = getelementptr inbounds i8, ptr %5582, i64 9
  %5584 = load i8, ptr %5583, align 1
  store i8 %5584, ptr %327, align 1
  %5585 = load i8, ptr %327, align 1
  %5586 = sext i8 %5585 to i32
  %5587 = icmp slt i32 %5586, 32
  br i1 %5587, label %5600, label %5588

5588:                                             ; preds = %5581
  %5589 = load i8, ptr %327, align 1
  %5590 = sext i8 %5589 to i32
  %5591 = icmp sgt i32 %5590, 126
  br i1 %5591, label %5600, label %5592

5592:                                             ; preds = %5588
  %5593 = load i8, ptr %327, align 1
  %5594 = sext i8 %5593 to i32
  %5595 = icmp eq i32 %5594, 34
  br i1 %5595, label %5600, label %5596

5596:                                             ; preds = %5592
  %5597 = load i8, ptr %327, align 1
  %5598 = sext i8 %5597 to i32
  %5599 = icmp eq i32 %5598, 92
  br i1 %5599, label %5600, label %5601

5600:                                             ; preds = %5596, %5592, %5588, %5581
  store i1 false, ptr %315, align 1
  br label %6132

5601:                                             ; preds = %5596
  br label %5602

5602:                                             ; preds = %5601, %5578
  %5603 = load i64, ptr %317, align 8
  %5604 = icmp ult i64 10, %5603
  br i1 %5604, label %5605, label %5626

5605:                                             ; preds = %5602
  %5606 = load ptr, ptr %316, align 8
  %5607 = getelementptr inbounds i8, ptr %5606, i64 10
  %5608 = load i8, ptr %5607, align 1
  store i8 %5608, ptr %328, align 1
  %5609 = load i8, ptr %328, align 1
  %5610 = sext i8 %5609 to i32
  %5611 = icmp slt i32 %5610, 32
  br i1 %5611, label %5624, label %5612

5612:                                             ; preds = %5605
  %5613 = load i8, ptr %328, align 1
  %5614 = sext i8 %5613 to i32
  %5615 = icmp sgt i32 %5614, 126
  br i1 %5615, label %5624, label %5616

5616:                                             ; preds = %5612
  %5617 = load i8, ptr %328, align 1
  %5618 = sext i8 %5617 to i32
  %5619 = icmp eq i32 %5618, 34
  br i1 %5619, label %5624, label %5620

5620:                                             ; preds = %5616
  %5621 = load i8, ptr %328, align 1
  %5622 = sext i8 %5621 to i32
  %5623 = icmp eq i32 %5622, 92
  br i1 %5623, label %5624, label %5625

5624:                                             ; preds = %5620, %5616, %5612, %5605
  store i1 false, ptr %315, align 1
  br label %6132

5625:                                             ; preds = %5620
  br label %5626

5626:                                             ; preds = %5625, %5602
  %5627 = load i64, ptr %317, align 8
  %5628 = icmp ult i64 11, %5627
  br i1 %5628, label %5629, label %5650

5629:                                             ; preds = %5626
  %5630 = load ptr, ptr %316, align 8
  %5631 = getelementptr inbounds i8, ptr %5630, i64 11
  %5632 = load i8, ptr %5631, align 1
  store i8 %5632, ptr %329, align 1
  %5633 = load i8, ptr %329, align 1
  %5634 = sext i8 %5633 to i32
  %5635 = icmp slt i32 %5634, 32
  br i1 %5635, label %5648, label %5636

5636:                                             ; preds = %5629
  %5637 = load i8, ptr %329, align 1
  %5638 = sext i8 %5637 to i32
  %5639 = icmp sgt i32 %5638, 126
  br i1 %5639, label %5648, label %5640

5640:                                             ; preds = %5636
  %5641 = load i8, ptr %329, align 1
  %5642 = sext i8 %5641 to i32
  %5643 = icmp eq i32 %5642, 34
  br i1 %5643, label %5648, label %5644

5644:                                             ; preds = %5640
  %5645 = load i8, ptr %329, align 1
  %5646 = sext i8 %5645 to i32
  %5647 = icmp eq i32 %5646, 92
  br i1 %5647, label %5648, label %5649

5648:                                             ; preds = %5644, %5640, %5636, %5629
  store i1 false, ptr %315, align 1
  br label %6132

5649:                                             ; preds = %5644
  br label %5650

5650:                                             ; preds = %5649, %5626
  %5651 = load i64, ptr %317, align 8
  %5652 = icmp ult i64 12, %5651
  br i1 %5652, label %5653, label %5674

5653:                                             ; preds = %5650
  %5654 = load ptr, ptr %316, align 8
  %5655 = getelementptr inbounds i8, ptr %5654, i64 12
  %5656 = load i8, ptr %5655, align 1
  store i8 %5656, ptr %330, align 1
  %5657 = load i8, ptr %330, align 1
  %5658 = sext i8 %5657 to i32
  %5659 = icmp slt i32 %5658, 32
  br i1 %5659, label %5672, label %5660

5660:                                             ; preds = %5653
  %5661 = load i8, ptr %330, align 1
  %5662 = sext i8 %5661 to i32
  %5663 = icmp sgt i32 %5662, 126
  br i1 %5663, label %5672, label %5664

5664:                                             ; preds = %5660
  %5665 = load i8, ptr %330, align 1
  %5666 = sext i8 %5665 to i32
  %5667 = icmp eq i32 %5666, 34
  br i1 %5667, label %5672, label %5668

5668:                                             ; preds = %5664
  %5669 = load i8, ptr %330, align 1
  %5670 = sext i8 %5669 to i32
  %5671 = icmp eq i32 %5670, 92
  br i1 %5671, label %5672, label %5673

5672:                                             ; preds = %5668, %5664, %5660, %5653
  store i1 false, ptr %315, align 1
  br label %6132

5673:                                             ; preds = %5668
  br label %5674

5674:                                             ; preds = %5673, %5650
  %5675 = load i64, ptr %317, align 8
  %5676 = icmp ult i64 13, %5675
  br i1 %5676, label %5677, label %5698

5677:                                             ; preds = %5674
  %5678 = load ptr, ptr %316, align 8
  %5679 = getelementptr inbounds i8, ptr %5678, i64 13
  %5680 = load i8, ptr %5679, align 1
  store i8 %5680, ptr %331, align 1
  %5681 = load i8, ptr %331, align 1
  %5682 = sext i8 %5681 to i32
  %5683 = icmp slt i32 %5682, 32
  br i1 %5683, label %5696, label %5684

5684:                                             ; preds = %5677
  %5685 = load i8, ptr %331, align 1
  %5686 = sext i8 %5685 to i32
  %5687 = icmp sgt i32 %5686, 126
  br i1 %5687, label %5696, label %5688

5688:                                             ; preds = %5684
  %5689 = load i8, ptr %331, align 1
  %5690 = sext i8 %5689 to i32
  %5691 = icmp eq i32 %5690, 34
  br i1 %5691, label %5696, label %5692

5692:                                             ; preds = %5688
  %5693 = load i8, ptr %331, align 1
  %5694 = sext i8 %5693 to i32
  %5695 = icmp eq i32 %5694, 92
  br i1 %5695, label %5696, label %5697

5696:                                             ; preds = %5692, %5688, %5684, %5677
  store i1 false, ptr %315, align 1
  br label %6132

5697:                                             ; preds = %5692
  br label %5698

5698:                                             ; preds = %5697, %5674
  %5699 = load i64, ptr %317, align 8
  %5700 = icmp ult i64 14, %5699
  br i1 %5700, label %5701, label %5722

5701:                                             ; preds = %5698
  %5702 = load ptr, ptr %316, align 8
  %5703 = getelementptr inbounds i8, ptr %5702, i64 14
  %5704 = load i8, ptr %5703, align 1
  store i8 %5704, ptr %332, align 1
  %5705 = load i8, ptr %332, align 1
  %5706 = sext i8 %5705 to i32
  %5707 = icmp slt i32 %5706, 32
  br i1 %5707, label %5720, label %5708

5708:                                             ; preds = %5701
  %5709 = load i8, ptr %332, align 1
  %5710 = sext i8 %5709 to i32
  %5711 = icmp sgt i32 %5710, 126
  br i1 %5711, label %5720, label %5712

5712:                                             ; preds = %5708
  %5713 = load i8, ptr %332, align 1
  %5714 = sext i8 %5713 to i32
  %5715 = icmp eq i32 %5714, 34
  br i1 %5715, label %5720, label %5716

5716:                                             ; preds = %5712
  %5717 = load i8, ptr %332, align 1
  %5718 = sext i8 %5717 to i32
  %5719 = icmp eq i32 %5718, 92
  br i1 %5719, label %5720, label %5721

5720:                                             ; preds = %5716, %5712, %5708, %5701
  store i1 false, ptr %315, align 1
  br label %6132

5721:                                             ; preds = %5716
  br label %5722

5722:                                             ; preds = %5721, %5698
  %5723 = load i64, ptr %317, align 8
  %5724 = icmp ult i64 15, %5723
  br i1 %5724, label %5725, label %5746

5725:                                             ; preds = %5722
  %5726 = load ptr, ptr %316, align 8
  %5727 = getelementptr inbounds i8, ptr %5726, i64 15
  %5728 = load i8, ptr %5727, align 1
  store i8 %5728, ptr %333, align 1
  %5729 = load i8, ptr %333, align 1
  %5730 = sext i8 %5729 to i32
  %5731 = icmp slt i32 %5730, 32
  br i1 %5731, label %5744, label %5732

5732:                                             ; preds = %5725
  %5733 = load i8, ptr %333, align 1
  %5734 = sext i8 %5733 to i32
  %5735 = icmp sgt i32 %5734, 126
  br i1 %5735, label %5744, label %5736

5736:                                             ; preds = %5732
  %5737 = load i8, ptr %333, align 1
  %5738 = sext i8 %5737 to i32
  %5739 = icmp eq i32 %5738, 34
  br i1 %5739, label %5744, label %5740

5740:                                             ; preds = %5736
  %5741 = load i8, ptr %333, align 1
  %5742 = sext i8 %5741 to i32
  %5743 = icmp eq i32 %5742, 92
  br i1 %5743, label %5744, label %5745

5744:                                             ; preds = %5740, %5736, %5732, %5725
  store i1 false, ptr %315, align 1
  br label %6132

5745:                                             ; preds = %5740
  br label %5746

5746:                                             ; preds = %5745, %5722
  %5747 = load i64, ptr %317, align 8
  %5748 = icmp ult i64 16, %5747
  br i1 %5748, label %5749, label %5770

5749:                                             ; preds = %5746
  %5750 = load ptr, ptr %316, align 8
  %5751 = getelementptr inbounds i8, ptr %5750, i64 16
  %5752 = load i8, ptr %5751, align 1
  store i8 %5752, ptr %334, align 1
  %5753 = load i8, ptr %334, align 1
  %5754 = sext i8 %5753 to i32
  %5755 = icmp slt i32 %5754, 32
  br i1 %5755, label %5768, label %5756

5756:                                             ; preds = %5749
  %5757 = load i8, ptr %334, align 1
  %5758 = sext i8 %5757 to i32
  %5759 = icmp sgt i32 %5758, 126
  br i1 %5759, label %5768, label %5760

5760:                                             ; preds = %5756
  %5761 = load i8, ptr %334, align 1
  %5762 = sext i8 %5761 to i32
  %5763 = icmp eq i32 %5762, 34
  br i1 %5763, label %5768, label %5764

5764:                                             ; preds = %5760
  %5765 = load i8, ptr %334, align 1
  %5766 = sext i8 %5765 to i32
  %5767 = icmp eq i32 %5766, 92
  br i1 %5767, label %5768, label %5769

5768:                                             ; preds = %5764, %5760, %5756, %5749
  store i1 false, ptr %315, align 1
  br label %6132

5769:                                             ; preds = %5764
  br label %5770

5770:                                             ; preds = %5769, %5746
  %5771 = load i64, ptr %317, align 8
  %5772 = icmp ult i64 17, %5771
  br i1 %5772, label %5773, label %5794

5773:                                             ; preds = %5770
  %5774 = load ptr, ptr %316, align 8
  %5775 = getelementptr inbounds i8, ptr %5774, i64 17
  %5776 = load i8, ptr %5775, align 1
  store i8 %5776, ptr %335, align 1
  %5777 = load i8, ptr %335, align 1
  %5778 = sext i8 %5777 to i32
  %5779 = icmp slt i32 %5778, 32
  br i1 %5779, label %5792, label %5780

5780:                                             ; preds = %5773
  %5781 = load i8, ptr %335, align 1
  %5782 = sext i8 %5781 to i32
  %5783 = icmp sgt i32 %5782, 126
  br i1 %5783, label %5792, label %5784

5784:                                             ; preds = %5780
  %5785 = load i8, ptr %335, align 1
  %5786 = sext i8 %5785 to i32
  %5787 = icmp eq i32 %5786, 34
  br i1 %5787, label %5792, label %5788

5788:                                             ; preds = %5784
  %5789 = load i8, ptr %335, align 1
  %5790 = sext i8 %5789 to i32
  %5791 = icmp eq i32 %5790, 92
  br i1 %5791, label %5792, label %5793

5792:                                             ; preds = %5788, %5784, %5780, %5773
  store i1 false, ptr %315, align 1
  br label %6132

5793:                                             ; preds = %5788
  br label %5794

5794:                                             ; preds = %5793, %5770
  %5795 = load i64, ptr %317, align 8
  %5796 = icmp ult i64 18, %5795
  br i1 %5796, label %5797, label %5818

5797:                                             ; preds = %5794
  %5798 = load ptr, ptr %316, align 8
  %5799 = getelementptr inbounds i8, ptr %5798, i64 18
  %5800 = load i8, ptr %5799, align 1
  store i8 %5800, ptr %336, align 1
  %5801 = load i8, ptr %336, align 1
  %5802 = sext i8 %5801 to i32
  %5803 = icmp slt i32 %5802, 32
  br i1 %5803, label %5816, label %5804

5804:                                             ; preds = %5797
  %5805 = load i8, ptr %336, align 1
  %5806 = sext i8 %5805 to i32
  %5807 = icmp sgt i32 %5806, 126
  br i1 %5807, label %5816, label %5808

5808:                                             ; preds = %5804
  %5809 = load i8, ptr %336, align 1
  %5810 = sext i8 %5809 to i32
  %5811 = icmp eq i32 %5810, 34
  br i1 %5811, label %5816, label %5812

5812:                                             ; preds = %5808
  %5813 = load i8, ptr %336, align 1
  %5814 = sext i8 %5813 to i32
  %5815 = icmp eq i32 %5814, 92
  br i1 %5815, label %5816, label %5817

5816:                                             ; preds = %5812, %5808, %5804, %5797
  store i1 false, ptr %315, align 1
  br label %6132

5817:                                             ; preds = %5812
  br label %5818

5818:                                             ; preds = %5817, %5794
  %5819 = load i64, ptr %317, align 8
  %5820 = icmp ult i64 19, %5819
  br i1 %5820, label %5821, label %5842

5821:                                             ; preds = %5818
  %5822 = load ptr, ptr %316, align 8
  %5823 = getelementptr inbounds i8, ptr %5822, i64 19
  %5824 = load i8, ptr %5823, align 1
  store i8 %5824, ptr %337, align 1
  %5825 = load i8, ptr %337, align 1
  %5826 = sext i8 %5825 to i32
  %5827 = icmp slt i32 %5826, 32
  br i1 %5827, label %5840, label %5828

5828:                                             ; preds = %5821
  %5829 = load i8, ptr %337, align 1
  %5830 = sext i8 %5829 to i32
  %5831 = icmp sgt i32 %5830, 126
  br i1 %5831, label %5840, label %5832

5832:                                             ; preds = %5828
  %5833 = load i8, ptr %337, align 1
  %5834 = sext i8 %5833 to i32
  %5835 = icmp eq i32 %5834, 34
  br i1 %5835, label %5840, label %5836

5836:                                             ; preds = %5832
  %5837 = load i8, ptr %337, align 1
  %5838 = sext i8 %5837 to i32
  %5839 = icmp eq i32 %5838, 92
  br i1 %5839, label %5840, label %5841

5840:                                             ; preds = %5836, %5832, %5828, %5821
  store i1 false, ptr %315, align 1
  br label %6132

5841:                                             ; preds = %5836
  br label %5842

5842:                                             ; preds = %5841, %5818
  %5843 = load i64, ptr %317, align 8
  %5844 = icmp ult i64 20, %5843
  br i1 %5844, label %5845, label %5866

5845:                                             ; preds = %5842
  %5846 = load ptr, ptr %316, align 8
  %5847 = getelementptr inbounds i8, ptr %5846, i64 20
  %5848 = load i8, ptr %5847, align 1
  store i8 %5848, ptr %338, align 1
  %5849 = load i8, ptr %338, align 1
  %5850 = sext i8 %5849 to i32
  %5851 = icmp slt i32 %5850, 32
  br i1 %5851, label %5864, label %5852

5852:                                             ; preds = %5845
  %5853 = load i8, ptr %338, align 1
  %5854 = sext i8 %5853 to i32
  %5855 = icmp sgt i32 %5854, 126
  br i1 %5855, label %5864, label %5856

5856:                                             ; preds = %5852
  %5857 = load i8, ptr %338, align 1
  %5858 = sext i8 %5857 to i32
  %5859 = icmp eq i32 %5858, 34
  br i1 %5859, label %5864, label %5860

5860:                                             ; preds = %5856
  %5861 = load i8, ptr %338, align 1
  %5862 = sext i8 %5861 to i32
  %5863 = icmp eq i32 %5862, 92
  br i1 %5863, label %5864, label %5865

5864:                                             ; preds = %5860, %5856, %5852, %5845
  store i1 false, ptr %315, align 1
  br label %6132

5865:                                             ; preds = %5860
  br label %5866

5866:                                             ; preds = %5865, %5842
  %5867 = load i64, ptr %317, align 8
  %5868 = icmp ult i64 21, %5867
  br i1 %5868, label %5869, label %5890

5869:                                             ; preds = %5866
  %5870 = load ptr, ptr %316, align 8
  %5871 = getelementptr inbounds i8, ptr %5870, i64 21
  %5872 = load i8, ptr %5871, align 1
  store i8 %5872, ptr %339, align 1
  %5873 = load i8, ptr %339, align 1
  %5874 = sext i8 %5873 to i32
  %5875 = icmp slt i32 %5874, 32
  br i1 %5875, label %5888, label %5876

5876:                                             ; preds = %5869
  %5877 = load i8, ptr %339, align 1
  %5878 = sext i8 %5877 to i32
  %5879 = icmp sgt i32 %5878, 126
  br i1 %5879, label %5888, label %5880

5880:                                             ; preds = %5876
  %5881 = load i8, ptr %339, align 1
  %5882 = sext i8 %5881 to i32
  %5883 = icmp eq i32 %5882, 34
  br i1 %5883, label %5888, label %5884

5884:                                             ; preds = %5880
  %5885 = load i8, ptr %339, align 1
  %5886 = sext i8 %5885 to i32
  %5887 = icmp eq i32 %5886, 92
  br i1 %5887, label %5888, label %5889

5888:                                             ; preds = %5884, %5880, %5876, %5869
  store i1 false, ptr %315, align 1
  br label %6132

5889:                                             ; preds = %5884
  br label %5890

5890:                                             ; preds = %5889, %5866
  %5891 = load i64, ptr %317, align 8
  %5892 = icmp ult i64 22, %5891
  br i1 %5892, label %5893, label %5914

5893:                                             ; preds = %5890
  %5894 = load ptr, ptr %316, align 8
  %5895 = getelementptr inbounds i8, ptr %5894, i64 22
  %5896 = load i8, ptr %5895, align 1
  store i8 %5896, ptr %340, align 1
  %5897 = load i8, ptr %340, align 1
  %5898 = sext i8 %5897 to i32
  %5899 = icmp slt i32 %5898, 32
  br i1 %5899, label %5912, label %5900

5900:                                             ; preds = %5893
  %5901 = load i8, ptr %340, align 1
  %5902 = sext i8 %5901 to i32
  %5903 = icmp sgt i32 %5902, 126
  br i1 %5903, label %5912, label %5904

5904:                                             ; preds = %5900
  %5905 = load i8, ptr %340, align 1
  %5906 = sext i8 %5905 to i32
  %5907 = icmp eq i32 %5906, 34
  br i1 %5907, label %5912, label %5908

5908:                                             ; preds = %5904
  %5909 = load i8, ptr %340, align 1
  %5910 = sext i8 %5909 to i32
  %5911 = icmp eq i32 %5910, 92
  br i1 %5911, label %5912, label %5913

5912:                                             ; preds = %5908, %5904, %5900, %5893
  store i1 false, ptr %315, align 1
  br label %6132

5913:                                             ; preds = %5908
  br label %5914

5914:                                             ; preds = %5913, %5890
  %5915 = load i64, ptr %317, align 8
  %5916 = icmp ult i64 23, %5915
  br i1 %5916, label %5917, label %5938

5917:                                             ; preds = %5914
  %5918 = load ptr, ptr %316, align 8
  %5919 = getelementptr inbounds i8, ptr %5918, i64 23
  %5920 = load i8, ptr %5919, align 1
  store i8 %5920, ptr %341, align 1
  %5921 = load i8, ptr %341, align 1
  %5922 = sext i8 %5921 to i32
  %5923 = icmp slt i32 %5922, 32
  br i1 %5923, label %5936, label %5924

5924:                                             ; preds = %5917
  %5925 = load i8, ptr %341, align 1
  %5926 = sext i8 %5925 to i32
  %5927 = icmp sgt i32 %5926, 126
  br i1 %5927, label %5936, label %5928

5928:                                             ; preds = %5924
  %5929 = load i8, ptr %341, align 1
  %5930 = sext i8 %5929 to i32
  %5931 = icmp eq i32 %5930, 34
  br i1 %5931, label %5936, label %5932

5932:                                             ; preds = %5928
  %5933 = load i8, ptr %341, align 1
  %5934 = sext i8 %5933 to i32
  %5935 = icmp eq i32 %5934, 92
  br i1 %5935, label %5936, label %5937

5936:                                             ; preds = %5932, %5928, %5924, %5917
  store i1 false, ptr %315, align 1
  br label %6132

5937:                                             ; preds = %5932
  br label %5938

5938:                                             ; preds = %5937, %5914
  %5939 = load i64, ptr %317, align 8
  %5940 = icmp ult i64 24, %5939
  br i1 %5940, label %5941, label %5962

5941:                                             ; preds = %5938
  %5942 = load ptr, ptr %316, align 8
  %5943 = getelementptr inbounds i8, ptr %5942, i64 24
  %5944 = load i8, ptr %5943, align 1
  store i8 %5944, ptr %342, align 1
  %5945 = load i8, ptr %342, align 1
  %5946 = sext i8 %5945 to i32
  %5947 = icmp slt i32 %5946, 32
  br i1 %5947, label %5960, label %5948

5948:                                             ; preds = %5941
  %5949 = load i8, ptr %342, align 1
  %5950 = sext i8 %5949 to i32
  %5951 = icmp sgt i32 %5950, 126
  br i1 %5951, label %5960, label %5952

5952:                                             ; preds = %5948
  %5953 = load i8, ptr %342, align 1
  %5954 = sext i8 %5953 to i32
  %5955 = icmp eq i32 %5954, 34
  br i1 %5955, label %5960, label %5956

5956:                                             ; preds = %5952
  %5957 = load i8, ptr %342, align 1
  %5958 = sext i8 %5957 to i32
  %5959 = icmp eq i32 %5958, 92
  br i1 %5959, label %5960, label %5961

5960:                                             ; preds = %5956, %5952, %5948, %5941
  store i1 false, ptr %315, align 1
  br label %6132

5961:                                             ; preds = %5956
  br label %5962

5962:                                             ; preds = %5961, %5938
  %5963 = load i64, ptr %317, align 8
  %5964 = icmp ult i64 25, %5963
  br i1 %5964, label %5965, label %5986

5965:                                             ; preds = %5962
  %5966 = load ptr, ptr %316, align 8
  %5967 = getelementptr inbounds i8, ptr %5966, i64 25
  %5968 = load i8, ptr %5967, align 1
  store i8 %5968, ptr %343, align 1
  %5969 = load i8, ptr %343, align 1
  %5970 = sext i8 %5969 to i32
  %5971 = icmp slt i32 %5970, 32
  br i1 %5971, label %5984, label %5972

5972:                                             ; preds = %5965
  %5973 = load i8, ptr %343, align 1
  %5974 = sext i8 %5973 to i32
  %5975 = icmp sgt i32 %5974, 126
  br i1 %5975, label %5984, label %5976

5976:                                             ; preds = %5972
  %5977 = load i8, ptr %343, align 1
  %5978 = sext i8 %5977 to i32
  %5979 = icmp eq i32 %5978, 34
  br i1 %5979, label %5984, label %5980

5980:                                             ; preds = %5976
  %5981 = load i8, ptr %343, align 1
  %5982 = sext i8 %5981 to i32
  %5983 = icmp eq i32 %5982, 92
  br i1 %5983, label %5984, label %5985

5984:                                             ; preds = %5980, %5976, %5972, %5965
  store i1 false, ptr %315, align 1
  br label %6132

5985:                                             ; preds = %5980
  br label %5986

5986:                                             ; preds = %5985, %5962
  %5987 = load i64, ptr %317, align 8
  %5988 = icmp ult i64 26, %5987
  br i1 %5988, label %5989, label %6010

5989:                                             ; preds = %5986
  %5990 = load ptr, ptr %316, align 8
  %5991 = getelementptr inbounds i8, ptr %5990, i64 26
  %5992 = load i8, ptr %5991, align 1
  store i8 %5992, ptr %344, align 1
  %5993 = load i8, ptr %344, align 1
  %5994 = sext i8 %5993 to i32
  %5995 = icmp slt i32 %5994, 32
  br i1 %5995, label %6008, label %5996

5996:                                             ; preds = %5989
  %5997 = load i8, ptr %344, align 1
  %5998 = sext i8 %5997 to i32
  %5999 = icmp sgt i32 %5998, 126
  br i1 %5999, label %6008, label %6000

6000:                                             ; preds = %5996
  %6001 = load i8, ptr %344, align 1
  %6002 = sext i8 %6001 to i32
  %6003 = icmp eq i32 %6002, 34
  br i1 %6003, label %6008, label %6004

6004:                                             ; preds = %6000
  %6005 = load i8, ptr %344, align 1
  %6006 = sext i8 %6005 to i32
  %6007 = icmp eq i32 %6006, 92
  br i1 %6007, label %6008, label %6009

6008:                                             ; preds = %6004, %6000, %5996, %5989
  store i1 false, ptr %315, align 1
  br label %6132

6009:                                             ; preds = %6004
  br label %6010

6010:                                             ; preds = %6009, %5986
  %6011 = load i64, ptr %317, align 8
  %6012 = icmp ult i64 27, %6011
  br i1 %6012, label %6013, label %6034

6013:                                             ; preds = %6010
  %6014 = load ptr, ptr %316, align 8
  %6015 = getelementptr inbounds i8, ptr %6014, i64 27
  %6016 = load i8, ptr %6015, align 1
  store i8 %6016, ptr %345, align 1
  %6017 = load i8, ptr %345, align 1
  %6018 = sext i8 %6017 to i32
  %6019 = icmp slt i32 %6018, 32
  br i1 %6019, label %6032, label %6020

6020:                                             ; preds = %6013
  %6021 = load i8, ptr %345, align 1
  %6022 = sext i8 %6021 to i32
  %6023 = icmp sgt i32 %6022, 126
  br i1 %6023, label %6032, label %6024

6024:                                             ; preds = %6020
  %6025 = load i8, ptr %345, align 1
  %6026 = sext i8 %6025 to i32
  %6027 = icmp eq i32 %6026, 34
  br i1 %6027, label %6032, label %6028

6028:                                             ; preds = %6024
  %6029 = load i8, ptr %345, align 1
  %6030 = sext i8 %6029 to i32
  %6031 = icmp eq i32 %6030, 92
  br i1 %6031, label %6032, label %6033

6032:                                             ; preds = %6028, %6024, %6020, %6013
  store i1 false, ptr %315, align 1
  br label %6132

6033:                                             ; preds = %6028
  br label %6034

6034:                                             ; preds = %6033, %6010
  %6035 = load i64, ptr %317, align 8
  %6036 = icmp ult i64 28, %6035
  br i1 %6036, label %6037, label %6058

6037:                                             ; preds = %6034
  %6038 = load ptr, ptr %316, align 8
  %6039 = getelementptr inbounds i8, ptr %6038, i64 28
  %6040 = load i8, ptr %6039, align 1
  store i8 %6040, ptr %346, align 1
  %6041 = load i8, ptr %346, align 1
  %6042 = sext i8 %6041 to i32
  %6043 = icmp slt i32 %6042, 32
  br i1 %6043, label %6056, label %6044

6044:                                             ; preds = %6037
  %6045 = load i8, ptr %346, align 1
  %6046 = sext i8 %6045 to i32
  %6047 = icmp sgt i32 %6046, 126
  br i1 %6047, label %6056, label %6048

6048:                                             ; preds = %6044
  %6049 = load i8, ptr %346, align 1
  %6050 = sext i8 %6049 to i32
  %6051 = icmp eq i32 %6050, 34
  br i1 %6051, label %6056, label %6052

6052:                                             ; preds = %6048
  %6053 = load i8, ptr %346, align 1
  %6054 = sext i8 %6053 to i32
  %6055 = icmp eq i32 %6054, 92
  br i1 %6055, label %6056, label %6057

6056:                                             ; preds = %6052, %6048, %6044, %6037
  store i1 false, ptr %315, align 1
  br label %6132

6057:                                             ; preds = %6052
  br label %6058

6058:                                             ; preds = %6057, %6034
  %6059 = load i64, ptr %317, align 8
  %6060 = icmp ult i64 29, %6059
  br i1 %6060, label %6061, label %6082

6061:                                             ; preds = %6058
  %6062 = load ptr, ptr %316, align 8
  %6063 = getelementptr inbounds i8, ptr %6062, i64 29
  %6064 = load i8, ptr %6063, align 1
  store i8 %6064, ptr %347, align 1
  %6065 = load i8, ptr %347, align 1
  %6066 = sext i8 %6065 to i32
  %6067 = icmp slt i32 %6066, 32
  br i1 %6067, label %6080, label %6068

6068:                                             ; preds = %6061
  %6069 = load i8, ptr %347, align 1
  %6070 = sext i8 %6069 to i32
  %6071 = icmp sgt i32 %6070, 126
  br i1 %6071, label %6080, label %6072

6072:                                             ; preds = %6068
  %6073 = load i8, ptr %347, align 1
  %6074 = sext i8 %6073 to i32
  %6075 = icmp eq i32 %6074, 34
  br i1 %6075, label %6080, label %6076

6076:                                             ; preds = %6072
  %6077 = load i8, ptr %347, align 1
  %6078 = sext i8 %6077 to i32
  %6079 = icmp eq i32 %6078, 92
  br i1 %6079, label %6080, label %6081

6080:                                             ; preds = %6076, %6072, %6068, %6061
  store i1 false, ptr %315, align 1
  br label %6132

6081:                                             ; preds = %6076
  br label %6082

6082:                                             ; preds = %6081, %6058
  %6083 = load i64, ptr %317, align 8
  %6084 = icmp ult i64 30, %6083
  br i1 %6084, label %6085, label %6106

6085:                                             ; preds = %6082
  %6086 = load ptr, ptr %316, align 8
  %6087 = getelementptr inbounds i8, ptr %6086, i64 30
  %6088 = load i8, ptr %6087, align 1
  store i8 %6088, ptr %348, align 1
  %6089 = load i8, ptr %348, align 1
  %6090 = sext i8 %6089 to i32
  %6091 = icmp slt i32 %6090, 32
  br i1 %6091, label %6104, label %6092

6092:                                             ; preds = %6085
  %6093 = load i8, ptr %348, align 1
  %6094 = sext i8 %6093 to i32
  %6095 = icmp sgt i32 %6094, 126
  br i1 %6095, label %6104, label %6096

6096:                                             ; preds = %6092
  %6097 = load i8, ptr %348, align 1
  %6098 = sext i8 %6097 to i32
  %6099 = icmp eq i32 %6098, 34
  br i1 %6099, label %6104, label %6100

6100:                                             ; preds = %6096
  %6101 = load i8, ptr %348, align 1
  %6102 = sext i8 %6101 to i32
  %6103 = icmp eq i32 %6102, 92
  br i1 %6103, label %6104, label %6105

6104:                                             ; preds = %6100, %6096, %6092, %6085
  store i1 false, ptr %315, align 1
  br label %6132

6105:                                             ; preds = %6100
  br label %6106

6106:                                             ; preds = %6105, %6082
  %6107 = load i64, ptr %317, align 8
  %6108 = icmp ult i64 31, %6107
  br i1 %6108, label %6109, label %6130

6109:                                             ; preds = %6106
  %6110 = load ptr, ptr %316, align 8
  %6111 = getelementptr inbounds i8, ptr %6110, i64 31
  %6112 = load i8, ptr %6111, align 1
  store i8 %6112, ptr %349, align 1
  %6113 = load i8, ptr %349, align 1
  %6114 = sext i8 %6113 to i32
  %6115 = icmp slt i32 %6114, 32
  br i1 %6115, label %6128, label %6116

6116:                                             ; preds = %6109
  %6117 = load i8, ptr %349, align 1
  %6118 = sext i8 %6117 to i32
  %6119 = icmp sgt i32 %6118, 126
  br i1 %6119, label %6128, label %6120

6120:                                             ; preds = %6116
  %6121 = load i8, ptr %349, align 1
  %6122 = sext i8 %6121 to i32
  %6123 = icmp eq i32 %6122, 34
  br i1 %6123, label %6128, label %6124

6124:                                             ; preds = %6120
  %6125 = load i8, ptr %349, align 1
  %6126 = sext i8 %6125 to i32
  %6127 = icmp eq i32 %6126, 92
  br i1 %6127, label %6128, label %6129

6128:                                             ; preds = %6124, %6120, %6116, %6109
  store i1 false, ptr %315, align 1
  br label %6132

6129:                                             ; preds = %6124
  br label %6130

6130:                                             ; preds = %6129, %6106
  store i1 true, ptr %315, align 1
  br label %6132

6131:                                             ; preds = %5360, %5351
  store i1 false, ptr %315, align 1
  br label %6132

6132:                                             ; preds = %5384, %5408, %5432, %5456, %5480, %5504, %5528, %5552, %5576, %5600, %5624, %5648, %5672, %5696, %5720, %5744, %5768, %5792, %5816, %5840, %5864, %5888, %5912, %5936, %5960, %5984, %6008, %6032, %6056, %6080, %6104, %6128, %6130, %6131
  %6133 = load i1, ptr %315, align 1
  %6134 = zext i1 %6133 to i8
  store i8 %6134, ptr %513, align 1
  %6135 = load i8, ptr %513, align 1
  %6136 = trunc i8 %6135 to i1
  %6137 = zext i1 %6136 to i64
  %6138 = select i1 %6136, i32 8, i32 0
  %6139 = trunc i32 %6138 to i8
  store i8 %6139, ptr %514, align 1
  %6140 = load ptr, ptr %510, align 8
  %6141 = load i8, ptr %514, align 1
  %6142 = load i64, ptr %512, align 8
  store ptr %6140, ptr %115, align 8
  store i8 5, ptr %116, align 1
  store i8 %6141, ptr %117, align 1
  store i64 %6142, ptr %118, align 8
  %6143 = load i64, ptr %118, align 8
  %6144 = shl i64 %6143, 8
  store i64 %6144, ptr %119, align 8
  %6145 = load i8, ptr %116, align 1
  %6146 = zext i8 %6145 to i32
  %6147 = load i8, ptr %117, align 1
  %6148 = zext i8 %6147 to i32
  %6149 = or i32 %6146, %6148
  %6150 = sext i32 %6149 to i64
  %6151 = load i64, ptr %119, align 8
  %6152 = or i64 %6151, %6150
  store i64 %6152, ptr %119, align 8
  %6153 = load i64, ptr %119, align 8
  %6154 = load ptr, ptr %115, align 8
  store i64 %6153, ptr %6154, align 8
  %6155 = load ptr, ptr %511, align 8
  %6156 = load ptr, ptr %510, align 8
  %6157 = getelementptr inbounds nuw %struct.yyjson_val, ptr %6156, i32 0, i32 1
  store ptr %6155, ptr %6157, align 8
  %6158 = load ptr, ptr %869, align 8
  store ptr %6158, ptr %866, align 8
  br label %6161

6159:                                             ; preds = %5344
  br label %6160

6160:                                             ; preds = %6159, %5300
  store ptr null, ptr %866, align 8
  br label %6161

6161:                                             ; preds = %6132, %6160
  %6162 = load ptr, ptr %866, align 8
  %6163 = load ptr, ptr %938, align 8
  %6164 = load ptr, ptr %942, align 8
  %6165 = getelementptr inbounds nuw %struct.Coord, ptr %6164, i32 0, i32 3
  %6166 = getelementptr inbounds [64 x i8], ptr %6165, i64 0, i64 0
  store ptr %6163, ptr %831, align 8
  store ptr %6166, ptr %832, align 8
  %6167 = load ptr, ptr %831, align 8
  %6168 = icmp ne ptr %6167, null
  br i1 %6168, label %6169, label %6172

6169:                                             ; preds = %6161
  %6170 = load ptr, ptr %832, align 8
  %6171 = icmp ne ptr %6170, null
  br label %6172

6172:                                             ; preds = %6169, %6161
  %6173 = phi i1 [ false, %6161 ], [ %6171, %6169 ]
  %6174 = xor i1 %6173, true
  %6175 = zext i1 %6173 to i32
  %6176 = sext i32 %6175 to i64
  br i1 %6173, label %6177, label %7107

6177:                                             ; preds = %6172
  %6178 = load ptr, ptr %831, align 8
  store ptr %6178, ptr %794, align 8
  store i64 1, ptr %795, align 8
  %6179 = load ptr, ptr %794, align 8
  %6180 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %6179, i32 0, i32 1
  store ptr %6180, ptr %797, align 8
  %6181 = load ptr, ptr %794, align 8
  %6182 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %6181, i32 0, i32 3
  store ptr %6182, ptr %798, align 8
  %6183 = load ptr, ptr %798, align 8
  %6184 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %6183, i32 0, i32 1
  %6185 = load ptr, ptr %6184, align 8
  %6186 = load ptr, ptr %798, align 8
  %6187 = load ptr, ptr %6186, align 8
  %6188 = ptrtoint ptr %6185 to i64
  %6189 = ptrtoint ptr %6187 to i64
  %6190 = sub i64 %6188, %6189
  %6191 = sdiv exact i64 %6190, 24
  %6192 = load i64, ptr %795, align 8
  %6193 = icmp ult i64 %6191, %6192
  %6194 = xor i1 %6193, true
  %6195 = zext i1 %6193 to i32
  %6196 = sext i32 %6195 to i64
  br i1 %6193, label %6197, label %6208

6197:                                             ; preds = %6177
  %6198 = load ptr, ptr %798, align 8
  %6199 = load ptr, ptr %797, align 8
  %6200 = load i64, ptr %795, align 8
  %6201 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %6198, ptr noundef %6199, i64 noundef %6200)
  %6202 = xor i1 %6201, true
  %6203 = xor i1 %6201, true
  %6204 = zext i1 %6203 to i32
  %6205 = sext i32 %6204 to i64
  br i1 %6203, label %6206, label %6207

6206:                                             ; preds = %6197
  store ptr null, ptr %793, align 8
  br label %6216

6207:                                             ; preds = %6197
  br label %6208

6208:                                             ; preds = %6207, %6177
  %6209 = load ptr, ptr %798, align 8
  %6210 = load ptr, ptr %6209, align 8
  store ptr %6210, ptr %796, align 8
  %6211 = load i64, ptr %795, align 8
  %6212 = load ptr, ptr %798, align 8
  %6213 = load ptr, ptr %6212, align 8
  %6214 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %6213, i64 %6211
  store ptr %6214, ptr %6212, align 8
  %6215 = load ptr, ptr %796, align 8
  store ptr %6215, ptr %793, align 8
  br label %6216

6216:                                             ; preds = %6206, %6208
  %6217 = load ptr, ptr %793, align 8
  store ptr %6217, ptr %833, align 8
  %6218 = load ptr, ptr %833, align 8
  %6219 = icmp ne ptr %6218, null
  %6220 = xor i1 %6219, true
  %6221 = zext i1 %6219 to i32
  %6222 = sext i32 %6221 to i64
  br i1 %6219, label %6223, label %7106

6223:                                             ; preds = %6216
  %6224 = load ptr, ptr %832, align 8
  %6225 = call i64 @strlen(ptr noundef %6224)
  store i64 %6225, ptr %834, align 8
  %6226 = load ptr, ptr %832, align 8
  %6227 = load i64, ptr %834, align 8
  store ptr %6226, ptr %141, align 8
  store i64 %6227, ptr %142, align 8
  %6228 = load i64, ptr %142, align 8
  %6229 = call i1 @llvm.is.constant.i64(i64 %6228)
  br i1 %6229, label %6230, label %7001

6230:                                             ; preds = %6223
  %6231 = load i64, ptr %142, align 8
  %6232 = icmp ule i64 %6231, 32
  br i1 %6232, label %6233, label %7001

6233:                                             ; preds = %6230
  %6234 = load i64, ptr %142, align 8
  %6235 = icmp ult i64 0, %6234
  br i1 %6235, label %6236, label %6256

6236:                                             ; preds = %6233
  %6237 = load ptr, ptr %141, align 8
  %6238 = load i8, ptr %6237, align 1
  store i8 %6238, ptr %143, align 1
  %6239 = load i8, ptr %143, align 1
  %6240 = sext i8 %6239 to i32
  %6241 = icmp slt i32 %6240, 32
  br i1 %6241, label %6254, label %6242

6242:                                             ; preds = %6236
  %6243 = load i8, ptr %143, align 1
  %6244 = sext i8 %6243 to i32
  %6245 = icmp sgt i32 %6244, 126
  br i1 %6245, label %6254, label %6246

6246:                                             ; preds = %6242
  %6247 = load i8, ptr %143, align 1
  %6248 = sext i8 %6247 to i32
  %6249 = icmp eq i32 %6248, 34
  br i1 %6249, label %6254, label %6250

6250:                                             ; preds = %6246
  %6251 = load i8, ptr %143, align 1
  %6252 = sext i8 %6251 to i32
  %6253 = icmp eq i32 %6252, 92
  br i1 %6253, label %6254, label %6255

6254:                                             ; preds = %6250, %6246, %6242, %6236
  store i1 false, ptr %140, align 1
  br label %7002

6255:                                             ; preds = %6250
  br label %6256

6256:                                             ; preds = %6255, %6233
  %6257 = load i64, ptr %142, align 8
  %6258 = icmp ult i64 1, %6257
  br i1 %6258, label %6259, label %6280

6259:                                             ; preds = %6256
  %6260 = load ptr, ptr %141, align 8
  %6261 = getelementptr inbounds i8, ptr %6260, i64 1
  %6262 = load i8, ptr %6261, align 1
  store i8 %6262, ptr %144, align 1
  %6263 = load i8, ptr %144, align 1
  %6264 = sext i8 %6263 to i32
  %6265 = icmp slt i32 %6264, 32
  br i1 %6265, label %6278, label %6266

6266:                                             ; preds = %6259
  %6267 = load i8, ptr %144, align 1
  %6268 = sext i8 %6267 to i32
  %6269 = icmp sgt i32 %6268, 126
  br i1 %6269, label %6278, label %6270

6270:                                             ; preds = %6266
  %6271 = load i8, ptr %144, align 1
  %6272 = sext i8 %6271 to i32
  %6273 = icmp eq i32 %6272, 34
  br i1 %6273, label %6278, label %6274

6274:                                             ; preds = %6270
  %6275 = load i8, ptr %144, align 1
  %6276 = sext i8 %6275 to i32
  %6277 = icmp eq i32 %6276, 92
  br i1 %6277, label %6278, label %6279

6278:                                             ; preds = %6274, %6270, %6266, %6259
  store i1 false, ptr %140, align 1
  br label %7002

6279:                                             ; preds = %6274
  br label %6280

6280:                                             ; preds = %6279, %6256
  %6281 = load i64, ptr %142, align 8
  %6282 = icmp ult i64 2, %6281
  br i1 %6282, label %6283, label %6304

6283:                                             ; preds = %6280
  %6284 = load ptr, ptr %141, align 8
  %6285 = getelementptr inbounds i8, ptr %6284, i64 2
  %6286 = load i8, ptr %6285, align 1
  store i8 %6286, ptr %145, align 1
  %6287 = load i8, ptr %145, align 1
  %6288 = sext i8 %6287 to i32
  %6289 = icmp slt i32 %6288, 32
  br i1 %6289, label %6302, label %6290

6290:                                             ; preds = %6283
  %6291 = load i8, ptr %145, align 1
  %6292 = sext i8 %6291 to i32
  %6293 = icmp sgt i32 %6292, 126
  br i1 %6293, label %6302, label %6294

6294:                                             ; preds = %6290
  %6295 = load i8, ptr %145, align 1
  %6296 = sext i8 %6295 to i32
  %6297 = icmp eq i32 %6296, 34
  br i1 %6297, label %6302, label %6298

6298:                                             ; preds = %6294
  %6299 = load i8, ptr %145, align 1
  %6300 = sext i8 %6299 to i32
  %6301 = icmp eq i32 %6300, 92
  br i1 %6301, label %6302, label %6303

6302:                                             ; preds = %6298, %6294, %6290, %6283
  store i1 false, ptr %140, align 1
  br label %7002

6303:                                             ; preds = %6298
  br label %6304

6304:                                             ; preds = %6303, %6280
  %6305 = load i64, ptr %142, align 8
  %6306 = icmp ult i64 3, %6305
  br i1 %6306, label %6307, label %6328

6307:                                             ; preds = %6304
  %6308 = load ptr, ptr %141, align 8
  %6309 = getelementptr inbounds i8, ptr %6308, i64 3
  %6310 = load i8, ptr %6309, align 1
  store i8 %6310, ptr %146, align 1
  %6311 = load i8, ptr %146, align 1
  %6312 = sext i8 %6311 to i32
  %6313 = icmp slt i32 %6312, 32
  br i1 %6313, label %6326, label %6314

6314:                                             ; preds = %6307
  %6315 = load i8, ptr %146, align 1
  %6316 = sext i8 %6315 to i32
  %6317 = icmp sgt i32 %6316, 126
  br i1 %6317, label %6326, label %6318

6318:                                             ; preds = %6314
  %6319 = load i8, ptr %146, align 1
  %6320 = sext i8 %6319 to i32
  %6321 = icmp eq i32 %6320, 34
  br i1 %6321, label %6326, label %6322

6322:                                             ; preds = %6318
  %6323 = load i8, ptr %146, align 1
  %6324 = sext i8 %6323 to i32
  %6325 = icmp eq i32 %6324, 92
  br i1 %6325, label %6326, label %6327

6326:                                             ; preds = %6322, %6318, %6314, %6307
  store i1 false, ptr %140, align 1
  br label %7002

6327:                                             ; preds = %6322
  br label %6328

6328:                                             ; preds = %6327, %6304
  %6329 = load i64, ptr %142, align 8
  %6330 = icmp ult i64 4, %6329
  br i1 %6330, label %6331, label %6352

6331:                                             ; preds = %6328
  %6332 = load ptr, ptr %141, align 8
  %6333 = getelementptr inbounds i8, ptr %6332, i64 4
  %6334 = load i8, ptr %6333, align 1
  store i8 %6334, ptr %147, align 1
  %6335 = load i8, ptr %147, align 1
  %6336 = sext i8 %6335 to i32
  %6337 = icmp slt i32 %6336, 32
  br i1 %6337, label %6350, label %6338

6338:                                             ; preds = %6331
  %6339 = load i8, ptr %147, align 1
  %6340 = sext i8 %6339 to i32
  %6341 = icmp sgt i32 %6340, 126
  br i1 %6341, label %6350, label %6342

6342:                                             ; preds = %6338
  %6343 = load i8, ptr %147, align 1
  %6344 = sext i8 %6343 to i32
  %6345 = icmp eq i32 %6344, 34
  br i1 %6345, label %6350, label %6346

6346:                                             ; preds = %6342
  %6347 = load i8, ptr %147, align 1
  %6348 = sext i8 %6347 to i32
  %6349 = icmp eq i32 %6348, 92
  br i1 %6349, label %6350, label %6351

6350:                                             ; preds = %6346, %6342, %6338, %6331
  store i1 false, ptr %140, align 1
  br label %7002

6351:                                             ; preds = %6346
  br label %6352

6352:                                             ; preds = %6351, %6328
  %6353 = load i64, ptr %142, align 8
  %6354 = icmp ult i64 5, %6353
  br i1 %6354, label %6355, label %6376

6355:                                             ; preds = %6352
  %6356 = load ptr, ptr %141, align 8
  %6357 = getelementptr inbounds i8, ptr %6356, i64 5
  %6358 = load i8, ptr %6357, align 1
  store i8 %6358, ptr %148, align 1
  %6359 = load i8, ptr %148, align 1
  %6360 = sext i8 %6359 to i32
  %6361 = icmp slt i32 %6360, 32
  br i1 %6361, label %6374, label %6362

6362:                                             ; preds = %6355
  %6363 = load i8, ptr %148, align 1
  %6364 = sext i8 %6363 to i32
  %6365 = icmp sgt i32 %6364, 126
  br i1 %6365, label %6374, label %6366

6366:                                             ; preds = %6362
  %6367 = load i8, ptr %148, align 1
  %6368 = sext i8 %6367 to i32
  %6369 = icmp eq i32 %6368, 34
  br i1 %6369, label %6374, label %6370

6370:                                             ; preds = %6366
  %6371 = load i8, ptr %148, align 1
  %6372 = sext i8 %6371 to i32
  %6373 = icmp eq i32 %6372, 92
  br i1 %6373, label %6374, label %6375

6374:                                             ; preds = %6370, %6366, %6362, %6355
  store i1 false, ptr %140, align 1
  br label %7002

6375:                                             ; preds = %6370
  br label %6376

6376:                                             ; preds = %6375, %6352
  %6377 = load i64, ptr %142, align 8
  %6378 = icmp ult i64 6, %6377
  br i1 %6378, label %6379, label %6400

6379:                                             ; preds = %6376
  %6380 = load ptr, ptr %141, align 8
  %6381 = getelementptr inbounds i8, ptr %6380, i64 6
  %6382 = load i8, ptr %6381, align 1
  store i8 %6382, ptr %149, align 1
  %6383 = load i8, ptr %149, align 1
  %6384 = sext i8 %6383 to i32
  %6385 = icmp slt i32 %6384, 32
  br i1 %6385, label %6398, label %6386

6386:                                             ; preds = %6379
  %6387 = load i8, ptr %149, align 1
  %6388 = sext i8 %6387 to i32
  %6389 = icmp sgt i32 %6388, 126
  br i1 %6389, label %6398, label %6390

6390:                                             ; preds = %6386
  %6391 = load i8, ptr %149, align 1
  %6392 = sext i8 %6391 to i32
  %6393 = icmp eq i32 %6392, 34
  br i1 %6393, label %6398, label %6394

6394:                                             ; preds = %6390
  %6395 = load i8, ptr %149, align 1
  %6396 = sext i8 %6395 to i32
  %6397 = icmp eq i32 %6396, 92
  br i1 %6397, label %6398, label %6399

6398:                                             ; preds = %6394, %6390, %6386, %6379
  store i1 false, ptr %140, align 1
  br label %7002

6399:                                             ; preds = %6394
  br label %6400

6400:                                             ; preds = %6399, %6376
  %6401 = load i64, ptr %142, align 8
  %6402 = icmp ult i64 7, %6401
  br i1 %6402, label %6403, label %6424

6403:                                             ; preds = %6400
  %6404 = load ptr, ptr %141, align 8
  %6405 = getelementptr inbounds i8, ptr %6404, i64 7
  %6406 = load i8, ptr %6405, align 1
  store i8 %6406, ptr %150, align 1
  %6407 = load i8, ptr %150, align 1
  %6408 = sext i8 %6407 to i32
  %6409 = icmp slt i32 %6408, 32
  br i1 %6409, label %6422, label %6410

6410:                                             ; preds = %6403
  %6411 = load i8, ptr %150, align 1
  %6412 = sext i8 %6411 to i32
  %6413 = icmp sgt i32 %6412, 126
  br i1 %6413, label %6422, label %6414

6414:                                             ; preds = %6410
  %6415 = load i8, ptr %150, align 1
  %6416 = sext i8 %6415 to i32
  %6417 = icmp eq i32 %6416, 34
  br i1 %6417, label %6422, label %6418

6418:                                             ; preds = %6414
  %6419 = load i8, ptr %150, align 1
  %6420 = sext i8 %6419 to i32
  %6421 = icmp eq i32 %6420, 92
  br i1 %6421, label %6422, label %6423

6422:                                             ; preds = %6418, %6414, %6410, %6403
  store i1 false, ptr %140, align 1
  br label %7002

6423:                                             ; preds = %6418
  br label %6424

6424:                                             ; preds = %6423, %6400
  %6425 = load i64, ptr %142, align 8
  %6426 = icmp ult i64 8, %6425
  br i1 %6426, label %6427, label %6448

6427:                                             ; preds = %6424
  %6428 = load ptr, ptr %141, align 8
  %6429 = getelementptr inbounds i8, ptr %6428, i64 8
  %6430 = load i8, ptr %6429, align 1
  store i8 %6430, ptr %151, align 1
  %6431 = load i8, ptr %151, align 1
  %6432 = sext i8 %6431 to i32
  %6433 = icmp slt i32 %6432, 32
  br i1 %6433, label %6446, label %6434

6434:                                             ; preds = %6427
  %6435 = load i8, ptr %151, align 1
  %6436 = sext i8 %6435 to i32
  %6437 = icmp sgt i32 %6436, 126
  br i1 %6437, label %6446, label %6438

6438:                                             ; preds = %6434
  %6439 = load i8, ptr %151, align 1
  %6440 = sext i8 %6439 to i32
  %6441 = icmp eq i32 %6440, 34
  br i1 %6441, label %6446, label %6442

6442:                                             ; preds = %6438
  %6443 = load i8, ptr %151, align 1
  %6444 = sext i8 %6443 to i32
  %6445 = icmp eq i32 %6444, 92
  br i1 %6445, label %6446, label %6447

6446:                                             ; preds = %6442, %6438, %6434, %6427
  store i1 false, ptr %140, align 1
  br label %7002

6447:                                             ; preds = %6442
  br label %6448

6448:                                             ; preds = %6447, %6424
  %6449 = load i64, ptr %142, align 8
  %6450 = icmp ult i64 9, %6449
  br i1 %6450, label %6451, label %6472

6451:                                             ; preds = %6448
  %6452 = load ptr, ptr %141, align 8
  %6453 = getelementptr inbounds i8, ptr %6452, i64 9
  %6454 = load i8, ptr %6453, align 1
  store i8 %6454, ptr %152, align 1
  %6455 = load i8, ptr %152, align 1
  %6456 = sext i8 %6455 to i32
  %6457 = icmp slt i32 %6456, 32
  br i1 %6457, label %6470, label %6458

6458:                                             ; preds = %6451
  %6459 = load i8, ptr %152, align 1
  %6460 = sext i8 %6459 to i32
  %6461 = icmp sgt i32 %6460, 126
  br i1 %6461, label %6470, label %6462

6462:                                             ; preds = %6458
  %6463 = load i8, ptr %152, align 1
  %6464 = sext i8 %6463 to i32
  %6465 = icmp eq i32 %6464, 34
  br i1 %6465, label %6470, label %6466

6466:                                             ; preds = %6462
  %6467 = load i8, ptr %152, align 1
  %6468 = sext i8 %6467 to i32
  %6469 = icmp eq i32 %6468, 92
  br i1 %6469, label %6470, label %6471

6470:                                             ; preds = %6466, %6462, %6458, %6451
  store i1 false, ptr %140, align 1
  br label %7002

6471:                                             ; preds = %6466
  br label %6472

6472:                                             ; preds = %6471, %6448
  %6473 = load i64, ptr %142, align 8
  %6474 = icmp ult i64 10, %6473
  br i1 %6474, label %6475, label %6496

6475:                                             ; preds = %6472
  %6476 = load ptr, ptr %141, align 8
  %6477 = getelementptr inbounds i8, ptr %6476, i64 10
  %6478 = load i8, ptr %6477, align 1
  store i8 %6478, ptr %153, align 1
  %6479 = load i8, ptr %153, align 1
  %6480 = sext i8 %6479 to i32
  %6481 = icmp slt i32 %6480, 32
  br i1 %6481, label %6494, label %6482

6482:                                             ; preds = %6475
  %6483 = load i8, ptr %153, align 1
  %6484 = sext i8 %6483 to i32
  %6485 = icmp sgt i32 %6484, 126
  br i1 %6485, label %6494, label %6486

6486:                                             ; preds = %6482
  %6487 = load i8, ptr %153, align 1
  %6488 = sext i8 %6487 to i32
  %6489 = icmp eq i32 %6488, 34
  br i1 %6489, label %6494, label %6490

6490:                                             ; preds = %6486
  %6491 = load i8, ptr %153, align 1
  %6492 = sext i8 %6491 to i32
  %6493 = icmp eq i32 %6492, 92
  br i1 %6493, label %6494, label %6495

6494:                                             ; preds = %6490, %6486, %6482, %6475
  store i1 false, ptr %140, align 1
  br label %7002

6495:                                             ; preds = %6490
  br label %6496

6496:                                             ; preds = %6495, %6472
  %6497 = load i64, ptr %142, align 8
  %6498 = icmp ult i64 11, %6497
  br i1 %6498, label %6499, label %6520

6499:                                             ; preds = %6496
  %6500 = load ptr, ptr %141, align 8
  %6501 = getelementptr inbounds i8, ptr %6500, i64 11
  %6502 = load i8, ptr %6501, align 1
  store i8 %6502, ptr %154, align 1
  %6503 = load i8, ptr %154, align 1
  %6504 = sext i8 %6503 to i32
  %6505 = icmp slt i32 %6504, 32
  br i1 %6505, label %6518, label %6506

6506:                                             ; preds = %6499
  %6507 = load i8, ptr %154, align 1
  %6508 = sext i8 %6507 to i32
  %6509 = icmp sgt i32 %6508, 126
  br i1 %6509, label %6518, label %6510

6510:                                             ; preds = %6506
  %6511 = load i8, ptr %154, align 1
  %6512 = sext i8 %6511 to i32
  %6513 = icmp eq i32 %6512, 34
  br i1 %6513, label %6518, label %6514

6514:                                             ; preds = %6510
  %6515 = load i8, ptr %154, align 1
  %6516 = sext i8 %6515 to i32
  %6517 = icmp eq i32 %6516, 92
  br i1 %6517, label %6518, label %6519

6518:                                             ; preds = %6514, %6510, %6506, %6499
  store i1 false, ptr %140, align 1
  br label %7002

6519:                                             ; preds = %6514
  br label %6520

6520:                                             ; preds = %6519, %6496
  %6521 = load i64, ptr %142, align 8
  %6522 = icmp ult i64 12, %6521
  br i1 %6522, label %6523, label %6544

6523:                                             ; preds = %6520
  %6524 = load ptr, ptr %141, align 8
  %6525 = getelementptr inbounds i8, ptr %6524, i64 12
  %6526 = load i8, ptr %6525, align 1
  store i8 %6526, ptr %155, align 1
  %6527 = load i8, ptr %155, align 1
  %6528 = sext i8 %6527 to i32
  %6529 = icmp slt i32 %6528, 32
  br i1 %6529, label %6542, label %6530

6530:                                             ; preds = %6523
  %6531 = load i8, ptr %155, align 1
  %6532 = sext i8 %6531 to i32
  %6533 = icmp sgt i32 %6532, 126
  br i1 %6533, label %6542, label %6534

6534:                                             ; preds = %6530
  %6535 = load i8, ptr %155, align 1
  %6536 = sext i8 %6535 to i32
  %6537 = icmp eq i32 %6536, 34
  br i1 %6537, label %6542, label %6538

6538:                                             ; preds = %6534
  %6539 = load i8, ptr %155, align 1
  %6540 = sext i8 %6539 to i32
  %6541 = icmp eq i32 %6540, 92
  br i1 %6541, label %6542, label %6543

6542:                                             ; preds = %6538, %6534, %6530, %6523
  store i1 false, ptr %140, align 1
  br label %7002

6543:                                             ; preds = %6538
  br label %6544

6544:                                             ; preds = %6543, %6520
  %6545 = load i64, ptr %142, align 8
  %6546 = icmp ult i64 13, %6545
  br i1 %6546, label %6547, label %6568

6547:                                             ; preds = %6544
  %6548 = load ptr, ptr %141, align 8
  %6549 = getelementptr inbounds i8, ptr %6548, i64 13
  %6550 = load i8, ptr %6549, align 1
  store i8 %6550, ptr %156, align 1
  %6551 = load i8, ptr %156, align 1
  %6552 = sext i8 %6551 to i32
  %6553 = icmp slt i32 %6552, 32
  br i1 %6553, label %6566, label %6554

6554:                                             ; preds = %6547
  %6555 = load i8, ptr %156, align 1
  %6556 = sext i8 %6555 to i32
  %6557 = icmp sgt i32 %6556, 126
  br i1 %6557, label %6566, label %6558

6558:                                             ; preds = %6554
  %6559 = load i8, ptr %156, align 1
  %6560 = sext i8 %6559 to i32
  %6561 = icmp eq i32 %6560, 34
  br i1 %6561, label %6566, label %6562

6562:                                             ; preds = %6558
  %6563 = load i8, ptr %156, align 1
  %6564 = sext i8 %6563 to i32
  %6565 = icmp eq i32 %6564, 92
  br i1 %6565, label %6566, label %6567

6566:                                             ; preds = %6562, %6558, %6554, %6547
  store i1 false, ptr %140, align 1
  br label %7002

6567:                                             ; preds = %6562
  br label %6568

6568:                                             ; preds = %6567, %6544
  %6569 = load i64, ptr %142, align 8
  %6570 = icmp ult i64 14, %6569
  br i1 %6570, label %6571, label %6592

6571:                                             ; preds = %6568
  %6572 = load ptr, ptr %141, align 8
  %6573 = getelementptr inbounds i8, ptr %6572, i64 14
  %6574 = load i8, ptr %6573, align 1
  store i8 %6574, ptr %157, align 1
  %6575 = load i8, ptr %157, align 1
  %6576 = sext i8 %6575 to i32
  %6577 = icmp slt i32 %6576, 32
  br i1 %6577, label %6590, label %6578

6578:                                             ; preds = %6571
  %6579 = load i8, ptr %157, align 1
  %6580 = sext i8 %6579 to i32
  %6581 = icmp sgt i32 %6580, 126
  br i1 %6581, label %6590, label %6582

6582:                                             ; preds = %6578
  %6583 = load i8, ptr %157, align 1
  %6584 = sext i8 %6583 to i32
  %6585 = icmp eq i32 %6584, 34
  br i1 %6585, label %6590, label %6586

6586:                                             ; preds = %6582
  %6587 = load i8, ptr %157, align 1
  %6588 = sext i8 %6587 to i32
  %6589 = icmp eq i32 %6588, 92
  br i1 %6589, label %6590, label %6591

6590:                                             ; preds = %6586, %6582, %6578, %6571
  store i1 false, ptr %140, align 1
  br label %7002

6591:                                             ; preds = %6586
  br label %6592

6592:                                             ; preds = %6591, %6568
  %6593 = load i64, ptr %142, align 8
  %6594 = icmp ult i64 15, %6593
  br i1 %6594, label %6595, label %6616

6595:                                             ; preds = %6592
  %6596 = load ptr, ptr %141, align 8
  %6597 = getelementptr inbounds i8, ptr %6596, i64 15
  %6598 = load i8, ptr %6597, align 1
  store i8 %6598, ptr %158, align 1
  %6599 = load i8, ptr %158, align 1
  %6600 = sext i8 %6599 to i32
  %6601 = icmp slt i32 %6600, 32
  br i1 %6601, label %6614, label %6602

6602:                                             ; preds = %6595
  %6603 = load i8, ptr %158, align 1
  %6604 = sext i8 %6603 to i32
  %6605 = icmp sgt i32 %6604, 126
  br i1 %6605, label %6614, label %6606

6606:                                             ; preds = %6602
  %6607 = load i8, ptr %158, align 1
  %6608 = sext i8 %6607 to i32
  %6609 = icmp eq i32 %6608, 34
  br i1 %6609, label %6614, label %6610

6610:                                             ; preds = %6606
  %6611 = load i8, ptr %158, align 1
  %6612 = sext i8 %6611 to i32
  %6613 = icmp eq i32 %6612, 92
  br i1 %6613, label %6614, label %6615

6614:                                             ; preds = %6610, %6606, %6602, %6595
  store i1 false, ptr %140, align 1
  br label %7002

6615:                                             ; preds = %6610
  br label %6616

6616:                                             ; preds = %6615, %6592
  %6617 = load i64, ptr %142, align 8
  %6618 = icmp ult i64 16, %6617
  br i1 %6618, label %6619, label %6640

6619:                                             ; preds = %6616
  %6620 = load ptr, ptr %141, align 8
  %6621 = getelementptr inbounds i8, ptr %6620, i64 16
  %6622 = load i8, ptr %6621, align 1
  store i8 %6622, ptr %159, align 1
  %6623 = load i8, ptr %159, align 1
  %6624 = sext i8 %6623 to i32
  %6625 = icmp slt i32 %6624, 32
  br i1 %6625, label %6638, label %6626

6626:                                             ; preds = %6619
  %6627 = load i8, ptr %159, align 1
  %6628 = sext i8 %6627 to i32
  %6629 = icmp sgt i32 %6628, 126
  br i1 %6629, label %6638, label %6630

6630:                                             ; preds = %6626
  %6631 = load i8, ptr %159, align 1
  %6632 = sext i8 %6631 to i32
  %6633 = icmp eq i32 %6632, 34
  br i1 %6633, label %6638, label %6634

6634:                                             ; preds = %6630
  %6635 = load i8, ptr %159, align 1
  %6636 = sext i8 %6635 to i32
  %6637 = icmp eq i32 %6636, 92
  br i1 %6637, label %6638, label %6639

6638:                                             ; preds = %6634, %6630, %6626, %6619
  store i1 false, ptr %140, align 1
  br label %7002

6639:                                             ; preds = %6634
  br label %6640

6640:                                             ; preds = %6639, %6616
  %6641 = load i64, ptr %142, align 8
  %6642 = icmp ult i64 17, %6641
  br i1 %6642, label %6643, label %6664

6643:                                             ; preds = %6640
  %6644 = load ptr, ptr %141, align 8
  %6645 = getelementptr inbounds i8, ptr %6644, i64 17
  %6646 = load i8, ptr %6645, align 1
  store i8 %6646, ptr %160, align 1
  %6647 = load i8, ptr %160, align 1
  %6648 = sext i8 %6647 to i32
  %6649 = icmp slt i32 %6648, 32
  br i1 %6649, label %6662, label %6650

6650:                                             ; preds = %6643
  %6651 = load i8, ptr %160, align 1
  %6652 = sext i8 %6651 to i32
  %6653 = icmp sgt i32 %6652, 126
  br i1 %6653, label %6662, label %6654

6654:                                             ; preds = %6650
  %6655 = load i8, ptr %160, align 1
  %6656 = sext i8 %6655 to i32
  %6657 = icmp eq i32 %6656, 34
  br i1 %6657, label %6662, label %6658

6658:                                             ; preds = %6654
  %6659 = load i8, ptr %160, align 1
  %6660 = sext i8 %6659 to i32
  %6661 = icmp eq i32 %6660, 92
  br i1 %6661, label %6662, label %6663

6662:                                             ; preds = %6658, %6654, %6650, %6643
  store i1 false, ptr %140, align 1
  br label %7002

6663:                                             ; preds = %6658
  br label %6664

6664:                                             ; preds = %6663, %6640
  %6665 = load i64, ptr %142, align 8
  %6666 = icmp ult i64 18, %6665
  br i1 %6666, label %6667, label %6688

6667:                                             ; preds = %6664
  %6668 = load ptr, ptr %141, align 8
  %6669 = getelementptr inbounds i8, ptr %6668, i64 18
  %6670 = load i8, ptr %6669, align 1
  store i8 %6670, ptr %161, align 1
  %6671 = load i8, ptr %161, align 1
  %6672 = sext i8 %6671 to i32
  %6673 = icmp slt i32 %6672, 32
  br i1 %6673, label %6686, label %6674

6674:                                             ; preds = %6667
  %6675 = load i8, ptr %161, align 1
  %6676 = sext i8 %6675 to i32
  %6677 = icmp sgt i32 %6676, 126
  br i1 %6677, label %6686, label %6678

6678:                                             ; preds = %6674
  %6679 = load i8, ptr %161, align 1
  %6680 = sext i8 %6679 to i32
  %6681 = icmp eq i32 %6680, 34
  br i1 %6681, label %6686, label %6682

6682:                                             ; preds = %6678
  %6683 = load i8, ptr %161, align 1
  %6684 = sext i8 %6683 to i32
  %6685 = icmp eq i32 %6684, 92
  br i1 %6685, label %6686, label %6687

6686:                                             ; preds = %6682, %6678, %6674, %6667
  store i1 false, ptr %140, align 1
  br label %7002

6687:                                             ; preds = %6682
  br label %6688

6688:                                             ; preds = %6687, %6664
  %6689 = load i64, ptr %142, align 8
  %6690 = icmp ult i64 19, %6689
  br i1 %6690, label %6691, label %6712

6691:                                             ; preds = %6688
  %6692 = load ptr, ptr %141, align 8
  %6693 = getelementptr inbounds i8, ptr %6692, i64 19
  %6694 = load i8, ptr %6693, align 1
  store i8 %6694, ptr %162, align 1
  %6695 = load i8, ptr %162, align 1
  %6696 = sext i8 %6695 to i32
  %6697 = icmp slt i32 %6696, 32
  br i1 %6697, label %6710, label %6698

6698:                                             ; preds = %6691
  %6699 = load i8, ptr %162, align 1
  %6700 = sext i8 %6699 to i32
  %6701 = icmp sgt i32 %6700, 126
  br i1 %6701, label %6710, label %6702

6702:                                             ; preds = %6698
  %6703 = load i8, ptr %162, align 1
  %6704 = sext i8 %6703 to i32
  %6705 = icmp eq i32 %6704, 34
  br i1 %6705, label %6710, label %6706

6706:                                             ; preds = %6702
  %6707 = load i8, ptr %162, align 1
  %6708 = sext i8 %6707 to i32
  %6709 = icmp eq i32 %6708, 92
  br i1 %6709, label %6710, label %6711

6710:                                             ; preds = %6706, %6702, %6698, %6691
  store i1 false, ptr %140, align 1
  br label %7002

6711:                                             ; preds = %6706
  br label %6712

6712:                                             ; preds = %6711, %6688
  %6713 = load i64, ptr %142, align 8
  %6714 = icmp ult i64 20, %6713
  br i1 %6714, label %6715, label %6736

6715:                                             ; preds = %6712
  %6716 = load ptr, ptr %141, align 8
  %6717 = getelementptr inbounds i8, ptr %6716, i64 20
  %6718 = load i8, ptr %6717, align 1
  store i8 %6718, ptr %163, align 1
  %6719 = load i8, ptr %163, align 1
  %6720 = sext i8 %6719 to i32
  %6721 = icmp slt i32 %6720, 32
  br i1 %6721, label %6734, label %6722

6722:                                             ; preds = %6715
  %6723 = load i8, ptr %163, align 1
  %6724 = sext i8 %6723 to i32
  %6725 = icmp sgt i32 %6724, 126
  br i1 %6725, label %6734, label %6726

6726:                                             ; preds = %6722
  %6727 = load i8, ptr %163, align 1
  %6728 = sext i8 %6727 to i32
  %6729 = icmp eq i32 %6728, 34
  br i1 %6729, label %6734, label %6730

6730:                                             ; preds = %6726
  %6731 = load i8, ptr %163, align 1
  %6732 = sext i8 %6731 to i32
  %6733 = icmp eq i32 %6732, 92
  br i1 %6733, label %6734, label %6735

6734:                                             ; preds = %6730, %6726, %6722, %6715
  store i1 false, ptr %140, align 1
  br label %7002

6735:                                             ; preds = %6730
  br label %6736

6736:                                             ; preds = %6735, %6712
  %6737 = load i64, ptr %142, align 8
  %6738 = icmp ult i64 21, %6737
  br i1 %6738, label %6739, label %6760

6739:                                             ; preds = %6736
  %6740 = load ptr, ptr %141, align 8
  %6741 = getelementptr inbounds i8, ptr %6740, i64 21
  %6742 = load i8, ptr %6741, align 1
  store i8 %6742, ptr %164, align 1
  %6743 = load i8, ptr %164, align 1
  %6744 = sext i8 %6743 to i32
  %6745 = icmp slt i32 %6744, 32
  br i1 %6745, label %6758, label %6746

6746:                                             ; preds = %6739
  %6747 = load i8, ptr %164, align 1
  %6748 = sext i8 %6747 to i32
  %6749 = icmp sgt i32 %6748, 126
  br i1 %6749, label %6758, label %6750

6750:                                             ; preds = %6746
  %6751 = load i8, ptr %164, align 1
  %6752 = sext i8 %6751 to i32
  %6753 = icmp eq i32 %6752, 34
  br i1 %6753, label %6758, label %6754

6754:                                             ; preds = %6750
  %6755 = load i8, ptr %164, align 1
  %6756 = sext i8 %6755 to i32
  %6757 = icmp eq i32 %6756, 92
  br i1 %6757, label %6758, label %6759

6758:                                             ; preds = %6754, %6750, %6746, %6739
  store i1 false, ptr %140, align 1
  br label %7002

6759:                                             ; preds = %6754
  br label %6760

6760:                                             ; preds = %6759, %6736
  %6761 = load i64, ptr %142, align 8
  %6762 = icmp ult i64 22, %6761
  br i1 %6762, label %6763, label %6784

6763:                                             ; preds = %6760
  %6764 = load ptr, ptr %141, align 8
  %6765 = getelementptr inbounds i8, ptr %6764, i64 22
  %6766 = load i8, ptr %6765, align 1
  store i8 %6766, ptr %165, align 1
  %6767 = load i8, ptr %165, align 1
  %6768 = sext i8 %6767 to i32
  %6769 = icmp slt i32 %6768, 32
  br i1 %6769, label %6782, label %6770

6770:                                             ; preds = %6763
  %6771 = load i8, ptr %165, align 1
  %6772 = sext i8 %6771 to i32
  %6773 = icmp sgt i32 %6772, 126
  br i1 %6773, label %6782, label %6774

6774:                                             ; preds = %6770
  %6775 = load i8, ptr %165, align 1
  %6776 = sext i8 %6775 to i32
  %6777 = icmp eq i32 %6776, 34
  br i1 %6777, label %6782, label %6778

6778:                                             ; preds = %6774
  %6779 = load i8, ptr %165, align 1
  %6780 = sext i8 %6779 to i32
  %6781 = icmp eq i32 %6780, 92
  br i1 %6781, label %6782, label %6783

6782:                                             ; preds = %6778, %6774, %6770, %6763
  store i1 false, ptr %140, align 1
  br label %7002

6783:                                             ; preds = %6778
  br label %6784

6784:                                             ; preds = %6783, %6760
  %6785 = load i64, ptr %142, align 8
  %6786 = icmp ult i64 23, %6785
  br i1 %6786, label %6787, label %6808

6787:                                             ; preds = %6784
  %6788 = load ptr, ptr %141, align 8
  %6789 = getelementptr inbounds i8, ptr %6788, i64 23
  %6790 = load i8, ptr %6789, align 1
  store i8 %6790, ptr %166, align 1
  %6791 = load i8, ptr %166, align 1
  %6792 = sext i8 %6791 to i32
  %6793 = icmp slt i32 %6792, 32
  br i1 %6793, label %6806, label %6794

6794:                                             ; preds = %6787
  %6795 = load i8, ptr %166, align 1
  %6796 = sext i8 %6795 to i32
  %6797 = icmp sgt i32 %6796, 126
  br i1 %6797, label %6806, label %6798

6798:                                             ; preds = %6794
  %6799 = load i8, ptr %166, align 1
  %6800 = sext i8 %6799 to i32
  %6801 = icmp eq i32 %6800, 34
  br i1 %6801, label %6806, label %6802

6802:                                             ; preds = %6798
  %6803 = load i8, ptr %166, align 1
  %6804 = sext i8 %6803 to i32
  %6805 = icmp eq i32 %6804, 92
  br i1 %6805, label %6806, label %6807

6806:                                             ; preds = %6802, %6798, %6794, %6787
  store i1 false, ptr %140, align 1
  br label %7002

6807:                                             ; preds = %6802
  br label %6808

6808:                                             ; preds = %6807, %6784
  %6809 = load i64, ptr %142, align 8
  %6810 = icmp ult i64 24, %6809
  br i1 %6810, label %6811, label %6832

6811:                                             ; preds = %6808
  %6812 = load ptr, ptr %141, align 8
  %6813 = getelementptr inbounds i8, ptr %6812, i64 24
  %6814 = load i8, ptr %6813, align 1
  store i8 %6814, ptr %167, align 1
  %6815 = load i8, ptr %167, align 1
  %6816 = sext i8 %6815 to i32
  %6817 = icmp slt i32 %6816, 32
  br i1 %6817, label %6830, label %6818

6818:                                             ; preds = %6811
  %6819 = load i8, ptr %167, align 1
  %6820 = sext i8 %6819 to i32
  %6821 = icmp sgt i32 %6820, 126
  br i1 %6821, label %6830, label %6822

6822:                                             ; preds = %6818
  %6823 = load i8, ptr %167, align 1
  %6824 = sext i8 %6823 to i32
  %6825 = icmp eq i32 %6824, 34
  br i1 %6825, label %6830, label %6826

6826:                                             ; preds = %6822
  %6827 = load i8, ptr %167, align 1
  %6828 = sext i8 %6827 to i32
  %6829 = icmp eq i32 %6828, 92
  br i1 %6829, label %6830, label %6831

6830:                                             ; preds = %6826, %6822, %6818, %6811
  store i1 false, ptr %140, align 1
  br label %7002

6831:                                             ; preds = %6826
  br label %6832

6832:                                             ; preds = %6831, %6808
  %6833 = load i64, ptr %142, align 8
  %6834 = icmp ult i64 25, %6833
  br i1 %6834, label %6835, label %6856

6835:                                             ; preds = %6832
  %6836 = load ptr, ptr %141, align 8
  %6837 = getelementptr inbounds i8, ptr %6836, i64 25
  %6838 = load i8, ptr %6837, align 1
  store i8 %6838, ptr %168, align 1
  %6839 = load i8, ptr %168, align 1
  %6840 = sext i8 %6839 to i32
  %6841 = icmp slt i32 %6840, 32
  br i1 %6841, label %6854, label %6842

6842:                                             ; preds = %6835
  %6843 = load i8, ptr %168, align 1
  %6844 = sext i8 %6843 to i32
  %6845 = icmp sgt i32 %6844, 126
  br i1 %6845, label %6854, label %6846

6846:                                             ; preds = %6842
  %6847 = load i8, ptr %168, align 1
  %6848 = sext i8 %6847 to i32
  %6849 = icmp eq i32 %6848, 34
  br i1 %6849, label %6854, label %6850

6850:                                             ; preds = %6846
  %6851 = load i8, ptr %168, align 1
  %6852 = sext i8 %6851 to i32
  %6853 = icmp eq i32 %6852, 92
  br i1 %6853, label %6854, label %6855

6854:                                             ; preds = %6850, %6846, %6842, %6835
  store i1 false, ptr %140, align 1
  br label %7002

6855:                                             ; preds = %6850
  br label %6856

6856:                                             ; preds = %6855, %6832
  %6857 = load i64, ptr %142, align 8
  %6858 = icmp ult i64 26, %6857
  br i1 %6858, label %6859, label %6880

6859:                                             ; preds = %6856
  %6860 = load ptr, ptr %141, align 8
  %6861 = getelementptr inbounds i8, ptr %6860, i64 26
  %6862 = load i8, ptr %6861, align 1
  store i8 %6862, ptr %169, align 1
  %6863 = load i8, ptr %169, align 1
  %6864 = sext i8 %6863 to i32
  %6865 = icmp slt i32 %6864, 32
  br i1 %6865, label %6878, label %6866

6866:                                             ; preds = %6859
  %6867 = load i8, ptr %169, align 1
  %6868 = sext i8 %6867 to i32
  %6869 = icmp sgt i32 %6868, 126
  br i1 %6869, label %6878, label %6870

6870:                                             ; preds = %6866
  %6871 = load i8, ptr %169, align 1
  %6872 = sext i8 %6871 to i32
  %6873 = icmp eq i32 %6872, 34
  br i1 %6873, label %6878, label %6874

6874:                                             ; preds = %6870
  %6875 = load i8, ptr %169, align 1
  %6876 = sext i8 %6875 to i32
  %6877 = icmp eq i32 %6876, 92
  br i1 %6877, label %6878, label %6879

6878:                                             ; preds = %6874, %6870, %6866, %6859
  store i1 false, ptr %140, align 1
  br label %7002

6879:                                             ; preds = %6874
  br label %6880

6880:                                             ; preds = %6879, %6856
  %6881 = load i64, ptr %142, align 8
  %6882 = icmp ult i64 27, %6881
  br i1 %6882, label %6883, label %6904

6883:                                             ; preds = %6880
  %6884 = load ptr, ptr %141, align 8
  %6885 = getelementptr inbounds i8, ptr %6884, i64 27
  %6886 = load i8, ptr %6885, align 1
  store i8 %6886, ptr %170, align 1
  %6887 = load i8, ptr %170, align 1
  %6888 = sext i8 %6887 to i32
  %6889 = icmp slt i32 %6888, 32
  br i1 %6889, label %6902, label %6890

6890:                                             ; preds = %6883
  %6891 = load i8, ptr %170, align 1
  %6892 = sext i8 %6891 to i32
  %6893 = icmp sgt i32 %6892, 126
  br i1 %6893, label %6902, label %6894

6894:                                             ; preds = %6890
  %6895 = load i8, ptr %170, align 1
  %6896 = sext i8 %6895 to i32
  %6897 = icmp eq i32 %6896, 34
  br i1 %6897, label %6902, label %6898

6898:                                             ; preds = %6894
  %6899 = load i8, ptr %170, align 1
  %6900 = sext i8 %6899 to i32
  %6901 = icmp eq i32 %6900, 92
  br i1 %6901, label %6902, label %6903

6902:                                             ; preds = %6898, %6894, %6890, %6883
  store i1 false, ptr %140, align 1
  br label %7002

6903:                                             ; preds = %6898
  br label %6904

6904:                                             ; preds = %6903, %6880
  %6905 = load i64, ptr %142, align 8
  %6906 = icmp ult i64 28, %6905
  br i1 %6906, label %6907, label %6928

6907:                                             ; preds = %6904
  %6908 = load ptr, ptr %141, align 8
  %6909 = getelementptr inbounds i8, ptr %6908, i64 28
  %6910 = load i8, ptr %6909, align 1
  store i8 %6910, ptr %171, align 1
  %6911 = load i8, ptr %171, align 1
  %6912 = sext i8 %6911 to i32
  %6913 = icmp slt i32 %6912, 32
  br i1 %6913, label %6926, label %6914

6914:                                             ; preds = %6907
  %6915 = load i8, ptr %171, align 1
  %6916 = sext i8 %6915 to i32
  %6917 = icmp sgt i32 %6916, 126
  br i1 %6917, label %6926, label %6918

6918:                                             ; preds = %6914
  %6919 = load i8, ptr %171, align 1
  %6920 = sext i8 %6919 to i32
  %6921 = icmp eq i32 %6920, 34
  br i1 %6921, label %6926, label %6922

6922:                                             ; preds = %6918
  %6923 = load i8, ptr %171, align 1
  %6924 = sext i8 %6923 to i32
  %6925 = icmp eq i32 %6924, 92
  br i1 %6925, label %6926, label %6927

6926:                                             ; preds = %6922, %6918, %6914, %6907
  store i1 false, ptr %140, align 1
  br label %7002

6927:                                             ; preds = %6922
  br label %6928

6928:                                             ; preds = %6927, %6904
  %6929 = load i64, ptr %142, align 8
  %6930 = icmp ult i64 29, %6929
  br i1 %6930, label %6931, label %6952

6931:                                             ; preds = %6928
  %6932 = load ptr, ptr %141, align 8
  %6933 = getelementptr inbounds i8, ptr %6932, i64 29
  %6934 = load i8, ptr %6933, align 1
  store i8 %6934, ptr %172, align 1
  %6935 = load i8, ptr %172, align 1
  %6936 = sext i8 %6935 to i32
  %6937 = icmp slt i32 %6936, 32
  br i1 %6937, label %6950, label %6938

6938:                                             ; preds = %6931
  %6939 = load i8, ptr %172, align 1
  %6940 = sext i8 %6939 to i32
  %6941 = icmp sgt i32 %6940, 126
  br i1 %6941, label %6950, label %6942

6942:                                             ; preds = %6938
  %6943 = load i8, ptr %172, align 1
  %6944 = sext i8 %6943 to i32
  %6945 = icmp eq i32 %6944, 34
  br i1 %6945, label %6950, label %6946

6946:                                             ; preds = %6942
  %6947 = load i8, ptr %172, align 1
  %6948 = sext i8 %6947 to i32
  %6949 = icmp eq i32 %6948, 92
  br i1 %6949, label %6950, label %6951

6950:                                             ; preds = %6946, %6942, %6938, %6931
  store i1 false, ptr %140, align 1
  br label %7002

6951:                                             ; preds = %6946
  br label %6952

6952:                                             ; preds = %6951, %6928
  %6953 = load i64, ptr %142, align 8
  %6954 = icmp ult i64 30, %6953
  br i1 %6954, label %6955, label %6976

6955:                                             ; preds = %6952
  %6956 = load ptr, ptr %141, align 8
  %6957 = getelementptr inbounds i8, ptr %6956, i64 30
  %6958 = load i8, ptr %6957, align 1
  store i8 %6958, ptr %173, align 1
  %6959 = load i8, ptr %173, align 1
  %6960 = sext i8 %6959 to i32
  %6961 = icmp slt i32 %6960, 32
  br i1 %6961, label %6974, label %6962

6962:                                             ; preds = %6955
  %6963 = load i8, ptr %173, align 1
  %6964 = sext i8 %6963 to i32
  %6965 = icmp sgt i32 %6964, 126
  br i1 %6965, label %6974, label %6966

6966:                                             ; preds = %6962
  %6967 = load i8, ptr %173, align 1
  %6968 = sext i8 %6967 to i32
  %6969 = icmp eq i32 %6968, 34
  br i1 %6969, label %6974, label %6970

6970:                                             ; preds = %6966
  %6971 = load i8, ptr %173, align 1
  %6972 = sext i8 %6971 to i32
  %6973 = icmp eq i32 %6972, 92
  br i1 %6973, label %6974, label %6975

6974:                                             ; preds = %6970, %6966, %6962, %6955
  store i1 false, ptr %140, align 1
  br label %7002

6975:                                             ; preds = %6970
  br label %6976

6976:                                             ; preds = %6975, %6952
  %6977 = load i64, ptr %142, align 8
  %6978 = icmp ult i64 31, %6977
  br i1 %6978, label %6979, label %7000

6979:                                             ; preds = %6976
  %6980 = load ptr, ptr %141, align 8
  %6981 = getelementptr inbounds i8, ptr %6980, i64 31
  %6982 = load i8, ptr %6981, align 1
  store i8 %6982, ptr %174, align 1
  %6983 = load i8, ptr %174, align 1
  %6984 = sext i8 %6983 to i32
  %6985 = icmp slt i32 %6984, 32
  br i1 %6985, label %6998, label %6986

6986:                                             ; preds = %6979
  %6987 = load i8, ptr %174, align 1
  %6988 = sext i8 %6987 to i32
  %6989 = icmp sgt i32 %6988, 126
  br i1 %6989, label %6998, label %6990

6990:                                             ; preds = %6986
  %6991 = load i8, ptr %174, align 1
  %6992 = sext i8 %6991 to i32
  %6993 = icmp eq i32 %6992, 34
  br i1 %6993, label %6998, label %6994

6994:                                             ; preds = %6990
  %6995 = load i8, ptr %174, align 1
  %6996 = sext i8 %6995 to i32
  %6997 = icmp eq i32 %6996, 92
  br i1 %6997, label %6998, label %6999

6998:                                             ; preds = %6994, %6990, %6986, %6979
  store i1 false, ptr %140, align 1
  br label %7002

6999:                                             ; preds = %6994
  br label %7000

7000:                                             ; preds = %6999, %6976
  store i1 true, ptr %140, align 1
  br label %7002

7001:                                             ; preds = %6230, %6223
  store i1 false, ptr %140, align 1
  br label %7002

7002:                                             ; preds = %6254, %6278, %6302, %6326, %6350, %6374, %6398, %6422, %6446, %6470, %6494, %6518, %6542, %6566, %6590, %6614, %6638, %6662, %6686, %6710, %6734, %6758, %6782, %6806, %6830, %6854, %6878, %6902, %6926, %6950, %6974, %6998, %7000, %7001
  %7003 = load i1, ptr %140, align 1
  %7004 = zext i1 %7003 to i8
  store i8 %7004, ptr %835, align 1
  %7005 = load i8, ptr %835, align 1
  %7006 = trunc i8 %7005 to i1
  %7007 = zext i1 %7006 to i64
  %7008 = select i1 %7006, i32 8, i32 0
  %7009 = trunc i32 %7008 to i8
  store i8 %7009, ptr %836, align 1
  %7010 = load ptr, ptr %831, align 8
  %7011 = load ptr, ptr %832, align 8
  %7012 = load i64, ptr %834, align 8
  store ptr %7010, ptr %65, align 8
  store ptr %7011, ptr %66, align 8
  store i64 %7012, ptr %67, align 8
  %7013 = load ptr, ptr %65, align 8
  %7014 = load i64, ptr %67, align 8
  store ptr %7013, ptr %59, align 8
  store i64 %7014, ptr %60, align 8
  %7015 = load ptr, ptr %59, align 8
  %7016 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7015, i32 0, i32 1
  store ptr %7016, ptr %62, align 8
  %7017 = load ptr, ptr %59, align 8
  %7018 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7017, i32 0, i32 2
  store ptr %7018, ptr %63, align 8
  %7019 = load i64, ptr %60, align 8
  %7020 = icmp eq i64 %7019, -1
  %7021 = xor i1 %7020, true
  %7022 = zext i1 %7020 to i32
  %7023 = sext i32 %7022 to i64
  br i1 %7020, label %7024, label %7025

7024:                                             ; preds = %7002
  store ptr null, ptr %58, align 8
  br label %7060

7025:                                             ; preds = %7002
  %7026 = load ptr, ptr %63, align 8
  %7027 = getelementptr inbounds nuw %struct.yyjson_str_pool, ptr %7026, i32 0, i32 1
  %7028 = load ptr, ptr %7027, align 8
  %7029 = load ptr, ptr %63, align 8
  %7030 = load ptr, ptr %7029, align 8
  %7031 = ptrtoint ptr %7028 to i64
  %7032 = ptrtoint ptr %7030 to i64
  %7033 = sub i64 %7031, %7032
  %7034 = load i64, ptr %60, align 8
  %7035 = icmp ule i64 %7033, %7034
  %7036 = xor i1 %7035, true
  %7037 = zext i1 %7035 to i32
  %7038 = sext i32 %7037 to i64
  br i1 %7035, label %7039, label %7051

7039:                                             ; preds = %7025
  %7040 = load ptr, ptr %63, align 8
  %7041 = load ptr, ptr %62, align 8
  %7042 = load i64, ptr %60, align 8
  %7043 = add i64 %7042, 1
  %7044 = call zeroext i1 @unsafe_yyjson_str_pool_grow(ptr noundef %7040, ptr noundef %7041, i64 noundef %7043)
  %7045 = xor i1 %7044, true
  %7046 = xor i1 %7044, true
  %7047 = zext i1 %7046 to i32
  %7048 = sext i32 %7047 to i64
  br i1 %7046, label %7049, label %7050

7049:                                             ; preds = %7039
  store ptr null, ptr %58, align 8
  br label %7060

7050:                                             ; preds = %7039
  br label %7051

7051:                                             ; preds = %7050, %7025
  %7052 = load ptr, ptr %63, align 8
  %7053 = load ptr, ptr %7052, align 8
  store ptr %7053, ptr %61, align 8
  %7054 = load ptr, ptr %61, align 8
  %7055 = load i64, ptr %60, align 8
  %7056 = getelementptr inbounds nuw i8, ptr %7054, i64 %7055
  %7057 = getelementptr inbounds i8, ptr %7056, i64 1
  %7058 = load ptr, ptr %63, align 8
  store ptr %7057, ptr %7058, align 8
  %7059 = load ptr, ptr %61, align 8
  store ptr %7059, ptr %58, align 8
  br label %7060

7060:                                             ; preds = %7024, %7049, %7051
  %7061 = load ptr, ptr %58, align 8
  store ptr %7061, ptr %68, align 8
  %7062 = load ptr, ptr %68, align 8
  %7063 = icmp ne ptr %7062, null
  %7064 = xor i1 %7063, true
  %7065 = xor i1 %7063, true
  %7066 = zext i1 %7065 to i32
  %7067 = sext i32 %7066 to i64
  br i1 %7065, label %7068, label %7069

7068:                                             ; preds = %7060
  store ptr null, ptr %64, align 8
  br label %7077

7069:                                             ; preds = %7060
  %7070 = load ptr, ptr %68, align 8
  %7071 = load ptr, ptr %66, align 8
  %7072 = load i64, ptr %67, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %7070, ptr align 1 %7071, i64 %7072, i1 false)
  %7073 = load ptr, ptr %68, align 8
  %7074 = load i64, ptr %67, align 8
  %7075 = getelementptr inbounds nuw i8, ptr %7073, i64 %7074
  store i8 0, ptr %7075, align 1
  %7076 = load ptr, ptr %68, align 8
  store ptr %7076, ptr %64, align 8
  br label %7077

7077:                                             ; preds = %7068, %7069
  %7078 = load ptr, ptr %64, align 8
  store ptr %7078, ptr %837, align 8
  %7079 = load ptr, ptr %837, align 8
  %7080 = icmp ne ptr %7079, null
  %7081 = xor i1 %7080, true
  %7082 = xor i1 %7080, true
  %7083 = zext i1 %7082 to i32
  %7084 = sext i32 %7083 to i64
  br i1 %7082, label %7085, label %7086

7085:                                             ; preds = %7077
  store ptr null, ptr %830, align 8
  br label %7108

7086:                                             ; preds = %7077
  %7087 = load ptr, ptr %833, align 8
  %7088 = load i8, ptr %836, align 1
  %7089 = load i64, ptr %834, align 8
  store ptr %7087, ptr %90, align 8
  store i8 5, ptr %91, align 1
  store i8 %7088, ptr %92, align 1
  store i64 %7089, ptr %93, align 8
  %7090 = load i64, ptr %93, align 8
  %7091 = shl i64 %7090, 8
  store i64 %7091, ptr %94, align 8
  %7092 = load i8, ptr %91, align 1
  %7093 = zext i8 %7092 to i32
  %7094 = load i8, ptr %92, align 1
  %7095 = zext i8 %7094 to i32
  %7096 = or i32 %7093, %7095
  %7097 = sext i32 %7096 to i64
  %7098 = load i64, ptr %94, align 8
  %7099 = or i64 %7098, %7097
  store i64 %7099, ptr %94, align 8
  %7100 = load i64, ptr %94, align 8
  %7101 = load ptr, ptr %90, align 8
  store i64 %7100, ptr %7101, align 8
  %7102 = load ptr, ptr %837, align 8
  %7103 = load ptr, ptr %833, align 8
  %7104 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7103, i32 0, i32 1
  store ptr %7102, ptr %7104, align 8
  %7105 = load ptr, ptr %833, align 8
  store ptr %7105, ptr %830, align 8
  br label %7108

7106:                                             ; preds = %6216
  br label %7107

7107:                                             ; preds = %7106, %6172
  store ptr null, ptr %830, align 8
  br label %7108

7108:                                             ; preds = %7085, %7086, %7107
  %7109 = load ptr, ptr %830, align 8
  store ptr %5293, ptr %903, align 8
  store ptr %6162, ptr %904, align 8
  store ptr %7109, ptr %905, align 8
  %7110 = load ptr, ptr %903, align 8
  store ptr %7110, ptr %686, align 8
  %7111 = load ptr, ptr %686, align 8
  %7112 = icmp ne ptr %7111, null
  br i1 %7112, label %7113, label %7126

7113:                                             ; preds = %7108
  %7114 = load ptr, ptr %686, align 8
  store ptr %7114, ptr %612, align 8
  %7115 = load ptr, ptr %612, align 8
  store ptr %7115, ptr %598, align 8
  %7116 = load ptr, ptr %598, align 8
  %7117 = load i64, ptr %7116, align 8
  %7118 = trunc i64 %7117 to i8
  store i8 %7118, ptr %599, align 1
  %7119 = load i8, ptr %599, align 1
  %7120 = zext i8 %7119 to i32
  %7121 = and i32 %7120, 7
  %7122 = trunc i32 %7121 to i8
  %7123 = zext i8 %7122 to i32
  %7124 = icmp eq i32 %7123, 7
  %7125 = zext i1 %7124 to i32
  br label %7127

7126:                                             ; preds = %7108
  br label %7127

7127:                                             ; preds = %7113, %7126
  %7128 = phi i32 [ %7125, %7113 ], [ 0, %7126 ]
  %7129 = icmp ne i32 %7128, 0
  br i1 %7129, label %7130, label %7154

7130:                                             ; preds = %7127
  %7131 = load ptr, ptr %904, align 8
  store ptr %7131, ptr %678, align 8
  %7132 = load ptr, ptr %678, align 8
  %7133 = icmp ne ptr %7132, null
  br i1 %7133, label %7134, label %7147

7134:                                             ; preds = %7130
  %7135 = load ptr, ptr %678, align 8
  store ptr %7135, ptr %582, align 8
  %7136 = load ptr, ptr %582, align 8
  store ptr %7136, ptr %580, align 8
  %7137 = load ptr, ptr %580, align 8
  %7138 = load i64, ptr %7137, align 8
  %7139 = trunc i64 %7138 to i8
  store i8 %7139, ptr %581, align 1
  %7140 = load i8, ptr %581, align 1
  %7141 = zext i8 %7140 to i32
  %7142 = and i32 %7141, 7
  %7143 = trunc i32 %7142 to i8
  %7144 = zext i8 %7143 to i32
  %7145 = icmp eq i32 %7144, 5
  %7146 = zext i1 %7145 to i32
  br label %7148

7147:                                             ; preds = %7130
  br label %7148

7148:                                             ; preds = %7134, %7147
  %7149 = phi i32 [ %7146, %7134 ], [ 0, %7147 ]
  %7150 = icmp ne i32 %7149, 0
  br i1 %7150, label %7151, label %7154

7151:                                             ; preds = %7148
  %7152 = load ptr, ptr %905, align 8
  %7153 = icmp ne ptr %7152, null
  br label %7154

7154:                                             ; preds = %7151, %7148, %7127
  %7155 = phi i1 [ false, %7148 ], [ false, %7127 ], [ %7153, %7151 ]
  %7156 = xor i1 %7155, true
  %7157 = zext i1 %7155 to i32
  %7158 = sext i32 %7157 to i64
  br i1 %7155, label %7159, label %7210

7159:                                             ; preds = %7154
  %7160 = load ptr, ptr %903, align 8
  %7161 = load ptr, ptr %904, align 8
  %7162 = load ptr, ptr %905, align 8
  %7163 = load ptr, ptr %903, align 8
  store ptr %7163, ptr %619, align 8
  %7164 = load ptr, ptr %619, align 8
  %7165 = load i64, ptr %7164, align 8
  %7166 = lshr i64 %7165, 8
  store ptr %7160, ptr %645, align 8
  store ptr %7161, ptr %646, align 8
  store ptr %7162, ptr %647, align 8
  store i64 %7166, ptr %648, align 8
  %7167 = load i64, ptr %648, align 8
  %7168 = icmp ne i64 %7167, 0
  %7169 = xor i1 %7168, true
  %7170 = zext i1 %7168 to i32
  %7171 = sext i32 %7170 to i64
  br i1 %7168, label %7172, label %7187

7172:                                             ; preds = %7159
  %7173 = load ptr, ptr %645, align 8
  %7174 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7173, i32 0, i32 1
  %7175 = load ptr, ptr %7174, align 8
  %7176 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7175, i32 0, i32 2
  %7177 = load ptr, ptr %7176, align 8
  store ptr %7177, ptr %649, align 8
  %7178 = load ptr, ptr %649, align 8
  %7179 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7178, i32 0, i32 2
  %7180 = load ptr, ptr %7179, align 8
  store ptr %7180, ptr %650, align 8
  %7181 = load ptr, ptr %646, align 8
  %7182 = load ptr, ptr %649, align 8
  %7183 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7182, i32 0, i32 2
  store ptr %7181, ptr %7183, align 8
  %7184 = load ptr, ptr %650, align 8
  %7185 = load ptr, ptr %647, align 8
  %7186 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7185, i32 0, i32 2
  store ptr %7184, ptr %7186, align 8
  br label %7191

7187:                                             ; preds = %7159
  %7188 = load ptr, ptr %646, align 8
  %7189 = load ptr, ptr %647, align 8
  %7190 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7189, i32 0, i32 2
  store ptr %7188, ptr %7190, align 8
  br label %7191

7191:                                             ; preds = %7172, %7187
  %7192 = load ptr, ptr %647, align 8
  %7193 = load ptr, ptr %646, align 8
  %7194 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7193, i32 0, i32 2
  store ptr %7192, ptr %7194, align 8
  %7195 = load ptr, ptr %646, align 8
  %7196 = load ptr, ptr %645, align 8
  %7197 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7196, i32 0, i32 1
  store ptr %7195, ptr %7197, align 8
  %7198 = load ptr, ptr %645, align 8
  %7199 = load i64, ptr %648, align 8
  %7200 = add i64 %7199, 1
  store ptr %7198, ptr %556, align 8
  store i64 %7200, ptr %557, align 8
  %7201 = load ptr, ptr %556, align 8
  %7202 = load i64, ptr %7201, align 8
  %7203 = and i64 %7202, 255
  store i64 %7203, ptr %558, align 8
  %7204 = load i64, ptr %557, align 8
  %7205 = shl i64 %7204, 8
  %7206 = load i64, ptr %558, align 8
  %7207 = or i64 %7206, %7205
  store i64 %7207, ptr %558, align 8
  %7208 = load i64, ptr %558, align 8
  %7209 = load ptr, ptr %556, align 8
  store i64 %7208, ptr %7209, align 8
  store i1 true, ptr %902, align 1
  br label %7211

7210:                                             ; preds = %7154
  store i1 false, ptr %902, align 1
  br label %7211

7211:                                             ; preds = %7191, %7210
  %7212 = load i1, ptr %902, align 1
  %7213 = load ptr, ptr %938, align 8
  store ptr %7213, ptr %933, align 8
  %7214 = load ptr, ptr %933, align 8
  %7215 = icmp ne ptr %7214, null
  %7216 = xor i1 %7215, true
  %7217 = zext i1 %7215 to i32
  %7218 = sext i32 %7217 to i64
  br i1 %7215, label %7219, label %7269

7219:                                             ; preds = %7211
  %7220 = load ptr, ptr %933, align 8
  store ptr %7220, ptr %692, align 8
  store i64 1, ptr %693, align 8
  %7221 = load ptr, ptr %692, align 8
  %7222 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7221, i32 0, i32 1
  store ptr %7222, ptr %695, align 8
  %7223 = load ptr, ptr %692, align 8
  %7224 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7223, i32 0, i32 3
  store ptr %7224, ptr %696, align 8
  %7225 = load ptr, ptr %696, align 8
  %7226 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %7225, i32 0, i32 1
  %7227 = load ptr, ptr %7226, align 8
  %7228 = load ptr, ptr %696, align 8
  %7229 = load ptr, ptr %7228, align 8
  %7230 = ptrtoint ptr %7227 to i64
  %7231 = ptrtoint ptr %7229 to i64
  %7232 = sub i64 %7230, %7231
  %7233 = sdiv exact i64 %7232, 24
  %7234 = load i64, ptr %693, align 8
  %7235 = icmp ult i64 %7233, %7234
  %7236 = xor i1 %7235, true
  %7237 = zext i1 %7235 to i32
  %7238 = sext i32 %7237 to i64
  br i1 %7235, label %7239, label %7250

7239:                                             ; preds = %7219
  %7240 = load ptr, ptr %696, align 8
  %7241 = load ptr, ptr %695, align 8
  %7242 = load i64, ptr %693, align 8
  %7243 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %7240, ptr noundef %7241, i64 noundef %7242)
  %7244 = xor i1 %7243, true
  %7245 = xor i1 %7243, true
  %7246 = zext i1 %7245 to i32
  %7247 = sext i32 %7246 to i64
  br i1 %7245, label %7248, label %7249

7248:                                             ; preds = %7239
  store ptr null, ptr %691, align 8
  br label %7258

7249:                                             ; preds = %7239
  br label %7250

7250:                                             ; preds = %7249, %7219
  %7251 = load ptr, ptr %696, align 8
  %7252 = load ptr, ptr %7251, align 8
  store ptr %7252, ptr %694, align 8
  %7253 = load i64, ptr %693, align 8
  %7254 = load ptr, ptr %696, align 8
  %7255 = load ptr, ptr %7254, align 8
  %7256 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7255, i64 %7253
  store ptr %7256, ptr %7254, align 8
  %7257 = load ptr, ptr %694, align 8
  store ptr %7257, ptr %691, align 8
  br label %7258

7258:                                             ; preds = %7248, %7250
  %7259 = load ptr, ptr %691, align 8
  store ptr %7259, ptr %934, align 8
  %7260 = load ptr, ptr %934, align 8
  %7261 = icmp ne ptr %7260, null
  %7262 = xor i1 %7261, true
  %7263 = zext i1 %7261 to i32
  %7264 = sext i32 %7263 to i64
  br i1 %7261, label %7265, label %7268

7265:                                             ; preds = %7258
  %7266 = load ptr, ptr %934, align 8
  store i64 7, ptr %7266, align 8
  %7267 = load ptr, ptr %934, align 8
  store ptr %7267, ptr %932, align 8
  br label %7270

7268:                                             ; preds = %7258
  br label %7269

7269:                                             ; preds = %7268, %7211
  store ptr null, ptr %932, align 8
  br label %7270

7270:                                             ; preds = %7265, %7269
  %7271 = load ptr, ptr %932, align 8
  store ptr %7271, ptr %944, align 8
  %7272 = load ptr, ptr %938, align 8
  store ptr %7272, ptr %922, align 8
  %7273 = load ptr, ptr %922, align 8
  %7274 = icmp ne ptr %7273, null
  %7275 = xor i1 %7274, true
  %7276 = zext i1 %7274 to i32
  %7277 = sext i32 %7276 to i64
  br i1 %7274, label %7278, label %7328

7278:                                             ; preds = %7270
  %7279 = load ptr, ptr %922, align 8
  store ptr %7279, ptr %710, align 8
  store i64 1, ptr %711, align 8
  %7280 = load ptr, ptr %710, align 8
  %7281 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7280, i32 0, i32 1
  store ptr %7281, ptr %713, align 8
  %7282 = load ptr, ptr %710, align 8
  %7283 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7282, i32 0, i32 3
  store ptr %7283, ptr %714, align 8
  %7284 = load ptr, ptr %714, align 8
  %7285 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %7284, i32 0, i32 1
  %7286 = load ptr, ptr %7285, align 8
  %7287 = load ptr, ptr %714, align 8
  %7288 = load ptr, ptr %7287, align 8
  %7289 = ptrtoint ptr %7286 to i64
  %7290 = ptrtoint ptr %7288 to i64
  %7291 = sub i64 %7289, %7290
  %7292 = sdiv exact i64 %7291, 24
  %7293 = load i64, ptr %711, align 8
  %7294 = icmp ult i64 %7292, %7293
  %7295 = xor i1 %7294, true
  %7296 = zext i1 %7294 to i32
  %7297 = sext i32 %7296 to i64
  br i1 %7294, label %7298, label %7309

7298:                                             ; preds = %7278
  %7299 = load ptr, ptr %714, align 8
  %7300 = load ptr, ptr %713, align 8
  %7301 = load i64, ptr %711, align 8
  %7302 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %7299, ptr noundef %7300, i64 noundef %7301)
  %7303 = xor i1 %7302, true
  %7304 = xor i1 %7302, true
  %7305 = zext i1 %7304 to i32
  %7306 = sext i32 %7305 to i64
  br i1 %7304, label %7307, label %7308

7307:                                             ; preds = %7298
  store ptr null, ptr %709, align 8
  br label %7317

7308:                                             ; preds = %7298
  br label %7309

7309:                                             ; preds = %7308, %7278
  %7310 = load ptr, ptr %714, align 8
  %7311 = load ptr, ptr %7310, align 8
  store ptr %7311, ptr %712, align 8
  %7312 = load i64, ptr %711, align 8
  %7313 = load ptr, ptr %714, align 8
  %7314 = load ptr, ptr %7313, align 8
  %7315 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7314, i64 %7312
  store ptr %7315, ptr %7313, align 8
  %7316 = load ptr, ptr %712, align 8
  store ptr %7316, ptr %709, align 8
  br label %7317

7317:                                             ; preds = %7307, %7309
  %7318 = load ptr, ptr %709, align 8
  store ptr %7318, ptr %923, align 8
  %7319 = load ptr, ptr %923, align 8
  %7320 = icmp ne ptr %7319, null
  %7321 = xor i1 %7320, true
  %7322 = zext i1 %7320 to i32
  %7323 = sext i32 %7322 to i64
  br i1 %7320, label %7324, label %7327

7324:                                             ; preds = %7317
  %7325 = load ptr, ptr %923, align 8
  store i64 6, ptr %7325, align 8
  %7326 = load ptr, ptr %923, align 8
  store ptr %7326, ptr %921, align 8
  br label %7329

7327:                                             ; preds = %7317
  br label %7328

7328:                                             ; preds = %7327, %7270
  store ptr null, ptr %921, align 8
  br label %7329

7329:                                             ; preds = %7324, %7328
  %7330 = load ptr, ptr %921, align 8
  store ptr %7330, ptr %945, align 8
  %7331 = load ptr, ptr %938, align 8
  %7332 = load ptr, ptr %945, align 8
  %7333 = load ptr, ptr %942, align 8
  %7334 = getelementptr inbounds nuw %struct.Coord, ptr %7333, i32 0, i32 4
  %7335 = load i32, ptr %7334, align 8
  %7336 = sext i32 %7335 to i64
  store ptr %7331, ptr %826, align 8
  store ptr %7332, ptr %827, align 8
  store i64 %7336, ptr %828, align 8
  %7337 = load ptr, ptr %826, align 8
  %7338 = icmp ne ptr %7337, null
  br i1 %7338, label %7339, label %7360

7339:                                             ; preds = %7329
  %7340 = load ptr, ptr %827, align 8
  store ptr %7340, ptr %53, align 8
  %7341 = load ptr, ptr %53, align 8
  %7342 = icmp ne ptr %7341, null
  br i1 %7342, label %7343, label %7356

7343:                                             ; preds = %7339
  %7344 = load ptr, ptr %53, align 8
  store ptr %7344, ptr %42, align 8
  %7345 = load ptr, ptr %42, align 8
  store ptr %7345, ptr %40, align 8
  %7346 = load ptr, ptr %40, align 8
  %7347 = load i64, ptr %7346, align 8
  %7348 = trunc i64 %7347 to i8
  store i8 %7348, ptr %41, align 1
  %7349 = load i8, ptr %41, align 1
  %7350 = zext i8 %7349 to i32
  %7351 = and i32 %7350, 7
  %7352 = trunc i32 %7351 to i8
  %7353 = zext i8 %7352 to i32
  %7354 = icmp eq i32 %7353, 6
  %7355 = zext i1 %7354 to i32
  br label %7357

7356:                                             ; preds = %7339
  br label %7357

7357:                                             ; preds = %7343, %7356
  %7358 = phi i32 [ %7355, %7343 ], [ 0, %7356 ]
  %7359 = icmp ne i32 %7358, 0
  br label %7360

7360:                                             ; preds = %7357, %7329
  %7361 = phi i1 [ false, %7329 ], [ %7359, %7357 ]
  %7362 = xor i1 %7361, true
  %7363 = zext i1 %7361 to i32
  %7364 = sext i32 %7363 to i64
  br i1 %7361, label %7365, label %7516

7365:                                             ; preds = %7360
  %7366 = load ptr, ptr %826, align 8
  %7367 = load i64, ptr %828, align 8
  store ptr %7366, ptr %50, align 8
  store i64 %7367, ptr %51, align 8
  %7368 = load ptr, ptr %50, align 8
  %7369 = icmp ne ptr %7368, null
  %7370 = xor i1 %7369, true
  %7371 = zext i1 %7369 to i32
  %7372 = sext i32 %7371 to i64
  br i1 %7369, label %7373, label %7440

7373:                                             ; preds = %7365
  %7374 = load ptr, ptr %50, align 8
  store ptr %7374, ptr %44, align 8
  store i64 1, ptr %45, align 8
  %7375 = load ptr, ptr %44, align 8
  %7376 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7375, i32 0, i32 1
  store ptr %7376, ptr %47, align 8
  %7377 = load ptr, ptr %44, align 8
  %7378 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7377, i32 0, i32 3
  store ptr %7378, ptr %48, align 8
  %7379 = load ptr, ptr %48, align 8
  %7380 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %7379, i32 0, i32 1
  %7381 = load ptr, ptr %7380, align 8
  %7382 = load ptr, ptr %48, align 8
  %7383 = load ptr, ptr %7382, align 8
  %7384 = ptrtoint ptr %7381 to i64
  %7385 = ptrtoint ptr %7383 to i64
  %7386 = sub i64 %7384, %7385
  %7387 = sdiv exact i64 %7386, 24
  %7388 = load i64, ptr %45, align 8
  %7389 = icmp ult i64 %7387, %7388
  %7390 = xor i1 %7389, true
  %7391 = zext i1 %7389 to i32
  %7392 = sext i32 %7391 to i64
  br i1 %7389, label %7393, label %7404

7393:                                             ; preds = %7373
  %7394 = load ptr, ptr %48, align 8
  %7395 = load ptr, ptr %47, align 8
  %7396 = load i64, ptr %45, align 8
  %7397 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %7394, ptr noundef %7395, i64 noundef %7396)
  %7398 = xor i1 %7397, true
  %7399 = xor i1 %7397, true
  %7400 = zext i1 %7399 to i32
  %7401 = sext i32 %7400 to i64
  br i1 %7399, label %7402, label %7403

7402:                                             ; preds = %7393
  store ptr null, ptr %43, align 8
  br label %7412

7403:                                             ; preds = %7393
  br label %7404

7404:                                             ; preds = %7403, %7373
  %7405 = load ptr, ptr %48, align 8
  %7406 = load ptr, ptr %7405, align 8
  store ptr %7406, ptr %46, align 8
  %7407 = load i64, ptr %45, align 8
  %7408 = load ptr, ptr %48, align 8
  %7409 = load ptr, ptr %7408, align 8
  %7410 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7409, i64 %7407
  store ptr %7410, ptr %7408, align 8
  %7411 = load ptr, ptr %46, align 8
  store ptr %7411, ptr %43, align 8
  br label %7412

7412:                                             ; preds = %7404, %7402
  %7413 = load ptr, ptr %43, align 8
  store ptr %7413, ptr %52, align 8
  %7414 = load ptr, ptr %52, align 8
  %7415 = icmp ne ptr %7414, null
  %7416 = xor i1 %7415, true
  %7417 = zext i1 %7415 to i32
  %7418 = sext i32 %7417 to i64
  br i1 %7415, label %7419, label %7439

7419:                                             ; preds = %7412
  %7420 = load ptr, ptr %52, align 8
  %7421 = load i64, ptr %51, align 8
  store ptr %7420, ptr %26, align 8
  store i64 %7421, ptr %27, align 8
  %7422 = load ptr, ptr %26, align 8
  store ptr %7422, ptr %21, align 8
  store i8 4, ptr %22, align 1
  store i8 0, ptr %23, align 1
  store i64 0, ptr %24, align 8
  %7423 = load i64, ptr %24, align 8
  %7424 = shl i64 %7423, 8
  store i64 %7424, ptr %25, align 8
  %7425 = load i8, ptr %22, align 1
  %7426 = zext i8 %7425 to i32
  %7427 = load i8, ptr %23, align 1
  %7428 = zext i8 %7427 to i32
  %7429 = or i32 %7426, %7428
  %7430 = sext i32 %7429 to i64
  %7431 = load i64, ptr %25, align 8
  %7432 = or i64 %7431, %7430
  store i64 %7432, ptr %25, align 8
  %7433 = load i64, ptr %25, align 8
  %7434 = load ptr, ptr %21, align 8
  store i64 %7433, ptr %7434, align 8
  %7435 = load i64, ptr %27, align 8
  %7436 = load ptr, ptr %26, align 8
  %7437 = getelementptr inbounds nuw %struct.yyjson_val, ptr %7436, i32 0, i32 1
  store i64 %7435, ptr %7437, align 8
  %7438 = load ptr, ptr %52, align 8
  store ptr %7438, ptr %49, align 8
  br label %7441

7439:                                             ; preds = %7412
  br label %7440

7440:                                             ; preds = %7439, %7365
  store ptr null, ptr %49, align 8
  br label %7441

7441:                                             ; preds = %7419, %7440
  %7442 = load ptr, ptr %49, align 8
  store ptr %7442, ptr %829, align 8
  %7443 = load ptr, ptr %827, align 8
  %7444 = load ptr, ptr %829, align 8
  store ptr %7443, ptr %809, align 8
  store ptr %7444, ptr %810, align 8
  %7445 = load ptr, ptr %809, align 8
  store ptr %7445, ptr %56, align 8
  %7446 = load ptr, ptr %56, align 8
  %7447 = icmp ne ptr %7446, null
  br i1 %7447, label %7448, label %7461

7448:                                             ; preds = %7441
  %7449 = load ptr, ptr %56, align 8
  store ptr %7449, ptr %33, align 8
  %7450 = load ptr, ptr %33, align 8
  store ptr %7450, ptr %31, align 8
  %7451 = load ptr, ptr %31, align 8
  %7452 = load i64, ptr %7451, align 8
  %7453 = trunc i64 %7452 to i8
  store i8 %7453, ptr %32, align 1
  %7454 = load i8, ptr %32, align 1
  %7455 = zext i8 %7454 to i32
  %7456 = and i32 %7455, 7
  %7457 = trunc i32 %7456 to i8
  %7458 = zext i8 %7457 to i32
  %7459 = icmp eq i32 %7458, 6
  %7460 = zext i1 %7459 to i32
  br label %7462

7461:                                             ; preds = %7441
  br label %7462

7462:                                             ; preds = %7448, %7461
  %7463 = phi i32 [ %7460, %7448 ], [ 0, %7461 ]
  %7464 = icmp ne i32 %7463, 0
  br i1 %7464, label %7465, label %7468

7465:                                             ; preds = %7462
  %7466 = load ptr, ptr %810, align 8
  %7467 = icmp ne ptr %7466, null
  br label %7468

7468:                                             ; preds = %7465, %7462
  %7469 = phi i1 [ false, %7462 ], [ %7467, %7465 ]
  %7470 = xor i1 %7469, true
  %7471 = zext i1 %7469 to i32
  %7472 = sext i32 %7471 to i64
  br i1 %7469, label %7473, label %7513

7473:                                             ; preds = %7468
  %7474 = load ptr, ptr %809, align 8
  store ptr %7474, ptr %625, align 8
  %7475 = load ptr, ptr %625, align 8
  %7476 = load i64, ptr %7475, align 8
  %7477 = lshr i64 %7476, 8
  store i64 %7477, ptr %811, align 8
  %7478 = load ptr, ptr %809, align 8
  %7479 = load i64, ptr %811, align 8
  %7480 = add i64 %7479, 1
  store ptr %7478, ptr %538, align 8
  store i64 %7480, ptr %539, align 8
  %7481 = load ptr, ptr %538, align 8
  %7482 = load i64, ptr %7481, align 8
  %7483 = and i64 %7482, 255
  store i64 %7483, ptr %540, align 8
  %7484 = load i64, ptr %539, align 8
  %7485 = shl i64 %7484, 8
  %7486 = load i64, ptr %540, align 8
  %7487 = or i64 %7486, %7485
  store i64 %7487, ptr %540, align 8
  %7488 = load i64, ptr %540, align 8
  %7489 = load ptr, ptr %538, align 8
  store i64 %7488, ptr %7489, align 8
  %7490 = load i64, ptr %811, align 8
  %7491 = icmp eq i64 %7490, 0
  br i1 %7491, label %7492, label %7496

7492:                                             ; preds = %7473
  %7493 = load ptr, ptr %810, align 8
  %7494 = load ptr, ptr %810, align 8
  %7495 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7494, i32 0, i32 2
  store ptr %7493, ptr %7495, align 8
  br label %7509

7496:                                             ; preds = %7473
  %7497 = load ptr, ptr %809, align 8
  %7498 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7497, i32 0, i32 1
  %7499 = load ptr, ptr %7498, align 8
  store ptr %7499, ptr %812, align 8
  %7500 = load ptr, ptr %812, align 8
  %7501 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7500, i32 0, i32 2
  %7502 = load ptr, ptr %7501, align 8
  store ptr %7502, ptr %813, align 8
  %7503 = load ptr, ptr %810, align 8
  %7504 = load ptr, ptr %812, align 8
  %7505 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7504, i32 0, i32 2
  store ptr %7503, ptr %7505, align 8
  %7506 = load ptr, ptr %813, align 8
  %7507 = load ptr, ptr %810, align 8
  %7508 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7507, i32 0, i32 2
  store ptr %7506, ptr %7508, align 8
  br label %7509

7509:                                             ; preds = %7496, %7492
  %7510 = load ptr, ptr %810, align 8
  %7511 = load ptr, ptr %809, align 8
  %7512 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7511, i32 0, i32 1
  store ptr %7510, ptr %7512, align 8
  store i1 true, ptr %808, align 1
  br label %7514

7513:                                             ; preds = %7468
  store i1 false, ptr %808, align 1
  br label %7514

7514:                                             ; preds = %7509, %7513
  %7515 = load i1, ptr %808, align 1
  store i1 %7515, ptr %825, align 1
  br label %7517

7516:                                             ; preds = %7360
  store i1 false, ptr %825, align 1
  br label %7517

7517:                                             ; preds = %7514, %7516
  %7518 = load i1, ptr %825, align 1
  %7519 = load ptr, ptr %938, align 8
  %7520 = load ptr, ptr %945, align 8
  %7521 = load ptr, ptr %942, align 8
  %7522 = getelementptr inbounds nuw %struct.Coord, ptr %7521, i32 0, i32 5
  %7523 = load i8, ptr %7522, align 4
  %7524 = trunc i8 %7523 to i1
  store ptr %7519, ptr %821, align 8
  store ptr %7520, ptr %822, align 8
  %7525 = zext i1 %7524 to i8
  store i8 %7525, ptr %823, align 1
  %7526 = load ptr, ptr %821, align 8
  %7527 = icmp ne ptr %7526, null
  br i1 %7527, label %7528, label %7549

7528:                                             ; preds = %7517
  %7529 = load ptr, ptr %822, align 8
  store ptr %7529, ptr %54, align 8
  %7530 = load ptr, ptr %54, align 8
  %7531 = icmp ne ptr %7530, null
  br i1 %7531, label %7532, label %7545

7532:                                             ; preds = %7528
  %7533 = load ptr, ptr %54, align 8
  store ptr %7533, ptr %39, align 8
  %7534 = load ptr, ptr %39, align 8
  store ptr %7534, ptr %37, align 8
  %7535 = load ptr, ptr %37, align 8
  %7536 = load i64, ptr %7535, align 8
  %7537 = trunc i64 %7536 to i8
  store i8 %7537, ptr %38, align 1
  %7538 = load i8, ptr %38, align 1
  %7539 = zext i8 %7538 to i32
  %7540 = and i32 %7539, 7
  %7541 = trunc i32 %7540 to i8
  %7542 = zext i8 %7541 to i32
  %7543 = icmp eq i32 %7542, 6
  %7544 = zext i1 %7543 to i32
  br label %7546

7545:                                             ; preds = %7528
  br label %7546

7546:                                             ; preds = %7532, %7545
  %7547 = phi i32 [ %7544, %7532 ], [ 0, %7545 ]
  %7548 = icmp ne i32 %7547, 0
  br label %7549

7549:                                             ; preds = %7546, %7517
  %7550 = phi i1 [ false, %7517 ], [ %7548, %7546 ]
  %7551 = xor i1 %7550, true
  %7552 = zext i1 %7550 to i32
  %7553 = sext i32 %7552 to i64
  br i1 %7550, label %7554, label %7712

7554:                                             ; preds = %7549
  %7555 = load ptr, ptr %821, align 8
  %7556 = load i8, ptr %823, align 1
  %7557 = trunc i8 %7556 to i1
  store ptr %7555, ptr %18, align 8
  %7558 = zext i1 %7557 to i8
  store i8 %7558, ptr %19, align 1
  %7559 = load ptr, ptr %18, align 8
  %7560 = icmp ne ptr %7559, null
  %7561 = xor i1 %7560, true
  %7562 = zext i1 %7560 to i32
  %7563 = sext i32 %7562 to i64
  br i1 %7560, label %7564, label %7636

7564:                                             ; preds = %7554
  %7565 = load ptr, ptr %18, align 8
  store ptr %7565, ptr %12, align 8
  store i64 1, ptr %13, align 8
  %7566 = load ptr, ptr %12, align 8
  %7567 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7566, i32 0, i32 1
  store ptr %7567, ptr %15, align 8
  %7568 = load ptr, ptr %12, align 8
  %7569 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7568, i32 0, i32 3
  store ptr %7569, ptr %16, align 8
  %7570 = load ptr, ptr %16, align 8
  %7571 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %7570, i32 0, i32 1
  %7572 = load ptr, ptr %7571, align 8
  %7573 = load ptr, ptr %16, align 8
  %7574 = load ptr, ptr %7573, align 8
  %7575 = ptrtoint ptr %7572 to i64
  %7576 = ptrtoint ptr %7574 to i64
  %7577 = sub i64 %7575, %7576
  %7578 = sdiv exact i64 %7577, 24
  %7579 = load i64, ptr %13, align 8
  %7580 = icmp ult i64 %7578, %7579
  %7581 = xor i1 %7580, true
  %7582 = zext i1 %7580 to i32
  %7583 = sext i32 %7582 to i64
  br i1 %7580, label %7584, label %7595

7584:                                             ; preds = %7564
  %7585 = load ptr, ptr %16, align 8
  %7586 = load ptr, ptr %15, align 8
  %7587 = load i64, ptr %13, align 8
  %7588 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %7585, ptr noundef %7586, i64 noundef %7587)
  %7589 = xor i1 %7588, true
  %7590 = xor i1 %7588, true
  %7591 = zext i1 %7590 to i32
  %7592 = sext i32 %7591 to i64
  br i1 %7590, label %7593, label %7594

7593:                                             ; preds = %7584
  store ptr null, ptr %11, align 8
  br label %7603

7594:                                             ; preds = %7584
  br label %7595

7595:                                             ; preds = %7594, %7564
  %7596 = load ptr, ptr %16, align 8
  %7597 = load ptr, ptr %7596, align 8
  store ptr %7597, ptr %14, align 8
  %7598 = load i64, ptr %13, align 8
  %7599 = load ptr, ptr %16, align 8
  %7600 = load ptr, ptr %7599, align 8
  %7601 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7600, i64 %7598
  store ptr %7601, ptr %7599, align 8
  %7602 = load ptr, ptr %14, align 8
  store ptr %7602, ptr %11, align 8
  br label %7603

7603:                                             ; preds = %7595, %7593
  %7604 = load ptr, ptr %11, align 8
  store ptr %7604, ptr %20, align 8
  %7605 = load ptr, ptr %20, align 8
  %7606 = icmp ne ptr %7605, null
  %7607 = xor i1 %7606, true
  %7608 = zext i1 %7606 to i32
  %7609 = sext i32 %7608 to i64
  br i1 %7606, label %7610, label %7635

7610:                                             ; preds = %7603
  %7611 = load ptr, ptr %20, align 8
  %7612 = load i8, ptr %19, align 1
  %7613 = trunc i8 %7612 to i1
  store ptr %7611, ptr %8, align 8
  %7614 = zext i1 %7613 to i8
  store i8 %7614, ptr %9, align 1
  %7615 = load i8, ptr %9, align 1
  %7616 = trunc i8 %7615 to i1
  %7617 = zext i1 %7616 to i64
  %7618 = select i1 %7616, i32 8, i32 0
  %7619 = trunc i32 %7618 to i8
  store i8 %7619, ptr %10, align 1
  %7620 = load ptr, ptr %8, align 8
  %7621 = load i8, ptr %10, align 1
  store ptr %7620, ptr %3, align 8
  store i8 3, ptr %4, align 1
  store i8 %7621, ptr %5, align 1
  store i64 0, ptr %6, align 8
  %7622 = load i64, ptr %6, align 8
  %7623 = shl i64 %7622, 8
  store i64 %7623, ptr %7, align 8
  %7624 = load i8, ptr %4, align 1
  %7625 = zext i8 %7624 to i32
  %7626 = load i8, ptr %5, align 1
  %7627 = zext i8 %7626 to i32
  %7628 = or i32 %7625, %7627
  %7629 = sext i32 %7628 to i64
  %7630 = load i64, ptr %7, align 8
  %7631 = or i64 %7630, %7629
  store i64 %7631, ptr %7, align 8
  %7632 = load i64, ptr %7, align 8
  %7633 = load ptr, ptr %3, align 8
  store i64 %7632, ptr %7633, align 8
  %7634 = load ptr, ptr %20, align 8
  store ptr %7634, ptr %17, align 8
  br label %7637

7635:                                             ; preds = %7603
  br label %7636

7636:                                             ; preds = %7635, %7554
  store ptr null, ptr %17, align 8
  br label %7637

7637:                                             ; preds = %7610, %7636
  %7638 = load ptr, ptr %17, align 8
  store ptr %7638, ptr %824, align 8
  %7639 = load ptr, ptr %822, align 8
  %7640 = load ptr, ptr %824, align 8
  store ptr %7639, ptr %815, align 8
  store ptr %7640, ptr %816, align 8
  %7641 = load ptr, ptr %815, align 8
  store ptr %7641, ptr %55, align 8
  %7642 = load ptr, ptr %55, align 8
  %7643 = icmp ne ptr %7642, null
  br i1 %7643, label %7644, label %7657

7644:                                             ; preds = %7637
  %7645 = load ptr, ptr %55, align 8
  store ptr %7645, ptr %36, align 8
  %7646 = load ptr, ptr %36, align 8
  store ptr %7646, ptr %34, align 8
  %7647 = load ptr, ptr %34, align 8
  %7648 = load i64, ptr %7647, align 8
  %7649 = trunc i64 %7648 to i8
  store i8 %7649, ptr %35, align 1
  %7650 = load i8, ptr %35, align 1
  %7651 = zext i8 %7650 to i32
  %7652 = and i32 %7651, 7
  %7653 = trunc i32 %7652 to i8
  %7654 = zext i8 %7653 to i32
  %7655 = icmp eq i32 %7654, 6
  %7656 = zext i1 %7655 to i32
  br label %7658

7657:                                             ; preds = %7637
  br label %7658

7658:                                             ; preds = %7644, %7657
  %7659 = phi i32 [ %7656, %7644 ], [ 0, %7657 ]
  %7660 = icmp ne i32 %7659, 0
  br i1 %7660, label %7661, label %7664

7661:                                             ; preds = %7658
  %7662 = load ptr, ptr %816, align 8
  %7663 = icmp ne ptr %7662, null
  br label %7664

7664:                                             ; preds = %7661, %7658
  %7665 = phi i1 [ false, %7658 ], [ %7663, %7661 ]
  %7666 = xor i1 %7665, true
  %7667 = zext i1 %7665 to i32
  %7668 = sext i32 %7667 to i64
  br i1 %7665, label %7669, label %7709

7669:                                             ; preds = %7664
  %7670 = load ptr, ptr %815, align 8
  store ptr %7670, ptr %624, align 8
  %7671 = load ptr, ptr %624, align 8
  %7672 = load i64, ptr %7671, align 8
  %7673 = lshr i64 %7672, 8
  store i64 %7673, ptr %817, align 8
  %7674 = load ptr, ptr %815, align 8
  %7675 = load i64, ptr %817, align 8
  %7676 = add i64 %7675, 1
  store ptr %7674, ptr %535, align 8
  store i64 %7676, ptr %536, align 8
  %7677 = load ptr, ptr %535, align 8
  %7678 = load i64, ptr %7677, align 8
  %7679 = and i64 %7678, 255
  store i64 %7679, ptr %537, align 8
  %7680 = load i64, ptr %536, align 8
  %7681 = shl i64 %7680, 8
  %7682 = load i64, ptr %537, align 8
  %7683 = or i64 %7682, %7681
  store i64 %7683, ptr %537, align 8
  %7684 = load i64, ptr %537, align 8
  %7685 = load ptr, ptr %535, align 8
  store i64 %7684, ptr %7685, align 8
  %7686 = load i64, ptr %817, align 8
  %7687 = icmp eq i64 %7686, 0
  br i1 %7687, label %7688, label %7692

7688:                                             ; preds = %7669
  %7689 = load ptr, ptr %816, align 8
  %7690 = load ptr, ptr %816, align 8
  %7691 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7690, i32 0, i32 2
  store ptr %7689, ptr %7691, align 8
  br label %7705

7692:                                             ; preds = %7669
  %7693 = load ptr, ptr %815, align 8
  %7694 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7693, i32 0, i32 1
  %7695 = load ptr, ptr %7694, align 8
  store ptr %7695, ptr %818, align 8
  %7696 = load ptr, ptr %818, align 8
  %7697 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7696, i32 0, i32 2
  %7698 = load ptr, ptr %7697, align 8
  store ptr %7698, ptr %819, align 8
  %7699 = load ptr, ptr %816, align 8
  %7700 = load ptr, ptr %818, align 8
  %7701 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7700, i32 0, i32 2
  store ptr %7699, ptr %7701, align 8
  %7702 = load ptr, ptr %819, align 8
  %7703 = load ptr, ptr %816, align 8
  %7704 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7703, i32 0, i32 2
  store ptr %7702, ptr %7704, align 8
  br label %7705

7705:                                             ; preds = %7692, %7688
  %7706 = load ptr, ptr %816, align 8
  %7707 = load ptr, ptr %815, align 8
  %7708 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7707, i32 0, i32 1
  store ptr %7706, ptr %7708, align 8
  store i1 true, ptr %814, align 1
  br label %7710

7709:                                             ; preds = %7664
  store i1 false, ptr %814, align 1
  br label %7710

7710:                                             ; preds = %7705, %7709
  %7711 = load i1, ptr %814, align 1
  store i1 %7711, ptr %820, align 1
  br label %7713

7712:                                             ; preds = %7549
  store i1 false, ptr %820, align 1
  br label %7713

7713:                                             ; preds = %7710, %7712
  %7714 = load i1, ptr %820, align 1
  %7715 = load ptr, ptr %944, align 8
  %7716 = load ptr, ptr %938, align 8
  store ptr %7716, ptr %871, align 8
  store ptr @.str.6, ptr %872, align 8
  %7717 = load ptr, ptr %871, align 8
  %7718 = icmp ne ptr %7717, null
  br i1 %7718, label %7719, label %7722

7719:                                             ; preds = %7713
  %7720 = load ptr, ptr %872, align 8
  %7721 = icmp ne ptr %7720, null
  br label %7722

7722:                                             ; preds = %7719, %7713
  %7723 = phi i1 [ false, %7713 ], [ %7721, %7719 ]
  %7724 = xor i1 %7723, true
  %7725 = zext i1 %7723 to i32
  %7726 = sext i32 %7725 to i64
  br i1 %7723, label %7727, label %8582

7727:                                             ; preds = %7722
  %7728 = load ptr, ptr %871, align 8
  store ptr %7728, ptr %740, align 8
  store i64 1, ptr %741, align 8
  %7729 = load ptr, ptr %740, align 8
  %7730 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7729, i32 0, i32 1
  store ptr %7730, ptr %743, align 8
  %7731 = load ptr, ptr %740, align 8
  %7732 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %7731, i32 0, i32 3
  store ptr %7732, ptr %744, align 8
  %7733 = load ptr, ptr %744, align 8
  %7734 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %7733, i32 0, i32 1
  %7735 = load ptr, ptr %7734, align 8
  %7736 = load ptr, ptr %744, align 8
  %7737 = load ptr, ptr %7736, align 8
  %7738 = ptrtoint ptr %7735 to i64
  %7739 = ptrtoint ptr %7737 to i64
  %7740 = sub i64 %7738, %7739
  %7741 = sdiv exact i64 %7740, 24
  %7742 = load i64, ptr %741, align 8
  %7743 = icmp ult i64 %7741, %7742
  %7744 = xor i1 %7743, true
  %7745 = zext i1 %7743 to i32
  %7746 = sext i32 %7745 to i64
  br i1 %7743, label %7747, label %7758

7747:                                             ; preds = %7727
  %7748 = load ptr, ptr %744, align 8
  %7749 = load ptr, ptr %743, align 8
  %7750 = load i64, ptr %741, align 8
  %7751 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %7748, ptr noundef %7749, i64 noundef %7750)
  %7752 = xor i1 %7751, true
  %7753 = xor i1 %7751, true
  %7754 = zext i1 %7753 to i32
  %7755 = sext i32 %7754 to i64
  br i1 %7753, label %7756, label %7757

7756:                                             ; preds = %7747
  store ptr null, ptr %739, align 8
  br label %7766

7757:                                             ; preds = %7747
  br label %7758

7758:                                             ; preds = %7757, %7727
  %7759 = load ptr, ptr %744, align 8
  %7760 = load ptr, ptr %7759, align 8
  store ptr %7760, ptr %742, align 8
  %7761 = load i64, ptr %741, align 8
  %7762 = load ptr, ptr %744, align 8
  %7763 = load ptr, ptr %7762, align 8
  %7764 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %7763, i64 %7761
  store ptr %7764, ptr %7762, align 8
  %7765 = load ptr, ptr %742, align 8
  store ptr %7765, ptr %739, align 8
  br label %7766

7766:                                             ; preds = %7756, %7758
  %7767 = load ptr, ptr %739, align 8
  store ptr %7767, ptr %873, align 8
  %7768 = load ptr, ptr %873, align 8
  %7769 = icmp ne ptr %7768, null
  %7770 = xor i1 %7769, true
  %7771 = zext i1 %7769 to i32
  %7772 = sext i32 %7771 to i64
  br i1 %7769, label %7773, label %8581

7773:                                             ; preds = %7766
  %7774 = load ptr, ptr %873, align 8
  %7775 = load ptr, ptr %872, align 8
  store ptr %7774, ptr %505, align 8
  store ptr %7775, ptr %506, align 8
  %7776 = load ptr, ptr %506, align 8
  %7777 = call i64 @strlen(ptr noundef %7776)
  store i64 %7777, ptr %507, align 8
  %7778 = load ptr, ptr %506, align 8
  %7779 = load i64, ptr %507, align 8
  store ptr %7778, ptr %351, align 8
  store i64 %7779, ptr %352, align 8
  %7780 = load i64, ptr %352, align 8
  %7781 = call i1 @llvm.is.constant.i64(i64 %7780)
  br i1 %7781, label %7782, label %8553

7782:                                             ; preds = %7773
  %7783 = load i64, ptr %352, align 8
  %7784 = icmp ule i64 %7783, 32
  br i1 %7784, label %7785, label %8553

7785:                                             ; preds = %7782
  %7786 = load i64, ptr %352, align 8
  %7787 = icmp ult i64 0, %7786
  br i1 %7787, label %7788, label %7808

7788:                                             ; preds = %7785
  %7789 = load ptr, ptr %351, align 8
  %7790 = load i8, ptr %7789, align 1
  store i8 %7790, ptr %353, align 1
  %7791 = load i8, ptr %353, align 1
  %7792 = sext i8 %7791 to i32
  %7793 = icmp slt i32 %7792, 32
  br i1 %7793, label %7806, label %7794

7794:                                             ; preds = %7788
  %7795 = load i8, ptr %353, align 1
  %7796 = sext i8 %7795 to i32
  %7797 = icmp sgt i32 %7796, 126
  br i1 %7797, label %7806, label %7798

7798:                                             ; preds = %7794
  %7799 = load i8, ptr %353, align 1
  %7800 = sext i8 %7799 to i32
  %7801 = icmp eq i32 %7800, 34
  br i1 %7801, label %7806, label %7802

7802:                                             ; preds = %7798
  %7803 = load i8, ptr %353, align 1
  %7804 = sext i8 %7803 to i32
  %7805 = icmp eq i32 %7804, 92
  br i1 %7805, label %7806, label %7807

7806:                                             ; preds = %7802, %7798, %7794, %7788
  store i1 false, ptr %350, align 1
  br label %8554

7807:                                             ; preds = %7802
  br label %7808

7808:                                             ; preds = %7807, %7785
  %7809 = load i64, ptr %352, align 8
  %7810 = icmp ult i64 1, %7809
  br i1 %7810, label %7811, label %7832

7811:                                             ; preds = %7808
  %7812 = load ptr, ptr %351, align 8
  %7813 = getelementptr inbounds i8, ptr %7812, i64 1
  %7814 = load i8, ptr %7813, align 1
  store i8 %7814, ptr %354, align 1
  %7815 = load i8, ptr %354, align 1
  %7816 = sext i8 %7815 to i32
  %7817 = icmp slt i32 %7816, 32
  br i1 %7817, label %7830, label %7818

7818:                                             ; preds = %7811
  %7819 = load i8, ptr %354, align 1
  %7820 = sext i8 %7819 to i32
  %7821 = icmp sgt i32 %7820, 126
  br i1 %7821, label %7830, label %7822

7822:                                             ; preds = %7818
  %7823 = load i8, ptr %354, align 1
  %7824 = sext i8 %7823 to i32
  %7825 = icmp eq i32 %7824, 34
  br i1 %7825, label %7830, label %7826

7826:                                             ; preds = %7822
  %7827 = load i8, ptr %354, align 1
  %7828 = sext i8 %7827 to i32
  %7829 = icmp eq i32 %7828, 92
  br i1 %7829, label %7830, label %7831

7830:                                             ; preds = %7826, %7822, %7818, %7811
  store i1 false, ptr %350, align 1
  br label %8554

7831:                                             ; preds = %7826
  br label %7832

7832:                                             ; preds = %7831, %7808
  %7833 = load i64, ptr %352, align 8
  %7834 = icmp ult i64 2, %7833
  br i1 %7834, label %7835, label %7856

7835:                                             ; preds = %7832
  %7836 = load ptr, ptr %351, align 8
  %7837 = getelementptr inbounds i8, ptr %7836, i64 2
  %7838 = load i8, ptr %7837, align 1
  store i8 %7838, ptr %355, align 1
  %7839 = load i8, ptr %355, align 1
  %7840 = sext i8 %7839 to i32
  %7841 = icmp slt i32 %7840, 32
  br i1 %7841, label %7854, label %7842

7842:                                             ; preds = %7835
  %7843 = load i8, ptr %355, align 1
  %7844 = sext i8 %7843 to i32
  %7845 = icmp sgt i32 %7844, 126
  br i1 %7845, label %7854, label %7846

7846:                                             ; preds = %7842
  %7847 = load i8, ptr %355, align 1
  %7848 = sext i8 %7847 to i32
  %7849 = icmp eq i32 %7848, 34
  br i1 %7849, label %7854, label %7850

7850:                                             ; preds = %7846
  %7851 = load i8, ptr %355, align 1
  %7852 = sext i8 %7851 to i32
  %7853 = icmp eq i32 %7852, 92
  br i1 %7853, label %7854, label %7855

7854:                                             ; preds = %7850, %7846, %7842, %7835
  store i1 false, ptr %350, align 1
  br label %8554

7855:                                             ; preds = %7850
  br label %7856

7856:                                             ; preds = %7855, %7832
  %7857 = load i64, ptr %352, align 8
  %7858 = icmp ult i64 3, %7857
  br i1 %7858, label %7859, label %7880

7859:                                             ; preds = %7856
  %7860 = load ptr, ptr %351, align 8
  %7861 = getelementptr inbounds i8, ptr %7860, i64 3
  %7862 = load i8, ptr %7861, align 1
  store i8 %7862, ptr %356, align 1
  %7863 = load i8, ptr %356, align 1
  %7864 = sext i8 %7863 to i32
  %7865 = icmp slt i32 %7864, 32
  br i1 %7865, label %7878, label %7866

7866:                                             ; preds = %7859
  %7867 = load i8, ptr %356, align 1
  %7868 = sext i8 %7867 to i32
  %7869 = icmp sgt i32 %7868, 126
  br i1 %7869, label %7878, label %7870

7870:                                             ; preds = %7866
  %7871 = load i8, ptr %356, align 1
  %7872 = sext i8 %7871 to i32
  %7873 = icmp eq i32 %7872, 34
  br i1 %7873, label %7878, label %7874

7874:                                             ; preds = %7870
  %7875 = load i8, ptr %356, align 1
  %7876 = sext i8 %7875 to i32
  %7877 = icmp eq i32 %7876, 92
  br i1 %7877, label %7878, label %7879

7878:                                             ; preds = %7874, %7870, %7866, %7859
  store i1 false, ptr %350, align 1
  br label %8554

7879:                                             ; preds = %7874
  br label %7880

7880:                                             ; preds = %7879, %7856
  %7881 = load i64, ptr %352, align 8
  %7882 = icmp ult i64 4, %7881
  br i1 %7882, label %7883, label %7904

7883:                                             ; preds = %7880
  %7884 = load ptr, ptr %351, align 8
  %7885 = getelementptr inbounds i8, ptr %7884, i64 4
  %7886 = load i8, ptr %7885, align 1
  store i8 %7886, ptr %357, align 1
  %7887 = load i8, ptr %357, align 1
  %7888 = sext i8 %7887 to i32
  %7889 = icmp slt i32 %7888, 32
  br i1 %7889, label %7902, label %7890

7890:                                             ; preds = %7883
  %7891 = load i8, ptr %357, align 1
  %7892 = sext i8 %7891 to i32
  %7893 = icmp sgt i32 %7892, 126
  br i1 %7893, label %7902, label %7894

7894:                                             ; preds = %7890
  %7895 = load i8, ptr %357, align 1
  %7896 = sext i8 %7895 to i32
  %7897 = icmp eq i32 %7896, 34
  br i1 %7897, label %7902, label %7898

7898:                                             ; preds = %7894
  %7899 = load i8, ptr %357, align 1
  %7900 = sext i8 %7899 to i32
  %7901 = icmp eq i32 %7900, 92
  br i1 %7901, label %7902, label %7903

7902:                                             ; preds = %7898, %7894, %7890, %7883
  store i1 false, ptr %350, align 1
  br label %8554

7903:                                             ; preds = %7898
  br label %7904

7904:                                             ; preds = %7903, %7880
  %7905 = load i64, ptr %352, align 8
  %7906 = icmp ult i64 5, %7905
  br i1 %7906, label %7907, label %7928

7907:                                             ; preds = %7904
  %7908 = load ptr, ptr %351, align 8
  %7909 = getelementptr inbounds i8, ptr %7908, i64 5
  %7910 = load i8, ptr %7909, align 1
  store i8 %7910, ptr %358, align 1
  %7911 = load i8, ptr %358, align 1
  %7912 = sext i8 %7911 to i32
  %7913 = icmp slt i32 %7912, 32
  br i1 %7913, label %7926, label %7914

7914:                                             ; preds = %7907
  %7915 = load i8, ptr %358, align 1
  %7916 = sext i8 %7915 to i32
  %7917 = icmp sgt i32 %7916, 126
  br i1 %7917, label %7926, label %7918

7918:                                             ; preds = %7914
  %7919 = load i8, ptr %358, align 1
  %7920 = sext i8 %7919 to i32
  %7921 = icmp eq i32 %7920, 34
  br i1 %7921, label %7926, label %7922

7922:                                             ; preds = %7918
  %7923 = load i8, ptr %358, align 1
  %7924 = sext i8 %7923 to i32
  %7925 = icmp eq i32 %7924, 92
  br i1 %7925, label %7926, label %7927

7926:                                             ; preds = %7922, %7918, %7914, %7907
  store i1 false, ptr %350, align 1
  br label %8554

7927:                                             ; preds = %7922
  br label %7928

7928:                                             ; preds = %7927, %7904
  %7929 = load i64, ptr %352, align 8
  %7930 = icmp ult i64 6, %7929
  br i1 %7930, label %7931, label %7952

7931:                                             ; preds = %7928
  %7932 = load ptr, ptr %351, align 8
  %7933 = getelementptr inbounds i8, ptr %7932, i64 6
  %7934 = load i8, ptr %7933, align 1
  store i8 %7934, ptr %359, align 1
  %7935 = load i8, ptr %359, align 1
  %7936 = sext i8 %7935 to i32
  %7937 = icmp slt i32 %7936, 32
  br i1 %7937, label %7950, label %7938

7938:                                             ; preds = %7931
  %7939 = load i8, ptr %359, align 1
  %7940 = sext i8 %7939 to i32
  %7941 = icmp sgt i32 %7940, 126
  br i1 %7941, label %7950, label %7942

7942:                                             ; preds = %7938
  %7943 = load i8, ptr %359, align 1
  %7944 = sext i8 %7943 to i32
  %7945 = icmp eq i32 %7944, 34
  br i1 %7945, label %7950, label %7946

7946:                                             ; preds = %7942
  %7947 = load i8, ptr %359, align 1
  %7948 = sext i8 %7947 to i32
  %7949 = icmp eq i32 %7948, 92
  br i1 %7949, label %7950, label %7951

7950:                                             ; preds = %7946, %7942, %7938, %7931
  store i1 false, ptr %350, align 1
  br label %8554

7951:                                             ; preds = %7946
  br label %7952

7952:                                             ; preds = %7951, %7928
  %7953 = load i64, ptr %352, align 8
  %7954 = icmp ult i64 7, %7953
  br i1 %7954, label %7955, label %7976

7955:                                             ; preds = %7952
  %7956 = load ptr, ptr %351, align 8
  %7957 = getelementptr inbounds i8, ptr %7956, i64 7
  %7958 = load i8, ptr %7957, align 1
  store i8 %7958, ptr %360, align 1
  %7959 = load i8, ptr %360, align 1
  %7960 = sext i8 %7959 to i32
  %7961 = icmp slt i32 %7960, 32
  br i1 %7961, label %7974, label %7962

7962:                                             ; preds = %7955
  %7963 = load i8, ptr %360, align 1
  %7964 = sext i8 %7963 to i32
  %7965 = icmp sgt i32 %7964, 126
  br i1 %7965, label %7974, label %7966

7966:                                             ; preds = %7962
  %7967 = load i8, ptr %360, align 1
  %7968 = sext i8 %7967 to i32
  %7969 = icmp eq i32 %7968, 34
  br i1 %7969, label %7974, label %7970

7970:                                             ; preds = %7966
  %7971 = load i8, ptr %360, align 1
  %7972 = sext i8 %7971 to i32
  %7973 = icmp eq i32 %7972, 92
  br i1 %7973, label %7974, label %7975

7974:                                             ; preds = %7970, %7966, %7962, %7955
  store i1 false, ptr %350, align 1
  br label %8554

7975:                                             ; preds = %7970
  br label %7976

7976:                                             ; preds = %7975, %7952
  %7977 = load i64, ptr %352, align 8
  %7978 = icmp ult i64 8, %7977
  br i1 %7978, label %7979, label %8000

7979:                                             ; preds = %7976
  %7980 = load ptr, ptr %351, align 8
  %7981 = getelementptr inbounds i8, ptr %7980, i64 8
  %7982 = load i8, ptr %7981, align 1
  store i8 %7982, ptr %361, align 1
  %7983 = load i8, ptr %361, align 1
  %7984 = sext i8 %7983 to i32
  %7985 = icmp slt i32 %7984, 32
  br i1 %7985, label %7998, label %7986

7986:                                             ; preds = %7979
  %7987 = load i8, ptr %361, align 1
  %7988 = sext i8 %7987 to i32
  %7989 = icmp sgt i32 %7988, 126
  br i1 %7989, label %7998, label %7990

7990:                                             ; preds = %7986
  %7991 = load i8, ptr %361, align 1
  %7992 = sext i8 %7991 to i32
  %7993 = icmp eq i32 %7992, 34
  br i1 %7993, label %7998, label %7994

7994:                                             ; preds = %7990
  %7995 = load i8, ptr %361, align 1
  %7996 = sext i8 %7995 to i32
  %7997 = icmp eq i32 %7996, 92
  br i1 %7997, label %7998, label %7999

7998:                                             ; preds = %7994, %7990, %7986, %7979
  store i1 false, ptr %350, align 1
  br label %8554

7999:                                             ; preds = %7994
  br label %8000

8000:                                             ; preds = %7999, %7976
  %8001 = load i64, ptr %352, align 8
  %8002 = icmp ult i64 9, %8001
  br i1 %8002, label %8003, label %8024

8003:                                             ; preds = %8000
  %8004 = load ptr, ptr %351, align 8
  %8005 = getelementptr inbounds i8, ptr %8004, i64 9
  %8006 = load i8, ptr %8005, align 1
  store i8 %8006, ptr %362, align 1
  %8007 = load i8, ptr %362, align 1
  %8008 = sext i8 %8007 to i32
  %8009 = icmp slt i32 %8008, 32
  br i1 %8009, label %8022, label %8010

8010:                                             ; preds = %8003
  %8011 = load i8, ptr %362, align 1
  %8012 = sext i8 %8011 to i32
  %8013 = icmp sgt i32 %8012, 126
  br i1 %8013, label %8022, label %8014

8014:                                             ; preds = %8010
  %8015 = load i8, ptr %362, align 1
  %8016 = sext i8 %8015 to i32
  %8017 = icmp eq i32 %8016, 34
  br i1 %8017, label %8022, label %8018

8018:                                             ; preds = %8014
  %8019 = load i8, ptr %362, align 1
  %8020 = sext i8 %8019 to i32
  %8021 = icmp eq i32 %8020, 92
  br i1 %8021, label %8022, label %8023

8022:                                             ; preds = %8018, %8014, %8010, %8003
  store i1 false, ptr %350, align 1
  br label %8554

8023:                                             ; preds = %8018
  br label %8024

8024:                                             ; preds = %8023, %8000
  %8025 = load i64, ptr %352, align 8
  %8026 = icmp ult i64 10, %8025
  br i1 %8026, label %8027, label %8048

8027:                                             ; preds = %8024
  %8028 = load ptr, ptr %351, align 8
  %8029 = getelementptr inbounds i8, ptr %8028, i64 10
  %8030 = load i8, ptr %8029, align 1
  store i8 %8030, ptr %363, align 1
  %8031 = load i8, ptr %363, align 1
  %8032 = sext i8 %8031 to i32
  %8033 = icmp slt i32 %8032, 32
  br i1 %8033, label %8046, label %8034

8034:                                             ; preds = %8027
  %8035 = load i8, ptr %363, align 1
  %8036 = sext i8 %8035 to i32
  %8037 = icmp sgt i32 %8036, 126
  br i1 %8037, label %8046, label %8038

8038:                                             ; preds = %8034
  %8039 = load i8, ptr %363, align 1
  %8040 = sext i8 %8039 to i32
  %8041 = icmp eq i32 %8040, 34
  br i1 %8041, label %8046, label %8042

8042:                                             ; preds = %8038
  %8043 = load i8, ptr %363, align 1
  %8044 = sext i8 %8043 to i32
  %8045 = icmp eq i32 %8044, 92
  br i1 %8045, label %8046, label %8047

8046:                                             ; preds = %8042, %8038, %8034, %8027
  store i1 false, ptr %350, align 1
  br label %8554

8047:                                             ; preds = %8042
  br label %8048

8048:                                             ; preds = %8047, %8024
  %8049 = load i64, ptr %352, align 8
  %8050 = icmp ult i64 11, %8049
  br i1 %8050, label %8051, label %8072

8051:                                             ; preds = %8048
  %8052 = load ptr, ptr %351, align 8
  %8053 = getelementptr inbounds i8, ptr %8052, i64 11
  %8054 = load i8, ptr %8053, align 1
  store i8 %8054, ptr %364, align 1
  %8055 = load i8, ptr %364, align 1
  %8056 = sext i8 %8055 to i32
  %8057 = icmp slt i32 %8056, 32
  br i1 %8057, label %8070, label %8058

8058:                                             ; preds = %8051
  %8059 = load i8, ptr %364, align 1
  %8060 = sext i8 %8059 to i32
  %8061 = icmp sgt i32 %8060, 126
  br i1 %8061, label %8070, label %8062

8062:                                             ; preds = %8058
  %8063 = load i8, ptr %364, align 1
  %8064 = sext i8 %8063 to i32
  %8065 = icmp eq i32 %8064, 34
  br i1 %8065, label %8070, label %8066

8066:                                             ; preds = %8062
  %8067 = load i8, ptr %364, align 1
  %8068 = sext i8 %8067 to i32
  %8069 = icmp eq i32 %8068, 92
  br i1 %8069, label %8070, label %8071

8070:                                             ; preds = %8066, %8062, %8058, %8051
  store i1 false, ptr %350, align 1
  br label %8554

8071:                                             ; preds = %8066
  br label %8072

8072:                                             ; preds = %8071, %8048
  %8073 = load i64, ptr %352, align 8
  %8074 = icmp ult i64 12, %8073
  br i1 %8074, label %8075, label %8096

8075:                                             ; preds = %8072
  %8076 = load ptr, ptr %351, align 8
  %8077 = getelementptr inbounds i8, ptr %8076, i64 12
  %8078 = load i8, ptr %8077, align 1
  store i8 %8078, ptr %365, align 1
  %8079 = load i8, ptr %365, align 1
  %8080 = sext i8 %8079 to i32
  %8081 = icmp slt i32 %8080, 32
  br i1 %8081, label %8094, label %8082

8082:                                             ; preds = %8075
  %8083 = load i8, ptr %365, align 1
  %8084 = sext i8 %8083 to i32
  %8085 = icmp sgt i32 %8084, 126
  br i1 %8085, label %8094, label %8086

8086:                                             ; preds = %8082
  %8087 = load i8, ptr %365, align 1
  %8088 = sext i8 %8087 to i32
  %8089 = icmp eq i32 %8088, 34
  br i1 %8089, label %8094, label %8090

8090:                                             ; preds = %8086
  %8091 = load i8, ptr %365, align 1
  %8092 = sext i8 %8091 to i32
  %8093 = icmp eq i32 %8092, 92
  br i1 %8093, label %8094, label %8095

8094:                                             ; preds = %8090, %8086, %8082, %8075
  store i1 false, ptr %350, align 1
  br label %8554

8095:                                             ; preds = %8090
  br label %8096

8096:                                             ; preds = %8095, %8072
  %8097 = load i64, ptr %352, align 8
  %8098 = icmp ult i64 13, %8097
  br i1 %8098, label %8099, label %8120

8099:                                             ; preds = %8096
  %8100 = load ptr, ptr %351, align 8
  %8101 = getelementptr inbounds i8, ptr %8100, i64 13
  %8102 = load i8, ptr %8101, align 1
  store i8 %8102, ptr %366, align 1
  %8103 = load i8, ptr %366, align 1
  %8104 = sext i8 %8103 to i32
  %8105 = icmp slt i32 %8104, 32
  br i1 %8105, label %8118, label %8106

8106:                                             ; preds = %8099
  %8107 = load i8, ptr %366, align 1
  %8108 = sext i8 %8107 to i32
  %8109 = icmp sgt i32 %8108, 126
  br i1 %8109, label %8118, label %8110

8110:                                             ; preds = %8106
  %8111 = load i8, ptr %366, align 1
  %8112 = sext i8 %8111 to i32
  %8113 = icmp eq i32 %8112, 34
  br i1 %8113, label %8118, label %8114

8114:                                             ; preds = %8110
  %8115 = load i8, ptr %366, align 1
  %8116 = sext i8 %8115 to i32
  %8117 = icmp eq i32 %8116, 92
  br i1 %8117, label %8118, label %8119

8118:                                             ; preds = %8114, %8110, %8106, %8099
  store i1 false, ptr %350, align 1
  br label %8554

8119:                                             ; preds = %8114
  br label %8120

8120:                                             ; preds = %8119, %8096
  %8121 = load i64, ptr %352, align 8
  %8122 = icmp ult i64 14, %8121
  br i1 %8122, label %8123, label %8144

8123:                                             ; preds = %8120
  %8124 = load ptr, ptr %351, align 8
  %8125 = getelementptr inbounds i8, ptr %8124, i64 14
  %8126 = load i8, ptr %8125, align 1
  store i8 %8126, ptr %367, align 1
  %8127 = load i8, ptr %367, align 1
  %8128 = sext i8 %8127 to i32
  %8129 = icmp slt i32 %8128, 32
  br i1 %8129, label %8142, label %8130

8130:                                             ; preds = %8123
  %8131 = load i8, ptr %367, align 1
  %8132 = sext i8 %8131 to i32
  %8133 = icmp sgt i32 %8132, 126
  br i1 %8133, label %8142, label %8134

8134:                                             ; preds = %8130
  %8135 = load i8, ptr %367, align 1
  %8136 = sext i8 %8135 to i32
  %8137 = icmp eq i32 %8136, 34
  br i1 %8137, label %8142, label %8138

8138:                                             ; preds = %8134
  %8139 = load i8, ptr %367, align 1
  %8140 = sext i8 %8139 to i32
  %8141 = icmp eq i32 %8140, 92
  br i1 %8141, label %8142, label %8143

8142:                                             ; preds = %8138, %8134, %8130, %8123
  store i1 false, ptr %350, align 1
  br label %8554

8143:                                             ; preds = %8138
  br label %8144

8144:                                             ; preds = %8143, %8120
  %8145 = load i64, ptr %352, align 8
  %8146 = icmp ult i64 15, %8145
  br i1 %8146, label %8147, label %8168

8147:                                             ; preds = %8144
  %8148 = load ptr, ptr %351, align 8
  %8149 = getelementptr inbounds i8, ptr %8148, i64 15
  %8150 = load i8, ptr %8149, align 1
  store i8 %8150, ptr %368, align 1
  %8151 = load i8, ptr %368, align 1
  %8152 = sext i8 %8151 to i32
  %8153 = icmp slt i32 %8152, 32
  br i1 %8153, label %8166, label %8154

8154:                                             ; preds = %8147
  %8155 = load i8, ptr %368, align 1
  %8156 = sext i8 %8155 to i32
  %8157 = icmp sgt i32 %8156, 126
  br i1 %8157, label %8166, label %8158

8158:                                             ; preds = %8154
  %8159 = load i8, ptr %368, align 1
  %8160 = sext i8 %8159 to i32
  %8161 = icmp eq i32 %8160, 34
  br i1 %8161, label %8166, label %8162

8162:                                             ; preds = %8158
  %8163 = load i8, ptr %368, align 1
  %8164 = sext i8 %8163 to i32
  %8165 = icmp eq i32 %8164, 92
  br i1 %8165, label %8166, label %8167

8166:                                             ; preds = %8162, %8158, %8154, %8147
  store i1 false, ptr %350, align 1
  br label %8554

8167:                                             ; preds = %8162
  br label %8168

8168:                                             ; preds = %8167, %8144
  %8169 = load i64, ptr %352, align 8
  %8170 = icmp ult i64 16, %8169
  br i1 %8170, label %8171, label %8192

8171:                                             ; preds = %8168
  %8172 = load ptr, ptr %351, align 8
  %8173 = getelementptr inbounds i8, ptr %8172, i64 16
  %8174 = load i8, ptr %8173, align 1
  store i8 %8174, ptr %369, align 1
  %8175 = load i8, ptr %369, align 1
  %8176 = sext i8 %8175 to i32
  %8177 = icmp slt i32 %8176, 32
  br i1 %8177, label %8190, label %8178

8178:                                             ; preds = %8171
  %8179 = load i8, ptr %369, align 1
  %8180 = sext i8 %8179 to i32
  %8181 = icmp sgt i32 %8180, 126
  br i1 %8181, label %8190, label %8182

8182:                                             ; preds = %8178
  %8183 = load i8, ptr %369, align 1
  %8184 = sext i8 %8183 to i32
  %8185 = icmp eq i32 %8184, 34
  br i1 %8185, label %8190, label %8186

8186:                                             ; preds = %8182
  %8187 = load i8, ptr %369, align 1
  %8188 = sext i8 %8187 to i32
  %8189 = icmp eq i32 %8188, 92
  br i1 %8189, label %8190, label %8191

8190:                                             ; preds = %8186, %8182, %8178, %8171
  store i1 false, ptr %350, align 1
  br label %8554

8191:                                             ; preds = %8186
  br label %8192

8192:                                             ; preds = %8191, %8168
  %8193 = load i64, ptr %352, align 8
  %8194 = icmp ult i64 17, %8193
  br i1 %8194, label %8195, label %8216

8195:                                             ; preds = %8192
  %8196 = load ptr, ptr %351, align 8
  %8197 = getelementptr inbounds i8, ptr %8196, i64 17
  %8198 = load i8, ptr %8197, align 1
  store i8 %8198, ptr %370, align 1
  %8199 = load i8, ptr %370, align 1
  %8200 = sext i8 %8199 to i32
  %8201 = icmp slt i32 %8200, 32
  br i1 %8201, label %8214, label %8202

8202:                                             ; preds = %8195
  %8203 = load i8, ptr %370, align 1
  %8204 = sext i8 %8203 to i32
  %8205 = icmp sgt i32 %8204, 126
  br i1 %8205, label %8214, label %8206

8206:                                             ; preds = %8202
  %8207 = load i8, ptr %370, align 1
  %8208 = sext i8 %8207 to i32
  %8209 = icmp eq i32 %8208, 34
  br i1 %8209, label %8214, label %8210

8210:                                             ; preds = %8206
  %8211 = load i8, ptr %370, align 1
  %8212 = sext i8 %8211 to i32
  %8213 = icmp eq i32 %8212, 92
  br i1 %8213, label %8214, label %8215

8214:                                             ; preds = %8210, %8206, %8202, %8195
  store i1 false, ptr %350, align 1
  br label %8554

8215:                                             ; preds = %8210
  br label %8216

8216:                                             ; preds = %8215, %8192
  %8217 = load i64, ptr %352, align 8
  %8218 = icmp ult i64 18, %8217
  br i1 %8218, label %8219, label %8240

8219:                                             ; preds = %8216
  %8220 = load ptr, ptr %351, align 8
  %8221 = getelementptr inbounds i8, ptr %8220, i64 18
  %8222 = load i8, ptr %8221, align 1
  store i8 %8222, ptr %371, align 1
  %8223 = load i8, ptr %371, align 1
  %8224 = sext i8 %8223 to i32
  %8225 = icmp slt i32 %8224, 32
  br i1 %8225, label %8238, label %8226

8226:                                             ; preds = %8219
  %8227 = load i8, ptr %371, align 1
  %8228 = sext i8 %8227 to i32
  %8229 = icmp sgt i32 %8228, 126
  br i1 %8229, label %8238, label %8230

8230:                                             ; preds = %8226
  %8231 = load i8, ptr %371, align 1
  %8232 = sext i8 %8231 to i32
  %8233 = icmp eq i32 %8232, 34
  br i1 %8233, label %8238, label %8234

8234:                                             ; preds = %8230
  %8235 = load i8, ptr %371, align 1
  %8236 = sext i8 %8235 to i32
  %8237 = icmp eq i32 %8236, 92
  br i1 %8237, label %8238, label %8239

8238:                                             ; preds = %8234, %8230, %8226, %8219
  store i1 false, ptr %350, align 1
  br label %8554

8239:                                             ; preds = %8234
  br label %8240

8240:                                             ; preds = %8239, %8216
  %8241 = load i64, ptr %352, align 8
  %8242 = icmp ult i64 19, %8241
  br i1 %8242, label %8243, label %8264

8243:                                             ; preds = %8240
  %8244 = load ptr, ptr %351, align 8
  %8245 = getelementptr inbounds i8, ptr %8244, i64 19
  %8246 = load i8, ptr %8245, align 1
  store i8 %8246, ptr %372, align 1
  %8247 = load i8, ptr %372, align 1
  %8248 = sext i8 %8247 to i32
  %8249 = icmp slt i32 %8248, 32
  br i1 %8249, label %8262, label %8250

8250:                                             ; preds = %8243
  %8251 = load i8, ptr %372, align 1
  %8252 = sext i8 %8251 to i32
  %8253 = icmp sgt i32 %8252, 126
  br i1 %8253, label %8262, label %8254

8254:                                             ; preds = %8250
  %8255 = load i8, ptr %372, align 1
  %8256 = sext i8 %8255 to i32
  %8257 = icmp eq i32 %8256, 34
  br i1 %8257, label %8262, label %8258

8258:                                             ; preds = %8254
  %8259 = load i8, ptr %372, align 1
  %8260 = sext i8 %8259 to i32
  %8261 = icmp eq i32 %8260, 92
  br i1 %8261, label %8262, label %8263

8262:                                             ; preds = %8258, %8254, %8250, %8243
  store i1 false, ptr %350, align 1
  br label %8554

8263:                                             ; preds = %8258
  br label %8264

8264:                                             ; preds = %8263, %8240
  %8265 = load i64, ptr %352, align 8
  %8266 = icmp ult i64 20, %8265
  br i1 %8266, label %8267, label %8288

8267:                                             ; preds = %8264
  %8268 = load ptr, ptr %351, align 8
  %8269 = getelementptr inbounds i8, ptr %8268, i64 20
  %8270 = load i8, ptr %8269, align 1
  store i8 %8270, ptr %373, align 1
  %8271 = load i8, ptr %373, align 1
  %8272 = sext i8 %8271 to i32
  %8273 = icmp slt i32 %8272, 32
  br i1 %8273, label %8286, label %8274

8274:                                             ; preds = %8267
  %8275 = load i8, ptr %373, align 1
  %8276 = sext i8 %8275 to i32
  %8277 = icmp sgt i32 %8276, 126
  br i1 %8277, label %8286, label %8278

8278:                                             ; preds = %8274
  %8279 = load i8, ptr %373, align 1
  %8280 = sext i8 %8279 to i32
  %8281 = icmp eq i32 %8280, 34
  br i1 %8281, label %8286, label %8282

8282:                                             ; preds = %8278
  %8283 = load i8, ptr %373, align 1
  %8284 = sext i8 %8283 to i32
  %8285 = icmp eq i32 %8284, 92
  br i1 %8285, label %8286, label %8287

8286:                                             ; preds = %8282, %8278, %8274, %8267
  store i1 false, ptr %350, align 1
  br label %8554

8287:                                             ; preds = %8282
  br label %8288

8288:                                             ; preds = %8287, %8264
  %8289 = load i64, ptr %352, align 8
  %8290 = icmp ult i64 21, %8289
  br i1 %8290, label %8291, label %8312

8291:                                             ; preds = %8288
  %8292 = load ptr, ptr %351, align 8
  %8293 = getelementptr inbounds i8, ptr %8292, i64 21
  %8294 = load i8, ptr %8293, align 1
  store i8 %8294, ptr %374, align 1
  %8295 = load i8, ptr %374, align 1
  %8296 = sext i8 %8295 to i32
  %8297 = icmp slt i32 %8296, 32
  br i1 %8297, label %8310, label %8298

8298:                                             ; preds = %8291
  %8299 = load i8, ptr %374, align 1
  %8300 = sext i8 %8299 to i32
  %8301 = icmp sgt i32 %8300, 126
  br i1 %8301, label %8310, label %8302

8302:                                             ; preds = %8298
  %8303 = load i8, ptr %374, align 1
  %8304 = sext i8 %8303 to i32
  %8305 = icmp eq i32 %8304, 34
  br i1 %8305, label %8310, label %8306

8306:                                             ; preds = %8302
  %8307 = load i8, ptr %374, align 1
  %8308 = sext i8 %8307 to i32
  %8309 = icmp eq i32 %8308, 92
  br i1 %8309, label %8310, label %8311

8310:                                             ; preds = %8306, %8302, %8298, %8291
  store i1 false, ptr %350, align 1
  br label %8554

8311:                                             ; preds = %8306
  br label %8312

8312:                                             ; preds = %8311, %8288
  %8313 = load i64, ptr %352, align 8
  %8314 = icmp ult i64 22, %8313
  br i1 %8314, label %8315, label %8336

8315:                                             ; preds = %8312
  %8316 = load ptr, ptr %351, align 8
  %8317 = getelementptr inbounds i8, ptr %8316, i64 22
  %8318 = load i8, ptr %8317, align 1
  store i8 %8318, ptr %375, align 1
  %8319 = load i8, ptr %375, align 1
  %8320 = sext i8 %8319 to i32
  %8321 = icmp slt i32 %8320, 32
  br i1 %8321, label %8334, label %8322

8322:                                             ; preds = %8315
  %8323 = load i8, ptr %375, align 1
  %8324 = sext i8 %8323 to i32
  %8325 = icmp sgt i32 %8324, 126
  br i1 %8325, label %8334, label %8326

8326:                                             ; preds = %8322
  %8327 = load i8, ptr %375, align 1
  %8328 = sext i8 %8327 to i32
  %8329 = icmp eq i32 %8328, 34
  br i1 %8329, label %8334, label %8330

8330:                                             ; preds = %8326
  %8331 = load i8, ptr %375, align 1
  %8332 = sext i8 %8331 to i32
  %8333 = icmp eq i32 %8332, 92
  br i1 %8333, label %8334, label %8335

8334:                                             ; preds = %8330, %8326, %8322, %8315
  store i1 false, ptr %350, align 1
  br label %8554

8335:                                             ; preds = %8330
  br label %8336

8336:                                             ; preds = %8335, %8312
  %8337 = load i64, ptr %352, align 8
  %8338 = icmp ult i64 23, %8337
  br i1 %8338, label %8339, label %8360

8339:                                             ; preds = %8336
  %8340 = load ptr, ptr %351, align 8
  %8341 = getelementptr inbounds i8, ptr %8340, i64 23
  %8342 = load i8, ptr %8341, align 1
  store i8 %8342, ptr %376, align 1
  %8343 = load i8, ptr %376, align 1
  %8344 = sext i8 %8343 to i32
  %8345 = icmp slt i32 %8344, 32
  br i1 %8345, label %8358, label %8346

8346:                                             ; preds = %8339
  %8347 = load i8, ptr %376, align 1
  %8348 = sext i8 %8347 to i32
  %8349 = icmp sgt i32 %8348, 126
  br i1 %8349, label %8358, label %8350

8350:                                             ; preds = %8346
  %8351 = load i8, ptr %376, align 1
  %8352 = sext i8 %8351 to i32
  %8353 = icmp eq i32 %8352, 34
  br i1 %8353, label %8358, label %8354

8354:                                             ; preds = %8350
  %8355 = load i8, ptr %376, align 1
  %8356 = sext i8 %8355 to i32
  %8357 = icmp eq i32 %8356, 92
  br i1 %8357, label %8358, label %8359

8358:                                             ; preds = %8354, %8350, %8346, %8339
  store i1 false, ptr %350, align 1
  br label %8554

8359:                                             ; preds = %8354
  br label %8360

8360:                                             ; preds = %8359, %8336
  %8361 = load i64, ptr %352, align 8
  %8362 = icmp ult i64 24, %8361
  br i1 %8362, label %8363, label %8384

8363:                                             ; preds = %8360
  %8364 = load ptr, ptr %351, align 8
  %8365 = getelementptr inbounds i8, ptr %8364, i64 24
  %8366 = load i8, ptr %8365, align 1
  store i8 %8366, ptr %377, align 1
  %8367 = load i8, ptr %377, align 1
  %8368 = sext i8 %8367 to i32
  %8369 = icmp slt i32 %8368, 32
  br i1 %8369, label %8382, label %8370

8370:                                             ; preds = %8363
  %8371 = load i8, ptr %377, align 1
  %8372 = sext i8 %8371 to i32
  %8373 = icmp sgt i32 %8372, 126
  br i1 %8373, label %8382, label %8374

8374:                                             ; preds = %8370
  %8375 = load i8, ptr %377, align 1
  %8376 = sext i8 %8375 to i32
  %8377 = icmp eq i32 %8376, 34
  br i1 %8377, label %8382, label %8378

8378:                                             ; preds = %8374
  %8379 = load i8, ptr %377, align 1
  %8380 = sext i8 %8379 to i32
  %8381 = icmp eq i32 %8380, 92
  br i1 %8381, label %8382, label %8383

8382:                                             ; preds = %8378, %8374, %8370, %8363
  store i1 false, ptr %350, align 1
  br label %8554

8383:                                             ; preds = %8378
  br label %8384

8384:                                             ; preds = %8383, %8360
  %8385 = load i64, ptr %352, align 8
  %8386 = icmp ult i64 25, %8385
  br i1 %8386, label %8387, label %8408

8387:                                             ; preds = %8384
  %8388 = load ptr, ptr %351, align 8
  %8389 = getelementptr inbounds i8, ptr %8388, i64 25
  %8390 = load i8, ptr %8389, align 1
  store i8 %8390, ptr %378, align 1
  %8391 = load i8, ptr %378, align 1
  %8392 = sext i8 %8391 to i32
  %8393 = icmp slt i32 %8392, 32
  br i1 %8393, label %8406, label %8394

8394:                                             ; preds = %8387
  %8395 = load i8, ptr %378, align 1
  %8396 = sext i8 %8395 to i32
  %8397 = icmp sgt i32 %8396, 126
  br i1 %8397, label %8406, label %8398

8398:                                             ; preds = %8394
  %8399 = load i8, ptr %378, align 1
  %8400 = sext i8 %8399 to i32
  %8401 = icmp eq i32 %8400, 34
  br i1 %8401, label %8406, label %8402

8402:                                             ; preds = %8398
  %8403 = load i8, ptr %378, align 1
  %8404 = sext i8 %8403 to i32
  %8405 = icmp eq i32 %8404, 92
  br i1 %8405, label %8406, label %8407

8406:                                             ; preds = %8402, %8398, %8394, %8387
  store i1 false, ptr %350, align 1
  br label %8554

8407:                                             ; preds = %8402
  br label %8408

8408:                                             ; preds = %8407, %8384
  %8409 = load i64, ptr %352, align 8
  %8410 = icmp ult i64 26, %8409
  br i1 %8410, label %8411, label %8432

8411:                                             ; preds = %8408
  %8412 = load ptr, ptr %351, align 8
  %8413 = getelementptr inbounds i8, ptr %8412, i64 26
  %8414 = load i8, ptr %8413, align 1
  store i8 %8414, ptr %379, align 1
  %8415 = load i8, ptr %379, align 1
  %8416 = sext i8 %8415 to i32
  %8417 = icmp slt i32 %8416, 32
  br i1 %8417, label %8430, label %8418

8418:                                             ; preds = %8411
  %8419 = load i8, ptr %379, align 1
  %8420 = sext i8 %8419 to i32
  %8421 = icmp sgt i32 %8420, 126
  br i1 %8421, label %8430, label %8422

8422:                                             ; preds = %8418
  %8423 = load i8, ptr %379, align 1
  %8424 = sext i8 %8423 to i32
  %8425 = icmp eq i32 %8424, 34
  br i1 %8425, label %8430, label %8426

8426:                                             ; preds = %8422
  %8427 = load i8, ptr %379, align 1
  %8428 = sext i8 %8427 to i32
  %8429 = icmp eq i32 %8428, 92
  br i1 %8429, label %8430, label %8431

8430:                                             ; preds = %8426, %8422, %8418, %8411
  store i1 false, ptr %350, align 1
  br label %8554

8431:                                             ; preds = %8426
  br label %8432

8432:                                             ; preds = %8431, %8408
  %8433 = load i64, ptr %352, align 8
  %8434 = icmp ult i64 27, %8433
  br i1 %8434, label %8435, label %8456

8435:                                             ; preds = %8432
  %8436 = load ptr, ptr %351, align 8
  %8437 = getelementptr inbounds i8, ptr %8436, i64 27
  %8438 = load i8, ptr %8437, align 1
  store i8 %8438, ptr %380, align 1
  %8439 = load i8, ptr %380, align 1
  %8440 = sext i8 %8439 to i32
  %8441 = icmp slt i32 %8440, 32
  br i1 %8441, label %8454, label %8442

8442:                                             ; preds = %8435
  %8443 = load i8, ptr %380, align 1
  %8444 = sext i8 %8443 to i32
  %8445 = icmp sgt i32 %8444, 126
  br i1 %8445, label %8454, label %8446

8446:                                             ; preds = %8442
  %8447 = load i8, ptr %380, align 1
  %8448 = sext i8 %8447 to i32
  %8449 = icmp eq i32 %8448, 34
  br i1 %8449, label %8454, label %8450

8450:                                             ; preds = %8446
  %8451 = load i8, ptr %380, align 1
  %8452 = sext i8 %8451 to i32
  %8453 = icmp eq i32 %8452, 92
  br i1 %8453, label %8454, label %8455

8454:                                             ; preds = %8450, %8446, %8442, %8435
  store i1 false, ptr %350, align 1
  br label %8554

8455:                                             ; preds = %8450
  br label %8456

8456:                                             ; preds = %8455, %8432
  %8457 = load i64, ptr %352, align 8
  %8458 = icmp ult i64 28, %8457
  br i1 %8458, label %8459, label %8480

8459:                                             ; preds = %8456
  %8460 = load ptr, ptr %351, align 8
  %8461 = getelementptr inbounds i8, ptr %8460, i64 28
  %8462 = load i8, ptr %8461, align 1
  store i8 %8462, ptr %381, align 1
  %8463 = load i8, ptr %381, align 1
  %8464 = sext i8 %8463 to i32
  %8465 = icmp slt i32 %8464, 32
  br i1 %8465, label %8478, label %8466

8466:                                             ; preds = %8459
  %8467 = load i8, ptr %381, align 1
  %8468 = sext i8 %8467 to i32
  %8469 = icmp sgt i32 %8468, 126
  br i1 %8469, label %8478, label %8470

8470:                                             ; preds = %8466
  %8471 = load i8, ptr %381, align 1
  %8472 = sext i8 %8471 to i32
  %8473 = icmp eq i32 %8472, 34
  br i1 %8473, label %8478, label %8474

8474:                                             ; preds = %8470
  %8475 = load i8, ptr %381, align 1
  %8476 = sext i8 %8475 to i32
  %8477 = icmp eq i32 %8476, 92
  br i1 %8477, label %8478, label %8479

8478:                                             ; preds = %8474, %8470, %8466, %8459
  store i1 false, ptr %350, align 1
  br label %8554

8479:                                             ; preds = %8474
  br label %8480

8480:                                             ; preds = %8479, %8456
  %8481 = load i64, ptr %352, align 8
  %8482 = icmp ult i64 29, %8481
  br i1 %8482, label %8483, label %8504

8483:                                             ; preds = %8480
  %8484 = load ptr, ptr %351, align 8
  %8485 = getelementptr inbounds i8, ptr %8484, i64 29
  %8486 = load i8, ptr %8485, align 1
  store i8 %8486, ptr %382, align 1
  %8487 = load i8, ptr %382, align 1
  %8488 = sext i8 %8487 to i32
  %8489 = icmp slt i32 %8488, 32
  br i1 %8489, label %8502, label %8490

8490:                                             ; preds = %8483
  %8491 = load i8, ptr %382, align 1
  %8492 = sext i8 %8491 to i32
  %8493 = icmp sgt i32 %8492, 126
  br i1 %8493, label %8502, label %8494

8494:                                             ; preds = %8490
  %8495 = load i8, ptr %382, align 1
  %8496 = sext i8 %8495 to i32
  %8497 = icmp eq i32 %8496, 34
  br i1 %8497, label %8502, label %8498

8498:                                             ; preds = %8494
  %8499 = load i8, ptr %382, align 1
  %8500 = sext i8 %8499 to i32
  %8501 = icmp eq i32 %8500, 92
  br i1 %8501, label %8502, label %8503

8502:                                             ; preds = %8498, %8494, %8490, %8483
  store i1 false, ptr %350, align 1
  br label %8554

8503:                                             ; preds = %8498
  br label %8504

8504:                                             ; preds = %8503, %8480
  %8505 = load i64, ptr %352, align 8
  %8506 = icmp ult i64 30, %8505
  br i1 %8506, label %8507, label %8528

8507:                                             ; preds = %8504
  %8508 = load ptr, ptr %351, align 8
  %8509 = getelementptr inbounds i8, ptr %8508, i64 30
  %8510 = load i8, ptr %8509, align 1
  store i8 %8510, ptr %383, align 1
  %8511 = load i8, ptr %383, align 1
  %8512 = sext i8 %8511 to i32
  %8513 = icmp slt i32 %8512, 32
  br i1 %8513, label %8526, label %8514

8514:                                             ; preds = %8507
  %8515 = load i8, ptr %383, align 1
  %8516 = sext i8 %8515 to i32
  %8517 = icmp sgt i32 %8516, 126
  br i1 %8517, label %8526, label %8518

8518:                                             ; preds = %8514
  %8519 = load i8, ptr %383, align 1
  %8520 = sext i8 %8519 to i32
  %8521 = icmp eq i32 %8520, 34
  br i1 %8521, label %8526, label %8522

8522:                                             ; preds = %8518
  %8523 = load i8, ptr %383, align 1
  %8524 = sext i8 %8523 to i32
  %8525 = icmp eq i32 %8524, 92
  br i1 %8525, label %8526, label %8527

8526:                                             ; preds = %8522, %8518, %8514, %8507
  store i1 false, ptr %350, align 1
  br label %8554

8527:                                             ; preds = %8522
  br label %8528

8528:                                             ; preds = %8527, %8504
  %8529 = load i64, ptr %352, align 8
  %8530 = icmp ult i64 31, %8529
  br i1 %8530, label %8531, label %8552

8531:                                             ; preds = %8528
  %8532 = load ptr, ptr %351, align 8
  %8533 = getelementptr inbounds i8, ptr %8532, i64 31
  %8534 = load i8, ptr %8533, align 1
  store i8 %8534, ptr %384, align 1
  %8535 = load i8, ptr %384, align 1
  %8536 = sext i8 %8535 to i32
  %8537 = icmp slt i32 %8536, 32
  br i1 %8537, label %8550, label %8538

8538:                                             ; preds = %8531
  %8539 = load i8, ptr %384, align 1
  %8540 = sext i8 %8539 to i32
  %8541 = icmp sgt i32 %8540, 126
  br i1 %8541, label %8550, label %8542

8542:                                             ; preds = %8538
  %8543 = load i8, ptr %384, align 1
  %8544 = sext i8 %8543 to i32
  %8545 = icmp eq i32 %8544, 34
  br i1 %8545, label %8550, label %8546

8546:                                             ; preds = %8542
  %8547 = load i8, ptr %384, align 1
  %8548 = sext i8 %8547 to i32
  %8549 = icmp eq i32 %8548, 92
  br i1 %8549, label %8550, label %8551

8550:                                             ; preds = %8546, %8542, %8538, %8531
  store i1 false, ptr %350, align 1
  br label %8554

8551:                                             ; preds = %8546
  br label %8552

8552:                                             ; preds = %8551, %8528
  store i1 true, ptr %350, align 1
  br label %8554

8553:                                             ; preds = %7782, %7773
  store i1 false, ptr %350, align 1
  br label %8554

8554:                                             ; preds = %7806, %7830, %7854, %7878, %7902, %7926, %7950, %7974, %7998, %8022, %8046, %8070, %8094, %8118, %8142, %8166, %8190, %8214, %8238, %8262, %8286, %8310, %8334, %8358, %8382, %8406, %8430, %8454, %8478, %8502, %8526, %8550, %8552, %8553
  %8555 = load i1, ptr %350, align 1
  %8556 = zext i1 %8555 to i8
  store i8 %8556, ptr %508, align 1
  %8557 = load i8, ptr %508, align 1
  %8558 = trunc i8 %8557 to i1
  %8559 = zext i1 %8558 to i64
  %8560 = select i1 %8558, i32 8, i32 0
  %8561 = trunc i32 %8560 to i8
  store i8 %8561, ptr %509, align 1
  %8562 = load ptr, ptr %505, align 8
  %8563 = load i8, ptr %509, align 1
  %8564 = load i64, ptr %507, align 8
  store ptr %8562, ptr %120, align 8
  store i8 5, ptr %121, align 1
  store i8 %8563, ptr %122, align 1
  store i64 %8564, ptr %123, align 8
  %8565 = load i64, ptr %123, align 8
  %8566 = shl i64 %8565, 8
  store i64 %8566, ptr %124, align 8
  %8567 = load i8, ptr %121, align 1
  %8568 = zext i8 %8567 to i32
  %8569 = load i8, ptr %122, align 1
  %8570 = zext i8 %8569 to i32
  %8571 = or i32 %8568, %8570
  %8572 = sext i32 %8571 to i64
  %8573 = load i64, ptr %124, align 8
  %8574 = or i64 %8573, %8572
  store i64 %8574, ptr %124, align 8
  %8575 = load i64, ptr %124, align 8
  %8576 = load ptr, ptr %120, align 8
  store i64 %8575, ptr %8576, align 8
  %8577 = load ptr, ptr %506, align 8
  %8578 = load ptr, ptr %505, align 8
  %8579 = getelementptr inbounds nuw %struct.yyjson_val, ptr %8578, i32 0, i32 1
  store ptr %8577, ptr %8579, align 8
  %8580 = load ptr, ptr %873, align 8
  store ptr %8580, ptr %870, align 8
  br label %8583

8581:                                             ; preds = %7766
  br label %8582

8582:                                             ; preds = %8581, %7722
  store ptr null, ptr %870, align 8
  br label %8583

8583:                                             ; preds = %8554, %8582
  %8584 = load ptr, ptr %870, align 8
  %8585 = load ptr, ptr %945, align 8
  store ptr %7715, ptr %907, align 8
  store ptr %8584, ptr %908, align 8
  store ptr %8585, ptr %909, align 8
  %8586 = load ptr, ptr %907, align 8
  store ptr %8586, ptr %685, align 8
  %8587 = load ptr, ptr %685, align 8
  %8588 = icmp ne ptr %8587, null
  br i1 %8588, label %8589, label %8602

8589:                                             ; preds = %8583
  %8590 = load ptr, ptr %685, align 8
  store ptr %8590, ptr %613, align 8
  %8591 = load ptr, ptr %613, align 8
  store ptr %8591, ptr %596, align 8
  %8592 = load ptr, ptr %596, align 8
  %8593 = load i64, ptr %8592, align 8
  %8594 = trunc i64 %8593 to i8
  store i8 %8594, ptr %597, align 1
  %8595 = load i8, ptr %597, align 1
  %8596 = zext i8 %8595 to i32
  %8597 = and i32 %8596, 7
  %8598 = trunc i32 %8597 to i8
  %8599 = zext i8 %8598 to i32
  %8600 = icmp eq i32 %8599, 7
  %8601 = zext i1 %8600 to i32
  br label %8603

8602:                                             ; preds = %8583
  br label %8603

8603:                                             ; preds = %8589, %8602
  %8604 = phi i32 [ %8601, %8589 ], [ 0, %8602 ]
  %8605 = icmp ne i32 %8604, 0
  br i1 %8605, label %8606, label %8630

8606:                                             ; preds = %8603
  %8607 = load ptr, ptr %908, align 8
  store ptr %8607, ptr %677, align 8
  %8608 = load ptr, ptr %677, align 8
  %8609 = icmp ne ptr %8608, null
  br i1 %8609, label %8610, label %8623

8610:                                             ; preds = %8606
  %8611 = load ptr, ptr %677, align 8
  store ptr %8611, ptr %585, align 8
  %8612 = load ptr, ptr %585, align 8
  store ptr %8612, ptr %583, align 8
  %8613 = load ptr, ptr %583, align 8
  %8614 = load i64, ptr %8613, align 8
  %8615 = trunc i64 %8614 to i8
  store i8 %8615, ptr %584, align 1
  %8616 = load i8, ptr %584, align 1
  %8617 = zext i8 %8616 to i32
  %8618 = and i32 %8617, 7
  %8619 = trunc i32 %8618 to i8
  %8620 = zext i8 %8619 to i32
  %8621 = icmp eq i32 %8620, 5
  %8622 = zext i1 %8621 to i32
  br label %8624

8623:                                             ; preds = %8606
  br label %8624

8624:                                             ; preds = %8610, %8623
  %8625 = phi i32 [ %8622, %8610 ], [ 0, %8623 ]
  %8626 = icmp ne i32 %8625, 0
  br i1 %8626, label %8627, label %8630

8627:                                             ; preds = %8624
  %8628 = load ptr, ptr %909, align 8
  %8629 = icmp ne ptr %8628, null
  br label %8630

8630:                                             ; preds = %8627, %8624, %8603
  %8631 = phi i1 [ false, %8624 ], [ false, %8603 ], [ %8629, %8627 ]
  %8632 = xor i1 %8631, true
  %8633 = zext i1 %8631 to i32
  %8634 = sext i32 %8633 to i64
  br i1 %8631, label %8635, label %8686

8635:                                             ; preds = %8630
  %8636 = load ptr, ptr %907, align 8
  %8637 = load ptr, ptr %908, align 8
  %8638 = load ptr, ptr %909, align 8
  %8639 = load ptr, ptr %907, align 8
  store ptr %8639, ptr %618, align 8
  %8640 = load ptr, ptr %618, align 8
  %8641 = load i64, ptr %8640, align 8
  %8642 = lshr i64 %8641, 8
  store ptr %8636, ptr %639, align 8
  store ptr %8637, ptr %640, align 8
  store ptr %8638, ptr %641, align 8
  store i64 %8642, ptr %642, align 8
  %8643 = load i64, ptr %642, align 8
  %8644 = icmp ne i64 %8643, 0
  %8645 = xor i1 %8644, true
  %8646 = zext i1 %8644 to i32
  %8647 = sext i32 %8646 to i64
  br i1 %8644, label %8648, label %8663

8648:                                             ; preds = %8635
  %8649 = load ptr, ptr %639, align 8
  %8650 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8649, i32 0, i32 1
  %8651 = load ptr, ptr %8650, align 8
  %8652 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8651, i32 0, i32 2
  %8653 = load ptr, ptr %8652, align 8
  store ptr %8653, ptr %643, align 8
  %8654 = load ptr, ptr %643, align 8
  %8655 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8654, i32 0, i32 2
  %8656 = load ptr, ptr %8655, align 8
  store ptr %8656, ptr %644, align 8
  %8657 = load ptr, ptr %640, align 8
  %8658 = load ptr, ptr %643, align 8
  %8659 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8658, i32 0, i32 2
  store ptr %8657, ptr %8659, align 8
  %8660 = load ptr, ptr %644, align 8
  %8661 = load ptr, ptr %641, align 8
  %8662 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8661, i32 0, i32 2
  store ptr %8660, ptr %8662, align 8
  br label %8667

8663:                                             ; preds = %8635
  %8664 = load ptr, ptr %640, align 8
  %8665 = load ptr, ptr %641, align 8
  %8666 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8665, i32 0, i32 2
  store ptr %8664, ptr %8666, align 8
  br label %8667

8667:                                             ; preds = %8648, %8663
  %8668 = load ptr, ptr %641, align 8
  %8669 = load ptr, ptr %640, align 8
  %8670 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8669, i32 0, i32 2
  store ptr %8668, ptr %8670, align 8
  %8671 = load ptr, ptr %640, align 8
  %8672 = load ptr, ptr %639, align 8
  %8673 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8672, i32 0, i32 1
  store ptr %8671, ptr %8673, align 8
  %8674 = load ptr, ptr %639, align 8
  %8675 = load i64, ptr %642, align 8
  %8676 = add i64 %8675, 1
  store ptr %8674, ptr %559, align 8
  store i64 %8676, ptr %560, align 8
  %8677 = load ptr, ptr %559, align 8
  %8678 = load i64, ptr %8677, align 8
  %8679 = and i64 %8678, 255
  store i64 %8679, ptr %561, align 8
  %8680 = load i64, ptr %560, align 8
  %8681 = shl i64 %8680, 8
  %8682 = load i64, ptr %561, align 8
  %8683 = or i64 %8682, %8681
  store i64 %8683, ptr %561, align 8
  %8684 = load i64, ptr %561, align 8
  %8685 = load ptr, ptr %559, align 8
  store i64 %8684, ptr %8685, align 8
  store i1 true, ptr %906, align 1
  br label %8687

8686:                                             ; preds = %8630
  store i1 false, ptr %906, align 1
  br label %8687

8687:                                             ; preds = %8667, %8686
  %8688 = load i1, ptr %906, align 1
  %8689 = load ptr, ptr %943, align 8
  %8690 = load ptr, ptr %938, align 8
  store ptr %8690, ptr %875, align 8
  store ptr @.str.7, ptr %876, align 8
  %8691 = load ptr, ptr %875, align 8
  %8692 = icmp ne ptr %8691, null
  br i1 %8692, label %8693, label %8696

8693:                                             ; preds = %8687
  %8694 = load ptr, ptr %876, align 8
  %8695 = icmp ne ptr %8694, null
  br label %8696

8696:                                             ; preds = %8693, %8687
  %8697 = phi i1 [ false, %8687 ], [ %8695, %8693 ]
  %8698 = xor i1 %8697, true
  %8699 = zext i1 %8697 to i32
  %8700 = sext i32 %8699 to i64
  br i1 %8697, label %8701, label %9556

8701:                                             ; preds = %8696
  %8702 = load ptr, ptr %875, align 8
  store ptr %8702, ptr %734, align 8
  store i64 1, ptr %735, align 8
  %8703 = load ptr, ptr %734, align 8
  %8704 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %8703, i32 0, i32 1
  store ptr %8704, ptr %737, align 8
  %8705 = load ptr, ptr %734, align 8
  %8706 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %8705, i32 0, i32 3
  store ptr %8706, ptr %738, align 8
  %8707 = load ptr, ptr %738, align 8
  %8708 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %8707, i32 0, i32 1
  %8709 = load ptr, ptr %8708, align 8
  %8710 = load ptr, ptr %738, align 8
  %8711 = load ptr, ptr %8710, align 8
  %8712 = ptrtoint ptr %8709 to i64
  %8713 = ptrtoint ptr %8711 to i64
  %8714 = sub i64 %8712, %8713
  %8715 = sdiv exact i64 %8714, 24
  %8716 = load i64, ptr %735, align 8
  %8717 = icmp ult i64 %8715, %8716
  %8718 = xor i1 %8717, true
  %8719 = zext i1 %8717 to i32
  %8720 = sext i32 %8719 to i64
  br i1 %8717, label %8721, label %8732

8721:                                             ; preds = %8701
  %8722 = load ptr, ptr %738, align 8
  %8723 = load ptr, ptr %737, align 8
  %8724 = load i64, ptr %735, align 8
  %8725 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %8722, ptr noundef %8723, i64 noundef %8724)
  %8726 = xor i1 %8725, true
  %8727 = xor i1 %8725, true
  %8728 = zext i1 %8727 to i32
  %8729 = sext i32 %8728 to i64
  br i1 %8727, label %8730, label %8731

8730:                                             ; preds = %8721
  store ptr null, ptr %733, align 8
  br label %8740

8731:                                             ; preds = %8721
  br label %8732

8732:                                             ; preds = %8731, %8701
  %8733 = load ptr, ptr %738, align 8
  %8734 = load ptr, ptr %8733, align 8
  store ptr %8734, ptr %736, align 8
  %8735 = load i64, ptr %735, align 8
  %8736 = load ptr, ptr %738, align 8
  %8737 = load ptr, ptr %8736, align 8
  %8738 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %8737, i64 %8735
  store ptr %8738, ptr %8736, align 8
  %8739 = load ptr, ptr %736, align 8
  store ptr %8739, ptr %733, align 8
  br label %8740

8740:                                             ; preds = %8730, %8732
  %8741 = load ptr, ptr %733, align 8
  store ptr %8741, ptr %877, align 8
  %8742 = load ptr, ptr %877, align 8
  %8743 = icmp ne ptr %8742, null
  %8744 = xor i1 %8743, true
  %8745 = zext i1 %8743 to i32
  %8746 = sext i32 %8745 to i64
  br i1 %8743, label %8747, label %9555

8747:                                             ; preds = %8740
  %8748 = load ptr, ptr %877, align 8
  %8749 = load ptr, ptr %876, align 8
  store ptr %8748, ptr %500, align 8
  store ptr %8749, ptr %501, align 8
  %8750 = load ptr, ptr %501, align 8
  %8751 = call i64 @strlen(ptr noundef %8750)
  store i64 %8751, ptr %502, align 8
  %8752 = load ptr, ptr %501, align 8
  %8753 = load i64, ptr %502, align 8
  store ptr %8752, ptr %386, align 8
  store i64 %8753, ptr %387, align 8
  %8754 = load i64, ptr %387, align 8
  %8755 = call i1 @llvm.is.constant.i64(i64 %8754)
  br i1 %8755, label %8756, label %9527

8756:                                             ; preds = %8747
  %8757 = load i64, ptr %387, align 8
  %8758 = icmp ule i64 %8757, 32
  br i1 %8758, label %8759, label %9527

8759:                                             ; preds = %8756
  %8760 = load i64, ptr %387, align 8
  %8761 = icmp ult i64 0, %8760
  br i1 %8761, label %8762, label %8782

8762:                                             ; preds = %8759
  %8763 = load ptr, ptr %386, align 8
  %8764 = load i8, ptr %8763, align 1
  store i8 %8764, ptr %388, align 1
  %8765 = load i8, ptr %388, align 1
  %8766 = sext i8 %8765 to i32
  %8767 = icmp slt i32 %8766, 32
  br i1 %8767, label %8780, label %8768

8768:                                             ; preds = %8762
  %8769 = load i8, ptr %388, align 1
  %8770 = sext i8 %8769 to i32
  %8771 = icmp sgt i32 %8770, 126
  br i1 %8771, label %8780, label %8772

8772:                                             ; preds = %8768
  %8773 = load i8, ptr %388, align 1
  %8774 = sext i8 %8773 to i32
  %8775 = icmp eq i32 %8774, 34
  br i1 %8775, label %8780, label %8776

8776:                                             ; preds = %8772
  %8777 = load i8, ptr %388, align 1
  %8778 = sext i8 %8777 to i32
  %8779 = icmp eq i32 %8778, 92
  br i1 %8779, label %8780, label %8781

8780:                                             ; preds = %8776, %8772, %8768, %8762
  store i1 false, ptr %385, align 1
  br label %9528

8781:                                             ; preds = %8776
  br label %8782

8782:                                             ; preds = %8781, %8759
  %8783 = load i64, ptr %387, align 8
  %8784 = icmp ult i64 1, %8783
  br i1 %8784, label %8785, label %8806

8785:                                             ; preds = %8782
  %8786 = load ptr, ptr %386, align 8
  %8787 = getelementptr inbounds i8, ptr %8786, i64 1
  %8788 = load i8, ptr %8787, align 1
  store i8 %8788, ptr %389, align 1
  %8789 = load i8, ptr %389, align 1
  %8790 = sext i8 %8789 to i32
  %8791 = icmp slt i32 %8790, 32
  br i1 %8791, label %8804, label %8792

8792:                                             ; preds = %8785
  %8793 = load i8, ptr %389, align 1
  %8794 = sext i8 %8793 to i32
  %8795 = icmp sgt i32 %8794, 126
  br i1 %8795, label %8804, label %8796

8796:                                             ; preds = %8792
  %8797 = load i8, ptr %389, align 1
  %8798 = sext i8 %8797 to i32
  %8799 = icmp eq i32 %8798, 34
  br i1 %8799, label %8804, label %8800

8800:                                             ; preds = %8796
  %8801 = load i8, ptr %389, align 1
  %8802 = sext i8 %8801 to i32
  %8803 = icmp eq i32 %8802, 92
  br i1 %8803, label %8804, label %8805

8804:                                             ; preds = %8800, %8796, %8792, %8785
  store i1 false, ptr %385, align 1
  br label %9528

8805:                                             ; preds = %8800
  br label %8806

8806:                                             ; preds = %8805, %8782
  %8807 = load i64, ptr %387, align 8
  %8808 = icmp ult i64 2, %8807
  br i1 %8808, label %8809, label %8830

8809:                                             ; preds = %8806
  %8810 = load ptr, ptr %386, align 8
  %8811 = getelementptr inbounds i8, ptr %8810, i64 2
  %8812 = load i8, ptr %8811, align 1
  store i8 %8812, ptr %390, align 1
  %8813 = load i8, ptr %390, align 1
  %8814 = sext i8 %8813 to i32
  %8815 = icmp slt i32 %8814, 32
  br i1 %8815, label %8828, label %8816

8816:                                             ; preds = %8809
  %8817 = load i8, ptr %390, align 1
  %8818 = sext i8 %8817 to i32
  %8819 = icmp sgt i32 %8818, 126
  br i1 %8819, label %8828, label %8820

8820:                                             ; preds = %8816
  %8821 = load i8, ptr %390, align 1
  %8822 = sext i8 %8821 to i32
  %8823 = icmp eq i32 %8822, 34
  br i1 %8823, label %8828, label %8824

8824:                                             ; preds = %8820
  %8825 = load i8, ptr %390, align 1
  %8826 = sext i8 %8825 to i32
  %8827 = icmp eq i32 %8826, 92
  br i1 %8827, label %8828, label %8829

8828:                                             ; preds = %8824, %8820, %8816, %8809
  store i1 false, ptr %385, align 1
  br label %9528

8829:                                             ; preds = %8824
  br label %8830

8830:                                             ; preds = %8829, %8806
  %8831 = load i64, ptr %387, align 8
  %8832 = icmp ult i64 3, %8831
  br i1 %8832, label %8833, label %8854

8833:                                             ; preds = %8830
  %8834 = load ptr, ptr %386, align 8
  %8835 = getelementptr inbounds i8, ptr %8834, i64 3
  %8836 = load i8, ptr %8835, align 1
  store i8 %8836, ptr %391, align 1
  %8837 = load i8, ptr %391, align 1
  %8838 = sext i8 %8837 to i32
  %8839 = icmp slt i32 %8838, 32
  br i1 %8839, label %8852, label %8840

8840:                                             ; preds = %8833
  %8841 = load i8, ptr %391, align 1
  %8842 = sext i8 %8841 to i32
  %8843 = icmp sgt i32 %8842, 126
  br i1 %8843, label %8852, label %8844

8844:                                             ; preds = %8840
  %8845 = load i8, ptr %391, align 1
  %8846 = sext i8 %8845 to i32
  %8847 = icmp eq i32 %8846, 34
  br i1 %8847, label %8852, label %8848

8848:                                             ; preds = %8844
  %8849 = load i8, ptr %391, align 1
  %8850 = sext i8 %8849 to i32
  %8851 = icmp eq i32 %8850, 92
  br i1 %8851, label %8852, label %8853

8852:                                             ; preds = %8848, %8844, %8840, %8833
  store i1 false, ptr %385, align 1
  br label %9528

8853:                                             ; preds = %8848
  br label %8854

8854:                                             ; preds = %8853, %8830
  %8855 = load i64, ptr %387, align 8
  %8856 = icmp ult i64 4, %8855
  br i1 %8856, label %8857, label %8878

8857:                                             ; preds = %8854
  %8858 = load ptr, ptr %386, align 8
  %8859 = getelementptr inbounds i8, ptr %8858, i64 4
  %8860 = load i8, ptr %8859, align 1
  store i8 %8860, ptr %392, align 1
  %8861 = load i8, ptr %392, align 1
  %8862 = sext i8 %8861 to i32
  %8863 = icmp slt i32 %8862, 32
  br i1 %8863, label %8876, label %8864

8864:                                             ; preds = %8857
  %8865 = load i8, ptr %392, align 1
  %8866 = sext i8 %8865 to i32
  %8867 = icmp sgt i32 %8866, 126
  br i1 %8867, label %8876, label %8868

8868:                                             ; preds = %8864
  %8869 = load i8, ptr %392, align 1
  %8870 = sext i8 %8869 to i32
  %8871 = icmp eq i32 %8870, 34
  br i1 %8871, label %8876, label %8872

8872:                                             ; preds = %8868
  %8873 = load i8, ptr %392, align 1
  %8874 = sext i8 %8873 to i32
  %8875 = icmp eq i32 %8874, 92
  br i1 %8875, label %8876, label %8877

8876:                                             ; preds = %8872, %8868, %8864, %8857
  store i1 false, ptr %385, align 1
  br label %9528

8877:                                             ; preds = %8872
  br label %8878

8878:                                             ; preds = %8877, %8854
  %8879 = load i64, ptr %387, align 8
  %8880 = icmp ult i64 5, %8879
  br i1 %8880, label %8881, label %8902

8881:                                             ; preds = %8878
  %8882 = load ptr, ptr %386, align 8
  %8883 = getelementptr inbounds i8, ptr %8882, i64 5
  %8884 = load i8, ptr %8883, align 1
  store i8 %8884, ptr %393, align 1
  %8885 = load i8, ptr %393, align 1
  %8886 = sext i8 %8885 to i32
  %8887 = icmp slt i32 %8886, 32
  br i1 %8887, label %8900, label %8888

8888:                                             ; preds = %8881
  %8889 = load i8, ptr %393, align 1
  %8890 = sext i8 %8889 to i32
  %8891 = icmp sgt i32 %8890, 126
  br i1 %8891, label %8900, label %8892

8892:                                             ; preds = %8888
  %8893 = load i8, ptr %393, align 1
  %8894 = sext i8 %8893 to i32
  %8895 = icmp eq i32 %8894, 34
  br i1 %8895, label %8900, label %8896

8896:                                             ; preds = %8892
  %8897 = load i8, ptr %393, align 1
  %8898 = sext i8 %8897 to i32
  %8899 = icmp eq i32 %8898, 92
  br i1 %8899, label %8900, label %8901

8900:                                             ; preds = %8896, %8892, %8888, %8881
  store i1 false, ptr %385, align 1
  br label %9528

8901:                                             ; preds = %8896
  br label %8902

8902:                                             ; preds = %8901, %8878
  %8903 = load i64, ptr %387, align 8
  %8904 = icmp ult i64 6, %8903
  br i1 %8904, label %8905, label %8926

8905:                                             ; preds = %8902
  %8906 = load ptr, ptr %386, align 8
  %8907 = getelementptr inbounds i8, ptr %8906, i64 6
  %8908 = load i8, ptr %8907, align 1
  store i8 %8908, ptr %394, align 1
  %8909 = load i8, ptr %394, align 1
  %8910 = sext i8 %8909 to i32
  %8911 = icmp slt i32 %8910, 32
  br i1 %8911, label %8924, label %8912

8912:                                             ; preds = %8905
  %8913 = load i8, ptr %394, align 1
  %8914 = sext i8 %8913 to i32
  %8915 = icmp sgt i32 %8914, 126
  br i1 %8915, label %8924, label %8916

8916:                                             ; preds = %8912
  %8917 = load i8, ptr %394, align 1
  %8918 = sext i8 %8917 to i32
  %8919 = icmp eq i32 %8918, 34
  br i1 %8919, label %8924, label %8920

8920:                                             ; preds = %8916
  %8921 = load i8, ptr %394, align 1
  %8922 = sext i8 %8921 to i32
  %8923 = icmp eq i32 %8922, 92
  br i1 %8923, label %8924, label %8925

8924:                                             ; preds = %8920, %8916, %8912, %8905
  store i1 false, ptr %385, align 1
  br label %9528

8925:                                             ; preds = %8920
  br label %8926

8926:                                             ; preds = %8925, %8902
  %8927 = load i64, ptr %387, align 8
  %8928 = icmp ult i64 7, %8927
  br i1 %8928, label %8929, label %8950

8929:                                             ; preds = %8926
  %8930 = load ptr, ptr %386, align 8
  %8931 = getelementptr inbounds i8, ptr %8930, i64 7
  %8932 = load i8, ptr %8931, align 1
  store i8 %8932, ptr %395, align 1
  %8933 = load i8, ptr %395, align 1
  %8934 = sext i8 %8933 to i32
  %8935 = icmp slt i32 %8934, 32
  br i1 %8935, label %8948, label %8936

8936:                                             ; preds = %8929
  %8937 = load i8, ptr %395, align 1
  %8938 = sext i8 %8937 to i32
  %8939 = icmp sgt i32 %8938, 126
  br i1 %8939, label %8948, label %8940

8940:                                             ; preds = %8936
  %8941 = load i8, ptr %395, align 1
  %8942 = sext i8 %8941 to i32
  %8943 = icmp eq i32 %8942, 34
  br i1 %8943, label %8948, label %8944

8944:                                             ; preds = %8940
  %8945 = load i8, ptr %395, align 1
  %8946 = sext i8 %8945 to i32
  %8947 = icmp eq i32 %8946, 92
  br i1 %8947, label %8948, label %8949

8948:                                             ; preds = %8944, %8940, %8936, %8929
  store i1 false, ptr %385, align 1
  br label %9528

8949:                                             ; preds = %8944
  br label %8950

8950:                                             ; preds = %8949, %8926
  %8951 = load i64, ptr %387, align 8
  %8952 = icmp ult i64 8, %8951
  br i1 %8952, label %8953, label %8974

8953:                                             ; preds = %8950
  %8954 = load ptr, ptr %386, align 8
  %8955 = getelementptr inbounds i8, ptr %8954, i64 8
  %8956 = load i8, ptr %8955, align 1
  store i8 %8956, ptr %396, align 1
  %8957 = load i8, ptr %396, align 1
  %8958 = sext i8 %8957 to i32
  %8959 = icmp slt i32 %8958, 32
  br i1 %8959, label %8972, label %8960

8960:                                             ; preds = %8953
  %8961 = load i8, ptr %396, align 1
  %8962 = sext i8 %8961 to i32
  %8963 = icmp sgt i32 %8962, 126
  br i1 %8963, label %8972, label %8964

8964:                                             ; preds = %8960
  %8965 = load i8, ptr %396, align 1
  %8966 = sext i8 %8965 to i32
  %8967 = icmp eq i32 %8966, 34
  br i1 %8967, label %8972, label %8968

8968:                                             ; preds = %8964
  %8969 = load i8, ptr %396, align 1
  %8970 = sext i8 %8969 to i32
  %8971 = icmp eq i32 %8970, 92
  br i1 %8971, label %8972, label %8973

8972:                                             ; preds = %8968, %8964, %8960, %8953
  store i1 false, ptr %385, align 1
  br label %9528

8973:                                             ; preds = %8968
  br label %8974

8974:                                             ; preds = %8973, %8950
  %8975 = load i64, ptr %387, align 8
  %8976 = icmp ult i64 9, %8975
  br i1 %8976, label %8977, label %8998

8977:                                             ; preds = %8974
  %8978 = load ptr, ptr %386, align 8
  %8979 = getelementptr inbounds i8, ptr %8978, i64 9
  %8980 = load i8, ptr %8979, align 1
  store i8 %8980, ptr %397, align 1
  %8981 = load i8, ptr %397, align 1
  %8982 = sext i8 %8981 to i32
  %8983 = icmp slt i32 %8982, 32
  br i1 %8983, label %8996, label %8984

8984:                                             ; preds = %8977
  %8985 = load i8, ptr %397, align 1
  %8986 = sext i8 %8985 to i32
  %8987 = icmp sgt i32 %8986, 126
  br i1 %8987, label %8996, label %8988

8988:                                             ; preds = %8984
  %8989 = load i8, ptr %397, align 1
  %8990 = sext i8 %8989 to i32
  %8991 = icmp eq i32 %8990, 34
  br i1 %8991, label %8996, label %8992

8992:                                             ; preds = %8988
  %8993 = load i8, ptr %397, align 1
  %8994 = sext i8 %8993 to i32
  %8995 = icmp eq i32 %8994, 92
  br i1 %8995, label %8996, label %8997

8996:                                             ; preds = %8992, %8988, %8984, %8977
  store i1 false, ptr %385, align 1
  br label %9528

8997:                                             ; preds = %8992
  br label %8998

8998:                                             ; preds = %8997, %8974
  %8999 = load i64, ptr %387, align 8
  %9000 = icmp ult i64 10, %8999
  br i1 %9000, label %9001, label %9022

9001:                                             ; preds = %8998
  %9002 = load ptr, ptr %386, align 8
  %9003 = getelementptr inbounds i8, ptr %9002, i64 10
  %9004 = load i8, ptr %9003, align 1
  store i8 %9004, ptr %398, align 1
  %9005 = load i8, ptr %398, align 1
  %9006 = sext i8 %9005 to i32
  %9007 = icmp slt i32 %9006, 32
  br i1 %9007, label %9020, label %9008

9008:                                             ; preds = %9001
  %9009 = load i8, ptr %398, align 1
  %9010 = sext i8 %9009 to i32
  %9011 = icmp sgt i32 %9010, 126
  br i1 %9011, label %9020, label %9012

9012:                                             ; preds = %9008
  %9013 = load i8, ptr %398, align 1
  %9014 = sext i8 %9013 to i32
  %9015 = icmp eq i32 %9014, 34
  br i1 %9015, label %9020, label %9016

9016:                                             ; preds = %9012
  %9017 = load i8, ptr %398, align 1
  %9018 = sext i8 %9017 to i32
  %9019 = icmp eq i32 %9018, 92
  br i1 %9019, label %9020, label %9021

9020:                                             ; preds = %9016, %9012, %9008, %9001
  store i1 false, ptr %385, align 1
  br label %9528

9021:                                             ; preds = %9016
  br label %9022

9022:                                             ; preds = %9021, %8998
  %9023 = load i64, ptr %387, align 8
  %9024 = icmp ult i64 11, %9023
  br i1 %9024, label %9025, label %9046

9025:                                             ; preds = %9022
  %9026 = load ptr, ptr %386, align 8
  %9027 = getelementptr inbounds i8, ptr %9026, i64 11
  %9028 = load i8, ptr %9027, align 1
  store i8 %9028, ptr %399, align 1
  %9029 = load i8, ptr %399, align 1
  %9030 = sext i8 %9029 to i32
  %9031 = icmp slt i32 %9030, 32
  br i1 %9031, label %9044, label %9032

9032:                                             ; preds = %9025
  %9033 = load i8, ptr %399, align 1
  %9034 = sext i8 %9033 to i32
  %9035 = icmp sgt i32 %9034, 126
  br i1 %9035, label %9044, label %9036

9036:                                             ; preds = %9032
  %9037 = load i8, ptr %399, align 1
  %9038 = sext i8 %9037 to i32
  %9039 = icmp eq i32 %9038, 34
  br i1 %9039, label %9044, label %9040

9040:                                             ; preds = %9036
  %9041 = load i8, ptr %399, align 1
  %9042 = sext i8 %9041 to i32
  %9043 = icmp eq i32 %9042, 92
  br i1 %9043, label %9044, label %9045

9044:                                             ; preds = %9040, %9036, %9032, %9025
  store i1 false, ptr %385, align 1
  br label %9528

9045:                                             ; preds = %9040
  br label %9046

9046:                                             ; preds = %9045, %9022
  %9047 = load i64, ptr %387, align 8
  %9048 = icmp ult i64 12, %9047
  br i1 %9048, label %9049, label %9070

9049:                                             ; preds = %9046
  %9050 = load ptr, ptr %386, align 8
  %9051 = getelementptr inbounds i8, ptr %9050, i64 12
  %9052 = load i8, ptr %9051, align 1
  store i8 %9052, ptr %400, align 1
  %9053 = load i8, ptr %400, align 1
  %9054 = sext i8 %9053 to i32
  %9055 = icmp slt i32 %9054, 32
  br i1 %9055, label %9068, label %9056

9056:                                             ; preds = %9049
  %9057 = load i8, ptr %400, align 1
  %9058 = sext i8 %9057 to i32
  %9059 = icmp sgt i32 %9058, 126
  br i1 %9059, label %9068, label %9060

9060:                                             ; preds = %9056
  %9061 = load i8, ptr %400, align 1
  %9062 = sext i8 %9061 to i32
  %9063 = icmp eq i32 %9062, 34
  br i1 %9063, label %9068, label %9064

9064:                                             ; preds = %9060
  %9065 = load i8, ptr %400, align 1
  %9066 = sext i8 %9065 to i32
  %9067 = icmp eq i32 %9066, 92
  br i1 %9067, label %9068, label %9069

9068:                                             ; preds = %9064, %9060, %9056, %9049
  store i1 false, ptr %385, align 1
  br label %9528

9069:                                             ; preds = %9064
  br label %9070

9070:                                             ; preds = %9069, %9046
  %9071 = load i64, ptr %387, align 8
  %9072 = icmp ult i64 13, %9071
  br i1 %9072, label %9073, label %9094

9073:                                             ; preds = %9070
  %9074 = load ptr, ptr %386, align 8
  %9075 = getelementptr inbounds i8, ptr %9074, i64 13
  %9076 = load i8, ptr %9075, align 1
  store i8 %9076, ptr %401, align 1
  %9077 = load i8, ptr %401, align 1
  %9078 = sext i8 %9077 to i32
  %9079 = icmp slt i32 %9078, 32
  br i1 %9079, label %9092, label %9080

9080:                                             ; preds = %9073
  %9081 = load i8, ptr %401, align 1
  %9082 = sext i8 %9081 to i32
  %9083 = icmp sgt i32 %9082, 126
  br i1 %9083, label %9092, label %9084

9084:                                             ; preds = %9080
  %9085 = load i8, ptr %401, align 1
  %9086 = sext i8 %9085 to i32
  %9087 = icmp eq i32 %9086, 34
  br i1 %9087, label %9092, label %9088

9088:                                             ; preds = %9084
  %9089 = load i8, ptr %401, align 1
  %9090 = sext i8 %9089 to i32
  %9091 = icmp eq i32 %9090, 92
  br i1 %9091, label %9092, label %9093

9092:                                             ; preds = %9088, %9084, %9080, %9073
  store i1 false, ptr %385, align 1
  br label %9528

9093:                                             ; preds = %9088
  br label %9094

9094:                                             ; preds = %9093, %9070
  %9095 = load i64, ptr %387, align 8
  %9096 = icmp ult i64 14, %9095
  br i1 %9096, label %9097, label %9118

9097:                                             ; preds = %9094
  %9098 = load ptr, ptr %386, align 8
  %9099 = getelementptr inbounds i8, ptr %9098, i64 14
  %9100 = load i8, ptr %9099, align 1
  store i8 %9100, ptr %402, align 1
  %9101 = load i8, ptr %402, align 1
  %9102 = sext i8 %9101 to i32
  %9103 = icmp slt i32 %9102, 32
  br i1 %9103, label %9116, label %9104

9104:                                             ; preds = %9097
  %9105 = load i8, ptr %402, align 1
  %9106 = sext i8 %9105 to i32
  %9107 = icmp sgt i32 %9106, 126
  br i1 %9107, label %9116, label %9108

9108:                                             ; preds = %9104
  %9109 = load i8, ptr %402, align 1
  %9110 = sext i8 %9109 to i32
  %9111 = icmp eq i32 %9110, 34
  br i1 %9111, label %9116, label %9112

9112:                                             ; preds = %9108
  %9113 = load i8, ptr %402, align 1
  %9114 = sext i8 %9113 to i32
  %9115 = icmp eq i32 %9114, 92
  br i1 %9115, label %9116, label %9117

9116:                                             ; preds = %9112, %9108, %9104, %9097
  store i1 false, ptr %385, align 1
  br label %9528

9117:                                             ; preds = %9112
  br label %9118

9118:                                             ; preds = %9117, %9094
  %9119 = load i64, ptr %387, align 8
  %9120 = icmp ult i64 15, %9119
  br i1 %9120, label %9121, label %9142

9121:                                             ; preds = %9118
  %9122 = load ptr, ptr %386, align 8
  %9123 = getelementptr inbounds i8, ptr %9122, i64 15
  %9124 = load i8, ptr %9123, align 1
  store i8 %9124, ptr %403, align 1
  %9125 = load i8, ptr %403, align 1
  %9126 = sext i8 %9125 to i32
  %9127 = icmp slt i32 %9126, 32
  br i1 %9127, label %9140, label %9128

9128:                                             ; preds = %9121
  %9129 = load i8, ptr %403, align 1
  %9130 = sext i8 %9129 to i32
  %9131 = icmp sgt i32 %9130, 126
  br i1 %9131, label %9140, label %9132

9132:                                             ; preds = %9128
  %9133 = load i8, ptr %403, align 1
  %9134 = sext i8 %9133 to i32
  %9135 = icmp eq i32 %9134, 34
  br i1 %9135, label %9140, label %9136

9136:                                             ; preds = %9132
  %9137 = load i8, ptr %403, align 1
  %9138 = sext i8 %9137 to i32
  %9139 = icmp eq i32 %9138, 92
  br i1 %9139, label %9140, label %9141

9140:                                             ; preds = %9136, %9132, %9128, %9121
  store i1 false, ptr %385, align 1
  br label %9528

9141:                                             ; preds = %9136
  br label %9142

9142:                                             ; preds = %9141, %9118
  %9143 = load i64, ptr %387, align 8
  %9144 = icmp ult i64 16, %9143
  br i1 %9144, label %9145, label %9166

9145:                                             ; preds = %9142
  %9146 = load ptr, ptr %386, align 8
  %9147 = getelementptr inbounds i8, ptr %9146, i64 16
  %9148 = load i8, ptr %9147, align 1
  store i8 %9148, ptr %404, align 1
  %9149 = load i8, ptr %404, align 1
  %9150 = sext i8 %9149 to i32
  %9151 = icmp slt i32 %9150, 32
  br i1 %9151, label %9164, label %9152

9152:                                             ; preds = %9145
  %9153 = load i8, ptr %404, align 1
  %9154 = sext i8 %9153 to i32
  %9155 = icmp sgt i32 %9154, 126
  br i1 %9155, label %9164, label %9156

9156:                                             ; preds = %9152
  %9157 = load i8, ptr %404, align 1
  %9158 = sext i8 %9157 to i32
  %9159 = icmp eq i32 %9158, 34
  br i1 %9159, label %9164, label %9160

9160:                                             ; preds = %9156
  %9161 = load i8, ptr %404, align 1
  %9162 = sext i8 %9161 to i32
  %9163 = icmp eq i32 %9162, 92
  br i1 %9163, label %9164, label %9165

9164:                                             ; preds = %9160, %9156, %9152, %9145
  store i1 false, ptr %385, align 1
  br label %9528

9165:                                             ; preds = %9160
  br label %9166

9166:                                             ; preds = %9165, %9142
  %9167 = load i64, ptr %387, align 8
  %9168 = icmp ult i64 17, %9167
  br i1 %9168, label %9169, label %9190

9169:                                             ; preds = %9166
  %9170 = load ptr, ptr %386, align 8
  %9171 = getelementptr inbounds i8, ptr %9170, i64 17
  %9172 = load i8, ptr %9171, align 1
  store i8 %9172, ptr %405, align 1
  %9173 = load i8, ptr %405, align 1
  %9174 = sext i8 %9173 to i32
  %9175 = icmp slt i32 %9174, 32
  br i1 %9175, label %9188, label %9176

9176:                                             ; preds = %9169
  %9177 = load i8, ptr %405, align 1
  %9178 = sext i8 %9177 to i32
  %9179 = icmp sgt i32 %9178, 126
  br i1 %9179, label %9188, label %9180

9180:                                             ; preds = %9176
  %9181 = load i8, ptr %405, align 1
  %9182 = sext i8 %9181 to i32
  %9183 = icmp eq i32 %9182, 34
  br i1 %9183, label %9188, label %9184

9184:                                             ; preds = %9180
  %9185 = load i8, ptr %405, align 1
  %9186 = sext i8 %9185 to i32
  %9187 = icmp eq i32 %9186, 92
  br i1 %9187, label %9188, label %9189

9188:                                             ; preds = %9184, %9180, %9176, %9169
  store i1 false, ptr %385, align 1
  br label %9528

9189:                                             ; preds = %9184
  br label %9190

9190:                                             ; preds = %9189, %9166
  %9191 = load i64, ptr %387, align 8
  %9192 = icmp ult i64 18, %9191
  br i1 %9192, label %9193, label %9214

9193:                                             ; preds = %9190
  %9194 = load ptr, ptr %386, align 8
  %9195 = getelementptr inbounds i8, ptr %9194, i64 18
  %9196 = load i8, ptr %9195, align 1
  store i8 %9196, ptr %406, align 1
  %9197 = load i8, ptr %406, align 1
  %9198 = sext i8 %9197 to i32
  %9199 = icmp slt i32 %9198, 32
  br i1 %9199, label %9212, label %9200

9200:                                             ; preds = %9193
  %9201 = load i8, ptr %406, align 1
  %9202 = sext i8 %9201 to i32
  %9203 = icmp sgt i32 %9202, 126
  br i1 %9203, label %9212, label %9204

9204:                                             ; preds = %9200
  %9205 = load i8, ptr %406, align 1
  %9206 = sext i8 %9205 to i32
  %9207 = icmp eq i32 %9206, 34
  br i1 %9207, label %9212, label %9208

9208:                                             ; preds = %9204
  %9209 = load i8, ptr %406, align 1
  %9210 = sext i8 %9209 to i32
  %9211 = icmp eq i32 %9210, 92
  br i1 %9211, label %9212, label %9213

9212:                                             ; preds = %9208, %9204, %9200, %9193
  store i1 false, ptr %385, align 1
  br label %9528

9213:                                             ; preds = %9208
  br label %9214

9214:                                             ; preds = %9213, %9190
  %9215 = load i64, ptr %387, align 8
  %9216 = icmp ult i64 19, %9215
  br i1 %9216, label %9217, label %9238

9217:                                             ; preds = %9214
  %9218 = load ptr, ptr %386, align 8
  %9219 = getelementptr inbounds i8, ptr %9218, i64 19
  %9220 = load i8, ptr %9219, align 1
  store i8 %9220, ptr %407, align 1
  %9221 = load i8, ptr %407, align 1
  %9222 = sext i8 %9221 to i32
  %9223 = icmp slt i32 %9222, 32
  br i1 %9223, label %9236, label %9224

9224:                                             ; preds = %9217
  %9225 = load i8, ptr %407, align 1
  %9226 = sext i8 %9225 to i32
  %9227 = icmp sgt i32 %9226, 126
  br i1 %9227, label %9236, label %9228

9228:                                             ; preds = %9224
  %9229 = load i8, ptr %407, align 1
  %9230 = sext i8 %9229 to i32
  %9231 = icmp eq i32 %9230, 34
  br i1 %9231, label %9236, label %9232

9232:                                             ; preds = %9228
  %9233 = load i8, ptr %407, align 1
  %9234 = sext i8 %9233 to i32
  %9235 = icmp eq i32 %9234, 92
  br i1 %9235, label %9236, label %9237

9236:                                             ; preds = %9232, %9228, %9224, %9217
  store i1 false, ptr %385, align 1
  br label %9528

9237:                                             ; preds = %9232
  br label %9238

9238:                                             ; preds = %9237, %9214
  %9239 = load i64, ptr %387, align 8
  %9240 = icmp ult i64 20, %9239
  br i1 %9240, label %9241, label %9262

9241:                                             ; preds = %9238
  %9242 = load ptr, ptr %386, align 8
  %9243 = getelementptr inbounds i8, ptr %9242, i64 20
  %9244 = load i8, ptr %9243, align 1
  store i8 %9244, ptr %408, align 1
  %9245 = load i8, ptr %408, align 1
  %9246 = sext i8 %9245 to i32
  %9247 = icmp slt i32 %9246, 32
  br i1 %9247, label %9260, label %9248

9248:                                             ; preds = %9241
  %9249 = load i8, ptr %408, align 1
  %9250 = sext i8 %9249 to i32
  %9251 = icmp sgt i32 %9250, 126
  br i1 %9251, label %9260, label %9252

9252:                                             ; preds = %9248
  %9253 = load i8, ptr %408, align 1
  %9254 = sext i8 %9253 to i32
  %9255 = icmp eq i32 %9254, 34
  br i1 %9255, label %9260, label %9256

9256:                                             ; preds = %9252
  %9257 = load i8, ptr %408, align 1
  %9258 = sext i8 %9257 to i32
  %9259 = icmp eq i32 %9258, 92
  br i1 %9259, label %9260, label %9261

9260:                                             ; preds = %9256, %9252, %9248, %9241
  store i1 false, ptr %385, align 1
  br label %9528

9261:                                             ; preds = %9256
  br label %9262

9262:                                             ; preds = %9261, %9238
  %9263 = load i64, ptr %387, align 8
  %9264 = icmp ult i64 21, %9263
  br i1 %9264, label %9265, label %9286

9265:                                             ; preds = %9262
  %9266 = load ptr, ptr %386, align 8
  %9267 = getelementptr inbounds i8, ptr %9266, i64 21
  %9268 = load i8, ptr %9267, align 1
  store i8 %9268, ptr %409, align 1
  %9269 = load i8, ptr %409, align 1
  %9270 = sext i8 %9269 to i32
  %9271 = icmp slt i32 %9270, 32
  br i1 %9271, label %9284, label %9272

9272:                                             ; preds = %9265
  %9273 = load i8, ptr %409, align 1
  %9274 = sext i8 %9273 to i32
  %9275 = icmp sgt i32 %9274, 126
  br i1 %9275, label %9284, label %9276

9276:                                             ; preds = %9272
  %9277 = load i8, ptr %409, align 1
  %9278 = sext i8 %9277 to i32
  %9279 = icmp eq i32 %9278, 34
  br i1 %9279, label %9284, label %9280

9280:                                             ; preds = %9276
  %9281 = load i8, ptr %409, align 1
  %9282 = sext i8 %9281 to i32
  %9283 = icmp eq i32 %9282, 92
  br i1 %9283, label %9284, label %9285

9284:                                             ; preds = %9280, %9276, %9272, %9265
  store i1 false, ptr %385, align 1
  br label %9528

9285:                                             ; preds = %9280
  br label %9286

9286:                                             ; preds = %9285, %9262
  %9287 = load i64, ptr %387, align 8
  %9288 = icmp ult i64 22, %9287
  br i1 %9288, label %9289, label %9310

9289:                                             ; preds = %9286
  %9290 = load ptr, ptr %386, align 8
  %9291 = getelementptr inbounds i8, ptr %9290, i64 22
  %9292 = load i8, ptr %9291, align 1
  store i8 %9292, ptr %410, align 1
  %9293 = load i8, ptr %410, align 1
  %9294 = sext i8 %9293 to i32
  %9295 = icmp slt i32 %9294, 32
  br i1 %9295, label %9308, label %9296

9296:                                             ; preds = %9289
  %9297 = load i8, ptr %410, align 1
  %9298 = sext i8 %9297 to i32
  %9299 = icmp sgt i32 %9298, 126
  br i1 %9299, label %9308, label %9300

9300:                                             ; preds = %9296
  %9301 = load i8, ptr %410, align 1
  %9302 = sext i8 %9301 to i32
  %9303 = icmp eq i32 %9302, 34
  br i1 %9303, label %9308, label %9304

9304:                                             ; preds = %9300
  %9305 = load i8, ptr %410, align 1
  %9306 = sext i8 %9305 to i32
  %9307 = icmp eq i32 %9306, 92
  br i1 %9307, label %9308, label %9309

9308:                                             ; preds = %9304, %9300, %9296, %9289
  store i1 false, ptr %385, align 1
  br label %9528

9309:                                             ; preds = %9304
  br label %9310

9310:                                             ; preds = %9309, %9286
  %9311 = load i64, ptr %387, align 8
  %9312 = icmp ult i64 23, %9311
  br i1 %9312, label %9313, label %9334

9313:                                             ; preds = %9310
  %9314 = load ptr, ptr %386, align 8
  %9315 = getelementptr inbounds i8, ptr %9314, i64 23
  %9316 = load i8, ptr %9315, align 1
  store i8 %9316, ptr %411, align 1
  %9317 = load i8, ptr %411, align 1
  %9318 = sext i8 %9317 to i32
  %9319 = icmp slt i32 %9318, 32
  br i1 %9319, label %9332, label %9320

9320:                                             ; preds = %9313
  %9321 = load i8, ptr %411, align 1
  %9322 = sext i8 %9321 to i32
  %9323 = icmp sgt i32 %9322, 126
  br i1 %9323, label %9332, label %9324

9324:                                             ; preds = %9320
  %9325 = load i8, ptr %411, align 1
  %9326 = sext i8 %9325 to i32
  %9327 = icmp eq i32 %9326, 34
  br i1 %9327, label %9332, label %9328

9328:                                             ; preds = %9324
  %9329 = load i8, ptr %411, align 1
  %9330 = sext i8 %9329 to i32
  %9331 = icmp eq i32 %9330, 92
  br i1 %9331, label %9332, label %9333

9332:                                             ; preds = %9328, %9324, %9320, %9313
  store i1 false, ptr %385, align 1
  br label %9528

9333:                                             ; preds = %9328
  br label %9334

9334:                                             ; preds = %9333, %9310
  %9335 = load i64, ptr %387, align 8
  %9336 = icmp ult i64 24, %9335
  br i1 %9336, label %9337, label %9358

9337:                                             ; preds = %9334
  %9338 = load ptr, ptr %386, align 8
  %9339 = getelementptr inbounds i8, ptr %9338, i64 24
  %9340 = load i8, ptr %9339, align 1
  store i8 %9340, ptr %412, align 1
  %9341 = load i8, ptr %412, align 1
  %9342 = sext i8 %9341 to i32
  %9343 = icmp slt i32 %9342, 32
  br i1 %9343, label %9356, label %9344

9344:                                             ; preds = %9337
  %9345 = load i8, ptr %412, align 1
  %9346 = sext i8 %9345 to i32
  %9347 = icmp sgt i32 %9346, 126
  br i1 %9347, label %9356, label %9348

9348:                                             ; preds = %9344
  %9349 = load i8, ptr %412, align 1
  %9350 = sext i8 %9349 to i32
  %9351 = icmp eq i32 %9350, 34
  br i1 %9351, label %9356, label %9352

9352:                                             ; preds = %9348
  %9353 = load i8, ptr %412, align 1
  %9354 = sext i8 %9353 to i32
  %9355 = icmp eq i32 %9354, 92
  br i1 %9355, label %9356, label %9357

9356:                                             ; preds = %9352, %9348, %9344, %9337
  store i1 false, ptr %385, align 1
  br label %9528

9357:                                             ; preds = %9352
  br label %9358

9358:                                             ; preds = %9357, %9334
  %9359 = load i64, ptr %387, align 8
  %9360 = icmp ult i64 25, %9359
  br i1 %9360, label %9361, label %9382

9361:                                             ; preds = %9358
  %9362 = load ptr, ptr %386, align 8
  %9363 = getelementptr inbounds i8, ptr %9362, i64 25
  %9364 = load i8, ptr %9363, align 1
  store i8 %9364, ptr %413, align 1
  %9365 = load i8, ptr %413, align 1
  %9366 = sext i8 %9365 to i32
  %9367 = icmp slt i32 %9366, 32
  br i1 %9367, label %9380, label %9368

9368:                                             ; preds = %9361
  %9369 = load i8, ptr %413, align 1
  %9370 = sext i8 %9369 to i32
  %9371 = icmp sgt i32 %9370, 126
  br i1 %9371, label %9380, label %9372

9372:                                             ; preds = %9368
  %9373 = load i8, ptr %413, align 1
  %9374 = sext i8 %9373 to i32
  %9375 = icmp eq i32 %9374, 34
  br i1 %9375, label %9380, label %9376

9376:                                             ; preds = %9372
  %9377 = load i8, ptr %413, align 1
  %9378 = sext i8 %9377 to i32
  %9379 = icmp eq i32 %9378, 92
  br i1 %9379, label %9380, label %9381

9380:                                             ; preds = %9376, %9372, %9368, %9361
  store i1 false, ptr %385, align 1
  br label %9528

9381:                                             ; preds = %9376
  br label %9382

9382:                                             ; preds = %9381, %9358
  %9383 = load i64, ptr %387, align 8
  %9384 = icmp ult i64 26, %9383
  br i1 %9384, label %9385, label %9406

9385:                                             ; preds = %9382
  %9386 = load ptr, ptr %386, align 8
  %9387 = getelementptr inbounds i8, ptr %9386, i64 26
  %9388 = load i8, ptr %9387, align 1
  store i8 %9388, ptr %414, align 1
  %9389 = load i8, ptr %414, align 1
  %9390 = sext i8 %9389 to i32
  %9391 = icmp slt i32 %9390, 32
  br i1 %9391, label %9404, label %9392

9392:                                             ; preds = %9385
  %9393 = load i8, ptr %414, align 1
  %9394 = sext i8 %9393 to i32
  %9395 = icmp sgt i32 %9394, 126
  br i1 %9395, label %9404, label %9396

9396:                                             ; preds = %9392
  %9397 = load i8, ptr %414, align 1
  %9398 = sext i8 %9397 to i32
  %9399 = icmp eq i32 %9398, 34
  br i1 %9399, label %9404, label %9400

9400:                                             ; preds = %9396
  %9401 = load i8, ptr %414, align 1
  %9402 = sext i8 %9401 to i32
  %9403 = icmp eq i32 %9402, 92
  br i1 %9403, label %9404, label %9405

9404:                                             ; preds = %9400, %9396, %9392, %9385
  store i1 false, ptr %385, align 1
  br label %9528

9405:                                             ; preds = %9400
  br label %9406

9406:                                             ; preds = %9405, %9382
  %9407 = load i64, ptr %387, align 8
  %9408 = icmp ult i64 27, %9407
  br i1 %9408, label %9409, label %9430

9409:                                             ; preds = %9406
  %9410 = load ptr, ptr %386, align 8
  %9411 = getelementptr inbounds i8, ptr %9410, i64 27
  %9412 = load i8, ptr %9411, align 1
  store i8 %9412, ptr %415, align 1
  %9413 = load i8, ptr %415, align 1
  %9414 = sext i8 %9413 to i32
  %9415 = icmp slt i32 %9414, 32
  br i1 %9415, label %9428, label %9416

9416:                                             ; preds = %9409
  %9417 = load i8, ptr %415, align 1
  %9418 = sext i8 %9417 to i32
  %9419 = icmp sgt i32 %9418, 126
  br i1 %9419, label %9428, label %9420

9420:                                             ; preds = %9416
  %9421 = load i8, ptr %415, align 1
  %9422 = sext i8 %9421 to i32
  %9423 = icmp eq i32 %9422, 34
  br i1 %9423, label %9428, label %9424

9424:                                             ; preds = %9420
  %9425 = load i8, ptr %415, align 1
  %9426 = sext i8 %9425 to i32
  %9427 = icmp eq i32 %9426, 92
  br i1 %9427, label %9428, label %9429

9428:                                             ; preds = %9424, %9420, %9416, %9409
  store i1 false, ptr %385, align 1
  br label %9528

9429:                                             ; preds = %9424
  br label %9430

9430:                                             ; preds = %9429, %9406
  %9431 = load i64, ptr %387, align 8
  %9432 = icmp ult i64 28, %9431
  br i1 %9432, label %9433, label %9454

9433:                                             ; preds = %9430
  %9434 = load ptr, ptr %386, align 8
  %9435 = getelementptr inbounds i8, ptr %9434, i64 28
  %9436 = load i8, ptr %9435, align 1
  store i8 %9436, ptr %416, align 1
  %9437 = load i8, ptr %416, align 1
  %9438 = sext i8 %9437 to i32
  %9439 = icmp slt i32 %9438, 32
  br i1 %9439, label %9452, label %9440

9440:                                             ; preds = %9433
  %9441 = load i8, ptr %416, align 1
  %9442 = sext i8 %9441 to i32
  %9443 = icmp sgt i32 %9442, 126
  br i1 %9443, label %9452, label %9444

9444:                                             ; preds = %9440
  %9445 = load i8, ptr %416, align 1
  %9446 = sext i8 %9445 to i32
  %9447 = icmp eq i32 %9446, 34
  br i1 %9447, label %9452, label %9448

9448:                                             ; preds = %9444
  %9449 = load i8, ptr %416, align 1
  %9450 = sext i8 %9449 to i32
  %9451 = icmp eq i32 %9450, 92
  br i1 %9451, label %9452, label %9453

9452:                                             ; preds = %9448, %9444, %9440, %9433
  store i1 false, ptr %385, align 1
  br label %9528

9453:                                             ; preds = %9448
  br label %9454

9454:                                             ; preds = %9453, %9430
  %9455 = load i64, ptr %387, align 8
  %9456 = icmp ult i64 29, %9455
  br i1 %9456, label %9457, label %9478

9457:                                             ; preds = %9454
  %9458 = load ptr, ptr %386, align 8
  %9459 = getelementptr inbounds i8, ptr %9458, i64 29
  %9460 = load i8, ptr %9459, align 1
  store i8 %9460, ptr %417, align 1
  %9461 = load i8, ptr %417, align 1
  %9462 = sext i8 %9461 to i32
  %9463 = icmp slt i32 %9462, 32
  br i1 %9463, label %9476, label %9464

9464:                                             ; preds = %9457
  %9465 = load i8, ptr %417, align 1
  %9466 = sext i8 %9465 to i32
  %9467 = icmp sgt i32 %9466, 126
  br i1 %9467, label %9476, label %9468

9468:                                             ; preds = %9464
  %9469 = load i8, ptr %417, align 1
  %9470 = sext i8 %9469 to i32
  %9471 = icmp eq i32 %9470, 34
  br i1 %9471, label %9476, label %9472

9472:                                             ; preds = %9468
  %9473 = load i8, ptr %417, align 1
  %9474 = sext i8 %9473 to i32
  %9475 = icmp eq i32 %9474, 92
  br i1 %9475, label %9476, label %9477

9476:                                             ; preds = %9472, %9468, %9464, %9457
  store i1 false, ptr %385, align 1
  br label %9528

9477:                                             ; preds = %9472
  br label %9478

9478:                                             ; preds = %9477, %9454
  %9479 = load i64, ptr %387, align 8
  %9480 = icmp ult i64 30, %9479
  br i1 %9480, label %9481, label %9502

9481:                                             ; preds = %9478
  %9482 = load ptr, ptr %386, align 8
  %9483 = getelementptr inbounds i8, ptr %9482, i64 30
  %9484 = load i8, ptr %9483, align 1
  store i8 %9484, ptr %418, align 1
  %9485 = load i8, ptr %418, align 1
  %9486 = sext i8 %9485 to i32
  %9487 = icmp slt i32 %9486, 32
  br i1 %9487, label %9500, label %9488

9488:                                             ; preds = %9481
  %9489 = load i8, ptr %418, align 1
  %9490 = sext i8 %9489 to i32
  %9491 = icmp sgt i32 %9490, 126
  br i1 %9491, label %9500, label %9492

9492:                                             ; preds = %9488
  %9493 = load i8, ptr %418, align 1
  %9494 = sext i8 %9493 to i32
  %9495 = icmp eq i32 %9494, 34
  br i1 %9495, label %9500, label %9496

9496:                                             ; preds = %9492
  %9497 = load i8, ptr %418, align 1
  %9498 = sext i8 %9497 to i32
  %9499 = icmp eq i32 %9498, 92
  br i1 %9499, label %9500, label %9501

9500:                                             ; preds = %9496, %9492, %9488, %9481
  store i1 false, ptr %385, align 1
  br label %9528

9501:                                             ; preds = %9496
  br label %9502

9502:                                             ; preds = %9501, %9478
  %9503 = load i64, ptr %387, align 8
  %9504 = icmp ult i64 31, %9503
  br i1 %9504, label %9505, label %9526

9505:                                             ; preds = %9502
  %9506 = load ptr, ptr %386, align 8
  %9507 = getelementptr inbounds i8, ptr %9506, i64 31
  %9508 = load i8, ptr %9507, align 1
  store i8 %9508, ptr %419, align 1
  %9509 = load i8, ptr %419, align 1
  %9510 = sext i8 %9509 to i32
  %9511 = icmp slt i32 %9510, 32
  br i1 %9511, label %9524, label %9512

9512:                                             ; preds = %9505
  %9513 = load i8, ptr %419, align 1
  %9514 = sext i8 %9513 to i32
  %9515 = icmp sgt i32 %9514, 126
  br i1 %9515, label %9524, label %9516

9516:                                             ; preds = %9512
  %9517 = load i8, ptr %419, align 1
  %9518 = sext i8 %9517 to i32
  %9519 = icmp eq i32 %9518, 34
  br i1 %9519, label %9524, label %9520

9520:                                             ; preds = %9516
  %9521 = load i8, ptr %419, align 1
  %9522 = sext i8 %9521 to i32
  %9523 = icmp eq i32 %9522, 92
  br i1 %9523, label %9524, label %9525

9524:                                             ; preds = %9520, %9516, %9512, %9505
  store i1 false, ptr %385, align 1
  br label %9528

9525:                                             ; preds = %9520
  br label %9526

9526:                                             ; preds = %9525, %9502
  store i1 true, ptr %385, align 1
  br label %9528

9527:                                             ; preds = %8756, %8747
  store i1 false, ptr %385, align 1
  br label %9528

9528:                                             ; preds = %8780, %8804, %8828, %8852, %8876, %8900, %8924, %8948, %8972, %8996, %9020, %9044, %9068, %9092, %9116, %9140, %9164, %9188, %9212, %9236, %9260, %9284, %9308, %9332, %9356, %9380, %9404, %9428, %9452, %9476, %9500, %9524, %9526, %9527
  %9529 = load i1, ptr %385, align 1
  %9530 = zext i1 %9529 to i8
  store i8 %9530, ptr %503, align 1
  %9531 = load i8, ptr %503, align 1
  %9532 = trunc i8 %9531 to i1
  %9533 = zext i1 %9532 to i64
  %9534 = select i1 %9532, i32 8, i32 0
  %9535 = trunc i32 %9534 to i8
  store i8 %9535, ptr %504, align 1
  %9536 = load ptr, ptr %500, align 8
  %9537 = load i8, ptr %504, align 1
  %9538 = load i64, ptr %502, align 8
  store ptr %9536, ptr %125, align 8
  store i8 5, ptr %126, align 1
  store i8 %9537, ptr %127, align 1
  store i64 %9538, ptr %128, align 8
  %9539 = load i64, ptr %128, align 8
  %9540 = shl i64 %9539, 8
  store i64 %9540, ptr %129, align 8
  %9541 = load i8, ptr %126, align 1
  %9542 = zext i8 %9541 to i32
  %9543 = load i8, ptr %127, align 1
  %9544 = zext i8 %9543 to i32
  %9545 = or i32 %9542, %9544
  %9546 = sext i32 %9545 to i64
  %9547 = load i64, ptr %129, align 8
  %9548 = or i64 %9547, %9546
  store i64 %9548, ptr %129, align 8
  %9549 = load i64, ptr %129, align 8
  %9550 = load ptr, ptr %125, align 8
  store i64 %9549, ptr %9550, align 8
  %9551 = load ptr, ptr %501, align 8
  %9552 = load ptr, ptr %500, align 8
  %9553 = getelementptr inbounds nuw %struct.yyjson_val, ptr %9552, i32 0, i32 1
  store ptr %9551, ptr %9553, align 8
  %9554 = load ptr, ptr %877, align 8
  store ptr %9554, ptr %874, align 8
  br label %9557

9555:                                             ; preds = %8740
  br label %9556

9556:                                             ; preds = %9555, %8696
  store ptr null, ptr %874, align 8
  br label %9557

9557:                                             ; preds = %9528, %9556
  %9558 = load ptr, ptr %874, align 8
  %9559 = load ptr, ptr %944, align 8
  store ptr %8689, ptr %911, align 8
  store ptr %9558, ptr %912, align 8
  store ptr %9559, ptr %913, align 8
  %9560 = load ptr, ptr %911, align 8
  store ptr %9560, ptr %684, align 8
  %9561 = load ptr, ptr %684, align 8
  %9562 = icmp ne ptr %9561, null
  br i1 %9562, label %9563, label %9576

9563:                                             ; preds = %9557
  %9564 = load ptr, ptr %684, align 8
  store ptr %9564, ptr %614, align 8
  %9565 = load ptr, ptr %614, align 8
  store ptr %9565, ptr %594, align 8
  %9566 = load ptr, ptr %594, align 8
  %9567 = load i64, ptr %9566, align 8
  %9568 = trunc i64 %9567 to i8
  store i8 %9568, ptr %595, align 1
  %9569 = load i8, ptr %595, align 1
  %9570 = zext i8 %9569 to i32
  %9571 = and i32 %9570, 7
  %9572 = trunc i32 %9571 to i8
  %9573 = zext i8 %9572 to i32
  %9574 = icmp eq i32 %9573, 7
  %9575 = zext i1 %9574 to i32
  br label %9577

9576:                                             ; preds = %9557
  br label %9577

9577:                                             ; preds = %9563, %9576
  %9578 = phi i32 [ %9575, %9563 ], [ 0, %9576 ]
  %9579 = icmp ne i32 %9578, 0
  br i1 %9579, label %9580, label %9604

9580:                                             ; preds = %9577
  %9581 = load ptr, ptr %912, align 8
  store ptr %9581, ptr %676, align 8
  %9582 = load ptr, ptr %676, align 8
  %9583 = icmp ne ptr %9582, null
  br i1 %9583, label %9584, label %9597

9584:                                             ; preds = %9580
  %9585 = load ptr, ptr %676, align 8
  store ptr %9585, ptr %588, align 8
  %9586 = load ptr, ptr %588, align 8
  store ptr %9586, ptr %586, align 8
  %9587 = load ptr, ptr %586, align 8
  %9588 = load i64, ptr %9587, align 8
  %9589 = trunc i64 %9588 to i8
  store i8 %9589, ptr %587, align 1
  %9590 = load i8, ptr %587, align 1
  %9591 = zext i8 %9590 to i32
  %9592 = and i32 %9591, 7
  %9593 = trunc i32 %9592 to i8
  %9594 = zext i8 %9593 to i32
  %9595 = icmp eq i32 %9594, 5
  %9596 = zext i1 %9595 to i32
  br label %9598

9597:                                             ; preds = %9580
  br label %9598

9598:                                             ; preds = %9584, %9597
  %9599 = phi i32 [ %9596, %9584 ], [ 0, %9597 ]
  %9600 = icmp ne i32 %9599, 0
  br i1 %9600, label %9601, label %9604

9601:                                             ; preds = %9598
  %9602 = load ptr, ptr %913, align 8
  %9603 = icmp ne ptr %9602, null
  br label %9604

9604:                                             ; preds = %9601, %9598, %9577
  %9605 = phi i1 [ false, %9598 ], [ false, %9577 ], [ %9603, %9601 ]
  %9606 = xor i1 %9605, true
  %9607 = zext i1 %9605 to i32
  %9608 = sext i32 %9607 to i64
  br i1 %9605, label %9609, label %9660

9609:                                             ; preds = %9604
  %9610 = load ptr, ptr %911, align 8
  %9611 = load ptr, ptr %912, align 8
  %9612 = load ptr, ptr %913, align 8
  %9613 = load ptr, ptr %911, align 8
  store ptr %9613, ptr %617, align 8
  %9614 = load ptr, ptr %617, align 8
  %9615 = load i64, ptr %9614, align 8
  %9616 = lshr i64 %9615, 8
  store ptr %9610, ptr %633, align 8
  store ptr %9611, ptr %634, align 8
  store ptr %9612, ptr %635, align 8
  store i64 %9616, ptr %636, align 8
  %9617 = load i64, ptr %636, align 8
  %9618 = icmp ne i64 %9617, 0
  %9619 = xor i1 %9618, true
  %9620 = zext i1 %9618 to i32
  %9621 = sext i32 %9620 to i64
  br i1 %9618, label %9622, label %9637

9622:                                             ; preds = %9609
  %9623 = load ptr, ptr %633, align 8
  %9624 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9623, i32 0, i32 1
  %9625 = load ptr, ptr %9624, align 8
  %9626 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9625, i32 0, i32 2
  %9627 = load ptr, ptr %9626, align 8
  store ptr %9627, ptr %637, align 8
  %9628 = load ptr, ptr %637, align 8
  %9629 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9628, i32 0, i32 2
  %9630 = load ptr, ptr %9629, align 8
  store ptr %9630, ptr %638, align 8
  %9631 = load ptr, ptr %634, align 8
  %9632 = load ptr, ptr %637, align 8
  %9633 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9632, i32 0, i32 2
  store ptr %9631, ptr %9633, align 8
  %9634 = load ptr, ptr %638, align 8
  %9635 = load ptr, ptr %635, align 8
  %9636 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9635, i32 0, i32 2
  store ptr %9634, ptr %9636, align 8
  br label %9641

9637:                                             ; preds = %9609
  %9638 = load ptr, ptr %634, align 8
  %9639 = load ptr, ptr %635, align 8
  %9640 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9639, i32 0, i32 2
  store ptr %9638, ptr %9640, align 8
  br label %9641

9641:                                             ; preds = %9622, %9637
  %9642 = load ptr, ptr %635, align 8
  %9643 = load ptr, ptr %634, align 8
  %9644 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9643, i32 0, i32 2
  store ptr %9642, ptr %9644, align 8
  %9645 = load ptr, ptr %634, align 8
  %9646 = load ptr, ptr %633, align 8
  %9647 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9646, i32 0, i32 1
  store ptr %9645, ptr %9647, align 8
  %9648 = load ptr, ptr %633, align 8
  %9649 = load i64, ptr %636, align 8
  %9650 = add i64 %9649, 1
  store ptr %9648, ptr %562, align 8
  store i64 %9650, ptr %563, align 8
  %9651 = load ptr, ptr %562, align 8
  %9652 = load i64, ptr %9651, align 8
  %9653 = and i64 %9652, 255
  store i64 %9653, ptr %564, align 8
  %9654 = load i64, ptr %563, align 8
  %9655 = shl i64 %9654, 8
  %9656 = load i64, ptr %564, align 8
  %9657 = or i64 %9656, %9655
  store i64 %9657, ptr %564, align 8
  %9658 = load i64, ptr %564, align 8
  %9659 = load ptr, ptr %562, align 8
  store i64 %9658, ptr %9659, align 8
  store i1 true, ptr %910, align 1
  br label %9661

9660:                                             ; preds = %9604
  store i1 false, ptr %910, align 1
  br label %9661

9661:                                             ; preds = %9641, %9660
  %9662 = load i1, ptr %910, align 1
  %9663 = load ptr, ptr %940, align 8
  %9664 = load ptr, ptr %943, align 8
  store ptr %9663, ptr %803, align 8
  store ptr %9664, ptr %804, align 8
  %9665 = load ptr, ptr %803, align 8
  store ptr %9665, ptr %57, align 8
  %9666 = load ptr, ptr %57, align 8
  %9667 = icmp ne ptr %9666, null
  br i1 %9667, label %9668, label %9681

9668:                                             ; preds = %9661
  %9669 = load ptr, ptr %57, align 8
  store ptr %9669, ptr %30, align 8
  %9670 = load ptr, ptr %30, align 8
  store ptr %9670, ptr %28, align 8
  %9671 = load ptr, ptr %28, align 8
  %9672 = load i64, ptr %9671, align 8
  %9673 = trunc i64 %9672 to i8
  store i8 %9673, ptr %29, align 1
  %9674 = load i8, ptr %29, align 1
  %9675 = zext i8 %9674 to i32
  %9676 = and i32 %9675, 7
  %9677 = trunc i32 %9676 to i8
  %9678 = zext i8 %9677 to i32
  %9679 = icmp eq i32 %9678, 6
  %9680 = zext i1 %9679 to i32
  br label %9682

9681:                                             ; preds = %9661
  br label %9682

9682:                                             ; preds = %9668, %9681
  %9683 = phi i32 [ %9680, %9668 ], [ 0, %9681 ]
  %9684 = icmp ne i32 %9683, 0
  br i1 %9684, label %9685, label %9688

9685:                                             ; preds = %9682
  %9686 = load ptr, ptr %804, align 8
  %9687 = icmp ne ptr %9686, null
  br label %9688

9688:                                             ; preds = %9685, %9682
  %9689 = phi i1 [ false, %9682 ], [ %9687, %9685 ]
  %9690 = xor i1 %9689, true
  %9691 = zext i1 %9689 to i32
  %9692 = sext i32 %9691 to i64
  br i1 %9689, label %9693, label %9733

9693:                                             ; preds = %9688
  %9694 = load ptr, ptr %803, align 8
  store ptr %9694, ptr %626, align 8
  %9695 = load ptr, ptr %626, align 8
  %9696 = load i64, ptr %9695, align 8
  %9697 = lshr i64 %9696, 8
  store i64 %9697, ptr %805, align 8
  %9698 = load ptr, ptr %803, align 8
  %9699 = load i64, ptr %805, align 8
  %9700 = add i64 %9699, 1
  store ptr %9698, ptr %541, align 8
  store i64 %9700, ptr %542, align 8
  %9701 = load ptr, ptr %541, align 8
  %9702 = load i64, ptr %9701, align 8
  %9703 = and i64 %9702, 255
  store i64 %9703, ptr %543, align 8
  %9704 = load i64, ptr %542, align 8
  %9705 = shl i64 %9704, 8
  %9706 = load i64, ptr %543, align 8
  %9707 = or i64 %9706, %9705
  store i64 %9707, ptr %543, align 8
  %9708 = load i64, ptr %543, align 8
  %9709 = load ptr, ptr %541, align 8
  store i64 %9708, ptr %9709, align 8
  %9710 = load i64, ptr %805, align 8
  %9711 = icmp eq i64 %9710, 0
  br i1 %9711, label %9712, label %9716

9712:                                             ; preds = %9693
  %9713 = load ptr, ptr %804, align 8
  %9714 = load ptr, ptr %804, align 8
  %9715 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9714, i32 0, i32 2
  store ptr %9713, ptr %9715, align 8
  br label %9729

9716:                                             ; preds = %9693
  %9717 = load ptr, ptr %803, align 8
  %9718 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9717, i32 0, i32 1
  %9719 = load ptr, ptr %9718, align 8
  store ptr %9719, ptr %806, align 8
  %9720 = load ptr, ptr %806, align 8
  %9721 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9720, i32 0, i32 2
  %9722 = load ptr, ptr %9721, align 8
  store ptr %9722, ptr %807, align 8
  %9723 = load ptr, ptr %804, align 8
  %9724 = load ptr, ptr %806, align 8
  %9725 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9724, i32 0, i32 2
  store ptr %9723, ptr %9725, align 8
  %9726 = load ptr, ptr %807, align 8
  %9727 = load ptr, ptr %804, align 8
  %9728 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9727, i32 0, i32 2
  store ptr %9726, ptr %9728, align 8
  br label %9729

9729:                                             ; preds = %9716, %9712
  %9730 = load ptr, ptr %804, align 8
  %9731 = load ptr, ptr %803, align 8
  %9732 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9731, i32 0, i32 1
  store ptr %9730, ptr %9732, align 8
  store i1 true, ptr %802, align 1
  br label %9734

9733:                                             ; preds = %9688
  store i1 false, ptr %802, align 1
  br label %9734

9734:                                             ; preds = %9729, %9733
  %9735 = load i1, ptr %802, align 1
  br label %9736

9736:                                             ; preds = %9734
  %9737 = load i64, ptr %941, align 8
  %9738 = add nsw i64 %9737, 1
  store i64 %9738, ptr %941, align 8
  br label %2066, !llvm.loop !8

9739:                                             ; preds = %2066
  %9740 = load ptr, ptr %939, align 8
  %9741 = load ptr, ptr %938, align 8
  store ptr %9741, ptr %879, align 8
  store ptr @.str.8, ptr %880, align 8
  %9742 = load ptr, ptr %879, align 8
  %9743 = icmp ne ptr %9742, null
  br i1 %9743, label %9744, label %9747

9744:                                             ; preds = %9739
  %9745 = load ptr, ptr %880, align 8
  %9746 = icmp ne ptr %9745, null
  br label %9747

9747:                                             ; preds = %9744, %9739
  %9748 = phi i1 [ false, %9739 ], [ %9746, %9744 ]
  %9749 = xor i1 %9748, true
  %9750 = zext i1 %9748 to i32
  %9751 = sext i32 %9750 to i64
  br i1 %9748, label %9752, label %10607

9752:                                             ; preds = %9747
  %9753 = load ptr, ptr %879, align 8
  store ptr %9753, ptr %728, align 8
  store i64 1, ptr %729, align 8
  %9754 = load ptr, ptr %728, align 8
  %9755 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %9754, i32 0, i32 1
  store ptr %9755, ptr %731, align 8
  %9756 = load ptr, ptr %728, align 8
  %9757 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %9756, i32 0, i32 3
  store ptr %9757, ptr %732, align 8
  %9758 = load ptr, ptr %732, align 8
  %9759 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %9758, i32 0, i32 1
  %9760 = load ptr, ptr %9759, align 8
  %9761 = load ptr, ptr %732, align 8
  %9762 = load ptr, ptr %9761, align 8
  %9763 = ptrtoint ptr %9760 to i64
  %9764 = ptrtoint ptr %9762 to i64
  %9765 = sub i64 %9763, %9764
  %9766 = sdiv exact i64 %9765, 24
  %9767 = load i64, ptr %729, align 8
  %9768 = icmp ult i64 %9766, %9767
  %9769 = xor i1 %9768, true
  %9770 = zext i1 %9768 to i32
  %9771 = sext i32 %9770 to i64
  br i1 %9768, label %9772, label %9783

9772:                                             ; preds = %9752
  %9773 = load ptr, ptr %732, align 8
  %9774 = load ptr, ptr %731, align 8
  %9775 = load i64, ptr %729, align 8
  %9776 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %9773, ptr noundef %9774, i64 noundef %9775)
  %9777 = xor i1 %9776, true
  %9778 = xor i1 %9776, true
  %9779 = zext i1 %9778 to i32
  %9780 = sext i32 %9779 to i64
  br i1 %9778, label %9781, label %9782

9781:                                             ; preds = %9772
  store ptr null, ptr %727, align 8
  br label %9791

9782:                                             ; preds = %9772
  br label %9783

9783:                                             ; preds = %9782, %9752
  %9784 = load ptr, ptr %732, align 8
  %9785 = load ptr, ptr %9784, align 8
  store ptr %9785, ptr %730, align 8
  %9786 = load i64, ptr %729, align 8
  %9787 = load ptr, ptr %732, align 8
  %9788 = load ptr, ptr %9787, align 8
  %9789 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %9788, i64 %9786
  store ptr %9789, ptr %9787, align 8
  %9790 = load ptr, ptr %730, align 8
  store ptr %9790, ptr %727, align 8
  br label %9791

9791:                                             ; preds = %9781, %9783
  %9792 = load ptr, ptr %727, align 8
  store ptr %9792, ptr %881, align 8
  %9793 = load ptr, ptr %881, align 8
  %9794 = icmp ne ptr %9793, null
  %9795 = xor i1 %9794, true
  %9796 = zext i1 %9794 to i32
  %9797 = sext i32 %9796 to i64
  br i1 %9794, label %9798, label %10606

9798:                                             ; preds = %9791
  %9799 = load ptr, ptr %881, align 8
  %9800 = load ptr, ptr %880, align 8
  store ptr %9799, ptr %495, align 8
  store ptr %9800, ptr %496, align 8
  %9801 = load ptr, ptr %496, align 8
  %9802 = call i64 @strlen(ptr noundef %9801)
  store i64 %9802, ptr %497, align 8
  %9803 = load ptr, ptr %496, align 8
  %9804 = load i64, ptr %497, align 8
  store ptr %9803, ptr %421, align 8
  store i64 %9804, ptr %422, align 8
  %9805 = load i64, ptr %422, align 8
  %9806 = call i1 @llvm.is.constant.i64(i64 %9805)
  br i1 %9806, label %9807, label %10578

9807:                                             ; preds = %9798
  %9808 = load i64, ptr %422, align 8
  %9809 = icmp ule i64 %9808, 32
  br i1 %9809, label %9810, label %10578

9810:                                             ; preds = %9807
  %9811 = load i64, ptr %422, align 8
  %9812 = icmp ult i64 0, %9811
  br i1 %9812, label %9813, label %9833

9813:                                             ; preds = %9810
  %9814 = load ptr, ptr %421, align 8
  %9815 = load i8, ptr %9814, align 1
  store i8 %9815, ptr %423, align 1
  %9816 = load i8, ptr %423, align 1
  %9817 = sext i8 %9816 to i32
  %9818 = icmp slt i32 %9817, 32
  br i1 %9818, label %9831, label %9819

9819:                                             ; preds = %9813
  %9820 = load i8, ptr %423, align 1
  %9821 = sext i8 %9820 to i32
  %9822 = icmp sgt i32 %9821, 126
  br i1 %9822, label %9831, label %9823

9823:                                             ; preds = %9819
  %9824 = load i8, ptr %423, align 1
  %9825 = sext i8 %9824 to i32
  %9826 = icmp eq i32 %9825, 34
  br i1 %9826, label %9831, label %9827

9827:                                             ; preds = %9823
  %9828 = load i8, ptr %423, align 1
  %9829 = sext i8 %9828 to i32
  %9830 = icmp eq i32 %9829, 92
  br i1 %9830, label %9831, label %9832

9831:                                             ; preds = %9827, %9823, %9819, %9813
  store i1 false, ptr %420, align 1
  br label %10579

9832:                                             ; preds = %9827
  br label %9833

9833:                                             ; preds = %9832, %9810
  %9834 = load i64, ptr %422, align 8
  %9835 = icmp ult i64 1, %9834
  br i1 %9835, label %9836, label %9857

9836:                                             ; preds = %9833
  %9837 = load ptr, ptr %421, align 8
  %9838 = getelementptr inbounds i8, ptr %9837, i64 1
  %9839 = load i8, ptr %9838, align 1
  store i8 %9839, ptr %424, align 1
  %9840 = load i8, ptr %424, align 1
  %9841 = sext i8 %9840 to i32
  %9842 = icmp slt i32 %9841, 32
  br i1 %9842, label %9855, label %9843

9843:                                             ; preds = %9836
  %9844 = load i8, ptr %424, align 1
  %9845 = sext i8 %9844 to i32
  %9846 = icmp sgt i32 %9845, 126
  br i1 %9846, label %9855, label %9847

9847:                                             ; preds = %9843
  %9848 = load i8, ptr %424, align 1
  %9849 = sext i8 %9848 to i32
  %9850 = icmp eq i32 %9849, 34
  br i1 %9850, label %9855, label %9851

9851:                                             ; preds = %9847
  %9852 = load i8, ptr %424, align 1
  %9853 = sext i8 %9852 to i32
  %9854 = icmp eq i32 %9853, 92
  br i1 %9854, label %9855, label %9856

9855:                                             ; preds = %9851, %9847, %9843, %9836
  store i1 false, ptr %420, align 1
  br label %10579

9856:                                             ; preds = %9851
  br label %9857

9857:                                             ; preds = %9856, %9833
  %9858 = load i64, ptr %422, align 8
  %9859 = icmp ult i64 2, %9858
  br i1 %9859, label %9860, label %9881

9860:                                             ; preds = %9857
  %9861 = load ptr, ptr %421, align 8
  %9862 = getelementptr inbounds i8, ptr %9861, i64 2
  %9863 = load i8, ptr %9862, align 1
  store i8 %9863, ptr %425, align 1
  %9864 = load i8, ptr %425, align 1
  %9865 = sext i8 %9864 to i32
  %9866 = icmp slt i32 %9865, 32
  br i1 %9866, label %9879, label %9867

9867:                                             ; preds = %9860
  %9868 = load i8, ptr %425, align 1
  %9869 = sext i8 %9868 to i32
  %9870 = icmp sgt i32 %9869, 126
  br i1 %9870, label %9879, label %9871

9871:                                             ; preds = %9867
  %9872 = load i8, ptr %425, align 1
  %9873 = sext i8 %9872 to i32
  %9874 = icmp eq i32 %9873, 34
  br i1 %9874, label %9879, label %9875

9875:                                             ; preds = %9871
  %9876 = load i8, ptr %425, align 1
  %9877 = sext i8 %9876 to i32
  %9878 = icmp eq i32 %9877, 92
  br i1 %9878, label %9879, label %9880

9879:                                             ; preds = %9875, %9871, %9867, %9860
  store i1 false, ptr %420, align 1
  br label %10579

9880:                                             ; preds = %9875
  br label %9881

9881:                                             ; preds = %9880, %9857
  %9882 = load i64, ptr %422, align 8
  %9883 = icmp ult i64 3, %9882
  br i1 %9883, label %9884, label %9905

9884:                                             ; preds = %9881
  %9885 = load ptr, ptr %421, align 8
  %9886 = getelementptr inbounds i8, ptr %9885, i64 3
  %9887 = load i8, ptr %9886, align 1
  store i8 %9887, ptr %426, align 1
  %9888 = load i8, ptr %426, align 1
  %9889 = sext i8 %9888 to i32
  %9890 = icmp slt i32 %9889, 32
  br i1 %9890, label %9903, label %9891

9891:                                             ; preds = %9884
  %9892 = load i8, ptr %426, align 1
  %9893 = sext i8 %9892 to i32
  %9894 = icmp sgt i32 %9893, 126
  br i1 %9894, label %9903, label %9895

9895:                                             ; preds = %9891
  %9896 = load i8, ptr %426, align 1
  %9897 = sext i8 %9896 to i32
  %9898 = icmp eq i32 %9897, 34
  br i1 %9898, label %9903, label %9899

9899:                                             ; preds = %9895
  %9900 = load i8, ptr %426, align 1
  %9901 = sext i8 %9900 to i32
  %9902 = icmp eq i32 %9901, 92
  br i1 %9902, label %9903, label %9904

9903:                                             ; preds = %9899, %9895, %9891, %9884
  store i1 false, ptr %420, align 1
  br label %10579

9904:                                             ; preds = %9899
  br label %9905

9905:                                             ; preds = %9904, %9881
  %9906 = load i64, ptr %422, align 8
  %9907 = icmp ult i64 4, %9906
  br i1 %9907, label %9908, label %9929

9908:                                             ; preds = %9905
  %9909 = load ptr, ptr %421, align 8
  %9910 = getelementptr inbounds i8, ptr %9909, i64 4
  %9911 = load i8, ptr %9910, align 1
  store i8 %9911, ptr %427, align 1
  %9912 = load i8, ptr %427, align 1
  %9913 = sext i8 %9912 to i32
  %9914 = icmp slt i32 %9913, 32
  br i1 %9914, label %9927, label %9915

9915:                                             ; preds = %9908
  %9916 = load i8, ptr %427, align 1
  %9917 = sext i8 %9916 to i32
  %9918 = icmp sgt i32 %9917, 126
  br i1 %9918, label %9927, label %9919

9919:                                             ; preds = %9915
  %9920 = load i8, ptr %427, align 1
  %9921 = sext i8 %9920 to i32
  %9922 = icmp eq i32 %9921, 34
  br i1 %9922, label %9927, label %9923

9923:                                             ; preds = %9919
  %9924 = load i8, ptr %427, align 1
  %9925 = sext i8 %9924 to i32
  %9926 = icmp eq i32 %9925, 92
  br i1 %9926, label %9927, label %9928

9927:                                             ; preds = %9923, %9919, %9915, %9908
  store i1 false, ptr %420, align 1
  br label %10579

9928:                                             ; preds = %9923
  br label %9929

9929:                                             ; preds = %9928, %9905
  %9930 = load i64, ptr %422, align 8
  %9931 = icmp ult i64 5, %9930
  br i1 %9931, label %9932, label %9953

9932:                                             ; preds = %9929
  %9933 = load ptr, ptr %421, align 8
  %9934 = getelementptr inbounds i8, ptr %9933, i64 5
  %9935 = load i8, ptr %9934, align 1
  store i8 %9935, ptr %428, align 1
  %9936 = load i8, ptr %428, align 1
  %9937 = sext i8 %9936 to i32
  %9938 = icmp slt i32 %9937, 32
  br i1 %9938, label %9951, label %9939

9939:                                             ; preds = %9932
  %9940 = load i8, ptr %428, align 1
  %9941 = sext i8 %9940 to i32
  %9942 = icmp sgt i32 %9941, 126
  br i1 %9942, label %9951, label %9943

9943:                                             ; preds = %9939
  %9944 = load i8, ptr %428, align 1
  %9945 = sext i8 %9944 to i32
  %9946 = icmp eq i32 %9945, 34
  br i1 %9946, label %9951, label %9947

9947:                                             ; preds = %9943
  %9948 = load i8, ptr %428, align 1
  %9949 = sext i8 %9948 to i32
  %9950 = icmp eq i32 %9949, 92
  br i1 %9950, label %9951, label %9952

9951:                                             ; preds = %9947, %9943, %9939, %9932
  store i1 false, ptr %420, align 1
  br label %10579

9952:                                             ; preds = %9947
  br label %9953

9953:                                             ; preds = %9952, %9929
  %9954 = load i64, ptr %422, align 8
  %9955 = icmp ult i64 6, %9954
  br i1 %9955, label %9956, label %9977

9956:                                             ; preds = %9953
  %9957 = load ptr, ptr %421, align 8
  %9958 = getelementptr inbounds i8, ptr %9957, i64 6
  %9959 = load i8, ptr %9958, align 1
  store i8 %9959, ptr %429, align 1
  %9960 = load i8, ptr %429, align 1
  %9961 = sext i8 %9960 to i32
  %9962 = icmp slt i32 %9961, 32
  br i1 %9962, label %9975, label %9963

9963:                                             ; preds = %9956
  %9964 = load i8, ptr %429, align 1
  %9965 = sext i8 %9964 to i32
  %9966 = icmp sgt i32 %9965, 126
  br i1 %9966, label %9975, label %9967

9967:                                             ; preds = %9963
  %9968 = load i8, ptr %429, align 1
  %9969 = sext i8 %9968 to i32
  %9970 = icmp eq i32 %9969, 34
  br i1 %9970, label %9975, label %9971

9971:                                             ; preds = %9967
  %9972 = load i8, ptr %429, align 1
  %9973 = sext i8 %9972 to i32
  %9974 = icmp eq i32 %9973, 92
  br i1 %9974, label %9975, label %9976

9975:                                             ; preds = %9971, %9967, %9963, %9956
  store i1 false, ptr %420, align 1
  br label %10579

9976:                                             ; preds = %9971
  br label %9977

9977:                                             ; preds = %9976, %9953
  %9978 = load i64, ptr %422, align 8
  %9979 = icmp ult i64 7, %9978
  br i1 %9979, label %9980, label %10001

9980:                                             ; preds = %9977
  %9981 = load ptr, ptr %421, align 8
  %9982 = getelementptr inbounds i8, ptr %9981, i64 7
  %9983 = load i8, ptr %9982, align 1
  store i8 %9983, ptr %430, align 1
  %9984 = load i8, ptr %430, align 1
  %9985 = sext i8 %9984 to i32
  %9986 = icmp slt i32 %9985, 32
  br i1 %9986, label %9999, label %9987

9987:                                             ; preds = %9980
  %9988 = load i8, ptr %430, align 1
  %9989 = sext i8 %9988 to i32
  %9990 = icmp sgt i32 %9989, 126
  br i1 %9990, label %9999, label %9991

9991:                                             ; preds = %9987
  %9992 = load i8, ptr %430, align 1
  %9993 = sext i8 %9992 to i32
  %9994 = icmp eq i32 %9993, 34
  br i1 %9994, label %9999, label %9995

9995:                                             ; preds = %9991
  %9996 = load i8, ptr %430, align 1
  %9997 = sext i8 %9996 to i32
  %9998 = icmp eq i32 %9997, 92
  br i1 %9998, label %9999, label %10000

9999:                                             ; preds = %9995, %9991, %9987, %9980
  store i1 false, ptr %420, align 1
  br label %10579

10000:                                            ; preds = %9995
  br label %10001

10001:                                            ; preds = %10000, %9977
  %10002 = load i64, ptr %422, align 8
  %10003 = icmp ult i64 8, %10002
  br i1 %10003, label %10004, label %10025

10004:                                            ; preds = %10001
  %10005 = load ptr, ptr %421, align 8
  %10006 = getelementptr inbounds i8, ptr %10005, i64 8
  %10007 = load i8, ptr %10006, align 1
  store i8 %10007, ptr %431, align 1
  %10008 = load i8, ptr %431, align 1
  %10009 = sext i8 %10008 to i32
  %10010 = icmp slt i32 %10009, 32
  br i1 %10010, label %10023, label %10011

10011:                                            ; preds = %10004
  %10012 = load i8, ptr %431, align 1
  %10013 = sext i8 %10012 to i32
  %10014 = icmp sgt i32 %10013, 126
  br i1 %10014, label %10023, label %10015

10015:                                            ; preds = %10011
  %10016 = load i8, ptr %431, align 1
  %10017 = sext i8 %10016 to i32
  %10018 = icmp eq i32 %10017, 34
  br i1 %10018, label %10023, label %10019

10019:                                            ; preds = %10015
  %10020 = load i8, ptr %431, align 1
  %10021 = sext i8 %10020 to i32
  %10022 = icmp eq i32 %10021, 92
  br i1 %10022, label %10023, label %10024

10023:                                            ; preds = %10019, %10015, %10011, %10004
  store i1 false, ptr %420, align 1
  br label %10579

10024:                                            ; preds = %10019
  br label %10025

10025:                                            ; preds = %10024, %10001
  %10026 = load i64, ptr %422, align 8
  %10027 = icmp ult i64 9, %10026
  br i1 %10027, label %10028, label %10049

10028:                                            ; preds = %10025
  %10029 = load ptr, ptr %421, align 8
  %10030 = getelementptr inbounds i8, ptr %10029, i64 9
  %10031 = load i8, ptr %10030, align 1
  store i8 %10031, ptr %432, align 1
  %10032 = load i8, ptr %432, align 1
  %10033 = sext i8 %10032 to i32
  %10034 = icmp slt i32 %10033, 32
  br i1 %10034, label %10047, label %10035

10035:                                            ; preds = %10028
  %10036 = load i8, ptr %432, align 1
  %10037 = sext i8 %10036 to i32
  %10038 = icmp sgt i32 %10037, 126
  br i1 %10038, label %10047, label %10039

10039:                                            ; preds = %10035
  %10040 = load i8, ptr %432, align 1
  %10041 = sext i8 %10040 to i32
  %10042 = icmp eq i32 %10041, 34
  br i1 %10042, label %10047, label %10043

10043:                                            ; preds = %10039
  %10044 = load i8, ptr %432, align 1
  %10045 = sext i8 %10044 to i32
  %10046 = icmp eq i32 %10045, 92
  br i1 %10046, label %10047, label %10048

10047:                                            ; preds = %10043, %10039, %10035, %10028
  store i1 false, ptr %420, align 1
  br label %10579

10048:                                            ; preds = %10043
  br label %10049

10049:                                            ; preds = %10048, %10025
  %10050 = load i64, ptr %422, align 8
  %10051 = icmp ult i64 10, %10050
  br i1 %10051, label %10052, label %10073

10052:                                            ; preds = %10049
  %10053 = load ptr, ptr %421, align 8
  %10054 = getelementptr inbounds i8, ptr %10053, i64 10
  %10055 = load i8, ptr %10054, align 1
  store i8 %10055, ptr %433, align 1
  %10056 = load i8, ptr %433, align 1
  %10057 = sext i8 %10056 to i32
  %10058 = icmp slt i32 %10057, 32
  br i1 %10058, label %10071, label %10059

10059:                                            ; preds = %10052
  %10060 = load i8, ptr %433, align 1
  %10061 = sext i8 %10060 to i32
  %10062 = icmp sgt i32 %10061, 126
  br i1 %10062, label %10071, label %10063

10063:                                            ; preds = %10059
  %10064 = load i8, ptr %433, align 1
  %10065 = sext i8 %10064 to i32
  %10066 = icmp eq i32 %10065, 34
  br i1 %10066, label %10071, label %10067

10067:                                            ; preds = %10063
  %10068 = load i8, ptr %433, align 1
  %10069 = sext i8 %10068 to i32
  %10070 = icmp eq i32 %10069, 92
  br i1 %10070, label %10071, label %10072

10071:                                            ; preds = %10067, %10063, %10059, %10052
  store i1 false, ptr %420, align 1
  br label %10579

10072:                                            ; preds = %10067
  br label %10073

10073:                                            ; preds = %10072, %10049
  %10074 = load i64, ptr %422, align 8
  %10075 = icmp ult i64 11, %10074
  br i1 %10075, label %10076, label %10097

10076:                                            ; preds = %10073
  %10077 = load ptr, ptr %421, align 8
  %10078 = getelementptr inbounds i8, ptr %10077, i64 11
  %10079 = load i8, ptr %10078, align 1
  store i8 %10079, ptr %434, align 1
  %10080 = load i8, ptr %434, align 1
  %10081 = sext i8 %10080 to i32
  %10082 = icmp slt i32 %10081, 32
  br i1 %10082, label %10095, label %10083

10083:                                            ; preds = %10076
  %10084 = load i8, ptr %434, align 1
  %10085 = sext i8 %10084 to i32
  %10086 = icmp sgt i32 %10085, 126
  br i1 %10086, label %10095, label %10087

10087:                                            ; preds = %10083
  %10088 = load i8, ptr %434, align 1
  %10089 = sext i8 %10088 to i32
  %10090 = icmp eq i32 %10089, 34
  br i1 %10090, label %10095, label %10091

10091:                                            ; preds = %10087
  %10092 = load i8, ptr %434, align 1
  %10093 = sext i8 %10092 to i32
  %10094 = icmp eq i32 %10093, 92
  br i1 %10094, label %10095, label %10096

10095:                                            ; preds = %10091, %10087, %10083, %10076
  store i1 false, ptr %420, align 1
  br label %10579

10096:                                            ; preds = %10091
  br label %10097

10097:                                            ; preds = %10096, %10073
  %10098 = load i64, ptr %422, align 8
  %10099 = icmp ult i64 12, %10098
  br i1 %10099, label %10100, label %10121

10100:                                            ; preds = %10097
  %10101 = load ptr, ptr %421, align 8
  %10102 = getelementptr inbounds i8, ptr %10101, i64 12
  %10103 = load i8, ptr %10102, align 1
  store i8 %10103, ptr %435, align 1
  %10104 = load i8, ptr %435, align 1
  %10105 = sext i8 %10104 to i32
  %10106 = icmp slt i32 %10105, 32
  br i1 %10106, label %10119, label %10107

10107:                                            ; preds = %10100
  %10108 = load i8, ptr %435, align 1
  %10109 = sext i8 %10108 to i32
  %10110 = icmp sgt i32 %10109, 126
  br i1 %10110, label %10119, label %10111

10111:                                            ; preds = %10107
  %10112 = load i8, ptr %435, align 1
  %10113 = sext i8 %10112 to i32
  %10114 = icmp eq i32 %10113, 34
  br i1 %10114, label %10119, label %10115

10115:                                            ; preds = %10111
  %10116 = load i8, ptr %435, align 1
  %10117 = sext i8 %10116 to i32
  %10118 = icmp eq i32 %10117, 92
  br i1 %10118, label %10119, label %10120

10119:                                            ; preds = %10115, %10111, %10107, %10100
  store i1 false, ptr %420, align 1
  br label %10579

10120:                                            ; preds = %10115
  br label %10121

10121:                                            ; preds = %10120, %10097
  %10122 = load i64, ptr %422, align 8
  %10123 = icmp ult i64 13, %10122
  br i1 %10123, label %10124, label %10145

10124:                                            ; preds = %10121
  %10125 = load ptr, ptr %421, align 8
  %10126 = getelementptr inbounds i8, ptr %10125, i64 13
  %10127 = load i8, ptr %10126, align 1
  store i8 %10127, ptr %436, align 1
  %10128 = load i8, ptr %436, align 1
  %10129 = sext i8 %10128 to i32
  %10130 = icmp slt i32 %10129, 32
  br i1 %10130, label %10143, label %10131

10131:                                            ; preds = %10124
  %10132 = load i8, ptr %436, align 1
  %10133 = sext i8 %10132 to i32
  %10134 = icmp sgt i32 %10133, 126
  br i1 %10134, label %10143, label %10135

10135:                                            ; preds = %10131
  %10136 = load i8, ptr %436, align 1
  %10137 = sext i8 %10136 to i32
  %10138 = icmp eq i32 %10137, 34
  br i1 %10138, label %10143, label %10139

10139:                                            ; preds = %10135
  %10140 = load i8, ptr %436, align 1
  %10141 = sext i8 %10140 to i32
  %10142 = icmp eq i32 %10141, 92
  br i1 %10142, label %10143, label %10144

10143:                                            ; preds = %10139, %10135, %10131, %10124
  store i1 false, ptr %420, align 1
  br label %10579

10144:                                            ; preds = %10139
  br label %10145

10145:                                            ; preds = %10144, %10121
  %10146 = load i64, ptr %422, align 8
  %10147 = icmp ult i64 14, %10146
  br i1 %10147, label %10148, label %10169

10148:                                            ; preds = %10145
  %10149 = load ptr, ptr %421, align 8
  %10150 = getelementptr inbounds i8, ptr %10149, i64 14
  %10151 = load i8, ptr %10150, align 1
  store i8 %10151, ptr %437, align 1
  %10152 = load i8, ptr %437, align 1
  %10153 = sext i8 %10152 to i32
  %10154 = icmp slt i32 %10153, 32
  br i1 %10154, label %10167, label %10155

10155:                                            ; preds = %10148
  %10156 = load i8, ptr %437, align 1
  %10157 = sext i8 %10156 to i32
  %10158 = icmp sgt i32 %10157, 126
  br i1 %10158, label %10167, label %10159

10159:                                            ; preds = %10155
  %10160 = load i8, ptr %437, align 1
  %10161 = sext i8 %10160 to i32
  %10162 = icmp eq i32 %10161, 34
  br i1 %10162, label %10167, label %10163

10163:                                            ; preds = %10159
  %10164 = load i8, ptr %437, align 1
  %10165 = sext i8 %10164 to i32
  %10166 = icmp eq i32 %10165, 92
  br i1 %10166, label %10167, label %10168

10167:                                            ; preds = %10163, %10159, %10155, %10148
  store i1 false, ptr %420, align 1
  br label %10579

10168:                                            ; preds = %10163
  br label %10169

10169:                                            ; preds = %10168, %10145
  %10170 = load i64, ptr %422, align 8
  %10171 = icmp ult i64 15, %10170
  br i1 %10171, label %10172, label %10193

10172:                                            ; preds = %10169
  %10173 = load ptr, ptr %421, align 8
  %10174 = getelementptr inbounds i8, ptr %10173, i64 15
  %10175 = load i8, ptr %10174, align 1
  store i8 %10175, ptr %438, align 1
  %10176 = load i8, ptr %438, align 1
  %10177 = sext i8 %10176 to i32
  %10178 = icmp slt i32 %10177, 32
  br i1 %10178, label %10191, label %10179

10179:                                            ; preds = %10172
  %10180 = load i8, ptr %438, align 1
  %10181 = sext i8 %10180 to i32
  %10182 = icmp sgt i32 %10181, 126
  br i1 %10182, label %10191, label %10183

10183:                                            ; preds = %10179
  %10184 = load i8, ptr %438, align 1
  %10185 = sext i8 %10184 to i32
  %10186 = icmp eq i32 %10185, 34
  br i1 %10186, label %10191, label %10187

10187:                                            ; preds = %10183
  %10188 = load i8, ptr %438, align 1
  %10189 = sext i8 %10188 to i32
  %10190 = icmp eq i32 %10189, 92
  br i1 %10190, label %10191, label %10192

10191:                                            ; preds = %10187, %10183, %10179, %10172
  store i1 false, ptr %420, align 1
  br label %10579

10192:                                            ; preds = %10187
  br label %10193

10193:                                            ; preds = %10192, %10169
  %10194 = load i64, ptr %422, align 8
  %10195 = icmp ult i64 16, %10194
  br i1 %10195, label %10196, label %10217

10196:                                            ; preds = %10193
  %10197 = load ptr, ptr %421, align 8
  %10198 = getelementptr inbounds i8, ptr %10197, i64 16
  %10199 = load i8, ptr %10198, align 1
  store i8 %10199, ptr %439, align 1
  %10200 = load i8, ptr %439, align 1
  %10201 = sext i8 %10200 to i32
  %10202 = icmp slt i32 %10201, 32
  br i1 %10202, label %10215, label %10203

10203:                                            ; preds = %10196
  %10204 = load i8, ptr %439, align 1
  %10205 = sext i8 %10204 to i32
  %10206 = icmp sgt i32 %10205, 126
  br i1 %10206, label %10215, label %10207

10207:                                            ; preds = %10203
  %10208 = load i8, ptr %439, align 1
  %10209 = sext i8 %10208 to i32
  %10210 = icmp eq i32 %10209, 34
  br i1 %10210, label %10215, label %10211

10211:                                            ; preds = %10207
  %10212 = load i8, ptr %439, align 1
  %10213 = sext i8 %10212 to i32
  %10214 = icmp eq i32 %10213, 92
  br i1 %10214, label %10215, label %10216

10215:                                            ; preds = %10211, %10207, %10203, %10196
  store i1 false, ptr %420, align 1
  br label %10579

10216:                                            ; preds = %10211
  br label %10217

10217:                                            ; preds = %10216, %10193
  %10218 = load i64, ptr %422, align 8
  %10219 = icmp ult i64 17, %10218
  br i1 %10219, label %10220, label %10241

10220:                                            ; preds = %10217
  %10221 = load ptr, ptr %421, align 8
  %10222 = getelementptr inbounds i8, ptr %10221, i64 17
  %10223 = load i8, ptr %10222, align 1
  store i8 %10223, ptr %440, align 1
  %10224 = load i8, ptr %440, align 1
  %10225 = sext i8 %10224 to i32
  %10226 = icmp slt i32 %10225, 32
  br i1 %10226, label %10239, label %10227

10227:                                            ; preds = %10220
  %10228 = load i8, ptr %440, align 1
  %10229 = sext i8 %10228 to i32
  %10230 = icmp sgt i32 %10229, 126
  br i1 %10230, label %10239, label %10231

10231:                                            ; preds = %10227
  %10232 = load i8, ptr %440, align 1
  %10233 = sext i8 %10232 to i32
  %10234 = icmp eq i32 %10233, 34
  br i1 %10234, label %10239, label %10235

10235:                                            ; preds = %10231
  %10236 = load i8, ptr %440, align 1
  %10237 = sext i8 %10236 to i32
  %10238 = icmp eq i32 %10237, 92
  br i1 %10238, label %10239, label %10240

10239:                                            ; preds = %10235, %10231, %10227, %10220
  store i1 false, ptr %420, align 1
  br label %10579

10240:                                            ; preds = %10235
  br label %10241

10241:                                            ; preds = %10240, %10217
  %10242 = load i64, ptr %422, align 8
  %10243 = icmp ult i64 18, %10242
  br i1 %10243, label %10244, label %10265

10244:                                            ; preds = %10241
  %10245 = load ptr, ptr %421, align 8
  %10246 = getelementptr inbounds i8, ptr %10245, i64 18
  %10247 = load i8, ptr %10246, align 1
  store i8 %10247, ptr %441, align 1
  %10248 = load i8, ptr %441, align 1
  %10249 = sext i8 %10248 to i32
  %10250 = icmp slt i32 %10249, 32
  br i1 %10250, label %10263, label %10251

10251:                                            ; preds = %10244
  %10252 = load i8, ptr %441, align 1
  %10253 = sext i8 %10252 to i32
  %10254 = icmp sgt i32 %10253, 126
  br i1 %10254, label %10263, label %10255

10255:                                            ; preds = %10251
  %10256 = load i8, ptr %441, align 1
  %10257 = sext i8 %10256 to i32
  %10258 = icmp eq i32 %10257, 34
  br i1 %10258, label %10263, label %10259

10259:                                            ; preds = %10255
  %10260 = load i8, ptr %441, align 1
  %10261 = sext i8 %10260 to i32
  %10262 = icmp eq i32 %10261, 92
  br i1 %10262, label %10263, label %10264

10263:                                            ; preds = %10259, %10255, %10251, %10244
  store i1 false, ptr %420, align 1
  br label %10579

10264:                                            ; preds = %10259
  br label %10265

10265:                                            ; preds = %10264, %10241
  %10266 = load i64, ptr %422, align 8
  %10267 = icmp ult i64 19, %10266
  br i1 %10267, label %10268, label %10289

10268:                                            ; preds = %10265
  %10269 = load ptr, ptr %421, align 8
  %10270 = getelementptr inbounds i8, ptr %10269, i64 19
  %10271 = load i8, ptr %10270, align 1
  store i8 %10271, ptr %442, align 1
  %10272 = load i8, ptr %442, align 1
  %10273 = sext i8 %10272 to i32
  %10274 = icmp slt i32 %10273, 32
  br i1 %10274, label %10287, label %10275

10275:                                            ; preds = %10268
  %10276 = load i8, ptr %442, align 1
  %10277 = sext i8 %10276 to i32
  %10278 = icmp sgt i32 %10277, 126
  br i1 %10278, label %10287, label %10279

10279:                                            ; preds = %10275
  %10280 = load i8, ptr %442, align 1
  %10281 = sext i8 %10280 to i32
  %10282 = icmp eq i32 %10281, 34
  br i1 %10282, label %10287, label %10283

10283:                                            ; preds = %10279
  %10284 = load i8, ptr %442, align 1
  %10285 = sext i8 %10284 to i32
  %10286 = icmp eq i32 %10285, 92
  br i1 %10286, label %10287, label %10288

10287:                                            ; preds = %10283, %10279, %10275, %10268
  store i1 false, ptr %420, align 1
  br label %10579

10288:                                            ; preds = %10283
  br label %10289

10289:                                            ; preds = %10288, %10265
  %10290 = load i64, ptr %422, align 8
  %10291 = icmp ult i64 20, %10290
  br i1 %10291, label %10292, label %10313

10292:                                            ; preds = %10289
  %10293 = load ptr, ptr %421, align 8
  %10294 = getelementptr inbounds i8, ptr %10293, i64 20
  %10295 = load i8, ptr %10294, align 1
  store i8 %10295, ptr %443, align 1
  %10296 = load i8, ptr %443, align 1
  %10297 = sext i8 %10296 to i32
  %10298 = icmp slt i32 %10297, 32
  br i1 %10298, label %10311, label %10299

10299:                                            ; preds = %10292
  %10300 = load i8, ptr %443, align 1
  %10301 = sext i8 %10300 to i32
  %10302 = icmp sgt i32 %10301, 126
  br i1 %10302, label %10311, label %10303

10303:                                            ; preds = %10299
  %10304 = load i8, ptr %443, align 1
  %10305 = sext i8 %10304 to i32
  %10306 = icmp eq i32 %10305, 34
  br i1 %10306, label %10311, label %10307

10307:                                            ; preds = %10303
  %10308 = load i8, ptr %443, align 1
  %10309 = sext i8 %10308 to i32
  %10310 = icmp eq i32 %10309, 92
  br i1 %10310, label %10311, label %10312

10311:                                            ; preds = %10307, %10303, %10299, %10292
  store i1 false, ptr %420, align 1
  br label %10579

10312:                                            ; preds = %10307
  br label %10313

10313:                                            ; preds = %10312, %10289
  %10314 = load i64, ptr %422, align 8
  %10315 = icmp ult i64 21, %10314
  br i1 %10315, label %10316, label %10337

10316:                                            ; preds = %10313
  %10317 = load ptr, ptr %421, align 8
  %10318 = getelementptr inbounds i8, ptr %10317, i64 21
  %10319 = load i8, ptr %10318, align 1
  store i8 %10319, ptr %444, align 1
  %10320 = load i8, ptr %444, align 1
  %10321 = sext i8 %10320 to i32
  %10322 = icmp slt i32 %10321, 32
  br i1 %10322, label %10335, label %10323

10323:                                            ; preds = %10316
  %10324 = load i8, ptr %444, align 1
  %10325 = sext i8 %10324 to i32
  %10326 = icmp sgt i32 %10325, 126
  br i1 %10326, label %10335, label %10327

10327:                                            ; preds = %10323
  %10328 = load i8, ptr %444, align 1
  %10329 = sext i8 %10328 to i32
  %10330 = icmp eq i32 %10329, 34
  br i1 %10330, label %10335, label %10331

10331:                                            ; preds = %10327
  %10332 = load i8, ptr %444, align 1
  %10333 = sext i8 %10332 to i32
  %10334 = icmp eq i32 %10333, 92
  br i1 %10334, label %10335, label %10336

10335:                                            ; preds = %10331, %10327, %10323, %10316
  store i1 false, ptr %420, align 1
  br label %10579

10336:                                            ; preds = %10331
  br label %10337

10337:                                            ; preds = %10336, %10313
  %10338 = load i64, ptr %422, align 8
  %10339 = icmp ult i64 22, %10338
  br i1 %10339, label %10340, label %10361

10340:                                            ; preds = %10337
  %10341 = load ptr, ptr %421, align 8
  %10342 = getelementptr inbounds i8, ptr %10341, i64 22
  %10343 = load i8, ptr %10342, align 1
  store i8 %10343, ptr %445, align 1
  %10344 = load i8, ptr %445, align 1
  %10345 = sext i8 %10344 to i32
  %10346 = icmp slt i32 %10345, 32
  br i1 %10346, label %10359, label %10347

10347:                                            ; preds = %10340
  %10348 = load i8, ptr %445, align 1
  %10349 = sext i8 %10348 to i32
  %10350 = icmp sgt i32 %10349, 126
  br i1 %10350, label %10359, label %10351

10351:                                            ; preds = %10347
  %10352 = load i8, ptr %445, align 1
  %10353 = sext i8 %10352 to i32
  %10354 = icmp eq i32 %10353, 34
  br i1 %10354, label %10359, label %10355

10355:                                            ; preds = %10351
  %10356 = load i8, ptr %445, align 1
  %10357 = sext i8 %10356 to i32
  %10358 = icmp eq i32 %10357, 92
  br i1 %10358, label %10359, label %10360

10359:                                            ; preds = %10355, %10351, %10347, %10340
  store i1 false, ptr %420, align 1
  br label %10579

10360:                                            ; preds = %10355
  br label %10361

10361:                                            ; preds = %10360, %10337
  %10362 = load i64, ptr %422, align 8
  %10363 = icmp ult i64 23, %10362
  br i1 %10363, label %10364, label %10385

10364:                                            ; preds = %10361
  %10365 = load ptr, ptr %421, align 8
  %10366 = getelementptr inbounds i8, ptr %10365, i64 23
  %10367 = load i8, ptr %10366, align 1
  store i8 %10367, ptr %446, align 1
  %10368 = load i8, ptr %446, align 1
  %10369 = sext i8 %10368 to i32
  %10370 = icmp slt i32 %10369, 32
  br i1 %10370, label %10383, label %10371

10371:                                            ; preds = %10364
  %10372 = load i8, ptr %446, align 1
  %10373 = sext i8 %10372 to i32
  %10374 = icmp sgt i32 %10373, 126
  br i1 %10374, label %10383, label %10375

10375:                                            ; preds = %10371
  %10376 = load i8, ptr %446, align 1
  %10377 = sext i8 %10376 to i32
  %10378 = icmp eq i32 %10377, 34
  br i1 %10378, label %10383, label %10379

10379:                                            ; preds = %10375
  %10380 = load i8, ptr %446, align 1
  %10381 = sext i8 %10380 to i32
  %10382 = icmp eq i32 %10381, 92
  br i1 %10382, label %10383, label %10384

10383:                                            ; preds = %10379, %10375, %10371, %10364
  store i1 false, ptr %420, align 1
  br label %10579

10384:                                            ; preds = %10379
  br label %10385

10385:                                            ; preds = %10384, %10361
  %10386 = load i64, ptr %422, align 8
  %10387 = icmp ult i64 24, %10386
  br i1 %10387, label %10388, label %10409

10388:                                            ; preds = %10385
  %10389 = load ptr, ptr %421, align 8
  %10390 = getelementptr inbounds i8, ptr %10389, i64 24
  %10391 = load i8, ptr %10390, align 1
  store i8 %10391, ptr %447, align 1
  %10392 = load i8, ptr %447, align 1
  %10393 = sext i8 %10392 to i32
  %10394 = icmp slt i32 %10393, 32
  br i1 %10394, label %10407, label %10395

10395:                                            ; preds = %10388
  %10396 = load i8, ptr %447, align 1
  %10397 = sext i8 %10396 to i32
  %10398 = icmp sgt i32 %10397, 126
  br i1 %10398, label %10407, label %10399

10399:                                            ; preds = %10395
  %10400 = load i8, ptr %447, align 1
  %10401 = sext i8 %10400 to i32
  %10402 = icmp eq i32 %10401, 34
  br i1 %10402, label %10407, label %10403

10403:                                            ; preds = %10399
  %10404 = load i8, ptr %447, align 1
  %10405 = sext i8 %10404 to i32
  %10406 = icmp eq i32 %10405, 92
  br i1 %10406, label %10407, label %10408

10407:                                            ; preds = %10403, %10399, %10395, %10388
  store i1 false, ptr %420, align 1
  br label %10579

10408:                                            ; preds = %10403
  br label %10409

10409:                                            ; preds = %10408, %10385
  %10410 = load i64, ptr %422, align 8
  %10411 = icmp ult i64 25, %10410
  br i1 %10411, label %10412, label %10433

10412:                                            ; preds = %10409
  %10413 = load ptr, ptr %421, align 8
  %10414 = getelementptr inbounds i8, ptr %10413, i64 25
  %10415 = load i8, ptr %10414, align 1
  store i8 %10415, ptr %448, align 1
  %10416 = load i8, ptr %448, align 1
  %10417 = sext i8 %10416 to i32
  %10418 = icmp slt i32 %10417, 32
  br i1 %10418, label %10431, label %10419

10419:                                            ; preds = %10412
  %10420 = load i8, ptr %448, align 1
  %10421 = sext i8 %10420 to i32
  %10422 = icmp sgt i32 %10421, 126
  br i1 %10422, label %10431, label %10423

10423:                                            ; preds = %10419
  %10424 = load i8, ptr %448, align 1
  %10425 = sext i8 %10424 to i32
  %10426 = icmp eq i32 %10425, 34
  br i1 %10426, label %10431, label %10427

10427:                                            ; preds = %10423
  %10428 = load i8, ptr %448, align 1
  %10429 = sext i8 %10428 to i32
  %10430 = icmp eq i32 %10429, 92
  br i1 %10430, label %10431, label %10432

10431:                                            ; preds = %10427, %10423, %10419, %10412
  store i1 false, ptr %420, align 1
  br label %10579

10432:                                            ; preds = %10427
  br label %10433

10433:                                            ; preds = %10432, %10409
  %10434 = load i64, ptr %422, align 8
  %10435 = icmp ult i64 26, %10434
  br i1 %10435, label %10436, label %10457

10436:                                            ; preds = %10433
  %10437 = load ptr, ptr %421, align 8
  %10438 = getelementptr inbounds i8, ptr %10437, i64 26
  %10439 = load i8, ptr %10438, align 1
  store i8 %10439, ptr %449, align 1
  %10440 = load i8, ptr %449, align 1
  %10441 = sext i8 %10440 to i32
  %10442 = icmp slt i32 %10441, 32
  br i1 %10442, label %10455, label %10443

10443:                                            ; preds = %10436
  %10444 = load i8, ptr %449, align 1
  %10445 = sext i8 %10444 to i32
  %10446 = icmp sgt i32 %10445, 126
  br i1 %10446, label %10455, label %10447

10447:                                            ; preds = %10443
  %10448 = load i8, ptr %449, align 1
  %10449 = sext i8 %10448 to i32
  %10450 = icmp eq i32 %10449, 34
  br i1 %10450, label %10455, label %10451

10451:                                            ; preds = %10447
  %10452 = load i8, ptr %449, align 1
  %10453 = sext i8 %10452 to i32
  %10454 = icmp eq i32 %10453, 92
  br i1 %10454, label %10455, label %10456

10455:                                            ; preds = %10451, %10447, %10443, %10436
  store i1 false, ptr %420, align 1
  br label %10579

10456:                                            ; preds = %10451
  br label %10457

10457:                                            ; preds = %10456, %10433
  %10458 = load i64, ptr %422, align 8
  %10459 = icmp ult i64 27, %10458
  br i1 %10459, label %10460, label %10481

10460:                                            ; preds = %10457
  %10461 = load ptr, ptr %421, align 8
  %10462 = getelementptr inbounds i8, ptr %10461, i64 27
  %10463 = load i8, ptr %10462, align 1
  store i8 %10463, ptr %450, align 1
  %10464 = load i8, ptr %450, align 1
  %10465 = sext i8 %10464 to i32
  %10466 = icmp slt i32 %10465, 32
  br i1 %10466, label %10479, label %10467

10467:                                            ; preds = %10460
  %10468 = load i8, ptr %450, align 1
  %10469 = sext i8 %10468 to i32
  %10470 = icmp sgt i32 %10469, 126
  br i1 %10470, label %10479, label %10471

10471:                                            ; preds = %10467
  %10472 = load i8, ptr %450, align 1
  %10473 = sext i8 %10472 to i32
  %10474 = icmp eq i32 %10473, 34
  br i1 %10474, label %10479, label %10475

10475:                                            ; preds = %10471
  %10476 = load i8, ptr %450, align 1
  %10477 = sext i8 %10476 to i32
  %10478 = icmp eq i32 %10477, 92
  br i1 %10478, label %10479, label %10480

10479:                                            ; preds = %10475, %10471, %10467, %10460
  store i1 false, ptr %420, align 1
  br label %10579

10480:                                            ; preds = %10475
  br label %10481

10481:                                            ; preds = %10480, %10457
  %10482 = load i64, ptr %422, align 8
  %10483 = icmp ult i64 28, %10482
  br i1 %10483, label %10484, label %10505

10484:                                            ; preds = %10481
  %10485 = load ptr, ptr %421, align 8
  %10486 = getelementptr inbounds i8, ptr %10485, i64 28
  %10487 = load i8, ptr %10486, align 1
  store i8 %10487, ptr %451, align 1
  %10488 = load i8, ptr %451, align 1
  %10489 = sext i8 %10488 to i32
  %10490 = icmp slt i32 %10489, 32
  br i1 %10490, label %10503, label %10491

10491:                                            ; preds = %10484
  %10492 = load i8, ptr %451, align 1
  %10493 = sext i8 %10492 to i32
  %10494 = icmp sgt i32 %10493, 126
  br i1 %10494, label %10503, label %10495

10495:                                            ; preds = %10491
  %10496 = load i8, ptr %451, align 1
  %10497 = sext i8 %10496 to i32
  %10498 = icmp eq i32 %10497, 34
  br i1 %10498, label %10503, label %10499

10499:                                            ; preds = %10495
  %10500 = load i8, ptr %451, align 1
  %10501 = sext i8 %10500 to i32
  %10502 = icmp eq i32 %10501, 92
  br i1 %10502, label %10503, label %10504

10503:                                            ; preds = %10499, %10495, %10491, %10484
  store i1 false, ptr %420, align 1
  br label %10579

10504:                                            ; preds = %10499
  br label %10505

10505:                                            ; preds = %10504, %10481
  %10506 = load i64, ptr %422, align 8
  %10507 = icmp ult i64 29, %10506
  br i1 %10507, label %10508, label %10529

10508:                                            ; preds = %10505
  %10509 = load ptr, ptr %421, align 8
  %10510 = getelementptr inbounds i8, ptr %10509, i64 29
  %10511 = load i8, ptr %10510, align 1
  store i8 %10511, ptr %452, align 1
  %10512 = load i8, ptr %452, align 1
  %10513 = sext i8 %10512 to i32
  %10514 = icmp slt i32 %10513, 32
  br i1 %10514, label %10527, label %10515

10515:                                            ; preds = %10508
  %10516 = load i8, ptr %452, align 1
  %10517 = sext i8 %10516 to i32
  %10518 = icmp sgt i32 %10517, 126
  br i1 %10518, label %10527, label %10519

10519:                                            ; preds = %10515
  %10520 = load i8, ptr %452, align 1
  %10521 = sext i8 %10520 to i32
  %10522 = icmp eq i32 %10521, 34
  br i1 %10522, label %10527, label %10523

10523:                                            ; preds = %10519
  %10524 = load i8, ptr %452, align 1
  %10525 = sext i8 %10524 to i32
  %10526 = icmp eq i32 %10525, 92
  br i1 %10526, label %10527, label %10528

10527:                                            ; preds = %10523, %10519, %10515, %10508
  store i1 false, ptr %420, align 1
  br label %10579

10528:                                            ; preds = %10523
  br label %10529

10529:                                            ; preds = %10528, %10505
  %10530 = load i64, ptr %422, align 8
  %10531 = icmp ult i64 30, %10530
  br i1 %10531, label %10532, label %10553

10532:                                            ; preds = %10529
  %10533 = load ptr, ptr %421, align 8
  %10534 = getelementptr inbounds i8, ptr %10533, i64 30
  %10535 = load i8, ptr %10534, align 1
  store i8 %10535, ptr %453, align 1
  %10536 = load i8, ptr %453, align 1
  %10537 = sext i8 %10536 to i32
  %10538 = icmp slt i32 %10537, 32
  br i1 %10538, label %10551, label %10539

10539:                                            ; preds = %10532
  %10540 = load i8, ptr %453, align 1
  %10541 = sext i8 %10540 to i32
  %10542 = icmp sgt i32 %10541, 126
  br i1 %10542, label %10551, label %10543

10543:                                            ; preds = %10539
  %10544 = load i8, ptr %453, align 1
  %10545 = sext i8 %10544 to i32
  %10546 = icmp eq i32 %10545, 34
  br i1 %10546, label %10551, label %10547

10547:                                            ; preds = %10543
  %10548 = load i8, ptr %453, align 1
  %10549 = sext i8 %10548 to i32
  %10550 = icmp eq i32 %10549, 92
  br i1 %10550, label %10551, label %10552

10551:                                            ; preds = %10547, %10543, %10539, %10532
  store i1 false, ptr %420, align 1
  br label %10579

10552:                                            ; preds = %10547
  br label %10553

10553:                                            ; preds = %10552, %10529
  %10554 = load i64, ptr %422, align 8
  %10555 = icmp ult i64 31, %10554
  br i1 %10555, label %10556, label %10577

10556:                                            ; preds = %10553
  %10557 = load ptr, ptr %421, align 8
  %10558 = getelementptr inbounds i8, ptr %10557, i64 31
  %10559 = load i8, ptr %10558, align 1
  store i8 %10559, ptr %454, align 1
  %10560 = load i8, ptr %454, align 1
  %10561 = sext i8 %10560 to i32
  %10562 = icmp slt i32 %10561, 32
  br i1 %10562, label %10575, label %10563

10563:                                            ; preds = %10556
  %10564 = load i8, ptr %454, align 1
  %10565 = sext i8 %10564 to i32
  %10566 = icmp sgt i32 %10565, 126
  br i1 %10566, label %10575, label %10567

10567:                                            ; preds = %10563
  %10568 = load i8, ptr %454, align 1
  %10569 = sext i8 %10568 to i32
  %10570 = icmp eq i32 %10569, 34
  br i1 %10570, label %10575, label %10571

10571:                                            ; preds = %10567
  %10572 = load i8, ptr %454, align 1
  %10573 = sext i8 %10572 to i32
  %10574 = icmp eq i32 %10573, 92
  br i1 %10574, label %10575, label %10576

10575:                                            ; preds = %10571, %10567, %10563, %10556
  store i1 false, ptr %420, align 1
  br label %10579

10576:                                            ; preds = %10571
  br label %10577

10577:                                            ; preds = %10576, %10553
  store i1 true, ptr %420, align 1
  br label %10579

10578:                                            ; preds = %9807, %9798
  store i1 false, ptr %420, align 1
  br label %10579

10579:                                            ; preds = %9831, %9855, %9879, %9903, %9927, %9951, %9975, %9999, %10023, %10047, %10071, %10095, %10119, %10143, %10167, %10191, %10215, %10239, %10263, %10287, %10311, %10335, %10359, %10383, %10407, %10431, %10455, %10479, %10503, %10527, %10551, %10575, %10577, %10578
  %10580 = load i1, ptr %420, align 1
  %10581 = zext i1 %10580 to i8
  store i8 %10581, ptr %498, align 1
  %10582 = load i8, ptr %498, align 1
  %10583 = trunc i8 %10582 to i1
  %10584 = zext i1 %10583 to i64
  %10585 = select i1 %10583, i32 8, i32 0
  %10586 = trunc i32 %10585 to i8
  store i8 %10586, ptr %499, align 1
  %10587 = load ptr, ptr %495, align 8
  %10588 = load i8, ptr %499, align 1
  %10589 = load i64, ptr %497, align 8
  store ptr %10587, ptr %130, align 8
  store i8 5, ptr %131, align 1
  store i8 %10588, ptr %132, align 1
  store i64 %10589, ptr %133, align 8
  %10590 = load i64, ptr %133, align 8
  %10591 = shl i64 %10590, 8
  store i64 %10591, ptr %134, align 8
  %10592 = load i8, ptr %131, align 1
  %10593 = zext i8 %10592 to i32
  %10594 = load i8, ptr %132, align 1
  %10595 = zext i8 %10594 to i32
  %10596 = or i32 %10593, %10595
  %10597 = sext i32 %10596 to i64
  %10598 = load i64, ptr %134, align 8
  %10599 = or i64 %10598, %10597
  store i64 %10599, ptr %134, align 8
  %10600 = load i64, ptr %134, align 8
  %10601 = load ptr, ptr %130, align 8
  store i64 %10600, ptr %10601, align 8
  %10602 = load ptr, ptr %496, align 8
  %10603 = load ptr, ptr %495, align 8
  %10604 = getelementptr inbounds nuw %struct.yyjson_val, ptr %10603, i32 0, i32 1
  store ptr %10602, ptr %10604, align 8
  %10605 = load ptr, ptr %881, align 8
  store ptr %10605, ptr %878, align 8
  br label %10608

10606:                                            ; preds = %9791
  br label %10607

10607:                                            ; preds = %10606, %9747
  store ptr null, ptr %878, align 8
  br label %10608

10608:                                            ; preds = %10579, %10607
  %10609 = load ptr, ptr %878, align 8
  %10610 = load ptr, ptr %938, align 8
  %10611 = load ptr, ptr @INFO_STR, align 8
  store ptr %10610, ptr %883, align 8
  store ptr %10611, ptr %884, align 8
  %10612 = load ptr, ptr %883, align 8
  %10613 = icmp ne ptr %10612, null
  br i1 %10613, label %10614, label %10617

10614:                                            ; preds = %10608
  %10615 = load ptr, ptr %884, align 8
  %10616 = icmp ne ptr %10615, null
  br label %10617

10617:                                            ; preds = %10614, %10608
  %10618 = phi i1 [ false, %10608 ], [ %10616, %10614 ]
  %10619 = xor i1 %10618, true
  %10620 = zext i1 %10618 to i32
  %10621 = sext i32 %10620 to i64
  br i1 %10618, label %10622, label %11477

10622:                                            ; preds = %10617
  %10623 = load ptr, ptr %883, align 8
  store ptr %10623, ptr %722, align 8
  store i64 1, ptr %723, align 8
  %10624 = load ptr, ptr %722, align 8
  %10625 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %10624, i32 0, i32 1
  store ptr %10625, ptr %725, align 8
  %10626 = load ptr, ptr %722, align 8
  %10627 = getelementptr inbounds nuw %struct.yyjson_mut_doc, ptr %10626, i32 0, i32 3
  store ptr %10627, ptr %726, align 8
  %10628 = load ptr, ptr %726, align 8
  %10629 = getelementptr inbounds nuw %struct.yyjson_val_pool, ptr %10628, i32 0, i32 1
  %10630 = load ptr, ptr %10629, align 8
  %10631 = load ptr, ptr %726, align 8
  %10632 = load ptr, ptr %10631, align 8
  %10633 = ptrtoint ptr %10630 to i64
  %10634 = ptrtoint ptr %10632 to i64
  %10635 = sub i64 %10633, %10634
  %10636 = sdiv exact i64 %10635, 24
  %10637 = load i64, ptr %723, align 8
  %10638 = icmp ult i64 %10636, %10637
  %10639 = xor i1 %10638, true
  %10640 = zext i1 %10638 to i32
  %10641 = sext i32 %10640 to i64
  br i1 %10638, label %10642, label %10653

10642:                                            ; preds = %10622
  %10643 = load ptr, ptr %726, align 8
  %10644 = load ptr, ptr %725, align 8
  %10645 = load i64, ptr %723, align 8
  %10646 = call zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef %10643, ptr noundef %10644, i64 noundef %10645)
  %10647 = xor i1 %10646, true
  %10648 = xor i1 %10646, true
  %10649 = zext i1 %10648 to i32
  %10650 = sext i32 %10649 to i64
  br i1 %10648, label %10651, label %10652

10651:                                            ; preds = %10642
  store ptr null, ptr %721, align 8
  br label %10661

10652:                                            ; preds = %10642
  br label %10653

10653:                                            ; preds = %10652, %10622
  %10654 = load ptr, ptr %726, align 8
  %10655 = load ptr, ptr %10654, align 8
  store ptr %10655, ptr %724, align 8
  %10656 = load i64, ptr %723, align 8
  %10657 = load ptr, ptr %726, align 8
  %10658 = load ptr, ptr %10657, align 8
  %10659 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %10658, i64 %10656
  store ptr %10659, ptr %10657, align 8
  %10660 = load ptr, ptr %724, align 8
  store ptr %10660, ptr %721, align 8
  br label %10661

10661:                                            ; preds = %10651, %10653
  %10662 = load ptr, ptr %721, align 8
  store ptr %10662, ptr %885, align 8
  %10663 = load ptr, ptr %885, align 8
  %10664 = icmp ne ptr %10663, null
  %10665 = xor i1 %10664, true
  %10666 = zext i1 %10664 to i32
  %10667 = sext i32 %10666 to i64
  br i1 %10664, label %10668, label %11476

10668:                                            ; preds = %10661
  %10669 = load ptr, ptr %885, align 8
  %10670 = load ptr, ptr %884, align 8
  store ptr %10669, ptr %490, align 8
  store ptr %10670, ptr %491, align 8
  %10671 = load ptr, ptr %491, align 8
  %10672 = call i64 @strlen(ptr noundef %10671)
  store i64 %10672, ptr %492, align 8
  %10673 = load ptr, ptr %491, align 8
  %10674 = load i64, ptr %492, align 8
  store ptr %10673, ptr %456, align 8
  store i64 %10674, ptr %457, align 8
  %10675 = load i64, ptr %457, align 8
  %10676 = call i1 @llvm.is.constant.i64(i64 %10675)
  br i1 %10676, label %10677, label %11448

10677:                                            ; preds = %10668
  %10678 = load i64, ptr %457, align 8
  %10679 = icmp ule i64 %10678, 32
  br i1 %10679, label %10680, label %11448

10680:                                            ; preds = %10677
  %10681 = load i64, ptr %457, align 8
  %10682 = icmp ult i64 0, %10681
  br i1 %10682, label %10683, label %10703

10683:                                            ; preds = %10680
  %10684 = load ptr, ptr %456, align 8
  %10685 = load i8, ptr %10684, align 1
  store i8 %10685, ptr %458, align 1
  %10686 = load i8, ptr %458, align 1
  %10687 = sext i8 %10686 to i32
  %10688 = icmp slt i32 %10687, 32
  br i1 %10688, label %10701, label %10689

10689:                                            ; preds = %10683
  %10690 = load i8, ptr %458, align 1
  %10691 = sext i8 %10690 to i32
  %10692 = icmp sgt i32 %10691, 126
  br i1 %10692, label %10701, label %10693

10693:                                            ; preds = %10689
  %10694 = load i8, ptr %458, align 1
  %10695 = sext i8 %10694 to i32
  %10696 = icmp eq i32 %10695, 34
  br i1 %10696, label %10701, label %10697

10697:                                            ; preds = %10693
  %10698 = load i8, ptr %458, align 1
  %10699 = sext i8 %10698 to i32
  %10700 = icmp eq i32 %10699, 92
  br i1 %10700, label %10701, label %10702

10701:                                            ; preds = %10697, %10693, %10689, %10683
  store i1 false, ptr %455, align 1
  br label %11449

10702:                                            ; preds = %10697
  br label %10703

10703:                                            ; preds = %10702, %10680
  %10704 = load i64, ptr %457, align 8
  %10705 = icmp ult i64 1, %10704
  br i1 %10705, label %10706, label %10727

10706:                                            ; preds = %10703
  %10707 = load ptr, ptr %456, align 8
  %10708 = getelementptr inbounds i8, ptr %10707, i64 1
  %10709 = load i8, ptr %10708, align 1
  store i8 %10709, ptr %459, align 1
  %10710 = load i8, ptr %459, align 1
  %10711 = sext i8 %10710 to i32
  %10712 = icmp slt i32 %10711, 32
  br i1 %10712, label %10725, label %10713

10713:                                            ; preds = %10706
  %10714 = load i8, ptr %459, align 1
  %10715 = sext i8 %10714 to i32
  %10716 = icmp sgt i32 %10715, 126
  br i1 %10716, label %10725, label %10717

10717:                                            ; preds = %10713
  %10718 = load i8, ptr %459, align 1
  %10719 = sext i8 %10718 to i32
  %10720 = icmp eq i32 %10719, 34
  br i1 %10720, label %10725, label %10721

10721:                                            ; preds = %10717
  %10722 = load i8, ptr %459, align 1
  %10723 = sext i8 %10722 to i32
  %10724 = icmp eq i32 %10723, 92
  br i1 %10724, label %10725, label %10726

10725:                                            ; preds = %10721, %10717, %10713, %10706
  store i1 false, ptr %455, align 1
  br label %11449

10726:                                            ; preds = %10721
  br label %10727

10727:                                            ; preds = %10726, %10703
  %10728 = load i64, ptr %457, align 8
  %10729 = icmp ult i64 2, %10728
  br i1 %10729, label %10730, label %10751

10730:                                            ; preds = %10727
  %10731 = load ptr, ptr %456, align 8
  %10732 = getelementptr inbounds i8, ptr %10731, i64 2
  %10733 = load i8, ptr %10732, align 1
  store i8 %10733, ptr %460, align 1
  %10734 = load i8, ptr %460, align 1
  %10735 = sext i8 %10734 to i32
  %10736 = icmp slt i32 %10735, 32
  br i1 %10736, label %10749, label %10737

10737:                                            ; preds = %10730
  %10738 = load i8, ptr %460, align 1
  %10739 = sext i8 %10738 to i32
  %10740 = icmp sgt i32 %10739, 126
  br i1 %10740, label %10749, label %10741

10741:                                            ; preds = %10737
  %10742 = load i8, ptr %460, align 1
  %10743 = sext i8 %10742 to i32
  %10744 = icmp eq i32 %10743, 34
  br i1 %10744, label %10749, label %10745

10745:                                            ; preds = %10741
  %10746 = load i8, ptr %460, align 1
  %10747 = sext i8 %10746 to i32
  %10748 = icmp eq i32 %10747, 92
  br i1 %10748, label %10749, label %10750

10749:                                            ; preds = %10745, %10741, %10737, %10730
  store i1 false, ptr %455, align 1
  br label %11449

10750:                                            ; preds = %10745
  br label %10751

10751:                                            ; preds = %10750, %10727
  %10752 = load i64, ptr %457, align 8
  %10753 = icmp ult i64 3, %10752
  br i1 %10753, label %10754, label %10775

10754:                                            ; preds = %10751
  %10755 = load ptr, ptr %456, align 8
  %10756 = getelementptr inbounds i8, ptr %10755, i64 3
  %10757 = load i8, ptr %10756, align 1
  store i8 %10757, ptr %461, align 1
  %10758 = load i8, ptr %461, align 1
  %10759 = sext i8 %10758 to i32
  %10760 = icmp slt i32 %10759, 32
  br i1 %10760, label %10773, label %10761

10761:                                            ; preds = %10754
  %10762 = load i8, ptr %461, align 1
  %10763 = sext i8 %10762 to i32
  %10764 = icmp sgt i32 %10763, 126
  br i1 %10764, label %10773, label %10765

10765:                                            ; preds = %10761
  %10766 = load i8, ptr %461, align 1
  %10767 = sext i8 %10766 to i32
  %10768 = icmp eq i32 %10767, 34
  br i1 %10768, label %10773, label %10769

10769:                                            ; preds = %10765
  %10770 = load i8, ptr %461, align 1
  %10771 = sext i8 %10770 to i32
  %10772 = icmp eq i32 %10771, 92
  br i1 %10772, label %10773, label %10774

10773:                                            ; preds = %10769, %10765, %10761, %10754
  store i1 false, ptr %455, align 1
  br label %11449

10774:                                            ; preds = %10769
  br label %10775

10775:                                            ; preds = %10774, %10751
  %10776 = load i64, ptr %457, align 8
  %10777 = icmp ult i64 4, %10776
  br i1 %10777, label %10778, label %10799

10778:                                            ; preds = %10775
  %10779 = load ptr, ptr %456, align 8
  %10780 = getelementptr inbounds i8, ptr %10779, i64 4
  %10781 = load i8, ptr %10780, align 1
  store i8 %10781, ptr %462, align 1
  %10782 = load i8, ptr %462, align 1
  %10783 = sext i8 %10782 to i32
  %10784 = icmp slt i32 %10783, 32
  br i1 %10784, label %10797, label %10785

10785:                                            ; preds = %10778
  %10786 = load i8, ptr %462, align 1
  %10787 = sext i8 %10786 to i32
  %10788 = icmp sgt i32 %10787, 126
  br i1 %10788, label %10797, label %10789

10789:                                            ; preds = %10785
  %10790 = load i8, ptr %462, align 1
  %10791 = sext i8 %10790 to i32
  %10792 = icmp eq i32 %10791, 34
  br i1 %10792, label %10797, label %10793

10793:                                            ; preds = %10789
  %10794 = load i8, ptr %462, align 1
  %10795 = sext i8 %10794 to i32
  %10796 = icmp eq i32 %10795, 92
  br i1 %10796, label %10797, label %10798

10797:                                            ; preds = %10793, %10789, %10785, %10778
  store i1 false, ptr %455, align 1
  br label %11449

10798:                                            ; preds = %10793
  br label %10799

10799:                                            ; preds = %10798, %10775
  %10800 = load i64, ptr %457, align 8
  %10801 = icmp ult i64 5, %10800
  br i1 %10801, label %10802, label %10823

10802:                                            ; preds = %10799
  %10803 = load ptr, ptr %456, align 8
  %10804 = getelementptr inbounds i8, ptr %10803, i64 5
  %10805 = load i8, ptr %10804, align 1
  store i8 %10805, ptr %463, align 1
  %10806 = load i8, ptr %463, align 1
  %10807 = sext i8 %10806 to i32
  %10808 = icmp slt i32 %10807, 32
  br i1 %10808, label %10821, label %10809

10809:                                            ; preds = %10802
  %10810 = load i8, ptr %463, align 1
  %10811 = sext i8 %10810 to i32
  %10812 = icmp sgt i32 %10811, 126
  br i1 %10812, label %10821, label %10813

10813:                                            ; preds = %10809
  %10814 = load i8, ptr %463, align 1
  %10815 = sext i8 %10814 to i32
  %10816 = icmp eq i32 %10815, 34
  br i1 %10816, label %10821, label %10817

10817:                                            ; preds = %10813
  %10818 = load i8, ptr %463, align 1
  %10819 = sext i8 %10818 to i32
  %10820 = icmp eq i32 %10819, 92
  br i1 %10820, label %10821, label %10822

10821:                                            ; preds = %10817, %10813, %10809, %10802
  store i1 false, ptr %455, align 1
  br label %11449

10822:                                            ; preds = %10817
  br label %10823

10823:                                            ; preds = %10822, %10799
  %10824 = load i64, ptr %457, align 8
  %10825 = icmp ult i64 6, %10824
  br i1 %10825, label %10826, label %10847

10826:                                            ; preds = %10823
  %10827 = load ptr, ptr %456, align 8
  %10828 = getelementptr inbounds i8, ptr %10827, i64 6
  %10829 = load i8, ptr %10828, align 1
  store i8 %10829, ptr %464, align 1
  %10830 = load i8, ptr %464, align 1
  %10831 = sext i8 %10830 to i32
  %10832 = icmp slt i32 %10831, 32
  br i1 %10832, label %10845, label %10833

10833:                                            ; preds = %10826
  %10834 = load i8, ptr %464, align 1
  %10835 = sext i8 %10834 to i32
  %10836 = icmp sgt i32 %10835, 126
  br i1 %10836, label %10845, label %10837

10837:                                            ; preds = %10833
  %10838 = load i8, ptr %464, align 1
  %10839 = sext i8 %10838 to i32
  %10840 = icmp eq i32 %10839, 34
  br i1 %10840, label %10845, label %10841

10841:                                            ; preds = %10837
  %10842 = load i8, ptr %464, align 1
  %10843 = sext i8 %10842 to i32
  %10844 = icmp eq i32 %10843, 92
  br i1 %10844, label %10845, label %10846

10845:                                            ; preds = %10841, %10837, %10833, %10826
  store i1 false, ptr %455, align 1
  br label %11449

10846:                                            ; preds = %10841
  br label %10847

10847:                                            ; preds = %10846, %10823
  %10848 = load i64, ptr %457, align 8
  %10849 = icmp ult i64 7, %10848
  br i1 %10849, label %10850, label %10871

10850:                                            ; preds = %10847
  %10851 = load ptr, ptr %456, align 8
  %10852 = getelementptr inbounds i8, ptr %10851, i64 7
  %10853 = load i8, ptr %10852, align 1
  store i8 %10853, ptr %465, align 1
  %10854 = load i8, ptr %465, align 1
  %10855 = sext i8 %10854 to i32
  %10856 = icmp slt i32 %10855, 32
  br i1 %10856, label %10869, label %10857

10857:                                            ; preds = %10850
  %10858 = load i8, ptr %465, align 1
  %10859 = sext i8 %10858 to i32
  %10860 = icmp sgt i32 %10859, 126
  br i1 %10860, label %10869, label %10861

10861:                                            ; preds = %10857
  %10862 = load i8, ptr %465, align 1
  %10863 = sext i8 %10862 to i32
  %10864 = icmp eq i32 %10863, 34
  br i1 %10864, label %10869, label %10865

10865:                                            ; preds = %10861
  %10866 = load i8, ptr %465, align 1
  %10867 = sext i8 %10866 to i32
  %10868 = icmp eq i32 %10867, 92
  br i1 %10868, label %10869, label %10870

10869:                                            ; preds = %10865, %10861, %10857, %10850
  store i1 false, ptr %455, align 1
  br label %11449

10870:                                            ; preds = %10865
  br label %10871

10871:                                            ; preds = %10870, %10847
  %10872 = load i64, ptr %457, align 8
  %10873 = icmp ult i64 8, %10872
  br i1 %10873, label %10874, label %10895

10874:                                            ; preds = %10871
  %10875 = load ptr, ptr %456, align 8
  %10876 = getelementptr inbounds i8, ptr %10875, i64 8
  %10877 = load i8, ptr %10876, align 1
  store i8 %10877, ptr %466, align 1
  %10878 = load i8, ptr %466, align 1
  %10879 = sext i8 %10878 to i32
  %10880 = icmp slt i32 %10879, 32
  br i1 %10880, label %10893, label %10881

10881:                                            ; preds = %10874
  %10882 = load i8, ptr %466, align 1
  %10883 = sext i8 %10882 to i32
  %10884 = icmp sgt i32 %10883, 126
  br i1 %10884, label %10893, label %10885

10885:                                            ; preds = %10881
  %10886 = load i8, ptr %466, align 1
  %10887 = sext i8 %10886 to i32
  %10888 = icmp eq i32 %10887, 34
  br i1 %10888, label %10893, label %10889

10889:                                            ; preds = %10885
  %10890 = load i8, ptr %466, align 1
  %10891 = sext i8 %10890 to i32
  %10892 = icmp eq i32 %10891, 92
  br i1 %10892, label %10893, label %10894

10893:                                            ; preds = %10889, %10885, %10881, %10874
  store i1 false, ptr %455, align 1
  br label %11449

10894:                                            ; preds = %10889
  br label %10895

10895:                                            ; preds = %10894, %10871
  %10896 = load i64, ptr %457, align 8
  %10897 = icmp ult i64 9, %10896
  br i1 %10897, label %10898, label %10919

10898:                                            ; preds = %10895
  %10899 = load ptr, ptr %456, align 8
  %10900 = getelementptr inbounds i8, ptr %10899, i64 9
  %10901 = load i8, ptr %10900, align 1
  store i8 %10901, ptr %467, align 1
  %10902 = load i8, ptr %467, align 1
  %10903 = sext i8 %10902 to i32
  %10904 = icmp slt i32 %10903, 32
  br i1 %10904, label %10917, label %10905

10905:                                            ; preds = %10898
  %10906 = load i8, ptr %467, align 1
  %10907 = sext i8 %10906 to i32
  %10908 = icmp sgt i32 %10907, 126
  br i1 %10908, label %10917, label %10909

10909:                                            ; preds = %10905
  %10910 = load i8, ptr %467, align 1
  %10911 = sext i8 %10910 to i32
  %10912 = icmp eq i32 %10911, 34
  br i1 %10912, label %10917, label %10913

10913:                                            ; preds = %10909
  %10914 = load i8, ptr %467, align 1
  %10915 = sext i8 %10914 to i32
  %10916 = icmp eq i32 %10915, 92
  br i1 %10916, label %10917, label %10918

10917:                                            ; preds = %10913, %10909, %10905, %10898
  store i1 false, ptr %455, align 1
  br label %11449

10918:                                            ; preds = %10913
  br label %10919

10919:                                            ; preds = %10918, %10895
  %10920 = load i64, ptr %457, align 8
  %10921 = icmp ult i64 10, %10920
  br i1 %10921, label %10922, label %10943

10922:                                            ; preds = %10919
  %10923 = load ptr, ptr %456, align 8
  %10924 = getelementptr inbounds i8, ptr %10923, i64 10
  %10925 = load i8, ptr %10924, align 1
  store i8 %10925, ptr %468, align 1
  %10926 = load i8, ptr %468, align 1
  %10927 = sext i8 %10926 to i32
  %10928 = icmp slt i32 %10927, 32
  br i1 %10928, label %10941, label %10929

10929:                                            ; preds = %10922
  %10930 = load i8, ptr %468, align 1
  %10931 = sext i8 %10930 to i32
  %10932 = icmp sgt i32 %10931, 126
  br i1 %10932, label %10941, label %10933

10933:                                            ; preds = %10929
  %10934 = load i8, ptr %468, align 1
  %10935 = sext i8 %10934 to i32
  %10936 = icmp eq i32 %10935, 34
  br i1 %10936, label %10941, label %10937

10937:                                            ; preds = %10933
  %10938 = load i8, ptr %468, align 1
  %10939 = sext i8 %10938 to i32
  %10940 = icmp eq i32 %10939, 92
  br i1 %10940, label %10941, label %10942

10941:                                            ; preds = %10937, %10933, %10929, %10922
  store i1 false, ptr %455, align 1
  br label %11449

10942:                                            ; preds = %10937
  br label %10943

10943:                                            ; preds = %10942, %10919
  %10944 = load i64, ptr %457, align 8
  %10945 = icmp ult i64 11, %10944
  br i1 %10945, label %10946, label %10967

10946:                                            ; preds = %10943
  %10947 = load ptr, ptr %456, align 8
  %10948 = getelementptr inbounds i8, ptr %10947, i64 11
  %10949 = load i8, ptr %10948, align 1
  store i8 %10949, ptr %469, align 1
  %10950 = load i8, ptr %469, align 1
  %10951 = sext i8 %10950 to i32
  %10952 = icmp slt i32 %10951, 32
  br i1 %10952, label %10965, label %10953

10953:                                            ; preds = %10946
  %10954 = load i8, ptr %469, align 1
  %10955 = sext i8 %10954 to i32
  %10956 = icmp sgt i32 %10955, 126
  br i1 %10956, label %10965, label %10957

10957:                                            ; preds = %10953
  %10958 = load i8, ptr %469, align 1
  %10959 = sext i8 %10958 to i32
  %10960 = icmp eq i32 %10959, 34
  br i1 %10960, label %10965, label %10961

10961:                                            ; preds = %10957
  %10962 = load i8, ptr %469, align 1
  %10963 = sext i8 %10962 to i32
  %10964 = icmp eq i32 %10963, 92
  br i1 %10964, label %10965, label %10966

10965:                                            ; preds = %10961, %10957, %10953, %10946
  store i1 false, ptr %455, align 1
  br label %11449

10966:                                            ; preds = %10961
  br label %10967

10967:                                            ; preds = %10966, %10943
  %10968 = load i64, ptr %457, align 8
  %10969 = icmp ult i64 12, %10968
  br i1 %10969, label %10970, label %10991

10970:                                            ; preds = %10967
  %10971 = load ptr, ptr %456, align 8
  %10972 = getelementptr inbounds i8, ptr %10971, i64 12
  %10973 = load i8, ptr %10972, align 1
  store i8 %10973, ptr %470, align 1
  %10974 = load i8, ptr %470, align 1
  %10975 = sext i8 %10974 to i32
  %10976 = icmp slt i32 %10975, 32
  br i1 %10976, label %10989, label %10977

10977:                                            ; preds = %10970
  %10978 = load i8, ptr %470, align 1
  %10979 = sext i8 %10978 to i32
  %10980 = icmp sgt i32 %10979, 126
  br i1 %10980, label %10989, label %10981

10981:                                            ; preds = %10977
  %10982 = load i8, ptr %470, align 1
  %10983 = sext i8 %10982 to i32
  %10984 = icmp eq i32 %10983, 34
  br i1 %10984, label %10989, label %10985

10985:                                            ; preds = %10981
  %10986 = load i8, ptr %470, align 1
  %10987 = sext i8 %10986 to i32
  %10988 = icmp eq i32 %10987, 92
  br i1 %10988, label %10989, label %10990

10989:                                            ; preds = %10985, %10981, %10977, %10970
  store i1 false, ptr %455, align 1
  br label %11449

10990:                                            ; preds = %10985
  br label %10991

10991:                                            ; preds = %10990, %10967
  %10992 = load i64, ptr %457, align 8
  %10993 = icmp ult i64 13, %10992
  br i1 %10993, label %10994, label %11015

10994:                                            ; preds = %10991
  %10995 = load ptr, ptr %456, align 8
  %10996 = getelementptr inbounds i8, ptr %10995, i64 13
  %10997 = load i8, ptr %10996, align 1
  store i8 %10997, ptr %471, align 1
  %10998 = load i8, ptr %471, align 1
  %10999 = sext i8 %10998 to i32
  %11000 = icmp slt i32 %10999, 32
  br i1 %11000, label %11013, label %11001

11001:                                            ; preds = %10994
  %11002 = load i8, ptr %471, align 1
  %11003 = sext i8 %11002 to i32
  %11004 = icmp sgt i32 %11003, 126
  br i1 %11004, label %11013, label %11005

11005:                                            ; preds = %11001
  %11006 = load i8, ptr %471, align 1
  %11007 = sext i8 %11006 to i32
  %11008 = icmp eq i32 %11007, 34
  br i1 %11008, label %11013, label %11009

11009:                                            ; preds = %11005
  %11010 = load i8, ptr %471, align 1
  %11011 = sext i8 %11010 to i32
  %11012 = icmp eq i32 %11011, 92
  br i1 %11012, label %11013, label %11014

11013:                                            ; preds = %11009, %11005, %11001, %10994
  store i1 false, ptr %455, align 1
  br label %11449

11014:                                            ; preds = %11009
  br label %11015

11015:                                            ; preds = %11014, %10991
  %11016 = load i64, ptr %457, align 8
  %11017 = icmp ult i64 14, %11016
  br i1 %11017, label %11018, label %11039

11018:                                            ; preds = %11015
  %11019 = load ptr, ptr %456, align 8
  %11020 = getelementptr inbounds i8, ptr %11019, i64 14
  %11021 = load i8, ptr %11020, align 1
  store i8 %11021, ptr %472, align 1
  %11022 = load i8, ptr %472, align 1
  %11023 = sext i8 %11022 to i32
  %11024 = icmp slt i32 %11023, 32
  br i1 %11024, label %11037, label %11025

11025:                                            ; preds = %11018
  %11026 = load i8, ptr %472, align 1
  %11027 = sext i8 %11026 to i32
  %11028 = icmp sgt i32 %11027, 126
  br i1 %11028, label %11037, label %11029

11029:                                            ; preds = %11025
  %11030 = load i8, ptr %472, align 1
  %11031 = sext i8 %11030 to i32
  %11032 = icmp eq i32 %11031, 34
  br i1 %11032, label %11037, label %11033

11033:                                            ; preds = %11029
  %11034 = load i8, ptr %472, align 1
  %11035 = sext i8 %11034 to i32
  %11036 = icmp eq i32 %11035, 92
  br i1 %11036, label %11037, label %11038

11037:                                            ; preds = %11033, %11029, %11025, %11018
  store i1 false, ptr %455, align 1
  br label %11449

11038:                                            ; preds = %11033
  br label %11039

11039:                                            ; preds = %11038, %11015
  %11040 = load i64, ptr %457, align 8
  %11041 = icmp ult i64 15, %11040
  br i1 %11041, label %11042, label %11063

11042:                                            ; preds = %11039
  %11043 = load ptr, ptr %456, align 8
  %11044 = getelementptr inbounds i8, ptr %11043, i64 15
  %11045 = load i8, ptr %11044, align 1
  store i8 %11045, ptr %473, align 1
  %11046 = load i8, ptr %473, align 1
  %11047 = sext i8 %11046 to i32
  %11048 = icmp slt i32 %11047, 32
  br i1 %11048, label %11061, label %11049

11049:                                            ; preds = %11042
  %11050 = load i8, ptr %473, align 1
  %11051 = sext i8 %11050 to i32
  %11052 = icmp sgt i32 %11051, 126
  br i1 %11052, label %11061, label %11053

11053:                                            ; preds = %11049
  %11054 = load i8, ptr %473, align 1
  %11055 = sext i8 %11054 to i32
  %11056 = icmp eq i32 %11055, 34
  br i1 %11056, label %11061, label %11057

11057:                                            ; preds = %11053
  %11058 = load i8, ptr %473, align 1
  %11059 = sext i8 %11058 to i32
  %11060 = icmp eq i32 %11059, 92
  br i1 %11060, label %11061, label %11062

11061:                                            ; preds = %11057, %11053, %11049, %11042
  store i1 false, ptr %455, align 1
  br label %11449

11062:                                            ; preds = %11057
  br label %11063

11063:                                            ; preds = %11062, %11039
  %11064 = load i64, ptr %457, align 8
  %11065 = icmp ult i64 16, %11064
  br i1 %11065, label %11066, label %11087

11066:                                            ; preds = %11063
  %11067 = load ptr, ptr %456, align 8
  %11068 = getelementptr inbounds i8, ptr %11067, i64 16
  %11069 = load i8, ptr %11068, align 1
  store i8 %11069, ptr %474, align 1
  %11070 = load i8, ptr %474, align 1
  %11071 = sext i8 %11070 to i32
  %11072 = icmp slt i32 %11071, 32
  br i1 %11072, label %11085, label %11073

11073:                                            ; preds = %11066
  %11074 = load i8, ptr %474, align 1
  %11075 = sext i8 %11074 to i32
  %11076 = icmp sgt i32 %11075, 126
  br i1 %11076, label %11085, label %11077

11077:                                            ; preds = %11073
  %11078 = load i8, ptr %474, align 1
  %11079 = sext i8 %11078 to i32
  %11080 = icmp eq i32 %11079, 34
  br i1 %11080, label %11085, label %11081

11081:                                            ; preds = %11077
  %11082 = load i8, ptr %474, align 1
  %11083 = sext i8 %11082 to i32
  %11084 = icmp eq i32 %11083, 92
  br i1 %11084, label %11085, label %11086

11085:                                            ; preds = %11081, %11077, %11073, %11066
  store i1 false, ptr %455, align 1
  br label %11449

11086:                                            ; preds = %11081
  br label %11087

11087:                                            ; preds = %11086, %11063
  %11088 = load i64, ptr %457, align 8
  %11089 = icmp ult i64 17, %11088
  br i1 %11089, label %11090, label %11111

11090:                                            ; preds = %11087
  %11091 = load ptr, ptr %456, align 8
  %11092 = getelementptr inbounds i8, ptr %11091, i64 17
  %11093 = load i8, ptr %11092, align 1
  store i8 %11093, ptr %475, align 1
  %11094 = load i8, ptr %475, align 1
  %11095 = sext i8 %11094 to i32
  %11096 = icmp slt i32 %11095, 32
  br i1 %11096, label %11109, label %11097

11097:                                            ; preds = %11090
  %11098 = load i8, ptr %475, align 1
  %11099 = sext i8 %11098 to i32
  %11100 = icmp sgt i32 %11099, 126
  br i1 %11100, label %11109, label %11101

11101:                                            ; preds = %11097
  %11102 = load i8, ptr %475, align 1
  %11103 = sext i8 %11102 to i32
  %11104 = icmp eq i32 %11103, 34
  br i1 %11104, label %11109, label %11105

11105:                                            ; preds = %11101
  %11106 = load i8, ptr %475, align 1
  %11107 = sext i8 %11106 to i32
  %11108 = icmp eq i32 %11107, 92
  br i1 %11108, label %11109, label %11110

11109:                                            ; preds = %11105, %11101, %11097, %11090
  store i1 false, ptr %455, align 1
  br label %11449

11110:                                            ; preds = %11105
  br label %11111

11111:                                            ; preds = %11110, %11087
  %11112 = load i64, ptr %457, align 8
  %11113 = icmp ult i64 18, %11112
  br i1 %11113, label %11114, label %11135

11114:                                            ; preds = %11111
  %11115 = load ptr, ptr %456, align 8
  %11116 = getelementptr inbounds i8, ptr %11115, i64 18
  %11117 = load i8, ptr %11116, align 1
  store i8 %11117, ptr %476, align 1
  %11118 = load i8, ptr %476, align 1
  %11119 = sext i8 %11118 to i32
  %11120 = icmp slt i32 %11119, 32
  br i1 %11120, label %11133, label %11121

11121:                                            ; preds = %11114
  %11122 = load i8, ptr %476, align 1
  %11123 = sext i8 %11122 to i32
  %11124 = icmp sgt i32 %11123, 126
  br i1 %11124, label %11133, label %11125

11125:                                            ; preds = %11121
  %11126 = load i8, ptr %476, align 1
  %11127 = sext i8 %11126 to i32
  %11128 = icmp eq i32 %11127, 34
  br i1 %11128, label %11133, label %11129

11129:                                            ; preds = %11125
  %11130 = load i8, ptr %476, align 1
  %11131 = sext i8 %11130 to i32
  %11132 = icmp eq i32 %11131, 92
  br i1 %11132, label %11133, label %11134

11133:                                            ; preds = %11129, %11125, %11121, %11114
  store i1 false, ptr %455, align 1
  br label %11449

11134:                                            ; preds = %11129
  br label %11135

11135:                                            ; preds = %11134, %11111
  %11136 = load i64, ptr %457, align 8
  %11137 = icmp ult i64 19, %11136
  br i1 %11137, label %11138, label %11159

11138:                                            ; preds = %11135
  %11139 = load ptr, ptr %456, align 8
  %11140 = getelementptr inbounds i8, ptr %11139, i64 19
  %11141 = load i8, ptr %11140, align 1
  store i8 %11141, ptr %477, align 1
  %11142 = load i8, ptr %477, align 1
  %11143 = sext i8 %11142 to i32
  %11144 = icmp slt i32 %11143, 32
  br i1 %11144, label %11157, label %11145

11145:                                            ; preds = %11138
  %11146 = load i8, ptr %477, align 1
  %11147 = sext i8 %11146 to i32
  %11148 = icmp sgt i32 %11147, 126
  br i1 %11148, label %11157, label %11149

11149:                                            ; preds = %11145
  %11150 = load i8, ptr %477, align 1
  %11151 = sext i8 %11150 to i32
  %11152 = icmp eq i32 %11151, 34
  br i1 %11152, label %11157, label %11153

11153:                                            ; preds = %11149
  %11154 = load i8, ptr %477, align 1
  %11155 = sext i8 %11154 to i32
  %11156 = icmp eq i32 %11155, 92
  br i1 %11156, label %11157, label %11158

11157:                                            ; preds = %11153, %11149, %11145, %11138
  store i1 false, ptr %455, align 1
  br label %11449

11158:                                            ; preds = %11153
  br label %11159

11159:                                            ; preds = %11158, %11135
  %11160 = load i64, ptr %457, align 8
  %11161 = icmp ult i64 20, %11160
  br i1 %11161, label %11162, label %11183

11162:                                            ; preds = %11159
  %11163 = load ptr, ptr %456, align 8
  %11164 = getelementptr inbounds i8, ptr %11163, i64 20
  %11165 = load i8, ptr %11164, align 1
  store i8 %11165, ptr %478, align 1
  %11166 = load i8, ptr %478, align 1
  %11167 = sext i8 %11166 to i32
  %11168 = icmp slt i32 %11167, 32
  br i1 %11168, label %11181, label %11169

11169:                                            ; preds = %11162
  %11170 = load i8, ptr %478, align 1
  %11171 = sext i8 %11170 to i32
  %11172 = icmp sgt i32 %11171, 126
  br i1 %11172, label %11181, label %11173

11173:                                            ; preds = %11169
  %11174 = load i8, ptr %478, align 1
  %11175 = sext i8 %11174 to i32
  %11176 = icmp eq i32 %11175, 34
  br i1 %11176, label %11181, label %11177

11177:                                            ; preds = %11173
  %11178 = load i8, ptr %478, align 1
  %11179 = sext i8 %11178 to i32
  %11180 = icmp eq i32 %11179, 92
  br i1 %11180, label %11181, label %11182

11181:                                            ; preds = %11177, %11173, %11169, %11162
  store i1 false, ptr %455, align 1
  br label %11449

11182:                                            ; preds = %11177
  br label %11183

11183:                                            ; preds = %11182, %11159
  %11184 = load i64, ptr %457, align 8
  %11185 = icmp ult i64 21, %11184
  br i1 %11185, label %11186, label %11207

11186:                                            ; preds = %11183
  %11187 = load ptr, ptr %456, align 8
  %11188 = getelementptr inbounds i8, ptr %11187, i64 21
  %11189 = load i8, ptr %11188, align 1
  store i8 %11189, ptr %479, align 1
  %11190 = load i8, ptr %479, align 1
  %11191 = sext i8 %11190 to i32
  %11192 = icmp slt i32 %11191, 32
  br i1 %11192, label %11205, label %11193

11193:                                            ; preds = %11186
  %11194 = load i8, ptr %479, align 1
  %11195 = sext i8 %11194 to i32
  %11196 = icmp sgt i32 %11195, 126
  br i1 %11196, label %11205, label %11197

11197:                                            ; preds = %11193
  %11198 = load i8, ptr %479, align 1
  %11199 = sext i8 %11198 to i32
  %11200 = icmp eq i32 %11199, 34
  br i1 %11200, label %11205, label %11201

11201:                                            ; preds = %11197
  %11202 = load i8, ptr %479, align 1
  %11203 = sext i8 %11202 to i32
  %11204 = icmp eq i32 %11203, 92
  br i1 %11204, label %11205, label %11206

11205:                                            ; preds = %11201, %11197, %11193, %11186
  store i1 false, ptr %455, align 1
  br label %11449

11206:                                            ; preds = %11201
  br label %11207

11207:                                            ; preds = %11206, %11183
  %11208 = load i64, ptr %457, align 8
  %11209 = icmp ult i64 22, %11208
  br i1 %11209, label %11210, label %11231

11210:                                            ; preds = %11207
  %11211 = load ptr, ptr %456, align 8
  %11212 = getelementptr inbounds i8, ptr %11211, i64 22
  %11213 = load i8, ptr %11212, align 1
  store i8 %11213, ptr %480, align 1
  %11214 = load i8, ptr %480, align 1
  %11215 = sext i8 %11214 to i32
  %11216 = icmp slt i32 %11215, 32
  br i1 %11216, label %11229, label %11217

11217:                                            ; preds = %11210
  %11218 = load i8, ptr %480, align 1
  %11219 = sext i8 %11218 to i32
  %11220 = icmp sgt i32 %11219, 126
  br i1 %11220, label %11229, label %11221

11221:                                            ; preds = %11217
  %11222 = load i8, ptr %480, align 1
  %11223 = sext i8 %11222 to i32
  %11224 = icmp eq i32 %11223, 34
  br i1 %11224, label %11229, label %11225

11225:                                            ; preds = %11221
  %11226 = load i8, ptr %480, align 1
  %11227 = sext i8 %11226 to i32
  %11228 = icmp eq i32 %11227, 92
  br i1 %11228, label %11229, label %11230

11229:                                            ; preds = %11225, %11221, %11217, %11210
  store i1 false, ptr %455, align 1
  br label %11449

11230:                                            ; preds = %11225
  br label %11231

11231:                                            ; preds = %11230, %11207
  %11232 = load i64, ptr %457, align 8
  %11233 = icmp ult i64 23, %11232
  br i1 %11233, label %11234, label %11255

11234:                                            ; preds = %11231
  %11235 = load ptr, ptr %456, align 8
  %11236 = getelementptr inbounds i8, ptr %11235, i64 23
  %11237 = load i8, ptr %11236, align 1
  store i8 %11237, ptr %481, align 1
  %11238 = load i8, ptr %481, align 1
  %11239 = sext i8 %11238 to i32
  %11240 = icmp slt i32 %11239, 32
  br i1 %11240, label %11253, label %11241

11241:                                            ; preds = %11234
  %11242 = load i8, ptr %481, align 1
  %11243 = sext i8 %11242 to i32
  %11244 = icmp sgt i32 %11243, 126
  br i1 %11244, label %11253, label %11245

11245:                                            ; preds = %11241
  %11246 = load i8, ptr %481, align 1
  %11247 = sext i8 %11246 to i32
  %11248 = icmp eq i32 %11247, 34
  br i1 %11248, label %11253, label %11249

11249:                                            ; preds = %11245
  %11250 = load i8, ptr %481, align 1
  %11251 = sext i8 %11250 to i32
  %11252 = icmp eq i32 %11251, 92
  br i1 %11252, label %11253, label %11254

11253:                                            ; preds = %11249, %11245, %11241, %11234
  store i1 false, ptr %455, align 1
  br label %11449

11254:                                            ; preds = %11249
  br label %11255

11255:                                            ; preds = %11254, %11231
  %11256 = load i64, ptr %457, align 8
  %11257 = icmp ult i64 24, %11256
  br i1 %11257, label %11258, label %11279

11258:                                            ; preds = %11255
  %11259 = load ptr, ptr %456, align 8
  %11260 = getelementptr inbounds i8, ptr %11259, i64 24
  %11261 = load i8, ptr %11260, align 1
  store i8 %11261, ptr %482, align 1
  %11262 = load i8, ptr %482, align 1
  %11263 = sext i8 %11262 to i32
  %11264 = icmp slt i32 %11263, 32
  br i1 %11264, label %11277, label %11265

11265:                                            ; preds = %11258
  %11266 = load i8, ptr %482, align 1
  %11267 = sext i8 %11266 to i32
  %11268 = icmp sgt i32 %11267, 126
  br i1 %11268, label %11277, label %11269

11269:                                            ; preds = %11265
  %11270 = load i8, ptr %482, align 1
  %11271 = sext i8 %11270 to i32
  %11272 = icmp eq i32 %11271, 34
  br i1 %11272, label %11277, label %11273

11273:                                            ; preds = %11269
  %11274 = load i8, ptr %482, align 1
  %11275 = sext i8 %11274 to i32
  %11276 = icmp eq i32 %11275, 92
  br i1 %11276, label %11277, label %11278

11277:                                            ; preds = %11273, %11269, %11265, %11258
  store i1 false, ptr %455, align 1
  br label %11449

11278:                                            ; preds = %11273
  br label %11279

11279:                                            ; preds = %11278, %11255
  %11280 = load i64, ptr %457, align 8
  %11281 = icmp ult i64 25, %11280
  br i1 %11281, label %11282, label %11303

11282:                                            ; preds = %11279
  %11283 = load ptr, ptr %456, align 8
  %11284 = getelementptr inbounds i8, ptr %11283, i64 25
  %11285 = load i8, ptr %11284, align 1
  store i8 %11285, ptr %483, align 1
  %11286 = load i8, ptr %483, align 1
  %11287 = sext i8 %11286 to i32
  %11288 = icmp slt i32 %11287, 32
  br i1 %11288, label %11301, label %11289

11289:                                            ; preds = %11282
  %11290 = load i8, ptr %483, align 1
  %11291 = sext i8 %11290 to i32
  %11292 = icmp sgt i32 %11291, 126
  br i1 %11292, label %11301, label %11293

11293:                                            ; preds = %11289
  %11294 = load i8, ptr %483, align 1
  %11295 = sext i8 %11294 to i32
  %11296 = icmp eq i32 %11295, 34
  br i1 %11296, label %11301, label %11297

11297:                                            ; preds = %11293
  %11298 = load i8, ptr %483, align 1
  %11299 = sext i8 %11298 to i32
  %11300 = icmp eq i32 %11299, 92
  br i1 %11300, label %11301, label %11302

11301:                                            ; preds = %11297, %11293, %11289, %11282
  store i1 false, ptr %455, align 1
  br label %11449

11302:                                            ; preds = %11297
  br label %11303

11303:                                            ; preds = %11302, %11279
  %11304 = load i64, ptr %457, align 8
  %11305 = icmp ult i64 26, %11304
  br i1 %11305, label %11306, label %11327

11306:                                            ; preds = %11303
  %11307 = load ptr, ptr %456, align 8
  %11308 = getelementptr inbounds i8, ptr %11307, i64 26
  %11309 = load i8, ptr %11308, align 1
  store i8 %11309, ptr %484, align 1
  %11310 = load i8, ptr %484, align 1
  %11311 = sext i8 %11310 to i32
  %11312 = icmp slt i32 %11311, 32
  br i1 %11312, label %11325, label %11313

11313:                                            ; preds = %11306
  %11314 = load i8, ptr %484, align 1
  %11315 = sext i8 %11314 to i32
  %11316 = icmp sgt i32 %11315, 126
  br i1 %11316, label %11325, label %11317

11317:                                            ; preds = %11313
  %11318 = load i8, ptr %484, align 1
  %11319 = sext i8 %11318 to i32
  %11320 = icmp eq i32 %11319, 34
  br i1 %11320, label %11325, label %11321

11321:                                            ; preds = %11317
  %11322 = load i8, ptr %484, align 1
  %11323 = sext i8 %11322 to i32
  %11324 = icmp eq i32 %11323, 92
  br i1 %11324, label %11325, label %11326

11325:                                            ; preds = %11321, %11317, %11313, %11306
  store i1 false, ptr %455, align 1
  br label %11449

11326:                                            ; preds = %11321
  br label %11327

11327:                                            ; preds = %11326, %11303
  %11328 = load i64, ptr %457, align 8
  %11329 = icmp ult i64 27, %11328
  br i1 %11329, label %11330, label %11351

11330:                                            ; preds = %11327
  %11331 = load ptr, ptr %456, align 8
  %11332 = getelementptr inbounds i8, ptr %11331, i64 27
  %11333 = load i8, ptr %11332, align 1
  store i8 %11333, ptr %485, align 1
  %11334 = load i8, ptr %485, align 1
  %11335 = sext i8 %11334 to i32
  %11336 = icmp slt i32 %11335, 32
  br i1 %11336, label %11349, label %11337

11337:                                            ; preds = %11330
  %11338 = load i8, ptr %485, align 1
  %11339 = sext i8 %11338 to i32
  %11340 = icmp sgt i32 %11339, 126
  br i1 %11340, label %11349, label %11341

11341:                                            ; preds = %11337
  %11342 = load i8, ptr %485, align 1
  %11343 = sext i8 %11342 to i32
  %11344 = icmp eq i32 %11343, 34
  br i1 %11344, label %11349, label %11345

11345:                                            ; preds = %11341
  %11346 = load i8, ptr %485, align 1
  %11347 = sext i8 %11346 to i32
  %11348 = icmp eq i32 %11347, 92
  br i1 %11348, label %11349, label %11350

11349:                                            ; preds = %11345, %11341, %11337, %11330
  store i1 false, ptr %455, align 1
  br label %11449

11350:                                            ; preds = %11345
  br label %11351

11351:                                            ; preds = %11350, %11327
  %11352 = load i64, ptr %457, align 8
  %11353 = icmp ult i64 28, %11352
  br i1 %11353, label %11354, label %11375

11354:                                            ; preds = %11351
  %11355 = load ptr, ptr %456, align 8
  %11356 = getelementptr inbounds i8, ptr %11355, i64 28
  %11357 = load i8, ptr %11356, align 1
  store i8 %11357, ptr %486, align 1
  %11358 = load i8, ptr %486, align 1
  %11359 = sext i8 %11358 to i32
  %11360 = icmp slt i32 %11359, 32
  br i1 %11360, label %11373, label %11361

11361:                                            ; preds = %11354
  %11362 = load i8, ptr %486, align 1
  %11363 = sext i8 %11362 to i32
  %11364 = icmp sgt i32 %11363, 126
  br i1 %11364, label %11373, label %11365

11365:                                            ; preds = %11361
  %11366 = load i8, ptr %486, align 1
  %11367 = sext i8 %11366 to i32
  %11368 = icmp eq i32 %11367, 34
  br i1 %11368, label %11373, label %11369

11369:                                            ; preds = %11365
  %11370 = load i8, ptr %486, align 1
  %11371 = sext i8 %11370 to i32
  %11372 = icmp eq i32 %11371, 92
  br i1 %11372, label %11373, label %11374

11373:                                            ; preds = %11369, %11365, %11361, %11354
  store i1 false, ptr %455, align 1
  br label %11449

11374:                                            ; preds = %11369
  br label %11375

11375:                                            ; preds = %11374, %11351
  %11376 = load i64, ptr %457, align 8
  %11377 = icmp ult i64 29, %11376
  br i1 %11377, label %11378, label %11399

11378:                                            ; preds = %11375
  %11379 = load ptr, ptr %456, align 8
  %11380 = getelementptr inbounds i8, ptr %11379, i64 29
  %11381 = load i8, ptr %11380, align 1
  store i8 %11381, ptr %487, align 1
  %11382 = load i8, ptr %487, align 1
  %11383 = sext i8 %11382 to i32
  %11384 = icmp slt i32 %11383, 32
  br i1 %11384, label %11397, label %11385

11385:                                            ; preds = %11378
  %11386 = load i8, ptr %487, align 1
  %11387 = sext i8 %11386 to i32
  %11388 = icmp sgt i32 %11387, 126
  br i1 %11388, label %11397, label %11389

11389:                                            ; preds = %11385
  %11390 = load i8, ptr %487, align 1
  %11391 = sext i8 %11390 to i32
  %11392 = icmp eq i32 %11391, 34
  br i1 %11392, label %11397, label %11393

11393:                                            ; preds = %11389
  %11394 = load i8, ptr %487, align 1
  %11395 = sext i8 %11394 to i32
  %11396 = icmp eq i32 %11395, 92
  br i1 %11396, label %11397, label %11398

11397:                                            ; preds = %11393, %11389, %11385, %11378
  store i1 false, ptr %455, align 1
  br label %11449

11398:                                            ; preds = %11393
  br label %11399

11399:                                            ; preds = %11398, %11375
  %11400 = load i64, ptr %457, align 8
  %11401 = icmp ult i64 30, %11400
  br i1 %11401, label %11402, label %11423

11402:                                            ; preds = %11399
  %11403 = load ptr, ptr %456, align 8
  %11404 = getelementptr inbounds i8, ptr %11403, i64 30
  %11405 = load i8, ptr %11404, align 1
  store i8 %11405, ptr %488, align 1
  %11406 = load i8, ptr %488, align 1
  %11407 = sext i8 %11406 to i32
  %11408 = icmp slt i32 %11407, 32
  br i1 %11408, label %11421, label %11409

11409:                                            ; preds = %11402
  %11410 = load i8, ptr %488, align 1
  %11411 = sext i8 %11410 to i32
  %11412 = icmp sgt i32 %11411, 126
  br i1 %11412, label %11421, label %11413

11413:                                            ; preds = %11409
  %11414 = load i8, ptr %488, align 1
  %11415 = sext i8 %11414 to i32
  %11416 = icmp eq i32 %11415, 34
  br i1 %11416, label %11421, label %11417

11417:                                            ; preds = %11413
  %11418 = load i8, ptr %488, align 1
  %11419 = sext i8 %11418 to i32
  %11420 = icmp eq i32 %11419, 92
  br i1 %11420, label %11421, label %11422

11421:                                            ; preds = %11417, %11413, %11409, %11402
  store i1 false, ptr %455, align 1
  br label %11449

11422:                                            ; preds = %11417
  br label %11423

11423:                                            ; preds = %11422, %11399
  %11424 = load i64, ptr %457, align 8
  %11425 = icmp ult i64 31, %11424
  br i1 %11425, label %11426, label %11447

11426:                                            ; preds = %11423
  %11427 = load ptr, ptr %456, align 8
  %11428 = getelementptr inbounds i8, ptr %11427, i64 31
  %11429 = load i8, ptr %11428, align 1
  store i8 %11429, ptr %489, align 1
  %11430 = load i8, ptr %489, align 1
  %11431 = sext i8 %11430 to i32
  %11432 = icmp slt i32 %11431, 32
  br i1 %11432, label %11445, label %11433

11433:                                            ; preds = %11426
  %11434 = load i8, ptr %489, align 1
  %11435 = sext i8 %11434 to i32
  %11436 = icmp sgt i32 %11435, 126
  br i1 %11436, label %11445, label %11437

11437:                                            ; preds = %11433
  %11438 = load i8, ptr %489, align 1
  %11439 = sext i8 %11438 to i32
  %11440 = icmp eq i32 %11439, 34
  br i1 %11440, label %11445, label %11441

11441:                                            ; preds = %11437
  %11442 = load i8, ptr %489, align 1
  %11443 = sext i8 %11442 to i32
  %11444 = icmp eq i32 %11443, 92
  br i1 %11444, label %11445, label %11446

11445:                                            ; preds = %11441, %11437, %11433, %11426
  store i1 false, ptr %455, align 1
  br label %11449

11446:                                            ; preds = %11441
  br label %11447

11447:                                            ; preds = %11446, %11423
  store i1 true, ptr %455, align 1
  br label %11449

11448:                                            ; preds = %10677, %10668
  store i1 false, ptr %455, align 1
  br label %11449

11449:                                            ; preds = %10701, %10725, %10749, %10773, %10797, %10821, %10845, %10869, %10893, %10917, %10941, %10965, %10989, %11013, %11037, %11061, %11085, %11109, %11133, %11157, %11181, %11205, %11229, %11253, %11277, %11301, %11325, %11349, %11373, %11397, %11421, %11445, %11447, %11448
  %11450 = load i1, ptr %455, align 1
  %11451 = zext i1 %11450 to i8
  store i8 %11451, ptr %493, align 1
  %11452 = load i8, ptr %493, align 1
  %11453 = trunc i8 %11452 to i1
  %11454 = zext i1 %11453 to i64
  %11455 = select i1 %11453, i32 8, i32 0
  %11456 = trunc i32 %11455 to i8
  store i8 %11456, ptr %494, align 1
  %11457 = load ptr, ptr %490, align 8
  %11458 = load i8, ptr %494, align 1
  %11459 = load i64, ptr %492, align 8
  store ptr %11457, ptr %135, align 8
  store i8 5, ptr %136, align 1
  store i8 %11458, ptr %137, align 1
  store i64 %11459, ptr %138, align 8
  %11460 = load i64, ptr %138, align 8
  %11461 = shl i64 %11460, 8
  store i64 %11461, ptr %139, align 8
  %11462 = load i8, ptr %136, align 1
  %11463 = zext i8 %11462 to i32
  %11464 = load i8, ptr %137, align 1
  %11465 = zext i8 %11464 to i32
  %11466 = or i32 %11463, %11465
  %11467 = sext i32 %11466 to i64
  %11468 = load i64, ptr %139, align 8
  %11469 = or i64 %11468, %11467
  store i64 %11469, ptr %139, align 8
  %11470 = load i64, ptr %139, align 8
  %11471 = load ptr, ptr %135, align 8
  store i64 %11470, ptr %11471, align 8
  %11472 = load ptr, ptr %491, align 8
  %11473 = load ptr, ptr %490, align 8
  %11474 = getelementptr inbounds nuw %struct.yyjson_val, ptr %11473, i32 0, i32 1
  store ptr %11472, ptr %11474, align 8
  %11475 = load ptr, ptr %885, align 8
  store ptr %11475, ptr %882, align 8
  br label %11478

11476:                                            ; preds = %10661
  br label %11477

11477:                                            ; preds = %11476, %10617
  store ptr null, ptr %882, align 8
  br label %11478

11478:                                            ; preds = %11449, %11477
  %11479 = load ptr, ptr %882, align 8
  store ptr %9740, ptr %915, align 8
  store ptr %10609, ptr %916, align 8
  store ptr %11479, ptr %917, align 8
  %11480 = load ptr, ptr %915, align 8
  store ptr %11480, ptr %683, align 8
  %11481 = load ptr, ptr %683, align 8
  %11482 = icmp ne ptr %11481, null
  br i1 %11482, label %11483, label %11496

11483:                                            ; preds = %11478
  %11484 = load ptr, ptr %683, align 8
  store ptr %11484, ptr %615, align 8
  %11485 = load ptr, ptr %615, align 8
  store ptr %11485, ptr %592, align 8
  %11486 = load ptr, ptr %592, align 8
  %11487 = load i64, ptr %11486, align 8
  %11488 = trunc i64 %11487 to i8
  store i8 %11488, ptr %593, align 1
  %11489 = load i8, ptr %593, align 1
  %11490 = zext i8 %11489 to i32
  %11491 = and i32 %11490, 7
  %11492 = trunc i32 %11491 to i8
  %11493 = zext i8 %11492 to i32
  %11494 = icmp eq i32 %11493, 7
  %11495 = zext i1 %11494 to i32
  br label %11497

11496:                                            ; preds = %11478
  br label %11497

11497:                                            ; preds = %11483, %11496
  %11498 = phi i32 [ %11495, %11483 ], [ 0, %11496 ]
  %11499 = icmp ne i32 %11498, 0
  br i1 %11499, label %11500, label %11524

11500:                                            ; preds = %11497
  %11501 = load ptr, ptr %916, align 8
  store ptr %11501, ptr %675, align 8
  %11502 = load ptr, ptr %675, align 8
  %11503 = icmp ne ptr %11502, null
  br i1 %11503, label %11504, label %11517

11504:                                            ; preds = %11500
  %11505 = load ptr, ptr %675, align 8
  store ptr %11505, ptr %591, align 8
  %11506 = load ptr, ptr %591, align 8
  store ptr %11506, ptr %589, align 8
  %11507 = load ptr, ptr %589, align 8
  %11508 = load i64, ptr %11507, align 8
  %11509 = trunc i64 %11508 to i8
  store i8 %11509, ptr %590, align 1
  %11510 = load i8, ptr %590, align 1
  %11511 = zext i8 %11510 to i32
  %11512 = and i32 %11511, 7
  %11513 = trunc i32 %11512 to i8
  %11514 = zext i8 %11513 to i32
  %11515 = icmp eq i32 %11514, 5
  %11516 = zext i1 %11515 to i32
  br label %11518

11517:                                            ; preds = %11500
  br label %11518

11518:                                            ; preds = %11504, %11517
  %11519 = phi i32 [ %11516, %11504 ], [ 0, %11517 ]
  %11520 = icmp ne i32 %11519, 0
  br i1 %11520, label %11521, label %11524

11521:                                            ; preds = %11518
  %11522 = load ptr, ptr %917, align 8
  %11523 = icmp ne ptr %11522, null
  br label %11524

11524:                                            ; preds = %11521, %11518, %11497
  %11525 = phi i1 [ false, %11518 ], [ false, %11497 ], [ %11523, %11521 ]
  %11526 = xor i1 %11525, true
  %11527 = zext i1 %11525 to i32
  %11528 = sext i32 %11527 to i64
  br i1 %11525, label %11529, label %11580

11529:                                            ; preds = %11524
  %11530 = load ptr, ptr %915, align 8
  %11531 = load ptr, ptr %916, align 8
  %11532 = load ptr, ptr %917, align 8
  %11533 = load ptr, ptr %915, align 8
  store ptr %11533, ptr %616, align 8
  %11534 = load ptr, ptr %616, align 8
  %11535 = load i64, ptr %11534, align 8
  %11536 = lshr i64 %11535, 8
  store ptr %11530, ptr %627, align 8
  store ptr %11531, ptr %628, align 8
  store ptr %11532, ptr %629, align 8
  store i64 %11536, ptr %630, align 8
  %11537 = load i64, ptr %630, align 8
  %11538 = icmp ne i64 %11537, 0
  %11539 = xor i1 %11538, true
  %11540 = zext i1 %11538 to i32
  %11541 = sext i32 %11540 to i64
  br i1 %11538, label %11542, label %11557

11542:                                            ; preds = %11529
  %11543 = load ptr, ptr %627, align 8
  %11544 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11543, i32 0, i32 1
  %11545 = load ptr, ptr %11544, align 8
  %11546 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11545, i32 0, i32 2
  %11547 = load ptr, ptr %11546, align 8
  store ptr %11547, ptr %631, align 8
  %11548 = load ptr, ptr %631, align 8
  %11549 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11548, i32 0, i32 2
  %11550 = load ptr, ptr %11549, align 8
  store ptr %11550, ptr %632, align 8
  %11551 = load ptr, ptr %628, align 8
  %11552 = load ptr, ptr %631, align 8
  %11553 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11552, i32 0, i32 2
  store ptr %11551, ptr %11553, align 8
  %11554 = load ptr, ptr %632, align 8
  %11555 = load ptr, ptr %629, align 8
  %11556 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11555, i32 0, i32 2
  store ptr %11554, ptr %11556, align 8
  br label %11561

11557:                                            ; preds = %11529
  %11558 = load ptr, ptr %628, align 8
  %11559 = load ptr, ptr %629, align 8
  %11560 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11559, i32 0, i32 2
  store ptr %11558, ptr %11560, align 8
  br label %11561

11561:                                            ; preds = %11542, %11557
  %11562 = load ptr, ptr %629, align 8
  %11563 = load ptr, ptr %628, align 8
  %11564 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11563, i32 0, i32 2
  store ptr %11562, ptr %11564, align 8
  %11565 = load ptr, ptr %628, align 8
  %11566 = load ptr, ptr %627, align 8
  %11567 = getelementptr inbounds nuw %struct.yyjson_mut_val, ptr %11566, i32 0, i32 1
  store ptr %11565, ptr %11567, align 8
  %11568 = load ptr, ptr %627, align 8
  %11569 = load i64, ptr %630, align 8
  %11570 = add i64 %11569, 1
  store ptr %11568, ptr %565, align 8
  store i64 %11570, ptr %566, align 8
  %11571 = load ptr, ptr %565, align 8
  %11572 = load i64, ptr %11571, align 8
  %11573 = and i64 %11572, 255
  store i64 %11573, ptr %567, align 8
  %11574 = load i64, ptr %566, align 8
  %11575 = shl i64 %11574, 8
  %11576 = load i64, ptr %567, align 8
  %11577 = or i64 %11576, %11575
  store i64 %11577, ptr %567, align 8
  %11578 = load i64, ptr %567, align 8
  %11579 = load ptr, ptr %565, align 8
  store i64 %11578, ptr %11579, align 8
  store i1 true, ptr %914, align 1
  br label %11581

11580:                                            ; preds = %11524
  store i1 false, ptr %914, align 1
  br label %11581

11581:                                            ; preds = %11561, %11580
  %11582 = load i1, ptr %914, align 1
  %11583 = load ptr, ptr %938, align 8
  store ptr %11583, ptr %799, align 8
  store i32 0, ptr %800, align 4
  store ptr null, ptr %801, align 8
  %11584 = load ptr, ptr %799, align 8
  %11585 = load i32, ptr %800, align 4
  %11586 = load ptr, ptr %801, align 8
  %11587 = call ptr @yyjson_mut_write_opts(ptr noundef %11584, i32 noundef %11585, ptr noundef null, ptr noundef %11586, ptr noundef null)
  %11588 = load ptr, ptr %937, align 8
  %11589 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11588, i32 0, i32 2
  store ptr %11587, ptr %11589, align 8
  %11590 = load ptr, ptr %937, align 8
  %11591 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11590, i32 0, i32 2
  %11592 = load ptr, ptr %11591, align 8
  %11593 = icmp ne ptr %11592, null
  br i1 %11593, label %11594, label %11611

11594:                                            ; preds = %11581
  %11595 = load ptr, ptr %937, align 8
  %11596 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11595, i32 0, i32 2
  %11597 = load ptr, ptr %11596, align 8
  %11598 = call i64 @strlen(ptr noundef %11597)
  %11599 = icmp uge i64 %11598, 15
  br i1 %11599, label %11600, label %11611

11600:                                            ; preds = %11594
  %11601 = load ptr, ptr %937, align 8
  %11602 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11601, i32 0, i32 2
  %11603 = load ptr, ptr %11602, align 8
  %11604 = call i32 @strncmp(ptr noundef %11603, ptr noundef @.str.9, i64 noundef 15)
  %11605 = icmp eq i32 %11604, 0
  br i1 %11605, label %11606, label %11611

11606:                                            ; preds = %11600
  %11607 = load ptr, ptr %937, align 8
  %11608 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11607, i32 0, i32 3
  %11609 = load i32, ptr %11608, align 8
  %11610 = add i32 %11609, 1
  store i32 %11610, ptr %11608, align 8
  br label %11611

11611:                                            ; preds = %11606, %11600, %11594, %11581
  %11612 = load ptr, ptr %938, align 8
  call void @yyjson_mut_doc_free(ptr noundef %11612)
  br label %11613

11613:                                            ; preds = %11611, %964
  ret void
}

declare ptr @yyjson_mut_doc_new(ptr noundef)

declare i64 @strlen(ptr noundef)

declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef)

declare void @yyjson_mut_doc_free(ptr noundef)

define dso_local i32 @JsonGenerate_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @JsonGenerate_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %28

22:                                               ; preds = %17
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %25)
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %26, i32 0, i32 2
  store ptr null, ptr %27, align 8
  br label %28

28:                                               ; preds = %22, %17
  ret void
}

define dso_local ptr @JsonGenerate_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.10)
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
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i64 @Helper_config_i64(ptr noundef %11, ptr noundef @.str.11)
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %13, i32 0, i32 1
  store i64 %12, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 3
  store ptr @JsonGenerate_prepare, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 4
  store ptr @JsonGenerate_run, ptr %18, align 8
  %19 = load ptr, ptr %1, align 8
  %20 = getelementptr inbounds nuw %struct.Benchmark, ptr %19, i32 0, i32 7
  store ptr @JsonGenerate_checksum, ptr %20, align 8
  %21 = load ptr, ptr %1, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 10
  store ptr @JsonGenerate_cleanup, ptr %22, align 8
  %23 = load ptr, ptr %1, align 8
  ret ptr %23
}

declare ptr @Benchmark_create(ptr noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local ptr @JsonGenerate_get_result(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = call noalias ptr @strdup(ptr noundef %14)
  br label %17

16:                                               ; preds = %1
  br label %17

17:                                               ; preds = %16, %11
  %18 = phi ptr [ %15, %11 ], [ null, %16 ]
  ret ptr %18
}

declare noalias ptr @strdup(ptr noundef)

define dso_local void @JsonParseDom_prepare(ptr noundef %0) {
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
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.11)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %11, i32 0, i32 2
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %13, i32 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = call ptr @generate_json_for_parsing(i64 noundef %15)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %17, i32 0, i32 0
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %19, i32 0, i32 1
  store i32 0, ptr %20, align 8
  ret void
}

define internal ptr @generate_json_for_parsing(i64 noundef %0) {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %6 = call ptr @JsonGenerate_create()
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %4, align 8
  %10 = load i64, ptr %2, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %11, i32 0, i32 1
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 3
  %15 = load ptr, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  call void %15(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 4
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %3, align 8
  call void %19(ptr noundef %20, i32 noundef 0)
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.JsonGenerateData, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = call noalias ptr @strdup(ptr noundef %23)
  store ptr %24, ptr %5, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 10
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr %3, align 8
  call void %27(ptr noundef %28)
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.Benchmark, ptr %29, i32 0, i32 11
  %31 = load ptr, ptr %30, align 8
  call void @free(ptr noundef %31)
  %32 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %32)
  %33 = load ptr, ptr %5, align 8
  ret ptr %33
}

define dso_local void @JsonParseDom_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca i8, align 1
  %13 = alloca ptr, align 8
  %14 = alloca i8, align 1
  %15 = alloca ptr, align 8
  %16 = alloca i8, align 1
  %17 = alloca ptr, align 8
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 8
  %20 = alloca i8, align 1
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i8, align 1
  %28 = alloca ptr, align 8
  %29 = alloca i8, align 1
  %30 = alloca ptr, align 8
  %31 = alloca i8, align 1
  %32 = alloca double, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i8, align 1
  %35 = alloca double, align 8
  %36 = alloca ptr, align 8
  %37 = alloca i8, align 1
  %38 = alloca double, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i8, align 1
  %41 = alloca ptr, align 8
  %42 = alloca i8, align 1
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca i8, align 1
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i8, align 1
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i64, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca i64, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca i64, align 8
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca i64, align 8
  %66 = alloca ptr, align 8
  %67 = alloca ptr, align 8
  %68 = alloca ptr, align 8
  %69 = alloca ptr, align 8
  %70 = alloca ptr, align 8
  %71 = alloca ptr, align 8
  %72 = alloca i8, align 1
  %73 = alloca ptr, align 8
  %74 = alloca ptr, align 8
  %75 = alloca ptr, align 8
  %76 = alloca i8, align 1
  %77 = alloca i64, align 8
  %78 = alloca i64, align 8
  %79 = alloca ptr, align 8
  %80 = alloca ptr, align 8
  %81 = alloca ptr, align 8
  %82 = alloca ptr, align 8
  %83 = alloca ptr, align 8
  %84 = alloca i64, align 8
  %85 = alloca i64, align 8
  %86 = alloca ptr, align 8
  %87 = alloca ptr, align 8
  %88 = alloca i8, align 1
  %89 = alloca ptr, align 8
  %90 = alloca ptr, align 8
  %91 = alloca ptr, align 8
  %92 = alloca i8, align 1
  %93 = alloca i64, align 8
  %94 = alloca i64, align 8
  %95 = alloca ptr, align 8
  %96 = alloca ptr, align 8
  %97 = alloca ptr, align 8
  %98 = alloca ptr, align 8
  %99 = alloca ptr, align 8
  %100 = alloca i64, align 8
  %101 = alloca i64, align 8
  %102 = alloca ptr, align 8
  %103 = alloca ptr, align 8
  %104 = alloca i8, align 1
  %105 = alloca ptr, align 8
  %106 = alloca ptr, align 8
  %107 = alloca ptr, align 8
  %108 = alloca i8, align 1
  %109 = alloca i64, align 8
  %110 = alloca i64, align 8
  %111 = alloca ptr, align 8
  %112 = alloca ptr, align 8
  %113 = alloca ptr, align 8
  %114 = alloca ptr, align 8
  %115 = alloca ptr, align 8
  %116 = alloca i64, align 8
  %117 = alloca i64, align 8
  %118 = alloca ptr, align 8
  %119 = alloca ptr, align 8
  %120 = alloca i8, align 1
  %121 = alloca ptr, align 8
  %122 = alloca ptr, align 8
  %123 = alloca ptr, align 8
  %124 = alloca i8, align 1
  %125 = alloca i64, align 8
  %126 = alloca i64, align 8
  %127 = alloca ptr, align 8
  %128 = alloca ptr, align 8
  %129 = alloca ptr, align 8
  %130 = alloca ptr, align 8
  %131 = alloca ptr, align 8
  %132 = alloca i64, align 8
  %133 = alloca i64, align 8
  %134 = alloca ptr, align 8
  %135 = alloca ptr, align 8
  %136 = alloca i8, align 1
  %137 = alloca ptr, align 8
  %138 = alloca ptr, align 8
  %139 = alloca i8, align 1
  %140 = alloca ptr, align 8
  %141 = alloca ptr, align 8
  %142 = alloca i8, align 1
  %143 = alloca ptr, align 8
  %144 = alloca ptr, align 8
  %145 = alloca i8, align 1
  %146 = alloca ptr, align 8
  %147 = alloca ptr, align 8
  %148 = alloca ptr, align 8
  %149 = alloca ptr, align 8
  %150 = alloca i8, align 1
  %151 = alloca i64, align 8
  %152 = alloca i64, align 8
  %153 = alloca ptr, align 8
  %154 = alloca ptr, align 8
  %155 = alloca ptr, align 8
  %156 = alloca ptr, align 8
  %157 = alloca ptr, align 8
  %158 = alloca ptr, align 8
  %159 = alloca ptr, align 8
  %160 = alloca ptr, align 8
  %161 = alloca ptr, align 8
  %162 = alloca ptr, align 8
  %163 = alloca ptr, align 8
  %164 = alloca ptr, align 8
  %165 = alloca ptr, align 8
  %166 = alloca ptr, align 8
  %167 = alloca ptr, align 8
  %168 = alloca ptr, align 8
  %169 = alloca ptr, align 8
  %170 = alloca ptr, align 8
  %171 = alloca ptr, align 8
  %172 = alloca ptr, align 8
  %173 = alloca ptr, align 8
  %174 = alloca ptr, align 8
  %175 = alloca ptr, align 8
  %176 = alloca %struct.yyjson_alc, align 8
  %177 = alloca ptr, align 8
  %178 = alloca %struct.yyjson_alc, align 8
  %179 = alloca ptr, align 8
  %180 = alloca %struct.yyjson_alc, align 8
  %181 = alloca ptr, align 8
  %182 = alloca ptr, align 8
  %183 = alloca i64, align 8
  %184 = alloca i32, align 4
  %185 = alloca ptr, align 8
  %186 = alloca i32, align 4
  %187 = alloca ptr, align 8
  %188 = alloca ptr, align 8
  %189 = alloca ptr, align 8
  %190 = alloca ptr, align 8
  %191 = alloca double, align 8
  %192 = alloca double, align 8
  %193 = alloca double, align 8
  %194 = alloca i64, align 8
  %195 = alloca ptr, align 8
  %196 = alloca i64, align 8
  %197 = alloca i64, align 8
  %198 = alloca ptr, align 8
  %199 = alloca ptr, align 8
  %200 = alloca ptr, align 8
  %201 = alloca double, align 8
  %202 = alloca double, align 8
  %203 = alloca double, align 8
  %204 = alloca i32, align 4
  store ptr %0, ptr %185, align 8
  store i32 %1, ptr %186, align 4
  %205 = load i32, ptr %186, align 4
  %206 = load ptr, ptr %185, align 8
  %207 = getelementptr inbounds nuw %struct.Benchmark, ptr %206, i32 0, i32 11
  %208 = load ptr, ptr %207, align 8
  store ptr %208, ptr %187, align 8
  %209 = load ptr, ptr %187, align 8
  %210 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %209, i32 0, i32 0
  %211 = load ptr, ptr %210, align 8
  %212 = load ptr, ptr %187, align 8
  %213 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %212, i32 0, i32 0
  %214 = load ptr, ptr %213, align 8
  %215 = call i64 @strlen(ptr noundef %214)
  store ptr %211, ptr %182, align 8
  store i64 %215, ptr %183, align 8
  store i32 0, ptr %184, align 4
  %216 = load i32, ptr %184, align 4
  %217 = and i32 %216, -2
  store i32 %217, ptr %184, align 4
  %218 = load ptr, ptr %182, align 8
  %219 = ptrtoint ptr %218 to i64
  %220 = load i64, ptr %183, align 8
  %221 = load i32, ptr %184, align 4
  %222 = call ptr @yyjson_read_opts(ptr noundef %218, i64 noundef %220, i32 noundef %221, ptr noundef null, ptr noundef null)
  store ptr %222, ptr %188, align 8
  %223 = load ptr, ptr %188, align 8
  %224 = icmp ne ptr %223, null
  br i1 %224, label %226, label %225

225:                                              ; preds = %2
  br label %1181

226:                                              ; preds = %2
  %227 = load ptr, ptr %188, align 8
  store ptr %227, ptr %181, align 8
  %228 = load ptr, ptr %181, align 8
  %229 = icmp ne ptr %228, null
  br i1 %229, label %230, label %233

230:                                              ; preds = %226
  %231 = load ptr, ptr %181, align 8
  %232 = load ptr, ptr %231, align 8
  br label %234

233:                                              ; preds = %226
  br label %234

234:                                              ; preds = %230, %233
  %235 = phi ptr [ %232, %230 ], [ null, %233 ]
  store ptr %235, ptr %189, align 8
  %236 = load ptr, ptr %189, align 8
  %237 = icmp ne ptr %236, null
  br i1 %237, label %266, label %238

238:                                              ; preds = %234
  %239 = load ptr, ptr %188, align 8
  store ptr %239, ptr %175, align 8
  %240 = load ptr, ptr %175, align 8
  %241 = icmp ne ptr %240, null
  br i1 %241, label %242, label %265

242:                                              ; preds = %238
  %243 = load ptr, ptr %175, align 8
  %244 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %243, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %176, ptr align 8 %244, i64 32, i1 false)
  %245 = load ptr, ptr %175, align 8
  %246 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %245, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %246, i8 0, i64 32, i1 false)
  %247 = load ptr, ptr %175, align 8
  %248 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %247, i32 0, i32 4
  %249 = load ptr, ptr %248, align 8
  %250 = icmp ne ptr %249, null
  br i1 %250, label %251, label %259

251:                                              ; preds = %242
  %252 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %176, i32 0, i32 2
  %253 = load ptr, ptr %252, align 8
  %254 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %176, i32 0, i32 3
  %255 = load ptr, ptr %254, align 8
  %256 = load ptr, ptr %175, align 8
  %257 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %256, i32 0, i32 4
  %258 = load ptr, ptr %257, align 8
  call void %253(ptr noundef %255, ptr noundef %258)
  br label %259

259:                                              ; preds = %251, %242
  %260 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %176, i32 0, i32 2
  %261 = load ptr, ptr %260, align 8
  %262 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %176, i32 0, i32 3
  %263 = load ptr, ptr %262, align 8
  %264 = load ptr, ptr %175, align 8
  call void %261(ptr noundef %263, ptr noundef %264)
  br label %265

265:                                              ; preds = %238, %259
  br label %1181

266:                                              ; preds = %234
  %267 = load ptr, ptr %189, align 8
  store ptr %267, ptr %167, align 8
  store ptr @.str.1, ptr %168, align 8
  %268 = load ptr, ptr %167, align 8
  %269 = load ptr, ptr %168, align 8
  %270 = load ptr, ptr %168, align 8
  %271 = icmp ne ptr %270, null
  br i1 %271, label %272, label %275

272:                                              ; preds = %266
  %273 = load ptr, ptr %168, align 8
  %274 = call i64 @strlen(ptr noundef %273)
  br label %276

275:                                              ; preds = %266
  br label %276

276:                                              ; preds = %272, %275
  %277 = phi i64 [ %274, %272 ], [ 0, %275 ]
  store ptr %268, ptr %130, align 8
  store ptr %269, ptr %131, align 8
  store i64 %277, ptr %132, align 8
  %278 = load ptr, ptr %130, align 8
  store ptr %278, ptr %128, align 8
  %279 = load ptr, ptr %128, align 8
  %280 = icmp ne ptr %279, null
  br i1 %280, label %281, label %294

281:                                              ; preds = %276
  %282 = load ptr, ptr %128, align 8
  store ptr %282, ptr %121, align 8
  %283 = load ptr, ptr %121, align 8
  store ptr %283, ptr %119, align 8
  %284 = load ptr, ptr %119, align 8
  %285 = load i64, ptr %284, align 8
  %286 = trunc i64 %285 to i8
  store i8 %286, ptr %120, align 1
  %287 = load i8, ptr %120, align 1
  %288 = zext i8 %287 to i32
  %289 = and i32 %288, 7
  %290 = trunc i32 %289 to i8
  %291 = zext i8 %290 to i32
  %292 = icmp eq i32 %291, 7
  %293 = zext i1 %292 to i32
  br label %295

294:                                              ; preds = %276
  br label %295

295:                                              ; preds = %294, %281
  %296 = phi i32 [ %293, %281 ], [ 0, %294 ]
  %297 = icmp ne i32 %296, 0
  br i1 %297, label %298, label %301

298:                                              ; preds = %295
  %299 = load ptr, ptr %131, align 8
  %300 = icmp ne ptr %299, null
  br label %301

301:                                              ; preds = %298, %295
  %302 = phi i1 [ false, %295 ], [ %300, %298 ]
  %303 = xor i1 %302, true
  %304 = zext i1 %302 to i32
  %305 = sext i32 %304 to i64
  br i1 %302, label %306, label %378

306:                                              ; preds = %301
  %307 = load ptr, ptr %130, align 8
  store ptr %307, ptr %122, align 8
  %308 = load ptr, ptr %122, align 8
  %309 = load i64, ptr %308, align 8
  %310 = lshr i64 %309, 8
  store i64 %310, ptr %133, align 8
  %311 = load ptr, ptr %130, align 8
  store ptr %311, ptr %67, align 8
  %312 = load ptr, ptr %67, align 8
  %313 = ptrtoint ptr %312 to i64
  %314 = getelementptr inbounds %struct.yyjson_val, ptr %312, i64 1
  store ptr %314, ptr %134, align 8
  br label %315

315:                                              ; preds = %370, %306
  %316 = load i64, ptr %133, align 8
  %317 = add i64 %316, -1
  store i64 %317, ptr %133, align 8
  %318 = icmp ugt i64 %316, 0
  br i1 %318, label %319, label %377

319:                                              ; preds = %315
  %320 = load ptr, ptr %134, align 8
  %321 = load ptr, ptr %131, align 8
  %322 = load i64, ptr %132, align 8
  store ptr %320, ptr %51, align 8
  store ptr %321, ptr %52, align 8
  store i64 %322, ptr %53, align 8
  %323 = load ptr, ptr %51, align 8
  store ptr %323, ptr %50, align 8
  %324 = load ptr, ptr %50, align 8
  %325 = load i64, ptr %324, align 8
  %326 = lshr i64 %325, 8
  %327 = load i64, ptr %53, align 8
  %328 = icmp eq i64 %326, %327
  br i1 %328, label %329, label %337

329:                                              ; preds = %319
  %330 = load ptr, ptr %51, align 8
  %331 = getelementptr inbounds nuw %struct.yyjson_val, ptr %330, i32 0, i32 1
  %332 = load ptr, ptr %331, align 8
  %333 = load ptr, ptr %52, align 8
  %334 = load i64, ptr %53, align 8
  %335 = call i32 @memcmp(ptr noundef %332, ptr noundef %333, i64 noundef %334)
  %336 = icmp eq i32 %335, 0
  br label %337

337:                                              ; preds = %319, %329
  %338 = phi i1 [ false, %319 ], [ %336, %329 ]
  br i1 %338, label %339, label %342

339:                                              ; preds = %337
  %340 = load ptr, ptr %134, align 8
  %341 = getelementptr inbounds %struct.yyjson_val, ptr %340, i64 1
  store ptr %341, ptr %129, align 8
  br label %379

342:                                              ; preds = %337
  %343 = load ptr, ptr %134, align 8
  %344 = getelementptr inbounds %struct.yyjson_val, ptr %343, i64 1
  store ptr %344, ptr %123, align 8
  %345 = load ptr, ptr %123, align 8
  store ptr %345, ptr %9, align 8
  store i8 6, ptr %10, align 1
  %346 = load ptr, ptr %9, align 8
  store ptr %346, ptr %7, align 8
  %347 = load ptr, ptr %7, align 8
  %348 = load i64, ptr %347, align 8
  %349 = trunc i64 %348 to i8
  store i8 %349, ptr %8, align 1
  %350 = load i8, ptr %8, align 1
  %351 = zext i8 %350 to i32
  %352 = and i32 %351, 255
  %353 = trunc i32 %352 to i8
  %354 = zext i8 %353 to i32
  %355 = load i8, ptr %10, align 1
  %356 = zext i8 %355 to i32
  %357 = and i32 %354, %356
  %358 = load i8, ptr %10, align 1
  %359 = zext i8 %358 to i32
  %360 = icmp eq i32 %357, %359
  %361 = zext i1 %360 to i8
  store i8 %361, ptr %124, align 1
  %362 = load ptr, ptr %123, align 8
  %363 = getelementptr inbounds nuw %struct.yyjson_val, ptr %362, i32 0, i32 1
  %364 = load i64, ptr %363, align 8
  store i64 %364, ptr %125, align 8
  %365 = load i8, ptr %124, align 1
  %366 = trunc i8 %365 to i1
  br i1 %366, label %367, label %369

367:                                              ; preds = %342
  %368 = load i64, ptr %125, align 8
  br label %370

369:                                              ; preds = %342
  br label %370

370:                                              ; preds = %369, %367
  %371 = phi i64 [ %368, %367 ], [ 16, %369 ]
  store i64 %371, ptr %126, align 8
  %372 = load ptr, ptr %123, align 8
  %373 = ptrtoint ptr %372 to i64
  store ptr %372, ptr %127, align 8
  %374 = load ptr, ptr %127, align 8
  %375 = load i64, ptr %126, align 8
  %376 = getelementptr inbounds nuw i8, ptr %374, i64 %375
  store ptr %376, ptr %134, align 8
  br label %315, !llvm.loop !9

377:                                              ; preds = %315
  br label %378

378:                                              ; preds = %377, %301
  store ptr null, ptr %129, align 8
  br label %379

379:                                              ; preds = %339, %378
  %380 = load ptr, ptr %129, align 8
  store ptr %380, ptr %190, align 8
  %381 = load ptr, ptr %190, align 8
  %382 = icmp ne ptr %381, null
  br i1 %382, label %383, label %404

383:                                              ; preds = %379
  %384 = load ptr, ptr %190, align 8
  store ptr %384, ptr %166, align 8
  %385 = load ptr, ptr %166, align 8
  %386 = icmp ne ptr %385, null
  br i1 %386, label %387, label %400

387:                                              ; preds = %383
  %388 = load ptr, ptr %166, align 8
  store ptr %388, ptr %137, align 8
  %389 = load ptr, ptr %137, align 8
  store ptr %389, ptr %135, align 8
  %390 = load ptr, ptr %135, align 8
  %391 = load i64, ptr %390, align 8
  %392 = trunc i64 %391 to i8
  store i8 %392, ptr %136, align 1
  %393 = load i8, ptr %136, align 1
  %394 = zext i8 %393 to i32
  %395 = and i32 %394, 7
  %396 = trunc i32 %395 to i8
  %397 = zext i8 %396 to i32
  %398 = icmp eq i32 %397, 6
  %399 = zext i1 %398 to i32
  br label %401

400:                                              ; preds = %383
  br label %401

401:                                              ; preds = %387, %400
  %402 = phi i32 [ %399, %387 ], [ 0, %400 ]
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %432, label %404

404:                                              ; preds = %401, %379
  %405 = load ptr, ptr %188, align 8
  store ptr %405, ptr %177, align 8
  %406 = load ptr, ptr %177, align 8
  %407 = icmp ne ptr %406, null
  br i1 %407, label %408, label %431

408:                                              ; preds = %404
  %409 = load ptr, ptr %177, align 8
  %410 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %409, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %178, ptr align 8 %410, i64 32, i1 false)
  %411 = load ptr, ptr %177, align 8
  %412 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %411, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %412, i8 0, i64 32, i1 false)
  %413 = load ptr, ptr %177, align 8
  %414 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %413, i32 0, i32 4
  %415 = load ptr, ptr %414, align 8
  %416 = icmp ne ptr %415, null
  br i1 %416, label %417, label %425

417:                                              ; preds = %408
  %418 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %178, i32 0, i32 2
  %419 = load ptr, ptr %418, align 8
  %420 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %178, i32 0, i32 3
  %421 = load ptr, ptr %420, align 8
  %422 = load ptr, ptr %177, align 8
  %423 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %422, i32 0, i32 4
  %424 = load ptr, ptr %423, align 8
  call void %419(ptr noundef %421, ptr noundef %424)
  br label %425

425:                                              ; preds = %417, %408
  %426 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %178, i32 0, i32 2
  %427 = load ptr, ptr %426, align 8
  %428 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %178, i32 0, i32 3
  %429 = load ptr, ptr %428, align 8
  %430 = load ptr, ptr %177, align 8
  call void %427(ptr noundef %429, ptr noundef %430)
  br label %431

431:                                              ; preds = %404, %425
  br label %1181

432:                                              ; preds = %401
  store double 0.000000e+00, ptr %191, align 8
  store double 0.000000e+00, ptr %192, align 8
  store double 0.000000e+00, ptr %193, align 8
  store i64 0, ptr %194, align 8
  store i64 0, ptr %196, align 8
  %433 = load ptr, ptr %190, align 8
  store ptr %433, ptr %165, align 8
  %434 = load ptr, ptr %165, align 8
  store ptr %434, ptr %164, align 8
  %435 = load ptr, ptr %164, align 8
  %436 = icmp ne ptr %435, null
  br i1 %436, label %437, label %450

437:                                              ; preds = %432
  %438 = load ptr, ptr %164, align 8
  store ptr %438, ptr %140, align 8
  %439 = load ptr, ptr %140, align 8
  store ptr %439, ptr %138, align 8
  %440 = load ptr, ptr %138, align 8
  %441 = load i64, ptr %440, align 8
  %442 = trunc i64 %441 to i8
  store i8 %442, ptr %139, align 1
  %443 = load i8, ptr %139, align 1
  %444 = zext i8 %443 to i32
  %445 = and i32 %444, 7
  %446 = trunc i32 %445 to i8
  %447 = zext i8 %446 to i32
  %448 = icmp eq i32 %447, 6
  %449 = zext i1 %448 to i32
  br label %451

450:                                              ; preds = %432
  br label %451

451:                                              ; preds = %450, %437
  %452 = phi i32 [ %449, %437 ], [ 0, %450 ]
  %453 = icmp ne i32 %452, 0
  br i1 %453, label %454, label %459

454:                                              ; preds = %451
  %455 = load ptr, ptr %165, align 8
  store ptr %455, ptr %147, align 8
  %456 = load ptr, ptr %147, align 8
  %457 = load i64, ptr %456, align 8
  %458 = lshr i64 %457, 8
  br label %460

459:                                              ; preds = %451
  br label %460

460:                                              ; preds = %454, %459
  %461 = phi i64 [ %458, %454 ], [ 0, %459 ]
  store i64 %461, ptr %197, align 8
  %462 = load ptr, ptr %190, align 8
  store ptr %462, ptr %163, align 8
  %463 = load ptr, ptr %163, align 8
  store ptr %463, ptr %161, align 8
  %464 = load ptr, ptr %161, align 8
  %465 = icmp ne ptr %464, null
  br i1 %465, label %466, label %479

466:                                              ; preds = %460
  %467 = load ptr, ptr %161, align 8
  store ptr %467, ptr %143, align 8
  %468 = load ptr, ptr %143, align 8
  store ptr %468, ptr %141, align 8
  %469 = load ptr, ptr %141, align 8
  %470 = load i64, ptr %469, align 8
  %471 = trunc i64 %470 to i8
  store i8 %471, ptr %142, align 1
  %472 = load i8, ptr %142, align 1
  %473 = zext i8 %472 to i32
  %474 = and i32 %473, 7
  %475 = trunc i32 %474 to i8
  %476 = zext i8 %475 to i32
  %477 = icmp eq i32 %476, 6
  %478 = zext i1 %477 to i32
  br label %480

479:                                              ; preds = %460
  br label %480

480:                                              ; preds = %479, %466
  %481 = phi i32 [ %478, %466 ], [ 0, %479 ]
  %482 = icmp ne i32 %481, 0
  %483 = xor i1 %482, true
  %484 = zext i1 %482 to i32
  %485 = sext i32 %484 to i64
  br i1 %482, label %486, label %501

486:                                              ; preds = %480
  %487 = load ptr, ptr %163, align 8
  store ptr %487, ptr %148, align 8
  %488 = load ptr, ptr %148, align 8
  %489 = load i64, ptr %488, align 8
  %490 = lshr i64 %489, 8
  %491 = icmp ugt i64 %490, 0
  %492 = xor i1 %491, true
  %493 = zext i1 %491 to i32
  %494 = sext i32 %493 to i64
  br i1 %491, label %495, label %500

495:                                              ; preds = %486
  %496 = load ptr, ptr %163, align 8
  store ptr %496, ptr %66, align 8
  %497 = load ptr, ptr %66, align 8
  %498 = ptrtoint ptr %497 to i64
  %499 = getelementptr inbounds %struct.yyjson_val, ptr %497, i64 1
  store ptr %499, ptr %162, align 8
  br label %502

500:                                              ; preds = %486
  br label %501

501:                                              ; preds = %500, %480
  store ptr null, ptr %162, align 8
  br label %502

502:                                              ; preds = %495, %501
  %503 = load ptr, ptr %162, align 8
  store ptr %503, ptr %195, align 8
  br label %504

504:                                              ; preds = %1118, %502
  %505 = load i64, ptr %196, align 8
  %506 = load i64, ptr %197, align 8
  %507 = icmp ult i64 %505, %506
  br i1 %507, label %508, label %1125

508:                                              ; preds = %504
  %509 = load ptr, ptr %195, align 8
  store ptr %509, ptr %160, align 8
  %510 = load ptr, ptr %160, align 8
  %511 = icmp ne ptr %510, null
  br i1 %511, label %512, label %525

512:                                              ; preds = %508
  %513 = load ptr, ptr %160, align 8
  store ptr %513, ptr %146, align 8
  %514 = load ptr, ptr %146, align 8
  store ptr %514, ptr %144, align 8
  %515 = load ptr, ptr %144, align 8
  %516 = load i64, ptr %515, align 8
  %517 = trunc i64 %516 to i8
  store i8 %517, ptr %145, align 1
  %518 = load i8, ptr %145, align 1
  %519 = zext i8 %518 to i32
  %520 = and i32 %519, 7
  %521 = trunc i32 %520 to i8
  %522 = zext i8 %521 to i32
  %523 = icmp eq i32 %522, 7
  %524 = zext i1 %523 to i32
  br label %526

525:                                              ; preds = %508
  br label %526

526:                                              ; preds = %512, %525
  %527 = phi i32 [ %524, %512 ], [ 0, %525 ]
  %528 = icmp ne i32 %527, 0
  br i1 %528, label %530, label %529

529:                                              ; preds = %526
  br label %1089

530:                                              ; preds = %526
  %531 = load ptr, ptr %195, align 8
  store ptr %531, ptr %169, align 8
  store ptr @.str.2, ptr %170, align 8
  %532 = load ptr, ptr %169, align 8
  %533 = load ptr, ptr %170, align 8
  %534 = load ptr, ptr %170, align 8
  %535 = icmp ne ptr %534, null
  br i1 %535, label %536, label %539

536:                                              ; preds = %530
  %537 = load ptr, ptr %170, align 8
  %538 = call i64 @strlen(ptr noundef %537)
  br label %540

539:                                              ; preds = %530
  br label %540

540:                                              ; preds = %536, %539
  %541 = phi i64 [ %538, %536 ], [ 0, %539 ]
  store ptr %532, ptr %114, align 8
  store ptr %533, ptr %115, align 8
  store i64 %541, ptr %116, align 8
  %542 = load ptr, ptr %114, align 8
  store ptr %542, ptr %112, align 8
  %543 = load ptr, ptr %112, align 8
  %544 = icmp ne ptr %543, null
  br i1 %544, label %545, label %558

545:                                              ; preds = %540
  %546 = load ptr, ptr %112, align 8
  store ptr %546, ptr %105, align 8
  %547 = load ptr, ptr %105, align 8
  store ptr %547, ptr %103, align 8
  %548 = load ptr, ptr %103, align 8
  %549 = load i64, ptr %548, align 8
  %550 = trunc i64 %549 to i8
  store i8 %550, ptr %104, align 1
  %551 = load i8, ptr %104, align 1
  %552 = zext i8 %551 to i32
  %553 = and i32 %552, 7
  %554 = trunc i32 %553 to i8
  %555 = zext i8 %554 to i32
  %556 = icmp eq i32 %555, 7
  %557 = zext i1 %556 to i32
  br label %559

558:                                              ; preds = %540
  br label %559

559:                                              ; preds = %558, %545
  %560 = phi i32 [ %557, %545 ], [ 0, %558 ]
  %561 = icmp ne i32 %560, 0
  br i1 %561, label %562, label %565

562:                                              ; preds = %559
  %563 = load ptr, ptr %115, align 8
  %564 = icmp ne ptr %563, null
  br label %565

565:                                              ; preds = %562, %559
  %566 = phi i1 [ false, %559 ], [ %564, %562 ]
  %567 = xor i1 %566, true
  %568 = zext i1 %566 to i32
  %569 = sext i32 %568 to i64
  br i1 %566, label %570, label %642

570:                                              ; preds = %565
  %571 = load ptr, ptr %114, align 8
  store ptr %571, ptr %106, align 8
  %572 = load ptr, ptr %106, align 8
  %573 = load i64, ptr %572, align 8
  %574 = lshr i64 %573, 8
  store i64 %574, ptr %117, align 8
  %575 = load ptr, ptr %114, align 8
  store ptr %575, ptr %68, align 8
  %576 = load ptr, ptr %68, align 8
  %577 = ptrtoint ptr %576 to i64
  %578 = getelementptr inbounds %struct.yyjson_val, ptr %576, i64 1
  store ptr %578, ptr %118, align 8
  br label %579

579:                                              ; preds = %634, %570
  %580 = load i64, ptr %117, align 8
  %581 = add i64 %580, -1
  store i64 %581, ptr %117, align 8
  %582 = icmp ugt i64 %580, 0
  br i1 %582, label %583, label %641

583:                                              ; preds = %579
  %584 = load ptr, ptr %118, align 8
  %585 = load ptr, ptr %115, align 8
  %586 = load i64, ptr %116, align 8
  store ptr %584, ptr %55, align 8
  store ptr %585, ptr %56, align 8
  store i64 %586, ptr %57, align 8
  %587 = load ptr, ptr %55, align 8
  store ptr %587, ptr %54, align 8
  %588 = load ptr, ptr %54, align 8
  %589 = load i64, ptr %588, align 8
  %590 = lshr i64 %589, 8
  %591 = load i64, ptr %57, align 8
  %592 = icmp eq i64 %590, %591
  br i1 %592, label %593, label %601

593:                                              ; preds = %583
  %594 = load ptr, ptr %55, align 8
  %595 = getelementptr inbounds nuw %struct.yyjson_val, ptr %594, i32 0, i32 1
  %596 = load ptr, ptr %595, align 8
  %597 = load ptr, ptr %56, align 8
  %598 = load i64, ptr %57, align 8
  %599 = call i32 @memcmp(ptr noundef %596, ptr noundef %597, i64 noundef %598)
  %600 = icmp eq i32 %599, 0
  br label %601

601:                                              ; preds = %583, %593
  %602 = phi i1 [ false, %583 ], [ %600, %593 ]
  br i1 %602, label %603, label %606

603:                                              ; preds = %601
  %604 = load ptr, ptr %118, align 8
  %605 = getelementptr inbounds %struct.yyjson_val, ptr %604, i64 1
  store ptr %605, ptr %113, align 8
  br label %643

606:                                              ; preds = %601
  %607 = load ptr, ptr %118, align 8
  %608 = getelementptr inbounds %struct.yyjson_val, ptr %607, i64 1
  store ptr %608, ptr %107, align 8
  %609 = load ptr, ptr %107, align 8
  store ptr %609, ptr %13, align 8
  store i8 6, ptr %14, align 1
  %610 = load ptr, ptr %13, align 8
  store ptr %610, ptr %11, align 8
  %611 = load ptr, ptr %11, align 8
  %612 = load i64, ptr %611, align 8
  %613 = trunc i64 %612 to i8
  store i8 %613, ptr %12, align 1
  %614 = load i8, ptr %12, align 1
  %615 = zext i8 %614 to i32
  %616 = and i32 %615, 255
  %617 = trunc i32 %616 to i8
  %618 = zext i8 %617 to i32
  %619 = load i8, ptr %14, align 1
  %620 = zext i8 %619 to i32
  %621 = and i32 %618, %620
  %622 = load i8, ptr %14, align 1
  %623 = zext i8 %622 to i32
  %624 = icmp eq i32 %621, %623
  %625 = zext i1 %624 to i8
  store i8 %625, ptr %108, align 1
  %626 = load ptr, ptr %107, align 8
  %627 = getelementptr inbounds nuw %struct.yyjson_val, ptr %626, i32 0, i32 1
  %628 = load i64, ptr %627, align 8
  store i64 %628, ptr %109, align 8
  %629 = load i8, ptr %108, align 1
  %630 = trunc i8 %629 to i1
  br i1 %630, label %631, label %633

631:                                              ; preds = %606
  %632 = load i64, ptr %109, align 8
  br label %634

633:                                              ; preds = %606
  br label %634

634:                                              ; preds = %633, %631
  %635 = phi i64 [ %632, %631 ], [ 16, %633 ]
  store i64 %635, ptr %110, align 8
  %636 = load ptr, ptr %107, align 8
  %637 = ptrtoint ptr %636 to i64
  store ptr %636, ptr %111, align 8
  %638 = load ptr, ptr %111, align 8
  %639 = load i64, ptr %110, align 8
  %640 = getelementptr inbounds nuw i8, ptr %638, i64 %639
  store ptr %640, ptr %118, align 8
  br label %579, !llvm.loop !9

641:                                              ; preds = %579
  br label %642

642:                                              ; preds = %641, %565
  store ptr null, ptr %113, align 8
  br label %643

643:                                              ; preds = %603, %642
  %644 = load ptr, ptr %113, align 8
  store ptr %644, ptr %198, align 8
  %645 = load ptr, ptr %195, align 8
  store ptr %645, ptr %171, align 8
  store ptr @.str.3, ptr %172, align 8
  %646 = load ptr, ptr %171, align 8
  %647 = load ptr, ptr %172, align 8
  %648 = load ptr, ptr %172, align 8
  %649 = icmp ne ptr %648, null
  br i1 %649, label %650, label %653

650:                                              ; preds = %643
  %651 = load ptr, ptr %172, align 8
  %652 = call i64 @strlen(ptr noundef %651)
  br label %654

653:                                              ; preds = %643
  br label %654

654:                                              ; preds = %650, %653
  %655 = phi i64 [ %652, %650 ], [ 0, %653 ]
  store ptr %646, ptr %98, align 8
  store ptr %647, ptr %99, align 8
  store i64 %655, ptr %100, align 8
  %656 = load ptr, ptr %98, align 8
  store ptr %656, ptr %96, align 8
  %657 = load ptr, ptr %96, align 8
  %658 = icmp ne ptr %657, null
  br i1 %658, label %659, label %672

659:                                              ; preds = %654
  %660 = load ptr, ptr %96, align 8
  store ptr %660, ptr %89, align 8
  %661 = load ptr, ptr %89, align 8
  store ptr %661, ptr %87, align 8
  %662 = load ptr, ptr %87, align 8
  %663 = load i64, ptr %662, align 8
  %664 = trunc i64 %663 to i8
  store i8 %664, ptr %88, align 1
  %665 = load i8, ptr %88, align 1
  %666 = zext i8 %665 to i32
  %667 = and i32 %666, 7
  %668 = trunc i32 %667 to i8
  %669 = zext i8 %668 to i32
  %670 = icmp eq i32 %669, 7
  %671 = zext i1 %670 to i32
  br label %673

672:                                              ; preds = %654
  br label %673

673:                                              ; preds = %672, %659
  %674 = phi i32 [ %671, %659 ], [ 0, %672 ]
  %675 = icmp ne i32 %674, 0
  br i1 %675, label %676, label %679

676:                                              ; preds = %673
  %677 = load ptr, ptr %99, align 8
  %678 = icmp ne ptr %677, null
  br label %679

679:                                              ; preds = %676, %673
  %680 = phi i1 [ false, %673 ], [ %678, %676 ]
  %681 = xor i1 %680, true
  %682 = zext i1 %680 to i32
  %683 = sext i32 %682 to i64
  br i1 %680, label %684, label %756

684:                                              ; preds = %679
  %685 = load ptr, ptr %98, align 8
  store ptr %685, ptr %90, align 8
  %686 = load ptr, ptr %90, align 8
  %687 = load i64, ptr %686, align 8
  %688 = lshr i64 %687, 8
  store i64 %688, ptr %101, align 8
  %689 = load ptr, ptr %98, align 8
  store ptr %689, ptr %69, align 8
  %690 = load ptr, ptr %69, align 8
  %691 = ptrtoint ptr %690 to i64
  %692 = getelementptr inbounds %struct.yyjson_val, ptr %690, i64 1
  store ptr %692, ptr %102, align 8
  br label %693

693:                                              ; preds = %748, %684
  %694 = load i64, ptr %101, align 8
  %695 = add i64 %694, -1
  store i64 %695, ptr %101, align 8
  %696 = icmp ugt i64 %694, 0
  br i1 %696, label %697, label %755

697:                                              ; preds = %693
  %698 = load ptr, ptr %102, align 8
  %699 = load ptr, ptr %99, align 8
  %700 = load i64, ptr %100, align 8
  store ptr %698, ptr %59, align 8
  store ptr %699, ptr %60, align 8
  store i64 %700, ptr %61, align 8
  %701 = load ptr, ptr %59, align 8
  store ptr %701, ptr %58, align 8
  %702 = load ptr, ptr %58, align 8
  %703 = load i64, ptr %702, align 8
  %704 = lshr i64 %703, 8
  %705 = load i64, ptr %61, align 8
  %706 = icmp eq i64 %704, %705
  br i1 %706, label %707, label %715

707:                                              ; preds = %697
  %708 = load ptr, ptr %59, align 8
  %709 = getelementptr inbounds nuw %struct.yyjson_val, ptr %708, i32 0, i32 1
  %710 = load ptr, ptr %709, align 8
  %711 = load ptr, ptr %60, align 8
  %712 = load i64, ptr %61, align 8
  %713 = call i32 @memcmp(ptr noundef %710, ptr noundef %711, i64 noundef %712)
  %714 = icmp eq i32 %713, 0
  br label %715

715:                                              ; preds = %697, %707
  %716 = phi i1 [ false, %697 ], [ %714, %707 ]
  br i1 %716, label %717, label %720

717:                                              ; preds = %715
  %718 = load ptr, ptr %102, align 8
  %719 = getelementptr inbounds %struct.yyjson_val, ptr %718, i64 1
  store ptr %719, ptr %97, align 8
  br label %757

720:                                              ; preds = %715
  %721 = load ptr, ptr %102, align 8
  %722 = getelementptr inbounds %struct.yyjson_val, ptr %721, i64 1
  store ptr %722, ptr %91, align 8
  %723 = load ptr, ptr %91, align 8
  store ptr %723, ptr %17, align 8
  store i8 6, ptr %18, align 1
  %724 = load ptr, ptr %17, align 8
  store ptr %724, ptr %15, align 8
  %725 = load ptr, ptr %15, align 8
  %726 = load i64, ptr %725, align 8
  %727 = trunc i64 %726 to i8
  store i8 %727, ptr %16, align 1
  %728 = load i8, ptr %16, align 1
  %729 = zext i8 %728 to i32
  %730 = and i32 %729, 255
  %731 = trunc i32 %730 to i8
  %732 = zext i8 %731 to i32
  %733 = load i8, ptr %18, align 1
  %734 = zext i8 %733 to i32
  %735 = and i32 %732, %734
  %736 = load i8, ptr %18, align 1
  %737 = zext i8 %736 to i32
  %738 = icmp eq i32 %735, %737
  %739 = zext i1 %738 to i8
  store i8 %739, ptr %92, align 1
  %740 = load ptr, ptr %91, align 8
  %741 = getelementptr inbounds nuw %struct.yyjson_val, ptr %740, i32 0, i32 1
  %742 = load i64, ptr %741, align 8
  store i64 %742, ptr %93, align 8
  %743 = load i8, ptr %92, align 1
  %744 = trunc i8 %743 to i1
  br i1 %744, label %745, label %747

745:                                              ; preds = %720
  %746 = load i64, ptr %93, align 8
  br label %748

747:                                              ; preds = %720
  br label %748

748:                                              ; preds = %747, %745
  %749 = phi i64 [ %746, %745 ], [ 16, %747 ]
  store i64 %749, ptr %94, align 8
  %750 = load ptr, ptr %91, align 8
  %751 = ptrtoint ptr %750 to i64
  store ptr %750, ptr %95, align 8
  %752 = load ptr, ptr %95, align 8
  %753 = load i64, ptr %94, align 8
  %754 = getelementptr inbounds nuw i8, ptr %752, i64 %753
  store ptr %754, ptr %102, align 8
  br label %693, !llvm.loop !9

755:                                              ; preds = %693
  br label %756

756:                                              ; preds = %755, %679
  store ptr null, ptr %97, align 8
  br label %757

757:                                              ; preds = %717, %756
  %758 = load ptr, ptr %97, align 8
  store ptr %758, ptr %199, align 8
  %759 = load ptr, ptr %195, align 8
  store ptr %759, ptr %173, align 8
  store ptr @.str.4, ptr %174, align 8
  %760 = load ptr, ptr %173, align 8
  %761 = load ptr, ptr %174, align 8
  %762 = load ptr, ptr %174, align 8
  %763 = icmp ne ptr %762, null
  br i1 %763, label %764, label %767

764:                                              ; preds = %757
  %765 = load ptr, ptr %174, align 8
  %766 = call i64 @strlen(ptr noundef %765)
  br label %768

767:                                              ; preds = %757
  br label %768

768:                                              ; preds = %764, %767
  %769 = phi i64 [ %766, %764 ], [ 0, %767 ]
  store ptr %760, ptr %82, align 8
  store ptr %761, ptr %83, align 8
  store i64 %769, ptr %84, align 8
  %770 = load ptr, ptr %82, align 8
  store ptr %770, ptr %80, align 8
  %771 = load ptr, ptr %80, align 8
  %772 = icmp ne ptr %771, null
  br i1 %772, label %773, label %786

773:                                              ; preds = %768
  %774 = load ptr, ptr %80, align 8
  store ptr %774, ptr %73, align 8
  %775 = load ptr, ptr %73, align 8
  store ptr %775, ptr %71, align 8
  %776 = load ptr, ptr %71, align 8
  %777 = load i64, ptr %776, align 8
  %778 = trunc i64 %777 to i8
  store i8 %778, ptr %72, align 1
  %779 = load i8, ptr %72, align 1
  %780 = zext i8 %779 to i32
  %781 = and i32 %780, 7
  %782 = trunc i32 %781 to i8
  %783 = zext i8 %782 to i32
  %784 = icmp eq i32 %783, 7
  %785 = zext i1 %784 to i32
  br label %787

786:                                              ; preds = %768
  br label %787

787:                                              ; preds = %786, %773
  %788 = phi i32 [ %785, %773 ], [ 0, %786 ]
  %789 = icmp ne i32 %788, 0
  br i1 %789, label %790, label %793

790:                                              ; preds = %787
  %791 = load ptr, ptr %83, align 8
  %792 = icmp ne ptr %791, null
  br label %793

793:                                              ; preds = %790, %787
  %794 = phi i1 [ false, %787 ], [ %792, %790 ]
  %795 = xor i1 %794, true
  %796 = zext i1 %794 to i32
  %797 = sext i32 %796 to i64
  br i1 %794, label %798, label %870

798:                                              ; preds = %793
  %799 = load ptr, ptr %82, align 8
  store ptr %799, ptr %74, align 8
  %800 = load ptr, ptr %74, align 8
  %801 = load i64, ptr %800, align 8
  %802 = lshr i64 %801, 8
  store i64 %802, ptr %85, align 8
  %803 = load ptr, ptr %82, align 8
  store ptr %803, ptr %70, align 8
  %804 = load ptr, ptr %70, align 8
  %805 = ptrtoint ptr %804 to i64
  %806 = getelementptr inbounds %struct.yyjson_val, ptr %804, i64 1
  store ptr %806, ptr %86, align 8
  br label %807

807:                                              ; preds = %862, %798
  %808 = load i64, ptr %85, align 8
  %809 = add i64 %808, -1
  store i64 %809, ptr %85, align 8
  %810 = icmp ugt i64 %808, 0
  br i1 %810, label %811, label %869

811:                                              ; preds = %807
  %812 = load ptr, ptr %86, align 8
  %813 = load ptr, ptr %83, align 8
  %814 = load i64, ptr %84, align 8
  store ptr %812, ptr %63, align 8
  store ptr %813, ptr %64, align 8
  store i64 %814, ptr %65, align 8
  %815 = load ptr, ptr %63, align 8
  store ptr %815, ptr %62, align 8
  %816 = load ptr, ptr %62, align 8
  %817 = load i64, ptr %816, align 8
  %818 = lshr i64 %817, 8
  %819 = load i64, ptr %65, align 8
  %820 = icmp eq i64 %818, %819
  br i1 %820, label %821, label %829

821:                                              ; preds = %811
  %822 = load ptr, ptr %63, align 8
  %823 = getelementptr inbounds nuw %struct.yyjson_val, ptr %822, i32 0, i32 1
  %824 = load ptr, ptr %823, align 8
  %825 = load ptr, ptr %64, align 8
  %826 = load i64, ptr %65, align 8
  %827 = call i32 @memcmp(ptr noundef %824, ptr noundef %825, i64 noundef %826)
  %828 = icmp eq i32 %827, 0
  br label %829

829:                                              ; preds = %811, %821
  %830 = phi i1 [ false, %811 ], [ %828, %821 ]
  br i1 %830, label %831, label %834

831:                                              ; preds = %829
  %832 = load ptr, ptr %86, align 8
  %833 = getelementptr inbounds %struct.yyjson_val, ptr %832, i64 1
  store ptr %833, ptr %81, align 8
  br label %871

834:                                              ; preds = %829
  %835 = load ptr, ptr %86, align 8
  %836 = getelementptr inbounds %struct.yyjson_val, ptr %835, i64 1
  store ptr %836, ptr %75, align 8
  %837 = load ptr, ptr %75, align 8
  store ptr %837, ptr %21, align 8
  store i8 6, ptr %22, align 1
  %838 = load ptr, ptr %21, align 8
  store ptr %838, ptr %19, align 8
  %839 = load ptr, ptr %19, align 8
  %840 = load i64, ptr %839, align 8
  %841 = trunc i64 %840 to i8
  store i8 %841, ptr %20, align 1
  %842 = load i8, ptr %20, align 1
  %843 = zext i8 %842 to i32
  %844 = and i32 %843, 255
  %845 = trunc i32 %844 to i8
  %846 = zext i8 %845 to i32
  %847 = load i8, ptr %22, align 1
  %848 = zext i8 %847 to i32
  %849 = and i32 %846, %848
  %850 = load i8, ptr %22, align 1
  %851 = zext i8 %850 to i32
  %852 = icmp eq i32 %849, %851
  %853 = zext i1 %852 to i8
  store i8 %853, ptr %76, align 1
  %854 = load ptr, ptr %75, align 8
  %855 = getelementptr inbounds nuw %struct.yyjson_val, ptr %854, i32 0, i32 1
  %856 = load i64, ptr %855, align 8
  store i64 %856, ptr %77, align 8
  %857 = load i8, ptr %76, align 1
  %858 = trunc i8 %857 to i1
  br i1 %858, label %859, label %861

859:                                              ; preds = %834
  %860 = load i64, ptr %77, align 8
  br label %862

861:                                              ; preds = %834
  br label %862

862:                                              ; preds = %861, %859
  %863 = phi i64 [ %860, %859 ], [ 16, %861 ]
  store i64 %863, ptr %78, align 8
  %864 = load ptr, ptr %75, align 8
  %865 = ptrtoint ptr %864 to i64
  store ptr %864, ptr %79, align 8
  %866 = load ptr, ptr %79, align 8
  %867 = load i64, ptr %78, align 8
  %868 = getelementptr inbounds nuw i8, ptr %866, i64 %867
  store ptr %868, ptr %86, align 8
  br label %807, !llvm.loop !9

869:                                              ; preds = %807
  br label %870

870:                                              ; preds = %869, %793
  store ptr null, ptr %81, align 8
  br label %871

871:                                              ; preds = %831, %870
  %872 = load ptr, ptr %81, align 8
  store ptr %872, ptr %200, align 8
  %873 = load ptr, ptr %198, align 8
  %874 = icmp ne ptr %873, null
  br i1 %874, label %875, label %1088

875:                                              ; preds = %871
  %876 = load ptr, ptr %199, align 8
  %877 = icmp ne ptr %876, null
  br i1 %877, label %878, label %1088

878:                                              ; preds = %875
  %879 = load ptr, ptr %200, align 8
  %880 = icmp ne ptr %879, null
  br i1 %880, label %881, label %1088

881:                                              ; preds = %878
  %882 = load ptr, ptr %198, align 8
  store ptr %882, ptr %157, align 8
  %883 = load ptr, ptr %157, align 8
  %884 = icmp ne ptr %883, null
  br i1 %884, label %885, label %898

885:                                              ; preds = %881
  %886 = load ptr, ptr %157, align 8
  store ptr %886, ptr %49, align 8
  %887 = load ptr, ptr %49, align 8
  store ptr %887, ptr %47, align 8
  %888 = load ptr, ptr %47, align 8
  %889 = load i64, ptr %888, align 8
  %890 = trunc i64 %889 to i8
  store i8 %890, ptr %48, align 1
  %891 = load i8, ptr %48, align 1
  %892 = zext i8 %891 to i32
  %893 = and i32 %892, 7
  %894 = trunc i32 %893 to i8
  %895 = zext i8 %894 to i32
  %896 = icmp eq i32 %895, 4
  %897 = zext i1 %896 to i32
  br label %899

898:                                              ; preds = %881
  br label %899

899:                                              ; preds = %885, %898
  %900 = phi i32 [ %897, %885 ], [ 0, %898 ]
  %901 = icmp ne i32 %900, 0
  br i1 %901, label %902, label %1088

902:                                              ; preds = %899
  %903 = load ptr, ptr %199, align 8
  store ptr %903, ptr %158, align 8
  %904 = load ptr, ptr %158, align 8
  %905 = icmp ne ptr %904, null
  br i1 %905, label %906, label %919

906:                                              ; preds = %902
  %907 = load ptr, ptr %158, align 8
  store ptr %907, ptr %46, align 8
  %908 = load ptr, ptr %46, align 8
  store ptr %908, ptr %44, align 8
  %909 = load ptr, ptr %44, align 8
  %910 = load i64, ptr %909, align 8
  %911 = trunc i64 %910 to i8
  store i8 %911, ptr %45, align 1
  %912 = load i8, ptr %45, align 1
  %913 = zext i8 %912 to i32
  %914 = and i32 %913, 7
  %915 = trunc i32 %914 to i8
  %916 = zext i8 %915 to i32
  %917 = icmp eq i32 %916, 4
  %918 = zext i1 %917 to i32
  br label %920

919:                                              ; preds = %902
  br label %920

920:                                              ; preds = %906, %919
  %921 = phi i32 [ %918, %906 ], [ 0, %919 ]
  %922 = icmp ne i32 %921, 0
  br i1 %922, label %923, label %1088

923:                                              ; preds = %920
  %924 = load ptr, ptr %200, align 8
  store ptr %924, ptr %159, align 8
  %925 = load ptr, ptr %159, align 8
  %926 = icmp ne ptr %925, null
  br i1 %926, label %927, label %940

927:                                              ; preds = %923
  %928 = load ptr, ptr %159, align 8
  store ptr %928, ptr %43, align 8
  %929 = load ptr, ptr %43, align 8
  store ptr %929, ptr %41, align 8
  %930 = load ptr, ptr %41, align 8
  %931 = load i64, ptr %930, align 8
  %932 = trunc i64 %931 to i8
  store i8 %932, ptr %42, align 1
  %933 = load i8, ptr %42, align 1
  %934 = zext i8 %933 to i32
  %935 = and i32 %934, 7
  %936 = trunc i32 %935 to i8
  %937 = zext i8 %936 to i32
  %938 = icmp eq i32 %937, 4
  %939 = zext i1 %938 to i32
  br label %941

940:                                              ; preds = %923
  br label %941

941:                                              ; preds = %927, %940
  %942 = phi i32 [ %939, %927 ], [ 0, %940 ]
  %943 = icmp ne i32 %942, 0
  br i1 %943, label %944, label %1088

944:                                              ; preds = %941
  %945 = load ptr, ptr %198, align 8
  store ptr %945, ptr %154, align 8
  %946 = load ptr, ptr %154, align 8
  %947 = icmp ne ptr %946, null
  br i1 %947, label %948, label %987

948:                                              ; preds = %944
  %949 = load ptr, ptr %154, align 8
  store ptr %949, ptr %39, align 8
  %950 = load ptr, ptr %39, align 8
  store ptr %950, ptr %26, align 8
  %951 = load ptr, ptr %26, align 8
  %952 = load i64, ptr %951, align 8
  %953 = trunc i64 %952 to i8
  store i8 %953, ptr %27, align 1
  %954 = load i8, ptr %27, align 1
  %955 = zext i8 %954 to i32
  %956 = and i32 %955, 255
  %957 = trunc i32 %956 to i8
  store i8 %957, ptr %40, align 1
  %958 = load i8, ptr %40, align 1
  %959 = zext i8 %958 to i32
  %960 = icmp eq i32 %959, 20
  br i1 %960, label %961, label %965

961:                                              ; preds = %948
  %962 = load ptr, ptr %39, align 8
  %963 = getelementptr inbounds nuw %struct.yyjson_val, ptr %962, i32 0, i32 1
  %964 = load double, ptr %963, align 8
  store double %964, ptr %38, align 8
  br label %985

965:                                              ; preds = %948
  %966 = load i8, ptr %40, align 1
  %967 = zext i8 %966 to i32
  %968 = icmp eq i32 %967, 12
  br i1 %968, label %969, label %974

969:                                              ; preds = %965
  %970 = load ptr, ptr %39, align 8
  %971 = getelementptr inbounds nuw %struct.yyjson_val, ptr %970, i32 0, i32 1
  %972 = load i64, ptr %971, align 8
  %973 = sitofp i64 %972 to double
  store double %973, ptr %38, align 8
  br label %985

974:                                              ; preds = %965
  %975 = load i8, ptr %40, align 1
  %976 = zext i8 %975 to i32
  %977 = icmp eq i32 %976, 4
  br i1 %977, label %978, label %984

978:                                              ; preds = %974
  %979 = load ptr, ptr %39, align 8
  %980 = getelementptr inbounds nuw %struct.yyjson_val, ptr %979, i32 0, i32 1
  %981 = load i64, ptr %980, align 8
  store i64 %981, ptr %23, align 8
  %982 = load i64, ptr %23, align 8
  %983 = uitofp i64 %982 to double
  store double %983, ptr %38, align 8
  br label %985

984:                                              ; preds = %974
  store double 0.000000e+00, ptr %38, align 8
  br label %985

985:                                              ; preds = %961, %969, %978, %984
  %986 = load double, ptr %38, align 8
  br label %988

987:                                              ; preds = %944
  br label %988

988:                                              ; preds = %985, %987
  %989 = phi double [ %986, %985 ], [ 0.000000e+00, %987 ]
  %990 = load double, ptr %191, align 8
  %991 = fadd double %990, %989
  store double %991, ptr %191, align 8
  %992 = load ptr, ptr %199, align 8
  store ptr %992, ptr %155, align 8
  %993 = load ptr, ptr %155, align 8
  %994 = icmp ne ptr %993, null
  br i1 %994, label %995, label %1034

995:                                              ; preds = %988
  %996 = load ptr, ptr %155, align 8
  store ptr %996, ptr %36, align 8
  %997 = load ptr, ptr %36, align 8
  store ptr %997, ptr %28, align 8
  %998 = load ptr, ptr %28, align 8
  %999 = load i64, ptr %998, align 8
  %1000 = trunc i64 %999 to i8
  store i8 %1000, ptr %29, align 1
  %1001 = load i8, ptr %29, align 1
  %1002 = zext i8 %1001 to i32
  %1003 = and i32 %1002, 255
  %1004 = trunc i32 %1003 to i8
  store i8 %1004, ptr %37, align 1
  %1005 = load i8, ptr %37, align 1
  %1006 = zext i8 %1005 to i32
  %1007 = icmp eq i32 %1006, 20
  br i1 %1007, label %1008, label %1012

1008:                                             ; preds = %995
  %1009 = load ptr, ptr %36, align 8
  %1010 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1009, i32 0, i32 1
  %1011 = load double, ptr %1010, align 8
  store double %1011, ptr %35, align 8
  br label %1032

1012:                                             ; preds = %995
  %1013 = load i8, ptr %37, align 1
  %1014 = zext i8 %1013 to i32
  %1015 = icmp eq i32 %1014, 12
  br i1 %1015, label %1016, label %1021

1016:                                             ; preds = %1012
  %1017 = load ptr, ptr %36, align 8
  %1018 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1017, i32 0, i32 1
  %1019 = load i64, ptr %1018, align 8
  %1020 = sitofp i64 %1019 to double
  store double %1020, ptr %35, align 8
  br label %1032

1021:                                             ; preds = %1012
  %1022 = load i8, ptr %37, align 1
  %1023 = zext i8 %1022 to i32
  %1024 = icmp eq i32 %1023, 4
  br i1 %1024, label %1025, label %1031

1025:                                             ; preds = %1021
  %1026 = load ptr, ptr %36, align 8
  %1027 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1026, i32 0, i32 1
  %1028 = load i64, ptr %1027, align 8
  store i64 %1028, ptr %24, align 8
  %1029 = load i64, ptr %24, align 8
  %1030 = uitofp i64 %1029 to double
  store double %1030, ptr %35, align 8
  br label %1032

1031:                                             ; preds = %1021
  store double 0.000000e+00, ptr %35, align 8
  br label %1032

1032:                                             ; preds = %1008, %1016, %1025, %1031
  %1033 = load double, ptr %35, align 8
  br label %1035

1034:                                             ; preds = %988
  br label %1035

1035:                                             ; preds = %1032, %1034
  %1036 = phi double [ %1033, %1032 ], [ 0.000000e+00, %1034 ]
  %1037 = load double, ptr %192, align 8
  %1038 = fadd double %1037, %1036
  store double %1038, ptr %192, align 8
  %1039 = load ptr, ptr %200, align 8
  store ptr %1039, ptr %156, align 8
  %1040 = load ptr, ptr %156, align 8
  %1041 = icmp ne ptr %1040, null
  br i1 %1041, label %1042, label %1081

1042:                                             ; preds = %1035
  %1043 = load ptr, ptr %156, align 8
  store ptr %1043, ptr %33, align 8
  %1044 = load ptr, ptr %33, align 8
  store ptr %1044, ptr %30, align 8
  %1045 = load ptr, ptr %30, align 8
  %1046 = load i64, ptr %1045, align 8
  %1047 = trunc i64 %1046 to i8
  store i8 %1047, ptr %31, align 1
  %1048 = load i8, ptr %31, align 1
  %1049 = zext i8 %1048 to i32
  %1050 = and i32 %1049, 255
  %1051 = trunc i32 %1050 to i8
  store i8 %1051, ptr %34, align 1
  %1052 = load i8, ptr %34, align 1
  %1053 = zext i8 %1052 to i32
  %1054 = icmp eq i32 %1053, 20
  br i1 %1054, label %1055, label %1059

1055:                                             ; preds = %1042
  %1056 = load ptr, ptr %33, align 8
  %1057 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1056, i32 0, i32 1
  %1058 = load double, ptr %1057, align 8
  store double %1058, ptr %32, align 8
  br label %1079

1059:                                             ; preds = %1042
  %1060 = load i8, ptr %34, align 1
  %1061 = zext i8 %1060 to i32
  %1062 = icmp eq i32 %1061, 12
  br i1 %1062, label %1063, label %1068

1063:                                             ; preds = %1059
  %1064 = load ptr, ptr %33, align 8
  %1065 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1064, i32 0, i32 1
  %1066 = load i64, ptr %1065, align 8
  %1067 = sitofp i64 %1066 to double
  store double %1067, ptr %32, align 8
  br label %1079

1068:                                             ; preds = %1059
  %1069 = load i8, ptr %34, align 1
  %1070 = zext i8 %1069 to i32
  %1071 = icmp eq i32 %1070, 4
  br i1 %1071, label %1072, label %1078

1072:                                             ; preds = %1068
  %1073 = load ptr, ptr %33, align 8
  %1074 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1073, i32 0, i32 1
  %1075 = load i64, ptr %1074, align 8
  store i64 %1075, ptr %25, align 8
  %1076 = load i64, ptr %25, align 8
  %1077 = uitofp i64 %1076 to double
  store double %1077, ptr %32, align 8
  br label %1079

1078:                                             ; preds = %1068
  store double 0.000000e+00, ptr %32, align 8
  br label %1079

1079:                                             ; preds = %1055, %1063, %1072, %1078
  %1080 = load double, ptr %32, align 8
  br label %1082

1081:                                             ; preds = %1035
  br label %1082

1082:                                             ; preds = %1079, %1081
  %1083 = phi double [ %1080, %1079 ], [ 0.000000e+00, %1081 ]
  %1084 = load double, ptr %193, align 8
  %1085 = fadd double %1084, %1083
  store double %1085, ptr %193, align 8
  %1086 = load i64, ptr %194, align 8
  %1087 = add i64 %1086, 1
  store i64 %1087, ptr %194, align 8
  br label %1088

1088:                                             ; preds = %1082, %941, %920, %899, %878, %875, %871
  br label %1089

1089:                                             ; preds = %1088, %529
  %1090 = load i64, ptr %196, align 8
  %1091 = add i64 %1090, 1
  store i64 %1091, ptr %196, align 8
  %1092 = load ptr, ptr %195, align 8
  store ptr %1092, ptr %149, align 8
  %1093 = load ptr, ptr %149, align 8
  store ptr %1093, ptr %5, align 8
  store i8 6, ptr %6, align 1
  %1094 = load ptr, ptr %5, align 8
  store ptr %1094, ptr %3, align 8
  %1095 = load ptr, ptr %3, align 8
  %1096 = load i64, ptr %1095, align 8
  %1097 = trunc i64 %1096 to i8
  store i8 %1097, ptr %4, align 1
  %1098 = load i8, ptr %4, align 1
  %1099 = zext i8 %1098 to i32
  %1100 = and i32 %1099, 255
  %1101 = trunc i32 %1100 to i8
  %1102 = zext i8 %1101 to i32
  %1103 = load i8, ptr %6, align 1
  %1104 = zext i8 %1103 to i32
  %1105 = and i32 %1102, %1104
  %1106 = load i8, ptr %6, align 1
  %1107 = zext i8 %1106 to i32
  %1108 = icmp eq i32 %1105, %1107
  %1109 = zext i1 %1108 to i8
  store i8 %1109, ptr %150, align 1
  %1110 = load ptr, ptr %149, align 8
  %1111 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1110, i32 0, i32 1
  %1112 = load i64, ptr %1111, align 8
  store i64 %1112, ptr %151, align 8
  %1113 = load i8, ptr %150, align 1
  %1114 = trunc i8 %1113 to i1
  br i1 %1114, label %1115, label %1117

1115:                                             ; preds = %1089
  %1116 = load i64, ptr %151, align 8
  br label %1118

1117:                                             ; preds = %1089
  br label %1118

1118:                                             ; preds = %1115, %1117
  %1119 = phi i64 [ %1116, %1115 ], [ 16, %1117 ]
  store i64 %1119, ptr %152, align 8
  %1120 = load ptr, ptr %149, align 8
  %1121 = ptrtoint ptr %1120 to i64
  store ptr %1120, ptr %153, align 8
  %1122 = load ptr, ptr %153, align 8
  %1123 = load i64, ptr %152, align 8
  %1124 = getelementptr inbounds nuw i8, ptr %1122, i64 %1123
  store ptr %1124, ptr %195, align 8
  br label %504, !llvm.loop !10

1125:                                             ; preds = %504
  %1126 = load ptr, ptr %188, align 8
  store ptr %1126, ptr %179, align 8
  %1127 = load ptr, ptr %179, align 8
  %1128 = icmp ne ptr %1127, null
  br i1 %1128, label %1129, label %1152

1129:                                             ; preds = %1125
  %1130 = load ptr, ptr %179, align 8
  %1131 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1130, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %180, ptr align 8 %1131, i64 32, i1 false)
  %1132 = load ptr, ptr %179, align 8
  %1133 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1132, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %1133, i8 0, i64 32, i1 false)
  %1134 = load ptr, ptr %179, align 8
  %1135 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1134, i32 0, i32 4
  %1136 = load ptr, ptr %1135, align 8
  %1137 = icmp ne ptr %1136, null
  br i1 %1137, label %1138, label %1146

1138:                                             ; preds = %1129
  %1139 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %180, i32 0, i32 2
  %1140 = load ptr, ptr %1139, align 8
  %1141 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %180, i32 0, i32 3
  %1142 = load ptr, ptr %1141, align 8
  %1143 = load ptr, ptr %179, align 8
  %1144 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1143, i32 0, i32 4
  %1145 = load ptr, ptr %1144, align 8
  call void %1140(ptr noundef %1142, ptr noundef %1145)
  br label %1146

1146:                                             ; preds = %1138, %1129
  %1147 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %180, i32 0, i32 2
  %1148 = load ptr, ptr %1147, align 8
  %1149 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %180, i32 0, i32 3
  %1150 = load ptr, ptr %1149, align 8
  %1151 = load ptr, ptr %179, align 8
  call void %1148(ptr noundef %1150, ptr noundef %1151)
  br label %1152

1152:                                             ; preds = %1125, %1146
  %1153 = load i64, ptr %194, align 8
  %1154 = icmp ugt i64 %1153, 0
  br i1 %1154, label %1155, label %1181

1155:                                             ; preds = %1152
  %1156 = load double, ptr %191, align 8
  %1157 = load i64, ptr %194, align 8
  %1158 = uitofp i64 %1157 to double
  %1159 = fdiv double %1156, %1158
  store double %1159, ptr %201, align 8
  %1160 = load double, ptr %192, align 8
  %1161 = load i64, ptr %194, align 8
  %1162 = uitofp i64 %1161 to double
  %1163 = fdiv double %1160, %1162
  store double %1163, ptr %202, align 8
  %1164 = load double, ptr %193, align 8
  %1165 = load i64, ptr %194, align 8
  %1166 = uitofp i64 %1165 to double
  %1167 = fdiv double %1164, %1166
  store double %1167, ptr %203, align 8
  %1168 = load double, ptr %201, align 8
  %1169 = call i32 @Helper_checksum_f64(double noundef %1168)
  %1170 = load double, ptr %202, align 8
  %1171 = call i32 @Helper_checksum_f64(double noundef %1170)
  %1172 = add i32 %1169, %1171
  %1173 = load double, ptr %203, align 8
  %1174 = call i32 @Helper_checksum_f64(double noundef %1173)
  %1175 = add i32 %1172, %1174
  store i32 %1175, ptr %204, align 4
  %1176 = load i32, ptr %204, align 4
  %1177 = load ptr, ptr %187, align 8
  %1178 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %1177, i32 0, i32 1
  %1179 = load i32, ptr %1178, align 8
  %1180 = add i32 %1179, %1176
  store i32 %1180, ptr %1178, align 8
  br label %1181

1181:                                             ; preds = %225, %265, %431, %1155, %1152
  ret void
}

declare i32 @Helper_checksum_f64(double noundef)

define dso_local i32 @JsonParseDom_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @JsonParseDom_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.JsonParseDomData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @JsonParseDom_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.12)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 24, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @JsonParseDom_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @JsonParseDom_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @JsonParseDom_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @JsonParseDom_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define dso_local void @JsonParseMapping_prepare(ptr noundef %0) {
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
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.11)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %11, i32 0, i32 2
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %13, i32 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = icmp sle i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %18, i32 0, i32 2
  store i64 1000, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %1
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %21, i32 0, i32 2
  %23 = load i64, ptr %22, align 8
  %24 = call ptr @generate_json_for_parsing(i64 noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %25, i32 0, i32 0
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %27, i32 0, i32 1
  store i32 0, ptr %28, align 8
  ret void
}

define dso_local void @JsonParseMapping_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca i8, align 1
  %13 = alloca ptr, align 8
  %14 = alloca i8, align 1
  %15 = alloca ptr, align 8
  %16 = alloca i8, align 1
  %17 = alloca ptr, align 8
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 8
  %20 = alloca i8, align 1
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i8, align 1
  %28 = alloca ptr, align 8
  %29 = alloca i8, align 1
  %30 = alloca ptr, align 8
  %31 = alloca i8, align 1
  %32 = alloca double, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i8, align 1
  %35 = alloca double, align 8
  %36 = alloca ptr, align 8
  %37 = alloca i8, align 1
  %38 = alloca double, align 8
  %39 = alloca ptr, align 8
  %40 = alloca i8, align 1
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i64, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca i64, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca i64, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i64, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca i8, align 1
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca ptr, align 8
  %67 = alloca i8, align 1
  %68 = alloca i64, align 8
  %69 = alloca i64, align 8
  %70 = alloca ptr, align 8
  %71 = alloca ptr, align 8
  %72 = alloca ptr, align 8
  %73 = alloca ptr, align 8
  %74 = alloca ptr, align 8
  %75 = alloca i64, align 8
  %76 = alloca i64, align 8
  %77 = alloca ptr, align 8
  %78 = alloca ptr, align 8
  %79 = alloca i8, align 1
  %80 = alloca ptr, align 8
  %81 = alloca ptr, align 8
  %82 = alloca ptr, align 8
  %83 = alloca i8, align 1
  %84 = alloca i64, align 8
  %85 = alloca i64, align 8
  %86 = alloca ptr, align 8
  %87 = alloca ptr, align 8
  %88 = alloca ptr, align 8
  %89 = alloca ptr, align 8
  %90 = alloca ptr, align 8
  %91 = alloca i64, align 8
  %92 = alloca i64, align 8
  %93 = alloca ptr, align 8
  %94 = alloca ptr, align 8
  %95 = alloca i8, align 1
  %96 = alloca ptr, align 8
  %97 = alloca ptr, align 8
  %98 = alloca ptr, align 8
  %99 = alloca i8, align 1
  %100 = alloca i64, align 8
  %101 = alloca i64, align 8
  %102 = alloca ptr, align 8
  %103 = alloca ptr, align 8
  %104 = alloca ptr, align 8
  %105 = alloca ptr, align 8
  %106 = alloca ptr, align 8
  %107 = alloca i64, align 8
  %108 = alloca i64, align 8
  %109 = alloca ptr, align 8
  %110 = alloca ptr, align 8
  %111 = alloca i8, align 1
  %112 = alloca ptr, align 8
  %113 = alloca ptr, align 8
  %114 = alloca ptr, align 8
  %115 = alloca i8, align 1
  %116 = alloca i64, align 8
  %117 = alloca i64, align 8
  %118 = alloca ptr, align 8
  %119 = alloca ptr, align 8
  %120 = alloca ptr, align 8
  %121 = alloca ptr, align 8
  %122 = alloca ptr, align 8
  %123 = alloca i64, align 8
  %124 = alloca i64, align 8
  %125 = alloca ptr, align 8
  %126 = alloca ptr, align 8
  %127 = alloca i8, align 1
  %128 = alloca ptr, align 8
  %129 = alloca ptr, align 8
  %130 = alloca i8, align 1
  %131 = alloca ptr, align 8
  %132 = alloca ptr, align 8
  %133 = alloca i8, align 1
  %134 = alloca ptr, align 8
  %135 = alloca ptr, align 8
  %136 = alloca i8, align 1
  %137 = alloca ptr, align 8
  %138 = alloca ptr, align 8
  %139 = alloca ptr, align 8
  %140 = alloca ptr, align 8
  %141 = alloca i8, align 1
  %142 = alloca i64, align 8
  %143 = alloca i64, align 8
  %144 = alloca ptr, align 8
  %145 = alloca ptr, align 8
  %146 = alloca ptr, align 8
  %147 = alloca ptr, align 8
  %148 = alloca ptr, align 8
  %149 = alloca ptr, align 8
  %150 = alloca ptr, align 8
  %151 = alloca ptr, align 8
  %152 = alloca ptr, align 8
  %153 = alloca ptr, align 8
  %154 = alloca ptr, align 8
  %155 = alloca ptr, align 8
  %156 = alloca ptr, align 8
  %157 = alloca ptr, align 8
  %158 = alloca ptr, align 8
  %159 = alloca ptr, align 8
  %160 = alloca ptr, align 8
  %161 = alloca ptr, align 8
  %162 = alloca ptr, align 8
  %163 = alloca ptr, align 8
  %164 = alloca %struct.yyjson_alc, align 8
  %165 = alloca ptr, align 8
  %166 = alloca %struct.yyjson_alc, align 8
  %167 = alloca ptr, align 8
  %168 = alloca %struct.yyjson_alc, align 8
  %169 = alloca ptr, align 8
  %170 = alloca ptr, align 8
  %171 = alloca i64, align 8
  %172 = alloca i32, align 4
  %173 = alloca ptr, align 8
  %174 = alloca i32, align 4
  %175 = alloca ptr, align 8
  %176 = alloca ptr, align 8
  %177 = alloca ptr, align 8
  %178 = alloca ptr, align 8
  %179 = alloca double, align 8
  %180 = alloca double, align 8
  %181 = alloca double, align 8
  %182 = alloca i64, align 8
  %183 = alloca ptr, align 8
  %184 = alloca i64, align 8
  %185 = alloca i64, align 8
  %186 = alloca ptr, align 8
  %187 = alloca ptr, align 8
  %188 = alloca ptr, align 8
  %189 = alloca double, align 8
  %190 = alloca double, align 8
  %191 = alloca double, align 8
  %192 = alloca i32, align 4
  store ptr %0, ptr %173, align 8
  store i32 %1, ptr %174, align 4
  %193 = load i32, ptr %174, align 4
  %194 = load ptr, ptr %173, align 8
  %195 = getelementptr inbounds nuw %struct.Benchmark, ptr %194, i32 0, i32 11
  %196 = load ptr, ptr %195, align 8
  store ptr %196, ptr %175, align 8
  %197 = load ptr, ptr %175, align 8
  %198 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %197, i32 0, i32 0
  %199 = load ptr, ptr %198, align 8
  %200 = load ptr, ptr %175, align 8
  %201 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %200, i32 0, i32 0
  %202 = load ptr, ptr %201, align 8
  %203 = call i64 @strlen(ptr noundef %202)
  store ptr %199, ptr %170, align 8
  store i64 %203, ptr %171, align 8
  store i32 0, ptr %172, align 4
  %204 = load i32, ptr %172, align 4
  %205 = and i32 %204, -2
  store i32 %205, ptr %172, align 4
  %206 = load ptr, ptr %170, align 8
  %207 = ptrtoint ptr %206 to i64
  %208 = load i64, ptr %171, align 8
  %209 = load i32, ptr %172, align 4
  %210 = call ptr @yyjson_read_opts(ptr noundef %206, i64 noundef %208, i32 noundef %209, ptr noundef null, ptr noundef null)
  store ptr %210, ptr %176, align 8
  %211 = load ptr, ptr %176, align 8
  %212 = icmp ne ptr %211, null
  br i1 %212, label %214, label %213

213:                                              ; preds = %2
  br label %1106

214:                                              ; preds = %2
  %215 = load ptr, ptr %176, align 8
  store ptr %215, ptr %169, align 8
  %216 = load ptr, ptr %169, align 8
  %217 = icmp ne ptr %216, null
  br i1 %217, label %218, label %221

218:                                              ; preds = %214
  %219 = load ptr, ptr %169, align 8
  %220 = load ptr, ptr %219, align 8
  br label %222

221:                                              ; preds = %214
  br label %222

222:                                              ; preds = %218, %221
  %223 = phi ptr [ %220, %218 ], [ null, %221 ]
  store ptr %223, ptr %177, align 8
  %224 = load ptr, ptr %177, align 8
  %225 = icmp ne ptr %224, null
  br i1 %225, label %254, label %226

226:                                              ; preds = %222
  %227 = load ptr, ptr %176, align 8
  store ptr %227, ptr %163, align 8
  %228 = load ptr, ptr %163, align 8
  %229 = icmp ne ptr %228, null
  br i1 %229, label %230, label %253

230:                                              ; preds = %226
  %231 = load ptr, ptr %163, align 8
  %232 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %231, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %164, ptr align 8 %232, i64 32, i1 false)
  %233 = load ptr, ptr %163, align 8
  %234 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %233, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %234, i8 0, i64 32, i1 false)
  %235 = load ptr, ptr %163, align 8
  %236 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %235, i32 0, i32 4
  %237 = load ptr, ptr %236, align 8
  %238 = icmp ne ptr %237, null
  br i1 %238, label %239, label %247

239:                                              ; preds = %230
  %240 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %164, i32 0, i32 2
  %241 = load ptr, ptr %240, align 8
  %242 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %164, i32 0, i32 3
  %243 = load ptr, ptr %242, align 8
  %244 = load ptr, ptr %163, align 8
  %245 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %244, i32 0, i32 4
  %246 = load ptr, ptr %245, align 8
  call void %241(ptr noundef %243, ptr noundef %246)
  br label %247

247:                                              ; preds = %239, %230
  %248 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %164, i32 0, i32 2
  %249 = load ptr, ptr %248, align 8
  %250 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %164, i32 0, i32 3
  %251 = load ptr, ptr %250, align 8
  %252 = load ptr, ptr %163, align 8
  call void %249(ptr noundef %251, ptr noundef %252)
  br label %253

253:                                              ; preds = %226, %247
  br label %1106

254:                                              ; preds = %222
  %255 = load ptr, ptr %177, align 8
  store ptr %255, ptr %155, align 8
  store ptr @.str.1, ptr %156, align 8
  %256 = load ptr, ptr %155, align 8
  %257 = load ptr, ptr %156, align 8
  %258 = load ptr, ptr %156, align 8
  %259 = icmp ne ptr %258, null
  br i1 %259, label %260, label %263

260:                                              ; preds = %254
  %261 = load ptr, ptr %156, align 8
  %262 = call i64 @strlen(ptr noundef %261)
  br label %264

263:                                              ; preds = %254
  br label %264

264:                                              ; preds = %260, %263
  %265 = phi i64 [ %262, %260 ], [ 0, %263 ]
  store ptr %256, ptr %121, align 8
  store ptr %257, ptr %122, align 8
  store i64 %265, ptr %123, align 8
  %266 = load ptr, ptr %121, align 8
  store ptr %266, ptr %119, align 8
  %267 = load ptr, ptr %119, align 8
  %268 = icmp ne ptr %267, null
  br i1 %268, label %269, label %282

269:                                              ; preds = %264
  %270 = load ptr, ptr %119, align 8
  store ptr %270, ptr %112, align 8
  %271 = load ptr, ptr %112, align 8
  store ptr %271, ptr %110, align 8
  %272 = load ptr, ptr %110, align 8
  %273 = load i64, ptr %272, align 8
  %274 = trunc i64 %273 to i8
  store i8 %274, ptr %111, align 1
  %275 = load i8, ptr %111, align 1
  %276 = zext i8 %275 to i32
  %277 = and i32 %276, 7
  %278 = trunc i32 %277 to i8
  %279 = zext i8 %278 to i32
  %280 = icmp eq i32 %279, 7
  %281 = zext i1 %280 to i32
  br label %283

282:                                              ; preds = %264
  br label %283

283:                                              ; preds = %282, %269
  %284 = phi i32 [ %281, %269 ], [ 0, %282 ]
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %286, label %289

286:                                              ; preds = %283
  %287 = load ptr, ptr %122, align 8
  %288 = icmp ne ptr %287, null
  br label %289

289:                                              ; preds = %286, %283
  %290 = phi i1 [ false, %283 ], [ %288, %286 ]
  %291 = xor i1 %290, true
  %292 = zext i1 %290 to i32
  %293 = sext i32 %292 to i64
  br i1 %290, label %294, label %366

294:                                              ; preds = %289
  %295 = load ptr, ptr %121, align 8
  store ptr %295, ptr %113, align 8
  %296 = load ptr, ptr %113, align 8
  %297 = load i64, ptr %296, align 8
  %298 = lshr i64 %297, 8
  store i64 %298, ptr %124, align 8
  %299 = load ptr, ptr %121, align 8
  store ptr %299, ptr %58, align 8
  %300 = load ptr, ptr %58, align 8
  %301 = ptrtoint ptr %300 to i64
  %302 = getelementptr inbounds %struct.yyjson_val, ptr %300, i64 1
  store ptr %302, ptr %125, align 8
  br label %303

303:                                              ; preds = %358, %294
  %304 = load i64, ptr %124, align 8
  %305 = add i64 %304, -1
  store i64 %305, ptr %124, align 8
  %306 = icmp ugt i64 %304, 0
  br i1 %306, label %307, label %365

307:                                              ; preds = %303
  %308 = load ptr, ptr %125, align 8
  %309 = load ptr, ptr %122, align 8
  %310 = load i64, ptr %123, align 8
  store ptr %308, ptr %42, align 8
  store ptr %309, ptr %43, align 8
  store i64 %310, ptr %44, align 8
  %311 = load ptr, ptr %42, align 8
  store ptr %311, ptr %41, align 8
  %312 = load ptr, ptr %41, align 8
  %313 = load i64, ptr %312, align 8
  %314 = lshr i64 %313, 8
  %315 = load i64, ptr %44, align 8
  %316 = icmp eq i64 %314, %315
  br i1 %316, label %317, label %325

317:                                              ; preds = %307
  %318 = load ptr, ptr %42, align 8
  %319 = getelementptr inbounds nuw %struct.yyjson_val, ptr %318, i32 0, i32 1
  %320 = load ptr, ptr %319, align 8
  %321 = load ptr, ptr %43, align 8
  %322 = load i64, ptr %44, align 8
  %323 = call i32 @memcmp(ptr noundef %320, ptr noundef %321, i64 noundef %322)
  %324 = icmp eq i32 %323, 0
  br label %325

325:                                              ; preds = %307, %317
  %326 = phi i1 [ false, %307 ], [ %324, %317 ]
  br i1 %326, label %327, label %330

327:                                              ; preds = %325
  %328 = load ptr, ptr %125, align 8
  %329 = getelementptr inbounds %struct.yyjson_val, ptr %328, i64 1
  store ptr %329, ptr %120, align 8
  br label %367

330:                                              ; preds = %325
  %331 = load ptr, ptr %125, align 8
  %332 = getelementptr inbounds %struct.yyjson_val, ptr %331, i64 1
  store ptr %332, ptr %114, align 8
  %333 = load ptr, ptr %114, align 8
  store ptr %333, ptr %9, align 8
  store i8 6, ptr %10, align 1
  %334 = load ptr, ptr %9, align 8
  store ptr %334, ptr %7, align 8
  %335 = load ptr, ptr %7, align 8
  %336 = load i64, ptr %335, align 8
  %337 = trunc i64 %336 to i8
  store i8 %337, ptr %8, align 1
  %338 = load i8, ptr %8, align 1
  %339 = zext i8 %338 to i32
  %340 = and i32 %339, 255
  %341 = trunc i32 %340 to i8
  %342 = zext i8 %341 to i32
  %343 = load i8, ptr %10, align 1
  %344 = zext i8 %343 to i32
  %345 = and i32 %342, %344
  %346 = load i8, ptr %10, align 1
  %347 = zext i8 %346 to i32
  %348 = icmp eq i32 %345, %347
  %349 = zext i1 %348 to i8
  store i8 %349, ptr %115, align 1
  %350 = load ptr, ptr %114, align 8
  %351 = getelementptr inbounds nuw %struct.yyjson_val, ptr %350, i32 0, i32 1
  %352 = load i64, ptr %351, align 8
  store i64 %352, ptr %116, align 8
  %353 = load i8, ptr %115, align 1
  %354 = trunc i8 %353 to i1
  br i1 %354, label %355, label %357

355:                                              ; preds = %330
  %356 = load i64, ptr %116, align 8
  br label %358

357:                                              ; preds = %330
  br label %358

358:                                              ; preds = %357, %355
  %359 = phi i64 [ %356, %355 ], [ 16, %357 ]
  store i64 %359, ptr %117, align 8
  %360 = load ptr, ptr %114, align 8
  %361 = ptrtoint ptr %360 to i64
  store ptr %360, ptr %118, align 8
  %362 = load ptr, ptr %118, align 8
  %363 = load i64, ptr %117, align 8
  %364 = getelementptr inbounds nuw i8, ptr %362, i64 %363
  store ptr %364, ptr %125, align 8
  br label %303, !llvm.loop !9

365:                                              ; preds = %303
  br label %366

366:                                              ; preds = %365, %289
  store ptr null, ptr %120, align 8
  br label %367

367:                                              ; preds = %327, %366
  %368 = load ptr, ptr %120, align 8
  store ptr %368, ptr %178, align 8
  %369 = load ptr, ptr %178, align 8
  %370 = icmp ne ptr %369, null
  br i1 %370, label %371, label %392

371:                                              ; preds = %367
  %372 = load ptr, ptr %178, align 8
  store ptr %372, ptr %154, align 8
  %373 = load ptr, ptr %154, align 8
  %374 = icmp ne ptr %373, null
  br i1 %374, label %375, label %388

375:                                              ; preds = %371
  %376 = load ptr, ptr %154, align 8
  store ptr %376, ptr %128, align 8
  %377 = load ptr, ptr %128, align 8
  store ptr %377, ptr %126, align 8
  %378 = load ptr, ptr %126, align 8
  %379 = load i64, ptr %378, align 8
  %380 = trunc i64 %379 to i8
  store i8 %380, ptr %127, align 1
  %381 = load i8, ptr %127, align 1
  %382 = zext i8 %381 to i32
  %383 = and i32 %382, 7
  %384 = trunc i32 %383 to i8
  %385 = zext i8 %384 to i32
  %386 = icmp eq i32 %385, 6
  %387 = zext i1 %386 to i32
  br label %389

388:                                              ; preds = %371
  br label %389

389:                                              ; preds = %375, %388
  %390 = phi i32 [ %387, %375 ], [ 0, %388 ]
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %420, label %392

392:                                              ; preds = %389, %367
  %393 = load ptr, ptr %176, align 8
  store ptr %393, ptr %165, align 8
  %394 = load ptr, ptr %165, align 8
  %395 = icmp ne ptr %394, null
  br i1 %395, label %396, label %419

396:                                              ; preds = %392
  %397 = load ptr, ptr %165, align 8
  %398 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %397, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %166, ptr align 8 %398, i64 32, i1 false)
  %399 = load ptr, ptr %165, align 8
  %400 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %399, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %400, i8 0, i64 32, i1 false)
  %401 = load ptr, ptr %165, align 8
  %402 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %401, i32 0, i32 4
  %403 = load ptr, ptr %402, align 8
  %404 = icmp ne ptr %403, null
  br i1 %404, label %405, label %413

405:                                              ; preds = %396
  %406 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %166, i32 0, i32 2
  %407 = load ptr, ptr %406, align 8
  %408 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %166, i32 0, i32 3
  %409 = load ptr, ptr %408, align 8
  %410 = load ptr, ptr %165, align 8
  %411 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %410, i32 0, i32 4
  %412 = load ptr, ptr %411, align 8
  call void %407(ptr noundef %409, ptr noundef %412)
  br label %413

413:                                              ; preds = %405, %396
  %414 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %166, i32 0, i32 2
  %415 = load ptr, ptr %414, align 8
  %416 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %166, i32 0, i32 3
  %417 = load ptr, ptr %416, align 8
  %418 = load ptr, ptr %165, align 8
  call void %415(ptr noundef %417, ptr noundef %418)
  br label %419

419:                                              ; preds = %392, %413
  br label %1106

420:                                              ; preds = %389
  store double 0.000000e+00, ptr %179, align 8
  store double 0.000000e+00, ptr %180, align 8
  store double 0.000000e+00, ptr %181, align 8
  store i64 0, ptr %182, align 8
  store i64 0, ptr %184, align 8
  %421 = load ptr, ptr %178, align 8
  store ptr %421, ptr %153, align 8
  %422 = load ptr, ptr %153, align 8
  store ptr %422, ptr %152, align 8
  %423 = load ptr, ptr %152, align 8
  %424 = icmp ne ptr %423, null
  br i1 %424, label %425, label %438

425:                                              ; preds = %420
  %426 = load ptr, ptr %152, align 8
  store ptr %426, ptr %131, align 8
  %427 = load ptr, ptr %131, align 8
  store ptr %427, ptr %129, align 8
  %428 = load ptr, ptr %129, align 8
  %429 = load i64, ptr %428, align 8
  %430 = trunc i64 %429 to i8
  store i8 %430, ptr %130, align 1
  %431 = load i8, ptr %130, align 1
  %432 = zext i8 %431 to i32
  %433 = and i32 %432, 7
  %434 = trunc i32 %433 to i8
  %435 = zext i8 %434 to i32
  %436 = icmp eq i32 %435, 6
  %437 = zext i1 %436 to i32
  br label %439

438:                                              ; preds = %420
  br label %439

439:                                              ; preds = %438, %425
  %440 = phi i32 [ %437, %425 ], [ 0, %438 ]
  %441 = icmp ne i32 %440, 0
  br i1 %441, label %442, label %447

442:                                              ; preds = %439
  %443 = load ptr, ptr %153, align 8
  store ptr %443, ptr %138, align 8
  %444 = load ptr, ptr %138, align 8
  %445 = load i64, ptr %444, align 8
  %446 = lshr i64 %445, 8
  br label %448

447:                                              ; preds = %439
  br label %448

448:                                              ; preds = %442, %447
  %449 = phi i64 [ %446, %442 ], [ 0, %447 ]
  store i64 %449, ptr %185, align 8
  %450 = load ptr, ptr %178, align 8
  store ptr %450, ptr %151, align 8
  %451 = load ptr, ptr %151, align 8
  store ptr %451, ptr %149, align 8
  %452 = load ptr, ptr %149, align 8
  %453 = icmp ne ptr %452, null
  br i1 %453, label %454, label %467

454:                                              ; preds = %448
  %455 = load ptr, ptr %149, align 8
  store ptr %455, ptr %134, align 8
  %456 = load ptr, ptr %134, align 8
  store ptr %456, ptr %132, align 8
  %457 = load ptr, ptr %132, align 8
  %458 = load i64, ptr %457, align 8
  %459 = trunc i64 %458 to i8
  store i8 %459, ptr %133, align 1
  %460 = load i8, ptr %133, align 1
  %461 = zext i8 %460 to i32
  %462 = and i32 %461, 7
  %463 = trunc i32 %462 to i8
  %464 = zext i8 %463 to i32
  %465 = icmp eq i32 %464, 6
  %466 = zext i1 %465 to i32
  br label %468

467:                                              ; preds = %448
  br label %468

468:                                              ; preds = %467, %454
  %469 = phi i32 [ %466, %454 ], [ 0, %467 ]
  %470 = icmp ne i32 %469, 0
  %471 = xor i1 %470, true
  %472 = zext i1 %470 to i32
  %473 = sext i32 %472 to i64
  br i1 %470, label %474, label %489

474:                                              ; preds = %468
  %475 = load ptr, ptr %151, align 8
  store ptr %475, ptr %139, align 8
  %476 = load ptr, ptr %139, align 8
  %477 = load i64, ptr %476, align 8
  %478 = lshr i64 %477, 8
  %479 = icmp ugt i64 %478, 0
  %480 = xor i1 %479, true
  %481 = zext i1 %479 to i32
  %482 = sext i32 %481 to i64
  br i1 %479, label %483, label %488

483:                                              ; preds = %474
  %484 = load ptr, ptr %151, align 8
  store ptr %484, ptr %57, align 8
  %485 = load ptr, ptr %57, align 8
  %486 = ptrtoint ptr %485 to i64
  %487 = getelementptr inbounds %struct.yyjson_val, ptr %485, i64 1
  store ptr %487, ptr %150, align 8
  br label %490

488:                                              ; preds = %474
  br label %489

489:                                              ; preds = %488, %468
  store ptr null, ptr %150, align 8
  br label %490

490:                                              ; preds = %483, %489
  %491 = load ptr, ptr %150, align 8
  store ptr %491, ptr %183, align 8
  br label %492

492:                                              ; preds = %1043, %490
  %493 = load i64, ptr %184, align 8
  %494 = load i64, ptr %185, align 8
  %495 = icmp ult i64 %493, %494
  br i1 %495, label %496, label %1050

496:                                              ; preds = %492
  %497 = load ptr, ptr %183, align 8
  store ptr %497, ptr %148, align 8
  %498 = load ptr, ptr %148, align 8
  %499 = icmp ne ptr %498, null
  br i1 %499, label %500, label %513

500:                                              ; preds = %496
  %501 = load ptr, ptr %148, align 8
  store ptr %501, ptr %137, align 8
  %502 = load ptr, ptr %137, align 8
  store ptr %502, ptr %135, align 8
  %503 = load ptr, ptr %135, align 8
  %504 = load i64, ptr %503, align 8
  %505 = trunc i64 %504 to i8
  store i8 %505, ptr %136, align 1
  %506 = load i8, ptr %136, align 1
  %507 = zext i8 %506 to i32
  %508 = and i32 %507, 7
  %509 = trunc i32 %508 to i8
  %510 = zext i8 %509 to i32
  %511 = icmp eq i32 %510, 7
  %512 = zext i1 %511 to i32
  br label %514

513:                                              ; preds = %496
  br label %514

514:                                              ; preds = %500, %513
  %515 = phi i32 [ %512, %500 ], [ 0, %513 ]
  %516 = icmp ne i32 %515, 0
  br i1 %516, label %518, label %517

517:                                              ; preds = %514
  br label %1014

518:                                              ; preds = %514
  %519 = load ptr, ptr %183, align 8
  store ptr %519, ptr %157, align 8
  store ptr @.str.2, ptr %158, align 8
  %520 = load ptr, ptr %157, align 8
  %521 = load ptr, ptr %158, align 8
  %522 = load ptr, ptr %158, align 8
  %523 = icmp ne ptr %522, null
  br i1 %523, label %524, label %527

524:                                              ; preds = %518
  %525 = load ptr, ptr %158, align 8
  %526 = call i64 @strlen(ptr noundef %525)
  br label %528

527:                                              ; preds = %518
  br label %528

528:                                              ; preds = %524, %527
  %529 = phi i64 [ %526, %524 ], [ 0, %527 ]
  store ptr %520, ptr %105, align 8
  store ptr %521, ptr %106, align 8
  store i64 %529, ptr %107, align 8
  %530 = load ptr, ptr %105, align 8
  store ptr %530, ptr %103, align 8
  %531 = load ptr, ptr %103, align 8
  %532 = icmp ne ptr %531, null
  br i1 %532, label %533, label %546

533:                                              ; preds = %528
  %534 = load ptr, ptr %103, align 8
  store ptr %534, ptr %96, align 8
  %535 = load ptr, ptr %96, align 8
  store ptr %535, ptr %94, align 8
  %536 = load ptr, ptr %94, align 8
  %537 = load i64, ptr %536, align 8
  %538 = trunc i64 %537 to i8
  store i8 %538, ptr %95, align 1
  %539 = load i8, ptr %95, align 1
  %540 = zext i8 %539 to i32
  %541 = and i32 %540, 7
  %542 = trunc i32 %541 to i8
  %543 = zext i8 %542 to i32
  %544 = icmp eq i32 %543, 7
  %545 = zext i1 %544 to i32
  br label %547

546:                                              ; preds = %528
  br label %547

547:                                              ; preds = %546, %533
  %548 = phi i32 [ %545, %533 ], [ 0, %546 ]
  %549 = icmp ne i32 %548, 0
  br i1 %549, label %550, label %553

550:                                              ; preds = %547
  %551 = load ptr, ptr %106, align 8
  %552 = icmp ne ptr %551, null
  br label %553

553:                                              ; preds = %550, %547
  %554 = phi i1 [ false, %547 ], [ %552, %550 ]
  %555 = xor i1 %554, true
  %556 = zext i1 %554 to i32
  %557 = sext i32 %556 to i64
  br i1 %554, label %558, label %630

558:                                              ; preds = %553
  %559 = load ptr, ptr %105, align 8
  store ptr %559, ptr %97, align 8
  %560 = load ptr, ptr %97, align 8
  %561 = load i64, ptr %560, align 8
  %562 = lshr i64 %561, 8
  store i64 %562, ptr %108, align 8
  %563 = load ptr, ptr %105, align 8
  store ptr %563, ptr %59, align 8
  %564 = load ptr, ptr %59, align 8
  %565 = ptrtoint ptr %564 to i64
  %566 = getelementptr inbounds %struct.yyjson_val, ptr %564, i64 1
  store ptr %566, ptr %109, align 8
  br label %567

567:                                              ; preds = %622, %558
  %568 = load i64, ptr %108, align 8
  %569 = add i64 %568, -1
  store i64 %569, ptr %108, align 8
  %570 = icmp ugt i64 %568, 0
  br i1 %570, label %571, label %629

571:                                              ; preds = %567
  %572 = load ptr, ptr %109, align 8
  %573 = load ptr, ptr %106, align 8
  %574 = load i64, ptr %107, align 8
  store ptr %572, ptr %46, align 8
  store ptr %573, ptr %47, align 8
  store i64 %574, ptr %48, align 8
  %575 = load ptr, ptr %46, align 8
  store ptr %575, ptr %45, align 8
  %576 = load ptr, ptr %45, align 8
  %577 = load i64, ptr %576, align 8
  %578 = lshr i64 %577, 8
  %579 = load i64, ptr %48, align 8
  %580 = icmp eq i64 %578, %579
  br i1 %580, label %581, label %589

581:                                              ; preds = %571
  %582 = load ptr, ptr %46, align 8
  %583 = getelementptr inbounds nuw %struct.yyjson_val, ptr %582, i32 0, i32 1
  %584 = load ptr, ptr %583, align 8
  %585 = load ptr, ptr %47, align 8
  %586 = load i64, ptr %48, align 8
  %587 = call i32 @memcmp(ptr noundef %584, ptr noundef %585, i64 noundef %586)
  %588 = icmp eq i32 %587, 0
  br label %589

589:                                              ; preds = %571, %581
  %590 = phi i1 [ false, %571 ], [ %588, %581 ]
  br i1 %590, label %591, label %594

591:                                              ; preds = %589
  %592 = load ptr, ptr %109, align 8
  %593 = getelementptr inbounds %struct.yyjson_val, ptr %592, i64 1
  store ptr %593, ptr %104, align 8
  br label %631

594:                                              ; preds = %589
  %595 = load ptr, ptr %109, align 8
  %596 = getelementptr inbounds %struct.yyjson_val, ptr %595, i64 1
  store ptr %596, ptr %98, align 8
  %597 = load ptr, ptr %98, align 8
  store ptr %597, ptr %13, align 8
  store i8 6, ptr %14, align 1
  %598 = load ptr, ptr %13, align 8
  store ptr %598, ptr %11, align 8
  %599 = load ptr, ptr %11, align 8
  %600 = load i64, ptr %599, align 8
  %601 = trunc i64 %600 to i8
  store i8 %601, ptr %12, align 1
  %602 = load i8, ptr %12, align 1
  %603 = zext i8 %602 to i32
  %604 = and i32 %603, 255
  %605 = trunc i32 %604 to i8
  %606 = zext i8 %605 to i32
  %607 = load i8, ptr %14, align 1
  %608 = zext i8 %607 to i32
  %609 = and i32 %606, %608
  %610 = load i8, ptr %14, align 1
  %611 = zext i8 %610 to i32
  %612 = icmp eq i32 %609, %611
  %613 = zext i1 %612 to i8
  store i8 %613, ptr %99, align 1
  %614 = load ptr, ptr %98, align 8
  %615 = getelementptr inbounds nuw %struct.yyjson_val, ptr %614, i32 0, i32 1
  %616 = load i64, ptr %615, align 8
  store i64 %616, ptr %100, align 8
  %617 = load i8, ptr %99, align 1
  %618 = trunc i8 %617 to i1
  br i1 %618, label %619, label %621

619:                                              ; preds = %594
  %620 = load i64, ptr %100, align 8
  br label %622

621:                                              ; preds = %594
  br label %622

622:                                              ; preds = %621, %619
  %623 = phi i64 [ %620, %619 ], [ 16, %621 ]
  store i64 %623, ptr %101, align 8
  %624 = load ptr, ptr %98, align 8
  %625 = ptrtoint ptr %624 to i64
  store ptr %624, ptr %102, align 8
  %626 = load ptr, ptr %102, align 8
  %627 = load i64, ptr %101, align 8
  %628 = getelementptr inbounds nuw i8, ptr %626, i64 %627
  store ptr %628, ptr %109, align 8
  br label %567, !llvm.loop !9

629:                                              ; preds = %567
  br label %630

630:                                              ; preds = %629, %553
  store ptr null, ptr %104, align 8
  br label %631

631:                                              ; preds = %591, %630
  %632 = load ptr, ptr %104, align 8
  store ptr %632, ptr %186, align 8
  %633 = load ptr, ptr %183, align 8
  store ptr %633, ptr %159, align 8
  store ptr @.str.3, ptr %160, align 8
  %634 = load ptr, ptr %159, align 8
  %635 = load ptr, ptr %160, align 8
  %636 = load ptr, ptr %160, align 8
  %637 = icmp ne ptr %636, null
  br i1 %637, label %638, label %641

638:                                              ; preds = %631
  %639 = load ptr, ptr %160, align 8
  %640 = call i64 @strlen(ptr noundef %639)
  br label %642

641:                                              ; preds = %631
  br label %642

642:                                              ; preds = %638, %641
  %643 = phi i64 [ %640, %638 ], [ 0, %641 ]
  store ptr %634, ptr %89, align 8
  store ptr %635, ptr %90, align 8
  store i64 %643, ptr %91, align 8
  %644 = load ptr, ptr %89, align 8
  store ptr %644, ptr %87, align 8
  %645 = load ptr, ptr %87, align 8
  %646 = icmp ne ptr %645, null
  br i1 %646, label %647, label %660

647:                                              ; preds = %642
  %648 = load ptr, ptr %87, align 8
  store ptr %648, ptr %80, align 8
  %649 = load ptr, ptr %80, align 8
  store ptr %649, ptr %78, align 8
  %650 = load ptr, ptr %78, align 8
  %651 = load i64, ptr %650, align 8
  %652 = trunc i64 %651 to i8
  store i8 %652, ptr %79, align 1
  %653 = load i8, ptr %79, align 1
  %654 = zext i8 %653 to i32
  %655 = and i32 %654, 7
  %656 = trunc i32 %655 to i8
  %657 = zext i8 %656 to i32
  %658 = icmp eq i32 %657, 7
  %659 = zext i1 %658 to i32
  br label %661

660:                                              ; preds = %642
  br label %661

661:                                              ; preds = %660, %647
  %662 = phi i32 [ %659, %647 ], [ 0, %660 ]
  %663 = icmp ne i32 %662, 0
  br i1 %663, label %664, label %667

664:                                              ; preds = %661
  %665 = load ptr, ptr %90, align 8
  %666 = icmp ne ptr %665, null
  br label %667

667:                                              ; preds = %664, %661
  %668 = phi i1 [ false, %661 ], [ %666, %664 ]
  %669 = xor i1 %668, true
  %670 = zext i1 %668 to i32
  %671 = sext i32 %670 to i64
  br i1 %668, label %672, label %744

672:                                              ; preds = %667
  %673 = load ptr, ptr %89, align 8
  store ptr %673, ptr %81, align 8
  %674 = load ptr, ptr %81, align 8
  %675 = load i64, ptr %674, align 8
  %676 = lshr i64 %675, 8
  store i64 %676, ptr %92, align 8
  %677 = load ptr, ptr %89, align 8
  store ptr %677, ptr %60, align 8
  %678 = load ptr, ptr %60, align 8
  %679 = ptrtoint ptr %678 to i64
  %680 = getelementptr inbounds %struct.yyjson_val, ptr %678, i64 1
  store ptr %680, ptr %93, align 8
  br label %681

681:                                              ; preds = %736, %672
  %682 = load i64, ptr %92, align 8
  %683 = add i64 %682, -1
  store i64 %683, ptr %92, align 8
  %684 = icmp ugt i64 %682, 0
  br i1 %684, label %685, label %743

685:                                              ; preds = %681
  %686 = load ptr, ptr %93, align 8
  %687 = load ptr, ptr %90, align 8
  %688 = load i64, ptr %91, align 8
  store ptr %686, ptr %50, align 8
  store ptr %687, ptr %51, align 8
  store i64 %688, ptr %52, align 8
  %689 = load ptr, ptr %50, align 8
  store ptr %689, ptr %49, align 8
  %690 = load ptr, ptr %49, align 8
  %691 = load i64, ptr %690, align 8
  %692 = lshr i64 %691, 8
  %693 = load i64, ptr %52, align 8
  %694 = icmp eq i64 %692, %693
  br i1 %694, label %695, label %703

695:                                              ; preds = %685
  %696 = load ptr, ptr %50, align 8
  %697 = getelementptr inbounds nuw %struct.yyjson_val, ptr %696, i32 0, i32 1
  %698 = load ptr, ptr %697, align 8
  %699 = load ptr, ptr %51, align 8
  %700 = load i64, ptr %52, align 8
  %701 = call i32 @memcmp(ptr noundef %698, ptr noundef %699, i64 noundef %700)
  %702 = icmp eq i32 %701, 0
  br label %703

703:                                              ; preds = %685, %695
  %704 = phi i1 [ false, %685 ], [ %702, %695 ]
  br i1 %704, label %705, label %708

705:                                              ; preds = %703
  %706 = load ptr, ptr %93, align 8
  %707 = getelementptr inbounds %struct.yyjson_val, ptr %706, i64 1
  store ptr %707, ptr %88, align 8
  br label %745

708:                                              ; preds = %703
  %709 = load ptr, ptr %93, align 8
  %710 = getelementptr inbounds %struct.yyjson_val, ptr %709, i64 1
  store ptr %710, ptr %82, align 8
  %711 = load ptr, ptr %82, align 8
  store ptr %711, ptr %17, align 8
  store i8 6, ptr %18, align 1
  %712 = load ptr, ptr %17, align 8
  store ptr %712, ptr %15, align 8
  %713 = load ptr, ptr %15, align 8
  %714 = load i64, ptr %713, align 8
  %715 = trunc i64 %714 to i8
  store i8 %715, ptr %16, align 1
  %716 = load i8, ptr %16, align 1
  %717 = zext i8 %716 to i32
  %718 = and i32 %717, 255
  %719 = trunc i32 %718 to i8
  %720 = zext i8 %719 to i32
  %721 = load i8, ptr %18, align 1
  %722 = zext i8 %721 to i32
  %723 = and i32 %720, %722
  %724 = load i8, ptr %18, align 1
  %725 = zext i8 %724 to i32
  %726 = icmp eq i32 %723, %725
  %727 = zext i1 %726 to i8
  store i8 %727, ptr %83, align 1
  %728 = load ptr, ptr %82, align 8
  %729 = getelementptr inbounds nuw %struct.yyjson_val, ptr %728, i32 0, i32 1
  %730 = load i64, ptr %729, align 8
  store i64 %730, ptr %84, align 8
  %731 = load i8, ptr %83, align 1
  %732 = trunc i8 %731 to i1
  br i1 %732, label %733, label %735

733:                                              ; preds = %708
  %734 = load i64, ptr %84, align 8
  br label %736

735:                                              ; preds = %708
  br label %736

736:                                              ; preds = %735, %733
  %737 = phi i64 [ %734, %733 ], [ 16, %735 ]
  store i64 %737, ptr %85, align 8
  %738 = load ptr, ptr %82, align 8
  %739 = ptrtoint ptr %738 to i64
  store ptr %738, ptr %86, align 8
  %740 = load ptr, ptr %86, align 8
  %741 = load i64, ptr %85, align 8
  %742 = getelementptr inbounds nuw i8, ptr %740, i64 %741
  store ptr %742, ptr %93, align 8
  br label %681, !llvm.loop !9

743:                                              ; preds = %681
  br label %744

744:                                              ; preds = %743, %667
  store ptr null, ptr %88, align 8
  br label %745

745:                                              ; preds = %705, %744
  %746 = load ptr, ptr %88, align 8
  store ptr %746, ptr %187, align 8
  %747 = load ptr, ptr %183, align 8
  store ptr %747, ptr %161, align 8
  store ptr @.str.4, ptr %162, align 8
  %748 = load ptr, ptr %161, align 8
  %749 = load ptr, ptr %162, align 8
  %750 = load ptr, ptr %162, align 8
  %751 = icmp ne ptr %750, null
  br i1 %751, label %752, label %755

752:                                              ; preds = %745
  %753 = load ptr, ptr %162, align 8
  %754 = call i64 @strlen(ptr noundef %753)
  br label %756

755:                                              ; preds = %745
  br label %756

756:                                              ; preds = %752, %755
  %757 = phi i64 [ %754, %752 ], [ 0, %755 ]
  store ptr %748, ptr %73, align 8
  store ptr %749, ptr %74, align 8
  store i64 %757, ptr %75, align 8
  %758 = load ptr, ptr %73, align 8
  store ptr %758, ptr %71, align 8
  %759 = load ptr, ptr %71, align 8
  %760 = icmp ne ptr %759, null
  br i1 %760, label %761, label %774

761:                                              ; preds = %756
  %762 = load ptr, ptr %71, align 8
  store ptr %762, ptr %64, align 8
  %763 = load ptr, ptr %64, align 8
  store ptr %763, ptr %62, align 8
  %764 = load ptr, ptr %62, align 8
  %765 = load i64, ptr %764, align 8
  %766 = trunc i64 %765 to i8
  store i8 %766, ptr %63, align 1
  %767 = load i8, ptr %63, align 1
  %768 = zext i8 %767 to i32
  %769 = and i32 %768, 7
  %770 = trunc i32 %769 to i8
  %771 = zext i8 %770 to i32
  %772 = icmp eq i32 %771, 7
  %773 = zext i1 %772 to i32
  br label %775

774:                                              ; preds = %756
  br label %775

775:                                              ; preds = %774, %761
  %776 = phi i32 [ %773, %761 ], [ 0, %774 ]
  %777 = icmp ne i32 %776, 0
  br i1 %777, label %778, label %781

778:                                              ; preds = %775
  %779 = load ptr, ptr %74, align 8
  %780 = icmp ne ptr %779, null
  br label %781

781:                                              ; preds = %778, %775
  %782 = phi i1 [ false, %775 ], [ %780, %778 ]
  %783 = xor i1 %782, true
  %784 = zext i1 %782 to i32
  %785 = sext i32 %784 to i64
  br i1 %782, label %786, label %858

786:                                              ; preds = %781
  %787 = load ptr, ptr %73, align 8
  store ptr %787, ptr %65, align 8
  %788 = load ptr, ptr %65, align 8
  %789 = load i64, ptr %788, align 8
  %790 = lshr i64 %789, 8
  store i64 %790, ptr %76, align 8
  %791 = load ptr, ptr %73, align 8
  store ptr %791, ptr %61, align 8
  %792 = load ptr, ptr %61, align 8
  %793 = ptrtoint ptr %792 to i64
  %794 = getelementptr inbounds %struct.yyjson_val, ptr %792, i64 1
  store ptr %794, ptr %77, align 8
  br label %795

795:                                              ; preds = %850, %786
  %796 = load i64, ptr %76, align 8
  %797 = add i64 %796, -1
  store i64 %797, ptr %76, align 8
  %798 = icmp ugt i64 %796, 0
  br i1 %798, label %799, label %857

799:                                              ; preds = %795
  %800 = load ptr, ptr %77, align 8
  %801 = load ptr, ptr %74, align 8
  %802 = load i64, ptr %75, align 8
  store ptr %800, ptr %54, align 8
  store ptr %801, ptr %55, align 8
  store i64 %802, ptr %56, align 8
  %803 = load ptr, ptr %54, align 8
  store ptr %803, ptr %53, align 8
  %804 = load ptr, ptr %53, align 8
  %805 = load i64, ptr %804, align 8
  %806 = lshr i64 %805, 8
  %807 = load i64, ptr %56, align 8
  %808 = icmp eq i64 %806, %807
  br i1 %808, label %809, label %817

809:                                              ; preds = %799
  %810 = load ptr, ptr %54, align 8
  %811 = getelementptr inbounds nuw %struct.yyjson_val, ptr %810, i32 0, i32 1
  %812 = load ptr, ptr %811, align 8
  %813 = load ptr, ptr %55, align 8
  %814 = load i64, ptr %56, align 8
  %815 = call i32 @memcmp(ptr noundef %812, ptr noundef %813, i64 noundef %814)
  %816 = icmp eq i32 %815, 0
  br label %817

817:                                              ; preds = %799, %809
  %818 = phi i1 [ false, %799 ], [ %816, %809 ]
  br i1 %818, label %819, label %822

819:                                              ; preds = %817
  %820 = load ptr, ptr %77, align 8
  %821 = getelementptr inbounds %struct.yyjson_val, ptr %820, i64 1
  store ptr %821, ptr %72, align 8
  br label %859

822:                                              ; preds = %817
  %823 = load ptr, ptr %77, align 8
  %824 = getelementptr inbounds %struct.yyjson_val, ptr %823, i64 1
  store ptr %824, ptr %66, align 8
  %825 = load ptr, ptr %66, align 8
  store ptr %825, ptr %21, align 8
  store i8 6, ptr %22, align 1
  %826 = load ptr, ptr %21, align 8
  store ptr %826, ptr %19, align 8
  %827 = load ptr, ptr %19, align 8
  %828 = load i64, ptr %827, align 8
  %829 = trunc i64 %828 to i8
  store i8 %829, ptr %20, align 1
  %830 = load i8, ptr %20, align 1
  %831 = zext i8 %830 to i32
  %832 = and i32 %831, 255
  %833 = trunc i32 %832 to i8
  %834 = zext i8 %833 to i32
  %835 = load i8, ptr %22, align 1
  %836 = zext i8 %835 to i32
  %837 = and i32 %834, %836
  %838 = load i8, ptr %22, align 1
  %839 = zext i8 %838 to i32
  %840 = icmp eq i32 %837, %839
  %841 = zext i1 %840 to i8
  store i8 %841, ptr %67, align 1
  %842 = load ptr, ptr %66, align 8
  %843 = getelementptr inbounds nuw %struct.yyjson_val, ptr %842, i32 0, i32 1
  %844 = load i64, ptr %843, align 8
  store i64 %844, ptr %68, align 8
  %845 = load i8, ptr %67, align 1
  %846 = trunc i8 %845 to i1
  br i1 %846, label %847, label %849

847:                                              ; preds = %822
  %848 = load i64, ptr %68, align 8
  br label %850

849:                                              ; preds = %822
  br label %850

850:                                              ; preds = %849, %847
  %851 = phi i64 [ %848, %847 ], [ 16, %849 ]
  store i64 %851, ptr %69, align 8
  %852 = load ptr, ptr %66, align 8
  %853 = ptrtoint ptr %852 to i64
  store ptr %852, ptr %70, align 8
  %854 = load ptr, ptr %70, align 8
  %855 = load i64, ptr %69, align 8
  %856 = getelementptr inbounds nuw i8, ptr %854, i64 %855
  store ptr %856, ptr %77, align 8
  br label %795, !llvm.loop !9

857:                                              ; preds = %795
  br label %858

858:                                              ; preds = %857, %781
  store ptr null, ptr %72, align 8
  br label %859

859:                                              ; preds = %819, %858
  %860 = load ptr, ptr %72, align 8
  store ptr %860, ptr %188, align 8
  %861 = load ptr, ptr %186, align 8
  %862 = icmp ne ptr %861, null
  br i1 %862, label %863, label %1013

863:                                              ; preds = %859
  %864 = load ptr, ptr %187, align 8
  %865 = icmp ne ptr %864, null
  br i1 %865, label %866, label %1013

866:                                              ; preds = %863
  %867 = load ptr, ptr %188, align 8
  %868 = icmp ne ptr %867, null
  br i1 %868, label %869, label %1013

869:                                              ; preds = %866
  %870 = load ptr, ptr %186, align 8
  store ptr %870, ptr %145, align 8
  %871 = load ptr, ptr %145, align 8
  %872 = icmp ne ptr %871, null
  br i1 %872, label %873, label %912

873:                                              ; preds = %869
  %874 = load ptr, ptr %145, align 8
  store ptr %874, ptr %39, align 8
  %875 = load ptr, ptr %39, align 8
  store ptr %875, ptr %26, align 8
  %876 = load ptr, ptr %26, align 8
  %877 = load i64, ptr %876, align 8
  %878 = trunc i64 %877 to i8
  store i8 %878, ptr %27, align 1
  %879 = load i8, ptr %27, align 1
  %880 = zext i8 %879 to i32
  %881 = and i32 %880, 255
  %882 = trunc i32 %881 to i8
  store i8 %882, ptr %40, align 1
  %883 = load i8, ptr %40, align 1
  %884 = zext i8 %883 to i32
  %885 = icmp eq i32 %884, 20
  br i1 %885, label %886, label %890

886:                                              ; preds = %873
  %887 = load ptr, ptr %39, align 8
  %888 = getelementptr inbounds nuw %struct.yyjson_val, ptr %887, i32 0, i32 1
  %889 = load double, ptr %888, align 8
  store double %889, ptr %38, align 8
  br label %910

890:                                              ; preds = %873
  %891 = load i8, ptr %40, align 1
  %892 = zext i8 %891 to i32
  %893 = icmp eq i32 %892, 12
  br i1 %893, label %894, label %899

894:                                              ; preds = %890
  %895 = load ptr, ptr %39, align 8
  %896 = getelementptr inbounds nuw %struct.yyjson_val, ptr %895, i32 0, i32 1
  %897 = load i64, ptr %896, align 8
  %898 = sitofp i64 %897 to double
  store double %898, ptr %38, align 8
  br label %910

899:                                              ; preds = %890
  %900 = load i8, ptr %40, align 1
  %901 = zext i8 %900 to i32
  %902 = icmp eq i32 %901, 4
  br i1 %902, label %903, label %909

903:                                              ; preds = %899
  %904 = load ptr, ptr %39, align 8
  %905 = getelementptr inbounds nuw %struct.yyjson_val, ptr %904, i32 0, i32 1
  %906 = load i64, ptr %905, align 8
  store i64 %906, ptr %23, align 8
  %907 = load i64, ptr %23, align 8
  %908 = uitofp i64 %907 to double
  store double %908, ptr %38, align 8
  br label %910

909:                                              ; preds = %899
  store double 0.000000e+00, ptr %38, align 8
  br label %910

910:                                              ; preds = %886, %894, %903, %909
  %911 = load double, ptr %38, align 8
  br label %913

912:                                              ; preds = %869
  br label %913

913:                                              ; preds = %910, %912
  %914 = phi double [ %911, %910 ], [ 0.000000e+00, %912 ]
  %915 = load double, ptr %179, align 8
  %916 = fadd double %915, %914
  store double %916, ptr %179, align 8
  %917 = load ptr, ptr %187, align 8
  store ptr %917, ptr %146, align 8
  %918 = load ptr, ptr %146, align 8
  %919 = icmp ne ptr %918, null
  br i1 %919, label %920, label %959

920:                                              ; preds = %913
  %921 = load ptr, ptr %146, align 8
  store ptr %921, ptr %36, align 8
  %922 = load ptr, ptr %36, align 8
  store ptr %922, ptr %28, align 8
  %923 = load ptr, ptr %28, align 8
  %924 = load i64, ptr %923, align 8
  %925 = trunc i64 %924 to i8
  store i8 %925, ptr %29, align 1
  %926 = load i8, ptr %29, align 1
  %927 = zext i8 %926 to i32
  %928 = and i32 %927, 255
  %929 = trunc i32 %928 to i8
  store i8 %929, ptr %37, align 1
  %930 = load i8, ptr %37, align 1
  %931 = zext i8 %930 to i32
  %932 = icmp eq i32 %931, 20
  br i1 %932, label %933, label %937

933:                                              ; preds = %920
  %934 = load ptr, ptr %36, align 8
  %935 = getelementptr inbounds nuw %struct.yyjson_val, ptr %934, i32 0, i32 1
  %936 = load double, ptr %935, align 8
  store double %936, ptr %35, align 8
  br label %957

937:                                              ; preds = %920
  %938 = load i8, ptr %37, align 1
  %939 = zext i8 %938 to i32
  %940 = icmp eq i32 %939, 12
  br i1 %940, label %941, label %946

941:                                              ; preds = %937
  %942 = load ptr, ptr %36, align 8
  %943 = getelementptr inbounds nuw %struct.yyjson_val, ptr %942, i32 0, i32 1
  %944 = load i64, ptr %943, align 8
  %945 = sitofp i64 %944 to double
  store double %945, ptr %35, align 8
  br label %957

946:                                              ; preds = %937
  %947 = load i8, ptr %37, align 1
  %948 = zext i8 %947 to i32
  %949 = icmp eq i32 %948, 4
  br i1 %949, label %950, label %956

950:                                              ; preds = %946
  %951 = load ptr, ptr %36, align 8
  %952 = getelementptr inbounds nuw %struct.yyjson_val, ptr %951, i32 0, i32 1
  %953 = load i64, ptr %952, align 8
  store i64 %953, ptr %24, align 8
  %954 = load i64, ptr %24, align 8
  %955 = uitofp i64 %954 to double
  store double %955, ptr %35, align 8
  br label %957

956:                                              ; preds = %946
  store double 0.000000e+00, ptr %35, align 8
  br label %957

957:                                              ; preds = %933, %941, %950, %956
  %958 = load double, ptr %35, align 8
  br label %960

959:                                              ; preds = %913
  br label %960

960:                                              ; preds = %957, %959
  %961 = phi double [ %958, %957 ], [ 0.000000e+00, %959 ]
  %962 = load double, ptr %180, align 8
  %963 = fadd double %962, %961
  store double %963, ptr %180, align 8
  %964 = load ptr, ptr %188, align 8
  store ptr %964, ptr %147, align 8
  %965 = load ptr, ptr %147, align 8
  %966 = icmp ne ptr %965, null
  br i1 %966, label %967, label %1006

967:                                              ; preds = %960
  %968 = load ptr, ptr %147, align 8
  store ptr %968, ptr %33, align 8
  %969 = load ptr, ptr %33, align 8
  store ptr %969, ptr %30, align 8
  %970 = load ptr, ptr %30, align 8
  %971 = load i64, ptr %970, align 8
  %972 = trunc i64 %971 to i8
  store i8 %972, ptr %31, align 1
  %973 = load i8, ptr %31, align 1
  %974 = zext i8 %973 to i32
  %975 = and i32 %974, 255
  %976 = trunc i32 %975 to i8
  store i8 %976, ptr %34, align 1
  %977 = load i8, ptr %34, align 1
  %978 = zext i8 %977 to i32
  %979 = icmp eq i32 %978, 20
  br i1 %979, label %980, label %984

980:                                              ; preds = %967
  %981 = load ptr, ptr %33, align 8
  %982 = getelementptr inbounds nuw %struct.yyjson_val, ptr %981, i32 0, i32 1
  %983 = load double, ptr %982, align 8
  store double %983, ptr %32, align 8
  br label %1004

984:                                              ; preds = %967
  %985 = load i8, ptr %34, align 1
  %986 = zext i8 %985 to i32
  %987 = icmp eq i32 %986, 12
  br i1 %987, label %988, label %993

988:                                              ; preds = %984
  %989 = load ptr, ptr %33, align 8
  %990 = getelementptr inbounds nuw %struct.yyjson_val, ptr %989, i32 0, i32 1
  %991 = load i64, ptr %990, align 8
  %992 = sitofp i64 %991 to double
  store double %992, ptr %32, align 8
  br label %1004

993:                                              ; preds = %984
  %994 = load i8, ptr %34, align 1
  %995 = zext i8 %994 to i32
  %996 = icmp eq i32 %995, 4
  br i1 %996, label %997, label %1003

997:                                              ; preds = %993
  %998 = load ptr, ptr %33, align 8
  %999 = getelementptr inbounds nuw %struct.yyjson_val, ptr %998, i32 0, i32 1
  %1000 = load i64, ptr %999, align 8
  store i64 %1000, ptr %25, align 8
  %1001 = load i64, ptr %25, align 8
  %1002 = uitofp i64 %1001 to double
  store double %1002, ptr %32, align 8
  br label %1004

1003:                                             ; preds = %993
  store double 0.000000e+00, ptr %32, align 8
  br label %1004

1004:                                             ; preds = %980, %988, %997, %1003
  %1005 = load double, ptr %32, align 8
  br label %1007

1006:                                             ; preds = %960
  br label %1007

1007:                                             ; preds = %1004, %1006
  %1008 = phi double [ %1005, %1004 ], [ 0.000000e+00, %1006 ]
  %1009 = load double, ptr %181, align 8
  %1010 = fadd double %1009, %1008
  store double %1010, ptr %181, align 8
  %1011 = load i64, ptr %182, align 8
  %1012 = add i64 %1011, 1
  store i64 %1012, ptr %182, align 8
  br label %1013

1013:                                             ; preds = %1007, %866, %863, %859
  br label %1014

1014:                                             ; preds = %1013, %517
  %1015 = load i64, ptr %184, align 8
  %1016 = add i64 %1015, 1
  store i64 %1016, ptr %184, align 8
  %1017 = load ptr, ptr %183, align 8
  store ptr %1017, ptr %140, align 8
  %1018 = load ptr, ptr %140, align 8
  store ptr %1018, ptr %5, align 8
  store i8 6, ptr %6, align 1
  %1019 = load ptr, ptr %5, align 8
  store ptr %1019, ptr %3, align 8
  %1020 = load ptr, ptr %3, align 8
  %1021 = load i64, ptr %1020, align 8
  %1022 = trunc i64 %1021 to i8
  store i8 %1022, ptr %4, align 1
  %1023 = load i8, ptr %4, align 1
  %1024 = zext i8 %1023 to i32
  %1025 = and i32 %1024, 255
  %1026 = trunc i32 %1025 to i8
  %1027 = zext i8 %1026 to i32
  %1028 = load i8, ptr %6, align 1
  %1029 = zext i8 %1028 to i32
  %1030 = and i32 %1027, %1029
  %1031 = load i8, ptr %6, align 1
  %1032 = zext i8 %1031 to i32
  %1033 = icmp eq i32 %1030, %1032
  %1034 = zext i1 %1033 to i8
  store i8 %1034, ptr %141, align 1
  %1035 = load ptr, ptr %140, align 8
  %1036 = getelementptr inbounds nuw %struct.yyjson_val, ptr %1035, i32 0, i32 1
  %1037 = load i64, ptr %1036, align 8
  store i64 %1037, ptr %142, align 8
  %1038 = load i8, ptr %141, align 1
  %1039 = trunc i8 %1038 to i1
  br i1 %1039, label %1040, label %1042

1040:                                             ; preds = %1014
  %1041 = load i64, ptr %142, align 8
  br label %1043

1042:                                             ; preds = %1014
  br label %1043

1043:                                             ; preds = %1040, %1042
  %1044 = phi i64 [ %1041, %1040 ], [ 16, %1042 ]
  store i64 %1044, ptr %143, align 8
  %1045 = load ptr, ptr %140, align 8
  %1046 = ptrtoint ptr %1045 to i64
  store ptr %1045, ptr %144, align 8
  %1047 = load ptr, ptr %144, align 8
  %1048 = load i64, ptr %143, align 8
  %1049 = getelementptr inbounds nuw i8, ptr %1047, i64 %1048
  store ptr %1049, ptr %183, align 8
  br label %492, !llvm.loop !11

1050:                                             ; preds = %492
  %1051 = load ptr, ptr %176, align 8
  store ptr %1051, ptr %167, align 8
  %1052 = load ptr, ptr %167, align 8
  %1053 = icmp ne ptr %1052, null
  br i1 %1053, label %1054, label %1077

1054:                                             ; preds = %1050
  %1055 = load ptr, ptr %167, align 8
  %1056 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1055, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %168, ptr align 8 %1056, i64 32, i1 false)
  %1057 = load ptr, ptr %167, align 8
  %1058 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1057, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %1058, i8 0, i64 32, i1 false)
  %1059 = load ptr, ptr %167, align 8
  %1060 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1059, i32 0, i32 4
  %1061 = load ptr, ptr %1060, align 8
  %1062 = icmp ne ptr %1061, null
  br i1 %1062, label %1063, label %1071

1063:                                             ; preds = %1054
  %1064 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %168, i32 0, i32 2
  %1065 = load ptr, ptr %1064, align 8
  %1066 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %168, i32 0, i32 3
  %1067 = load ptr, ptr %1066, align 8
  %1068 = load ptr, ptr %167, align 8
  %1069 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %1068, i32 0, i32 4
  %1070 = load ptr, ptr %1069, align 8
  call void %1065(ptr noundef %1067, ptr noundef %1070)
  br label %1071

1071:                                             ; preds = %1063, %1054
  %1072 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %168, i32 0, i32 2
  %1073 = load ptr, ptr %1072, align 8
  %1074 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %168, i32 0, i32 3
  %1075 = load ptr, ptr %1074, align 8
  %1076 = load ptr, ptr %167, align 8
  call void %1073(ptr noundef %1075, ptr noundef %1076)
  br label %1077

1077:                                             ; preds = %1050, %1071
  %1078 = load i64, ptr %182, align 8
  %1079 = icmp ugt i64 %1078, 0
  br i1 %1079, label %1080, label %1106

1080:                                             ; preds = %1077
  %1081 = load double, ptr %179, align 8
  %1082 = load i64, ptr %182, align 8
  %1083 = uitofp i64 %1082 to double
  %1084 = fdiv double %1081, %1083
  store double %1084, ptr %189, align 8
  %1085 = load double, ptr %180, align 8
  %1086 = load i64, ptr %182, align 8
  %1087 = uitofp i64 %1086 to double
  %1088 = fdiv double %1085, %1087
  store double %1088, ptr %190, align 8
  %1089 = load double, ptr %181, align 8
  %1090 = load i64, ptr %182, align 8
  %1091 = uitofp i64 %1090 to double
  %1092 = fdiv double %1089, %1091
  store double %1092, ptr %191, align 8
  %1093 = load double, ptr %189, align 8
  %1094 = call i32 @Helper_checksum_f64(double noundef %1093)
  %1095 = load double, ptr %190, align 8
  %1096 = call i32 @Helper_checksum_f64(double noundef %1095)
  %1097 = add i32 %1094, %1096
  %1098 = load double, ptr %191, align 8
  %1099 = call i32 @Helper_checksum_f64(double noundef %1098)
  %1100 = add i32 %1097, %1099
  store i32 %1100, ptr %192, align 4
  %1101 = load i32, ptr %192, align 4
  %1102 = load ptr, ptr %175, align 8
  %1103 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %1102, i32 0, i32 1
  %1104 = load i32, ptr %1103, align 8
  %1105 = add i32 %1104, %1101
  store i32 %1105, ptr %1103, align 8
  br label %1106

1106:                                             ; preds = %213, %253, %419, %1080, %1077
  ret void
}

define dso_local i32 @JsonParseMapping_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @JsonParseMapping_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.JsonParseMappingData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @JsonParseMapping_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.13)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 24, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @JsonParseMapping_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @JsonParseMapping_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @JsonParseMapping_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @JsonParseMapping_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare double @llvm.round.f64(double)

declare zeroext i1 @unsafe_yyjson_val_pool_grow(ptr noundef, ptr noundef, i64 noundef)

declare i1 @llvm.is.constant.i64(i64)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

declare zeroext i1 @unsafe_yyjson_str_pool_grow(ptr noundef, ptr noundef, i64 noundef)

declare ptr @yyjson_mut_write_opts(ptr noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef)

declare ptr @yyjson_read_opts(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef)

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
