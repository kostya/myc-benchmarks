; ModuleID = 'c/src/helper.c'
source_filename = "c/src/helper.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.yyjson_val = type { i64, %union.yyjson_val_uni }
%union.yyjson_val_uni = type { i64 }
%struct.yyjson_alc = type { ptr, ptr, ptr, ptr }
%struct.yyjson_doc = type { ptr, %struct.yyjson_alc, i64, i64, ptr }

@Helper_last = dso_local global i32 42, align 4
@global_config_doc = dso_local global ptr null, align 8
@global_config_mut = dso_local global ptr null, align 8
@global_config_root = dso_local global ptr null, align 8
@global_config_is_array = dso_local global i8 0, align 1
@global_order = dso_local global ptr null, align 8
@global_config = dso_local global ptr null, align 8
@global_order_count = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [5 x i8] c"%.7f\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"Cannot open config file: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Memory allocation error\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"Error parsing JSON config\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Config not loaded\0A\00", align 1
@.str.7 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"Config not found for %s\0A\00", align 1

define dso_local void @Helper_reset() {
  store i32 42, ptr @Helper_last, align 4
  ret void
}

define dso_local i32 @Helper_next_int(i32 noundef %0) {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr @Helper_last, align 4
  %4 = mul i32 %3, 3877
  %5 = add i32 %4, 29573
  %6 = urem i32 %5, 139968
  store i32 %6, ptr @Helper_last, align 4
  %7 = load i32, ptr @Helper_last, align 4
  %8 = zext i32 %7 to i64
  %9 = load i32, ptr %2, align 4
  %10 = zext i32 %9 to i64
  %11 = mul nsw i64 %8, %10
  %12 = sdiv i64 %11, 139968
  %13 = trunc i64 %12 to i32
  ret i32 %13
}

define dso_local i32 @Helper_next_int_range(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = sub i32 %5, %6
  %8 = add i32 %7, 1
  %9 = call i32 @Helper_next_int(i32 noundef %8)
  %10 = load i32, ptr %3, align 4
  %11 = add i32 %9, %10
  ret i32 %11
}

define dso_local double @Helper_next_float(double noundef %0) {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load i32, ptr @Helper_last, align 4
  %4 = mul i32 %3, 3877
  %5 = add i32 %4, 29573
  %6 = urem i32 %5, 139968
  store i32 %6, ptr @Helper_last, align 4
  %7 = load double, ptr %2, align 8
  %8 = load i32, ptr @Helper_last, align 4
  %9 = uitofp i32 %8 to double
  %10 = fmul double %7, %9
  %11 = fdiv double %10, 1.399680e+05
  ret double %11
}

define dso_local i32 @Helper_checksum_string(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  store i32 5381, ptr %3, align 4
  br label %5

5:                                                ; preds = %9, %1
  %6 = load ptr, ptr %2, align 8
  %7 = load i8, ptr %6, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load ptr, ptr %2, align 8
  %11 = load i8, ptr %10, align 1
  store i8 %11, ptr %4, align 1
  %12 = load i32, ptr %3, align 4
  %13 = shl i32 %12, 5
  %14 = load i32, ptr %3, align 4
  %15 = add i32 %13, %14
  %16 = load i8, ptr %4, align 1
  %17 = zext i8 %16 to i32
  %18 = add i32 %15, %17
  store i32 %18, ptr %3, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 1
  store ptr %20, ptr %2, align 8
  br label %5, !llvm.loop !6

21:                                               ; preds = %5
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

define dso_local i32 @Helper_checksum_bytes(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i32 5381, ptr %5, align 4
  store i64 0, ptr %6, align 8
  br label %7

7:                                                ; preds = %22, %2
  %8 = load i64, ptr %6, align 8
  %9 = load i64, ptr %4, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = shl i32 %12, 5
  %14 = load i32, ptr %5, align 4
  %15 = add i32 %13, %14
  %16 = load ptr, ptr %3, align 8
  %17 = load i64, ptr %6, align 8
  %18 = getelementptr inbounds nuw i8, ptr %16, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = add i32 %15, %20
  store i32 %21, ptr %5, align 4
  br label %22

22:                                               ; preds = %11
  %23 = load i64, ptr %6, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr %6, align 8
  br label %7, !llvm.loop !8

25:                                               ; preds = %7
  %26 = load i32, ptr %5, align 4
  ret i32 %26
}

define dso_local i32 @Helper_checksum_f64(double noundef %0) {
  %2 = alloca double, align 8
  %3 = alloca [32 x i8], align 16
  store double %0, ptr %2, align 8
  %4 = getelementptr inbounds [32 x i8], ptr %3, i64 0, i64 0
  %5 = load double, ptr %2, align 8
  %6 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %4, i64 noundef 32, ptr noundef @.str, double noundef %5)
  %7 = getelementptr inbounds [32 x i8], ptr %3, i64 0, i64 0
  %8 = call i32 @Helper_checksum_string(ptr noundef %7)
  ret i32 %8
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

define dso_local void @Helper_load_config(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca i8, align 1
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i8, align 1
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i64, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i8, align 1
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i64, align 8
  %36 = alloca i64, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca i8, align 1
  %43 = alloca ptr, align 8
  %44 = alloca i8, align 1
  %45 = alloca ptr, align 8
  %46 = alloca i8, align 1
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca i8, align 1
  %52 = alloca i64, align 8
  %53 = alloca i64, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca ptr, align 8
  %67 = alloca ptr, align 8
  %68 = alloca i64, align 8
  %69 = alloca i32, align 4
  %70 = alloca ptr, align 8
  %71 = alloca ptr, align 8
  %72 = alloca i64, align 8
  %73 = alloca ptr, align 8
  %74 = alloca i64, align 8
  %75 = alloca ptr, align 8
  %76 = alloca ptr, align 8
  %77 = alloca i64, align 8
  %78 = alloca i64, align 8
  %79 = alloca ptr, align 8
  %80 = alloca ptr, align 8
  %81 = alloca ptr, align 8
  store ptr %0, ptr %70, align 8
  %82 = load ptr, ptr %70, align 8
  %83 = call noalias ptr @fopen(ptr noundef %82, ptr noundef @.str.1)
  store ptr %83, ptr %71, align 8
  %84 = load ptr, ptr %71, align 8
  %85 = icmp ne ptr %84, null
  br i1 %85, label %90, label %86

86:                                               ; preds = %1
  %87 = load ptr, ptr @stderr, align 8
  %88 = load ptr, ptr %70, align 8
  %89 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %87, ptr noundef @.str.2, ptr noundef %88)
  call void @exit(i32 noundef 1)
  unreachable

90:                                               ; preds = %1
  %91 = load ptr, ptr %71, align 8
  %92 = call i32 @fseek(ptr noundef %91, i64 noundef 0, i32 noundef 2)
  %93 = load ptr, ptr %71, align 8
  %94 = call i64 @ftell(ptr noundef %93)
  store i64 %94, ptr %72, align 8
  %95 = load ptr, ptr %71, align 8
  %96 = call i32 @fseek(ptr noundef %95, i64 noundef 0, i32 noundef 0)
  %97 = load i64, ptr %72, align 8
  %98 = add nsw i64 %97, 1
  %99 = call noalias ptr @malloc(i64 noundef %98)
  store ptr %99, ptr %73, align 8
  %100 = load ptr, ptr %73, align 8
  %101 = icmp ne ptr %100, null
  br i1 %101, label %107, label %102

102:                                              ; preds = %90
  %103 = load ptr, ptr @stderr, align 8
  %104 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %103, ptr noundef @.str.3)
  %105 = load ptr, ptr %71, align 8
  %106 = call i32 @fclose(ptr noundef %105)
  call void @exit(i32 noundef 1)
  unreachable

107:                                              ; preds = %90
  %108 = load ptr, ptr %73, align 8
  %109 = load i64, ptr %72, align 8
  %110 = load ptr, ptr %71, align 8
  %111 = call i64 @fread(ptr noundef %108, i64 noundef 1, i64 noundef %109, ptr noundef %110)
  store i64 %111, ptr %74, align 8
  %112 = load ptr, ptr %73, align 8
  %113 = load i64, ptr %74, align 8
  %114 = getelementptr inbounds nuw i8, ptr %112, i64 %113
  store i8 0, ptr %114, align 1
  %115 = load ptr, ptr %71, align 8
  %116 = call i32 @fclose(ptr noundef %115)
  %117 = load ptr, ptr %73, align 8
  %118 = load i64, ptr %74, align 8
  store ptr %117, ptr %67, align 8
  store i64 %118, ptr %68, align 8
  store i32 0, ptr %69, align 4
  %119 = load i32, ptr %69, align 4
  %120 = and i32 %119, -2
  store i32 %120, ptr %69, align 4
  %121 = load ptr, ptr %67, align 8
  %122 = ptrtoint ptr %121 to i64
  %123 = load i64, ptr %68, align 8
  %124 = load i32, ptr %69, align 4
  %125 = call ptr @yyjson_read_opts(ptr noundef %121, i64 noundef %123, i32 noundef %124, ptr noundef null, ptr noundef null)
  store ptr %125, ptr %75, align 8
  %126 = load ptr, ptr %73, align 8
  call void @free(ptr noundef %126)
  %127 = load ptr, ptr %75, align 8
  %128 = icmp ne ptr %127, null
  br i1 %128, label %132, label %129

129:                                              ; preds = %107
  %130 = load ptr, ptr @stderr, align 8
  %131 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %130, ptr noundef @.str.4)
  call void @exit(i32 noundef 1)
  unreachable

132:                                              ; preds = %107
  %133 = load ptr, ptr %75, align 8
  store ptr %133, ptr %66, align 8
  %134 = load ptr, ptr %66, align 8
  %135 = icmp ne ptr %134, null
  br i1 %135, label %136, label %139

136:                                              ; preds = %132
  %137 = load ptr, ptr %66, align 8
  %138 = load ptr, ptr %137, align 8
  br label %140

139:                                              ; preds = %132
  br label %140

140:                                              ; preds = %136, %139
  %141 = phi ptr [ %138, %136 ], [ null, %139 ]
  store ptr %141, ptr %76, align 8
  %142 = load ptr, ptr %76, align 8
  store ptr %142, ptr %65, align 8
  %143 = load ptr, ptr %65, align 8
  %144 = icmp ne ptr %143, null
  br i1 %144, label %145, label %158

145:                                              ; preds = %140
  %146 = load ptr, ptr %65, align 8
  store ptr %146, ptr %47, align 8
  %147 = load ptr, ptr %47, align 8
  store ptr %147, ptr %45, align 8
  %148 = load ptr, ptr %45, align 8
  %149 = load i64, ptr %148, align 8
  %150 = trunc i64 %149 to i8
  store i8 %150, ptr %46, align 1
  %151 = load i8, ptr %46, align 1
  %152 = zext i8 %151 to i32
  %153 = and i32 %152, 7
  %154 = trunc i32 %153 to i8
  %155 = zext i8 %154 to i32
  %156 = icmp eq i32 %155, 6
  %157 = zext i1 %156 to i32
  br label %159

158:                                              ; preds = %140
  br label %159

159:                                              ; preds = %145, %158
  %160 = phi i32 [ %157, %145 ], [ 0, %158 ]
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %458

162:                                              ; preds = %159
  store i8 1, ptr @global_config_is_array, align 1
  %163 = load ptr, ptr %75, align 8
  store ptr %163, ptr @global_config, align 8
  %164 = load ptr, ptr %76, align 8
  store ptr %164, ptr @global_config_root, align 8
  store i64 0, ptr %77, align 8
  %165 = load ptr, ptr %76, align 8
  store ptr %165, ptr %64, align 8
  %166 = load ptr, ptr %64, align 8
  store ptr %166, ptr %63, align 8
  %167 = load ptr, ptr %63, align 8
  %168 = icmp ne ptr %167, null
  br i1 %168, label %169, label %182

169:                                              ; preds = %162
  %170 = load ptr, ptr %63, align 8
  store ptr %170, ptr %48, align 8
  %171 = load ptr, ptr %48, align 8
  store ptr %171, ptr %43, align 8
  %172 = load ptr, ptr %43, align 8
  %173 = load i64, ptr %172, align 8
  %174 = trunc i64 %173 to i8
  store i8 %174, ptr %44, align 1
  %175 = load i8, ptr %44, align 1
  %176 = zext i8 %175 to i32
  %177 = and i32 %176, 7
  %178 = trunc i32 %177 to i8
  %179 = zext i8 %178 to i32
  %180 = icmp eq i32 %179, 6
  %181 = zext i1 %180 to i32
  br label %183

182:                                              ; preds = %162
  br label %183

183:                                              ; preds = %182, %169
  %184 = phi i32 [ %181, %169 ], [ 0, %182 ]
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %191

186:                                              ; preds = %183
  %187 = load ptr, ptr %64, align 8
  store ptr %187, ptr %39, align 8
  %188 = load ptr, ptr %39, align 8
  %189 = load i64, ptr %188, align 8
  %190 = lshr i64 %189, 8
  br label %192

191:                                              ; preds = %183
  br label %192

192:                                              ; preds = %186, %191
  %193 = phi i64 [ %190, %186 ], [ 0, %191 ]
  store i64 %193, ptr %78, align 8
  %194 = load ptr, ptr %76, align 8
  store ptr %194, ptr %62, align 8
  %195 = load ptr, ptr %62, align 8
  store ptr %195, ptr %60, align 8
  %196 = load ptr, ptr %60, align 8
  %197 = icmp ne ptr %196, null
  br i1 %197, label %198, label %211

198:                                              ; preds = %192
  %199 = load ptr, ptr %60, align 8
  store ptr %199, ptr %49, align 8
  %200 = load ptr, ptr %49, align 8
  store ptr %200, ptr %41, align 8
  %201 = load ptr, ptr %41, align 8
  %202 = load i64, ptr %201, align 8
  %203 = trunc i64 %202 to i8
  store i8 %203, ptr %42, align 1
  %204 = load i8, ptr %42, align 1
  %205 = zext i8 %204 to i32
  %206 = and i32 %205, 7
  %207 = trunc i32 %206 to i8
  %208 = zext i8 %207 to i32
  %209 = icmp eq i32 %208, 6
  %210 = zext i1 %209 to i32
  br label %212

211:                                              ; preds = %192
  br label %212

212:                                              ; preds = %211, %198
  %213 = phi i32 [ %210, %198 ], [ 0, %211 ]
  %214 = icmp ne i32 %213, 0
  %215 = xor i1 %214, true
  %216 = zext i1 %214 to i32
  %217 = sext i32 %216 to i64
  br i1 %214, label %218, label %233

218:                                              ; preds = %212
  %219 = load ptr, ptr %62, align 8
  store ptr %219, ptr %40, align 8
  %220 = load ptr, ptr %40, align 8
  %221 = load i64, ptr %220, align 8
  %222 = lshr i64 %221, 8
  %223 = icmp ugt i64 %222, 0
  %224 = xor i1 %223, true
  %225 = zext i1 %223 to i32
  %226 = sext i32 %225 to i64
  br i1 %223, label %227, label %232

227:                                              ; preds = %218
  %228 = load ptr, ptr %62, align 8
  store ptr %228, ptr %38, align 8
  %229 = load ptr, ptr %38, align 8
  %230 = ptrtoint ptr %229 to i64
  %231 = getelementptr inbounds %struct.yyjson_val, ptr %229, i64 1
  store ptr %231, ptr %61, align 8
  br label %234

232:                                              ; preds = %218
  br label %233

233:                                              ; preds = %232, %212
  store ptr null, ptr %61, align 8
  br label %234

234:                                              ; preds = %227, %233
  %235 = load ptr, ptr %61, align 8
  store ptr %235, ptr %79, align 8
  br label %236

236:                                              ; preds = %450, %234
  %237 = load i64, ptr %77, align 8
  %238 = load i64, ptr %78, align 8
  %239 = icmp ult i64 %237, %238
  br i1 %239, label %240, label %457

240:                                              ; preds = %236
  %241 = load ptr, ptr %79, align 8
  store ptr %241, ptr %58, align 8
  store ptr @.str.5, ptr %59, align 8
  %242 = load ptr, ptr %58, align 8
  %243 = load ptr, ptr %59, align 8
  %244 = load ptr, ptr %59, align 8
  %245 = icmp ne ptr %244, null
  br i1 %245, label %246, label %249

246:                                              ; preds = %240
  %247 = load ptr, ptr %59, align 8
  %248 = call i64 @strlen(ptr noundef %247)
  br label %250

249:                                              ; preds = %240
  br label %250

250:                                              ; preds = %246, %249
  %251 = phi i64 [ %248, %246 ], [ 0, %249 ]
  store ptr %242, ptr %33, align 8
  store ptr %243, ptr %34, align 8
  store i64 %251, ptr %35, align 8
  %252 = load ptr, ptr %33, align 8
  store ptr %252, ptr %26, align 8
  %253 = load ptr, ptr %26, align 8
  %254 = icmp ne ptr %253, null
  br i1 %254, label %255, label %268

255:                                              ; preds = %250
  %256 = load ptr, ptr %26, align 8
  store ptr %256, ptr %4, align 8
  %257 = load ptr, ptr %4, align 8
  store ptr %257, ptr %2, align 8
  %258 = load ptr, ptr %2, align 8
  %259 = load i64, ptr %258, align 8
  %260 = trunc i64 %259 to i8
  store i8 %260, ptr %3, align 1
  %261 = load i8, ptr %3, align 1
  %262 = zext i8 %261 to i32
  %263 = and i32 %262, 7
  %264 = trunc i32 %263 to i8
  %265 = zext i8 %264 to i32
  %266 = icmp eq i32 %265, 7
  %267 = zext i1 %266 to i32
  br label %269

268:                                              ; preds = %250
  br label %269

269:                                              ; preds = %268, %255
  %270 = phi i32 [ %267, %255 ], [ 0, %268 ]
  %271 = icmp ne i32 %270, 0
  br i1 %271, label %272, label %275

272:                                              ; preds = %269
  %273 = load ptr, ptr %34, align 8
  %274 = icmp ne ptr %273, null
  br label %275

275:                                              ; preds = %272, %269
  %276 = phi i1 [ false, %269 ], [ %274, %272 ]
  %277 = xor i1 %276, true
  %278 = zext i1 %276 to i32
  %279 = sext i32 %278 to i64
  br i1 %276, label %280, label %352

280:                                              ; preds = %275
  %281 = load ptr, ptr %33, align 8
  store ptr %281, ptr %25, align 8
  %282 = load ptr, ptr %25, align 8
  %283 = load i64, ptr %282, align 8
  %284 = lshr i64 %283, 8
  store i64 %284, ptr %36, align 8
  %285 = load ptr, ptr %33, align 8
  store ptr %285, ptr %24, align 8
  %286 = load ptr, ptr %24, align 8
  %287 = ptrtoint ptr %286 to i64
  %288 = getelementptr inbounds %struct.yyjson_val, ptr %286, i64 1
  store ptr %288, ptr %37, align 8
  br label %289

289:                                              ; preds = %344, %280
  %290 = load i64, ptr %36, align 8
  %291 = add i64 %290, -1
  store i64 %291, ptr %36, align 8
  %292 = icmp ugt i64 %290, 0
  br i1 %292, label %293, label %351

293:                                              ; preds = %289
  %294 = load ptr, ptr %37, align 8
  %295 = load ptr, ptr %34, align 8
  %296 = load i64, ptr %35, align 8
  store ptr %294, ptr %21, align 8
  store ptr %295, ptr %22, align 8
  store i64 %296, ptr %23, align 8
  %297 = load ptr, ptr %21, align 8
  store ptr %297, ptr %20, align 8
  %298 = load ptr, ptr %20, align 8
  %299 = load i64, ptr %298, align 8
  %300 = lshr i64 %299, 8
  %301 = load i64, ptr %23, align 8
  %302 = icmp eq i64 %300, %301
  br i1 %302, label %303, label %311

303:                                              ; preds = %293
  %304 = load ptr, ptr %21, align 8
  %305 = getelementptr inbounds nuw %struct.yyjson_val, ptr %304, i32 0, i32 1
  %306 = load ptr, ptr %305, align 8
  %307 = load ptr, ptr %22, align 8
  %308 = load i64, ptr %23, align 8
  %309 = call i32 @memcmp(ptr noundef %306, ptr noundef %307, i64 noundef %308)
  %310 = icmp eq i32 %309, 0
  br label %311

311:                                              ; preds = %293, %303
  %312 = phi i1 [ false, %293 ], [ %310, %303 ]
  br i1 %312, label %313, label %316

313:                                              ; preds = %311
  %314 = load ptr, ptr %37, align 8
  %315 = getelementptr inbounds %struct.yyjson_val, ptr %314, i64 1
  store ptr %315, ptr %32, align 8
  br label %353

316:                                              ; preds = %311
  %317 = load ptr, ptr %37, align 8
  %318 = getelementptr inbounds %struct.yyjson_val, ptr %317, i64 1
  store ptr %318, ptr %27, align 8
  %319 = load ptr, ptr %27, align 8
  store ptr %319, ptr %11, align 8
  store i8 6, ptr %12, align 1
  %320 = load ptr, ptr %11, align 8
  store ptr %320, ptr %5, align 8
  %321 = load ptr, ptr %5, align 8
  %322 = load i64, ptr %321, align 8
  %323 = trunc i64 %322 to i8
  store i8 %323, ptr %6, align 1
  %324 = load i8, ptr %6, align 1
  %325 = zext i8 %324 to i32
  %326 = and i32 %325, 255
  %327 = trunc i32 %326 to i8
  %328 = zext i8 %327 to i32
  %329 = load i8, ptr %12, align 1
  %330 = zext i8 %329 to i32
  %331 = and i32 %328, %330
  %332 = load i8, ptr %12, align 1
  %333 = zext i8 %332 to i32
  %334 = icmp eq i32 %331, %333
  %335 = zext i1 %334 to i8
  store i8 %335, ptr %28, align 1
  %336 = load ptr, ptr %27, align 8
  %337 = getelementptr inbounds nuw %struct.yyjson_val, ptr %336, i32 0, i32 1
  %338 = load i64, ptr %337, align 8
  store i64 %338, ptr %29, align 8
  %339 = load i8, ptr %28, align 1
  %340 = trunc i8 %339 to i1
  br i1 %340, label %341, label %343

341:                                              ; preds = %316
  %342 = load i64, ptr %29, align 8
  br label %344

343:                                              ; preds = %316
  br label %344

344:                                              ; preds = %343, %341
  %345 = phi i64 [ %342, %341 ], [ 16, %343 ]
  store i64 %345, ptr %30, align 8
  %346 = load ptr, ptr %27, align 8
  %347 = ptrtoint ptr %346 to i64
  store ptr %346, ptr %31, align 8
  %348 = load ptr, ptr %31, align 8
  %349 = load i64, ptr %30, align 8
  %350 = getelementptr inbounds nuw i8, ptr %348, i64 %349
  store ptr %350, ptr %37, align 8
  br label %289, !llvm.loop !9

351:                                              ; preds = %289
  br label %352

352:                                              ; preds = %351, %275
  store ptr null, ptr %32, align 8
  br label %353

353:                                              ; preds = %313, %352
  %354 = load ptr, ptr %32, align 8
  store ptr %354, ptr %80, align 8
  %355 = load ptr, ptr %80, align 8
  %356 = icmp ne ptr %355, null
  br i1 %356, label %357, label %420

357:                                              ; preds = %353
  %358 = load ptr, ptr %80, align 8
  store ptr %358, ptr %57, align 8
  %359 = load ptr, ptr %57, align 8
  %360 = icmp ne ptr %359, null
  br i1 %360, label %361, label %374

361:                                              ; preds = %357
  %362 = load ptr, ptr %57, align 8
  store ptr %362, ptr %16, align 8
  %363 = load ptr, ptr %16, align 8
  store ptr %363, ptr %14, align 8
  %364 = load ptr, ptr %14, align 8
  %365 = load i64, ptr %364, align 8
  %366 = trunc i64 %365 to i8
  store i8 %366, ptr %15, align 1
  %367 = load i8, ptr %15, align 1
  %368 = zext i8 %367 to i32
  %369 = and i32 %368, 7
  %370 = trunc i32 %369 to i8
  %371 = zext i8 %370 to i32
  %372 = icmp eq i32 %371, 5
  %373 = zext i1 %372 to i32
  br label %375

374:                                              ; preds = %357
  br label %375

375:                                              ; preds = %361, %374
  %376 = phi i32 [ %373, %361 ], [ 0, %374 ]
  %377 = icmp ne i32 %376, 0
  br i1 %377, label %378, label %420

378:                                              ; preds = %375
  %379 = load ptr, ptr %80, align 8
  store ptr %379, ptr %56, align 8
  %380 = load ptr, ptr %56, align 8
  store ptr %380, ptr %55, align 8
  %381 = load ptr, ptr %55, align 8
  %382 = icmp ne ptr %381, null
  br i1 %382, label %383, label %396

383:                                              ; preds = %378
  %384 = load ptr, ptr %55, align 8
  store ptr %384, ptr %19, align 8
  %385 = load ptr, ptr %19, align 8
  store ptr %385, ptr %17, align 8
  %386 = load ptr, ptr %17, align 8
  %387 = load i64, ptr %386, align 8
  %388 = trunc i64 %387 to i8
  store i8 %388, ptr %18, align 1
  %389 = load i8, ptr %18, align 1
  %390 = zext i8 %389 to i32
  %391 = and i32 %390, 7
  %392 = trunc i32 %391 to i8
  %393 = zext i8 %392 to i32
  %394 = icmp eq i32 %393, 5
  %395 = zext i1 %394 to i32
  br label %397

396:                                              ; preds = %378
  br label %397

397:                                              ; preds = %396, %383
  %398 = phi i32 [ %395, %383 ], [ 0, %396 ]
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %405

400:                                              ; preds = %397
  %401 = load ptr, ptr %56, align 8
  store ptr %401, ptr %13, align 8
  %402 = load ptr, ptr %13, align 8
  %403 = getelementptr inbounds nuw %struct.yyjson_val, ptr %402, i32 0, i32 1
  %404 = load ptr, ptr %403, align 8
  br label %406

405:                                              ; preds = %397
  br label %406

406:                                              ; preds = %400, %405
  %407 = phi ptr [ %404, %400 ], [ null, %405 ]
  store ptr %407, ptr %81, align 8
  %408 = load ptr, ptr @global_order, align 8
  %409 = load i64, ptr @global_order_count, align 8
  %410 = add i64 %409, 1
  %411 = mul i64 8, %410
  %412 = call ptr @realloc(ptr noundef %408, i64 noundef %411)
  store ptr %412, ptr @global_order, align 8
  %413 = load ptr, ptr %81, align 8
  %414 = call noalias ptr @strdup(ptr noundef %413)
  %415 = load ptr, ptr @global_order, align 8
  %416 = load i64, ptr @global_order_count, align 8
  %417 = getelementptr inbounds nuw ptr, ptr %415, i64 %416
  store ptr %414, ptr %417, align 8
  %418 = load i64, ptr @global_order_count, align 8
  %419 = add i64 %418, 1
  store i64 %419, ptr @global_order_count, align 8
  br label %420

420:                                              ; preds = %406, %375, %353
  br label %421

421:                                              ; preds = %420
  %422 = load i64, ptr %77, align 8
  %423 = add i64 %422, 1
  store i64 %423, ptr %77, align 8
  %424 = load ptr, ptr %79, align 8
  store ptr %424, ptr %50, align 8
  %425 = load ptr, ptr %50, align 8
  store ptr %425, ptr %9, align 8
  store i8 6, ptr %10, align 1
  %426 = load ptr, ptr %9, align 8
  store ptr %426, ptr %7, align 8
  %427 = load ptr, ptr %7, align 8
  %428 = load i64, ptr %427, align 8
  %429 = trunc i64 %428 to i8
  store i8 %429, ptr %8, align 1
  %430 = load i8, ptr %8, align 1
  %431 = zext i8 %430 to i32
  %432 = and i32 %431, 255
  %433 = trunc i32 %432 to i8
  %434 = zext i8 %433 to i32
  %435 = load i8, ptr %10, align 1
  %436 = zext i8 %435 to i32
  %437 = and i32 %434, %436
  %438 = load i8, ptr %10, align 1
  %439 = zext i8 %438 to i32
  %440 = icmp eq i32 %437, %439
  %441 = zext i1 %440 to i8
  store i8 %441, ptr %51, align 1
  %442 = load ptr, ptr %50, align 8
  %443 = getelementptr inbounds nuw %struct.yyjson_val, ptr %442, i32 0, i32 1
  %444 = load i64, ptr %443, align 8
  store i64 %444, ptr %52, align 8
  %445 = load i8, ptr %51, align 1
  %446 = trunc i8 %445 to i1
  br i1 %446, label %447, label %449

447:                                              ; preds = %421
  %448 = load i64, ptr %52, align 8
  br label %450

449:                                              ; preds = %421
  br label %450

450:                                              ; preds = %447, %449
  %451 = phi i64 [ %448, %447 ], [ 16, %449 ]
  store i64 %451, ptr %53, align 8
  %452 = load ptr, ptr %50, align 8
  %453 = ptrtoint ptr %452 to i64
  store ptr %452, ptr %54, align 8
  %454 = load ptr, ptr %54, align 8
  %455 = load i64, ptr %53, align 8
  %456 = getelementptr inbounds nuw i8, ptr %454, i64 %455
  store ptr %456, ptr %79, align 8
  br label %236, !llvm.loop !10

457:                                              ; preds = %236
  br label %461

458:                                              ; preds = %159
  store i8 0, ptr @global_config_is_array, align 1
  %459 = load ptr, ptr %75, align 8
  store ptr %459, ptr @global_config, align 8
  %460 = load ptr, ptr %76, align 8
  store ptr %460, ptr @global_config_root, align 8
  br label %461

461:                                              ; preds = %458, %457
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef)

declare i32 @fprintf(ptr noundef, ptr noundef, ...)

declare void @exit(i32 noundef)

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef)

declare i64 @ftell(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare i32 @fclose(ptr noundef)

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef)

declare void @free(ptr noundef)

declare ptr @realloc(ptr noundef, i64 noundef)

declare noalias ptr @strdup(ptr noundef)

define dso_local void @Helper_free_config() {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.yyjson_alc, align 8
  %3 = alloca i64, align 8
  %4 = load ptr, ptr @global_config, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %34

6:                                                ; preds = %0
  %7 = load ptr, ptr @global_config, align 8
  store ptr %7, ptr %1, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %33

10:                                               ; preds = %6
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %11, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %12, i64 32, i1 false)
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %13, i32 0, i32 1
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 32, i1 false)
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %27

19:                                               ; preds = %10
  %20 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %2, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %2, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %1, align 8
  %25 = getelementptr inbounds nuw %struct.yyjson_doc, ptr %24, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  call void %21(ptr noundef %23, ptr noundef %26)
  br label %27

27:                                               ; preds = %19, %10
  %28 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %2, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds nuw %struct.yyjson_alc, ptr %2, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %1, align 8
  call void %29(ptr noundef %31, ptr noundef %32)
  br label %33

33:                                               ; preds = %6, %27
  store ptr null, ptr @global_config, align 8
  store ptr null, ptr @global_config_root, align 8
  br label %34

34:                                               ; preds = %33, %0
  %35 = load ptr, ptr @global_order, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %52

37:                                               ; preds = %34
  store i64 0, ptr %3, align 8
  br label %38

38:                                               ; preds = %47, %37
  %39 = load i64, ptr %3, align 8
  %40 = load i64, ptr @global_order_count, align 8
  %41 = icmp ult i64 %39, %40
  br i1 %41, label %42, label %50

42:                                               ; preds = %38
  %43 = load ptr, ptr @global_order, align 8
  %44 = load i64, ptr %3, align 8
  %45 = getelementptr inbounds nuw ptr, ptr %43, i64 %44
  %46 = load ptr, ptr %45, align 8
  call void @free(ptr noundef %46)
  br label %47

47:                                               ; preds = %42
  %48 = load i64, ptr %3, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr %3, align 8
  br label %38, !llvm.loop !11

50:                                               ; preds = %38
  %51 = load ptr, ptr @global_order, align 8
  call void @free(ptr noundef %51)
  store ptr null, ptr @global_order, align 8
  store i64 0, ptr @global_order_count, align 8
  br label %52

52:                                               ; preds = %50, %34
  ret void
}

define dso_local i64 @Helper_config_i64(ptr noundef %0, ptr noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i8, align 1
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i8, align 1
  %20 = alloca ptr, align 8
  %21 = alloca i8, align 1
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i8, align 1
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i8, align 1
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i64, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca i8, align 1
  %38 = alloca i64, align 8
  %39 = alloca i64, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca i64, align 8
  %45 = alloca i64, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca i64, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  store ptr %0, ptr %56, align 8
  store ptr %1, ptr %57, align 8
  %60 = load ptr, ptr @global_config, align 8
  %61 = icmp ne ptr %60, null
  br i1 %61, label %65, label %62

62:                                               ; preds = %2
  %63 = load ptr, ptr @stderr, align 8
  %64 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %63, ptr noundef @.str.6)
  store i64 0, ptr %55, align 8
  br label %332

65:                                               ; preds = %2
  %66 = load ptr, ptr %56, align 8
  %67 = call ptr @find_class_obj(ptr noundef %66)
  store ptr %67, ptr %58, align 8
  %68 = load ptr, ptr %58, align 8
  %69 = icmp ne ptr %68, null
  br i1 %69, label %70, label %91

70:                                               ; preds = %65
  %71 = load ptr, ptr %58, align 8
  store ptr %71, ptr %49, align 8
  %72 = load ptr, ptr %49, align 8
  %73 = icmp ne ptr %72, null
  br i1 %73, label %74, label %87

74:                                               ; preds = %70
  %75 = load ptr, ptr %49, align 8
  store ptr %75, ptr %14, align 8
  %76 = load ptr, ptr %14, align 8
  store ptr %76, ptr %12, align 8
  %77 = load ptr, ptr %12, align 8
  %78 = load i64, ptr %77, align 8
  %79 = trunc i64 %78 to i8
  store i8 %79, ptr %13, align 1
  %80 = load i8, ptr %13, align 1
  %81 = zext i8 %80 to i32
  %82 = and i32 %81, 7
  %83 = trunc i32 %82 to i8
  %84 = zext i8 %83 to i32
  %85 = icmp eq i32 %84, 7
  %86 = zext i1 %85 to i32
  br label %88

87:                                               ; preds = %70
  br label %88

88:                                               ; preds = %74, %87
  %89 = phi i32 [ %86, %74 ], [ 0, %87 ]
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %92, label %91

91:                                               ; preds = %88, %65
  store i64 0, ptr %55, align 8
  br label %332

92:                                               ; preds = %88
  %93 = load ptr, ptr %58, align 8
  %94 = load ptr, ptr %57, align 8
  store ptr %93, ptr %53, align 8
  store ptr %94, ptr %54, align 8
  %95 = load ptr, ptr %53, align 8
  %96 = load ptr, ptr %54, align 8
  %97 = load ptr, ptr %54, align 8
  %98 = icmp ne ptr %97, null
  br i1 %98, label %99, label %102

99:                                               ; preds = %92
  %100 = load ptr, ptr %54, align 8
  %101 = call i64 @strlen(ptr noundef %100)
  br label %103

102:                                              ; preds = %92
  br label %103

103:                                              ; preds = %99, %102
  %104 = phi i64 [ %101, %99 ], [ 0, %102 ]
  store ptr %95, ptr %42, align 8
  store ptr %96, ptr %43, align 8
  store i64 %104, ptr %44, align 8
  %105 = load ptr, ptr %42, align 8
  store ptr %105, ptr %35, align 8
  %106 = load ptr, ptr %35, align 8
  %107 = icmp ne ptr %106, null
  br i1 %107, label %108, label %121

108:                                              ; preds = %103
  %109 = load ptr, ptr %35, align 8
  store ptr %109, ptr %17, align 8
  %110 = load ptr, ptr %17, align 8
  store ptr %110, ptr %15, align 8
  %111 = load ptr, ptr %15, align 8
  %112 = load i64, ptr %111, align 8
  %113 = trunc i64 %112 to i8
  store i8 %113, ptr %16, align 1
  %114 = load i8, ptr %16, align 1
  %115 = zext i8 %114 to i32
  %116 = and i32 %115, 7
  %117 = trunc i32 %116 to i8
  %118 = zext i8 %117 to i32
  %119 = icmp eq i32 %118, 7
  %120 = zext i1 %119 to i32
  br label %122

121:                                              ; preds = %103
  br label %122

122:                                              ; preds = %121, %108
  %123 = phi i32 [ %120, %108 ], [ 0, %121 ]
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %128

125:                                              ; preds = %122
  %126 = load ptr, ptr %43, align 8
  %127 = icmp ne ptr %126, null
  br label %128

128:                                              ; preds = %125, %122
  %129 = phi i1 [ false, %122 ], [ %127, %125 ]
  %130 = xor i1 %129, true
  %131 = zext i1 %129 to i32
  %132 = sext i32 %131 to i64
  br i1 %129, label %133, label %205

133:                                              ; preds = %128
  %134 = load ptr, ptr %42, align 8
  store ptr %134, ptr %34, align 8
  %135 = load ptr, ptr %34, align 8
  %136 = load i64, ptr %135, align 8
  %137 = lshr i64 %136, 8
  store i64 %137, ptr %45, align 8
  %138 = load ptr, ptr %42, align 8
  store ptr %138, ptr %33, align 8
  %139 = load ptr, ptr %33, align 8
  %140 = ptrtoint ptr %139 to i64
  %141 = getelementptr inbounds %struct.yyjson_val, ptr %139, i64 1
  store ptr %141, ptr %46, align 8
  br label %142

142:                                              ; preds = %197, %133
  %143 = load i64, ptr %45, align 8
  %144 = add i64 %143, -1
  store i64 %144, ptr %45, align 8
  %145 = icmp ugt i64 %143, 0
  br i1 %145, label %146, label %204

146:                                              ; preds = %142
  %147 = load ptr, ptr %46, align 8
  %148 = load ptr, ptr %43, align 8
  %149 = load i64, ptr %44, align 8
  store ptr %147, ptr %30, align 8
  store ptr %148, ptr %31, align 8
  store i64 %149, ptr %32, align 8
  %150 = load ptr, ptr %30, align 8
  store ptr %150, ptr %29, align 8
  %151 = load ptr, ptr %29, align 8
  %152 = load i64, ptr %151, align 8
  %153 = lshr i64 %152, 8
  %154 = load i64, ptr %32, align 8
  %155 = icmp eq i64 %153, %154
  br i1 %155, label %156, label %164

156:                                              ; preds = %146
  %157 = load ptr, ptr %30, align 8
  %158 = getelementptr inbounds nuw %struct.yyjson_val, ptr %157, i32 0, i32 1
  %159 = load ptr, ptr %158, align 8
  %160 = load ptr, ptr %31, align 8
  %161 = load i64, ptr %32, align 8
  %162 = call i32 @memcmp(ptr noundef %159, ptr noundef %160, i64 noundef %161)
  %163 = icmp eq i32 %162, 0
  br label %164

164:                                              ; preds = %146, %156
  %165 = phi i1 [ false, %146 ], [ %163, %156 ]
  br i1 %165, label %166, label %169

166:                                              ; preds = %164
  %167 = load ptr, ptr %46, align 8
  %168 = getelementptr inbounds %struct.yyjson_val, ptr %167, i64 1
  store ptr %168, ptr %41, align 8
  br label %206

169:                                              ; preds = %164
  %170 = load ptr, ptr %46, align 8
  %171 = getelementptr inbounds %struct.yyjson_val, ptr %170, i64 1
  store ptr %171, ptr %36, align 8
  %172 = load ptr, ptr %36, align 8
  store ptr %172, ptr %20, align 8
  store i8 6, ptr %21, align 1
  %173 = load ptr, ptr %20, align 8
  store ptr %173, ptr %18, align 8
  %174 = load ptr, ptr %18, align 8
  %175 = load i64, ptr %174, align 8
  %176 = trunc i64 %175 to i8
  store i8 %176, ptr %19, align 1
  %177 = load i8, ptr %19, align 1
  %178 = zext i8 %177 to i32
  %179 = and i32 %178, 255
  %180 = trunc i32 %179 to i8
  %181 = zext i8 %180 to i32
  %182 = load i8, ptr %21, align 1
  %183 = zext i8 %182 to i32
  %184 = and i32 %181, %183
  %185 = load i8, ptr %21, align 1
  %186 = zext i8 %185 to i32
  %187 = icmp eq i32 %184, %186
  %188 = zext i1 %187 to i8
  store i8 %188, ptr %37, align 1
  %189 = load ptr, ptr %36, align 8
  %190 = getelementptr inbounds nuw %struct.yyjson_val, ptr %189, i32 0, i32 1
  %191 = load i64, ptr %190, align 8
  store i64 %191, ptr %38, align 8
  %192 = load i8, ptr %37, align 1
  %193 = trunc i8 %192 to i1
  br i1 %193, label %194, label %196

194:                                              ; preds = %169
  %195 = load i64, ptr %38, align 8
  br label %197

196:                                              ; preds = %169
  br label %197

197:                                              ; preds = %196, %194
  %198 = phi i64 [ %195, %194 ], [ 16, %196 ]
  store i64 %198, ptr %39, align 8
  %199 = load ptr, ptr %36, align 8
  %200 = ptrtoint ptr %199 to i64
  store ptr %199, ptr %40, align 8
  %201 = load ptr, ptr %40, align 8
  %202 = load i64, ptr %39, align 8
  %203 = getelementptr inbounds nuw i8, ptr %201, i64 %202
  store ptr %203, ptr %46, align 8
  br label %142, !llvm.loop !9

204:                                              ; preds = %142
  br label %205

205:                                              ; preds = %204, %128
  store ptr null, ptr %41, align 8
  br label %206

206:                                              ; preds = %166, %205
  %207 = load ptr, ptr %41, align 8
  store ptr %207, ptr %59, align 8
  %208 = load ptr, ptr %59, align 8
  %209 = icmp ne ptr %208, null
  br i1 %209, label %211, label %210

210:                                              ; preds = %206
  store i64 0, ptr %55, align 8
  br label %332

211:                                              ; preds = %206
  %212 = load ptr, ptr %59, align 8
  store ptr %212, ptr %48, align 8
  %213 = load ptr, ptr %48, align 8
  %214 = icmp ne ptr %213, null
  br i1 %214, label %215, label %228

215:                                              ; preds = %211
  %216 = load ptr, ptr %48, align 8
  store ptr %216, ptr %11, align 8
  %217 = load ptr, ptr %11, align 8
  store ptr %217, ptr %9, align 8
  %218 = load ptr, ptr %9, align 8
  %219 = load i64, ptr %218, align 8
  %220 = trunc i64 %219 to i8
  store i8 %220, ptr %10, align 1
  %221 = load i8, ptr %10, align 1
  %222 = zext i8 %221 to i32
  %223 = and i32 %222, 7
  %224 = trunc i32 %223 to i8
  %225 = zext i8 %224 to i32
  %226 = icmp eq i32 %225, 4
  %227 = zext i1 %226 to i32
  br label %229

228:                                              ; preds = %211
  br label %229

229:                                              ; preds = %215, %228
  %230 = phi i32 [ %227, %215 ], [ 0, %228 ]
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %232, label %279

232:                                              ; preds = %229
  %233 = load ptr, ptr %59, align 8
  store ptr %233, ptr %47, align 8
  %234 = load ptr, ptr %47, align 8
  %235 = icmp ne ptr %234, null
  br i1 %235, label %236, label %275

236:                                              ; preds = %232
  %237 = load ptr, ptr %47, align 8
  store ptr %237, ptr %7, align 8
  %238 = load ptr, ptr %7, align 8
  store ptr %238, ptr %4, align 8
  %239 = load ptr, ptr %4, align 8
  %240 = load i64, ptr %239, align 8
  %241 = trunc i64 %240 to i8
  store i8 %241, ptr %5, align 1
  %242 = load i8, ptr %5, align 1
  %243 = zext i8 %242 to i32
  %244 = and i32 %243, 255
  %245 = trunc i32 %244 to i8
  store i8 %245, ptr %8, align 1
  %246 = load i8, ptr %8, align 1
  %247 = zext i8 %246 to i32
  %248 = icmp eq i32 %247, 20
  br i1 %248, label %249, label %253

249:                                              ; preds = %236
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds nuw %struct.yyjson_val, ptr %250, i32 0, i32 1
  %252 = load double, ptr %251, align 8
  store double %252, ptr %6, align 8
  br label %273

253:                                              ; preds = %236
  %254 = load i8, ptr %8, align 1
  %255 = zext i8 %254 to i32
  %256 = icmp eq i32 %255, 12
  br i1 %256, label %257, label %262

257:                                              ; preds = %253
  %258 = load ptr, ptr %7, align 8
  %259 = getelementptr inbounds nuw %struct.yyjson_val, ptr %258, i32 0, i32 1
  %260 = load i64, ptr %259, align 8
  %261 = sitofp i64 %260 to double
  store double %261, ptr %6, align 8
  br label %273

262:                                              ; preds = %253
  %263 = load i8, ptr %8, align 1
  %264 = zext i8 %263 to i32
  %265 = icmp eq i32 %264, 4
  br i1 %265, label %266, label %272

266:                                              ; preds = %262
  %267 = load ptr, ptr %7, align 8
  %268 = getelementptr inbounds nuw %struct.yyjson_val, ptr %267, i32 0, i32 1
  %269 = load i64, ptr %268, align 8
  store i64 %269, ptr %3, align 8
  %270 = load i64, ptr %3, align 8
  %271 = uitofp i64 %270 to double
  store double %271, ptr %6, align 8
  br label %273

272:                                              ; preds = %262
  store double 0.000000e+00, ptr %6, align 8
  br label %273

273:                                              ; preds = %249, %257, %266, %272
  %274 = load double, ptr %6, align 8
  br label %276

275:                                              ; preds = %232
  br label %276

276:                                              ; preds = %273, %275
  %277 = phi double [ %274, %273 ], [ 0.000000e+00, %275 ]
  %278 = fptosi double %277 to i64
  store i64 %278, ptr %55, align 8
  br label %332

279:                                              ; preds = %229
  %280 = load ptr, ptr %59, align 8
  store ptr %280, ptr %52, align 8
  %281 = load ptr, ptr %52, align 8
  %282 = icmp ne ptr %281, null
  br i1 %282, label %283, label %296

283:                                              ; preds = %279
  %284 = load ptr, ptr %52, align 8
  store ptr %284, ptr %25, align 8
  %285 = load ptr, ptr %25, align 8
  store ptr %285, ptr %23, align 8
  %286 = load ptr, ptr %23, align 8
  %287 = load i64, ptr %286, align 8
  %288 = trunc i64 %287 to i8
  store i8 %288, ptr %24, align 1
  %289 = load i8, ptr %24, align 1
  %290 = zext i8 %289 to i32
  %291 = and i32 %290, 7
  %292 = trunc i32 %291 to i8
  %293 = zext i8 %292 to i32
  %294 = icmp eq i32 %293, 5
  %295 = zext i1 %294 to i32
  br label %297

296:                                              ; preds = %279
  br label %297

297:                                              ; preds = %283, %296
  %298 = phi i32 [ %295, %283 ], [ 0, %296 ]
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %300, label %331

300:                                              ; preds = %297
  %301 = load ptr, ptr %59, align 8
  store ptr %301, ptr %51, align 8
  %302 = load ptr, ptr %51, align 8
  store ptr %302, ptr %50, align 8
  %303 = load ptr, ptr %50, align 8
  %304 = icmp ne ptr %303, null
  br i1 %304, label %305, label %318

305:                                              ; preds = %300
  %306 = load ptr, ptr %50, align 8
  store ptr %306, ptr %28, align 8
  %307 = load ptr, ptr %28, align 8
  store ptr %307, ptr %26, align 8
  %308 = load ptr, ptr %26, align 8
  %309 = load i64, ptr %308, align 8
  %310 = trunc i64 %309 to i8
  store i8 %310, ptr %27, align 1
  %311 = load i8, ptr %27, align 1
  %312 = zext i8 %311 to i32
  %313 = and i32 %312, 7
  %314 = trunc i32 %313 to i8
  %315 = zext i8 %314 to i32
  %316 = icmp eq i32 %315, 5
  %317 = zext i1 %316 to i32
  br label %319

318:                                              ; preds = %300
  br label %319

319:                                              ; preds = %318, %305
  %320 = phi i32 [ %317, %305 ], [ 0, %318 ]
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %327

322:                                              ; preds = %319
  %323 = load ptr, ptr %51, align 8
  store ptr %323, ptr %22, align 8
  %324 = load ptr, ptr %22, align 8
  %325 = getelementptr inbounds nuw %struct.yyjson_val, ptr %324, i32 0, i32 1
  %326 = load ptr, ptr %325, align 8
  br label %328

327:                                              ; preds = %319
  br label %328

328:                                              ; preds = %322, %327
  %329 = phi ptr [ %326, %322 ], [ null, %327 ]
  %330 = call i64 @atoll(ptr noundef %329)
  store i64 %330, ptr %55, align 8
  br label %332

331:                                              ; preds = %297
  store i64 0, ptr %55, align 8
  br label %332

332:                                              ; preds = %331, %328, %276, %210, %91, %62
  %333 = load i64, ptr %55, align 8
  ret i64 %333
}

define internal ptr @find_class_obj(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca ptr, align 8
  %11 = alloca i8, align 1
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca ptr, align 8
  %15 = alloca i8, align 1
  %16 = alloca ptr, align 8
  %17 = alloca i8, align 1
  %18 = alloca ptr, align 8
  %19 = alloca i8, align 1
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i8, align 1
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca i64, align 8
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca i8, align 1
  %40 = alloca i64, align 8
  %41 = alloca i64, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca i64, align 8
  %47 = alloca i64, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca i8, align 1
  %54 = alloca i64, align 8
  %55 = alloca i64, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i64, align 8
  %61 = alloca i64, align 8
  %62 = alloca ptr, align 8
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca ptr, align 8
  %67 = alloca i8, align 1
  %68 = alloca ptr, align 8
  %69 = alloca i8, align 1
  %70 = alloca ptr, align 8
  %71 = alloca ptr, align 8
  %72 = alloca ptr, align 8
  %73 = alloca i8, align 1
  %74 = alloca i64, align 8
  %75 = alloca i64, align 8
  %76 = alloca ptr, align 8
  %77 = alloca ptr, align 8
  %78 = alloca ptr, align 8
  %79 = alloca ptr, align 8
  %80 = alloca ptr, align 8
  %81 = alloca ptr, align 8
  %82 = alloca ptr, align 8
  %83 = alloca ptr, align 8
  %84 = alloca ptr, align 8
  %85 = alloca ptr, align 8
  %86 = alloca ptr, align 8
  %87 = alloca ptr, align 8
  %88 = alloca ptr, align 8
  %89 = alloca ptr, align 8
  %90 = alloca ptr, align 8
  %91 = alloca i64, align 8
  %92 = alloca i64, align 8
  %93 = alloca ptr, align 8
  %94 = alloca ptr, align 8
  store ptr %0, ptr %90, align 8
  %95 = load ptr, ptr @global_config_root, align 8
  %96 = icmp ne ptr %95, null
  br i1 %96, label %98, label %97

97:                                               ; preds = %1
  store ptr null, ptr %89, align 8
  br label %505

98:                                               ; preds = %1
  %99 = load i8, ptr @global_config_is_array, align 1
  %100 = trunc i8 %99 to i1
  br i1 %100, label %101, label %389

101:                                              ; preds = %98
  store i64 0, ptr %91, align 8
  %102 = load ptr, ptr @global_config_root, align 8
  store ptr %102, ptr %88, align 8
  %103 = load ptr, ptr %88, align 8
  store ptr %103, ptr %87, align 8
  %104 = load ptr, ptr %87, align 8
  %105 = icmp ne ptr %104, null
  br i1 %105, label %106, label %119

106:                                              ; preds = %101
  %107 = load ptr, ptr %87, align 8
  store ptr %107, ptr %70, align 8
  %108 = load ptr, ptr %70, align 8
  store ptr %108, ptr %68, align 8
  %109 = load ptr, ptr %68, align 8
  %110 = load i64, ptr %109, align 8
  %111 = trunc i64 %110 to i8
  store i8 %111, ptr %69, align 1
  %112 = load i8, ptr %69, align 1
  %113 = zext i8 %112 to i32
  %114 = and i32 %113, 7
  %115 = trunc i32 %114 to i8
  %116 = zext i8 %115 to i32
  %117 = icmp eq i32 %116, 6
  %118 = zext i1 %117 to i32
  br label %120

119:                                              ; preds = %101
  br label %120

120:                                              ; preds = %119, %106
  %121 = phi i32 [ %118, %106 ], [ 0, %119 ]
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %128

123:                                              ; preds = %120
  %124 = load ptr, ptr %88, align 8
  store ptr %124, ptr %64, align 8
  %125 = load ptr, ptr %64, align 8
  %126 = load i64, ptr %125, align 8
  %127 = lshr i64 %126, 8
  br label %129

128:                                              ; preds = %120
  br label %129

129:                                              ; preds = %123, %128
  %130 = phi i64 [ %127, %123 ], [ 0, %128 ]
  store i64 %130, ptr %92, align 8
  %131 = load ptr, ptr @global_config_root, align 8
  store ptr %131, ptr %86, align 8
  %132 = load ptr, ptr %86, align 8
  store ptr %132, ptr %84, align 8
  %133 = load ptr, ptr %84, align 8
  %134 = icmp ne ptr %133, null
  br i1 %134, label %135, label %148

135:                                              ; preds = %129
  %136 = load ptr, ptr %84, align 8
  store ptr %136, ptr %71, align 8
  %137 = load ptr, ptr %71, align 8
  store ptr %137, ptr %66, align 8
  %138 = load ptr, ptr %66, align 8
  %139 = load i64, ptr %138, align 8
  %140 = trunc i64 %139 to i8
  store i8 %140, ptr %67, align 1
  %141 = load i8, ptr %67, align 1
  %142 = zext i8 %141 to i32
  %143 = and i32 %142, 7
  %144 = trunc i32 %143 to i8
  %145 = zext i8 %144 to i32
  %146 = icmp eq i32 %145, 6
  %147 = zext i1 %146 to i32
  br label %149

148:                                              ; preds = %129
  br label %149

149:                                              ; preds = %148, %135
  %150 = phi i32 [ %147, %135 ], [ 0, %148 ]
  %151 = icmp ne i32 %150, 0
  %152 = xor i1 %151, true
  %153 = zext i1 %151 to i32
  %154 = sext i32 %153 to i64
  br i1 %151, label %155, label %170

155:                                              ; preds = %149
  %156 = load ptr, ptr %86, align 8
  store ptr %156, ptr %65, align 8
  %157 = load ptr, ptr %65, align 8
  %158 = load i64, ptr %157, align 8
  %159 = lshr i64 %158, 8
  %160 = icmp ugt i64 %159, 0
  %161 = xor i1 %160, true
  %162 = zext i1 %160 to i32
  %163 = sext i32 %162 to i64
  br i1 %160, label %164, label %169

164:                                              ; preds = %155
  %165 = load ptr, ptr %86, align 8
  store ptr %165, ptr %63, align 8
  %166 = load ptr, ptr %63, align 8
  %167 = ptrtoint ptr %166 to i64
  %168 = getelementptr inbounds %struct.yyjson_val, ptr %166, i64 1
  store ptr %168, ptr %85, align 8
  br label %171

169:                                              ; preds = %155
  br label %170

170:                                              ; preds = %169, %149
  store ptr null, ptr %85, align 8
  br label %171

171:                                              ; preds = %164, %170
  %172 = load ptr, ptr %85, align 8
  store ptr %172, ptr %93, align 8
  br label %173

173:                                              ; preds = %381, %171
  %174 = load i64, ptr %91, align 8
  %175 = load i64, ptr %92, align 8
  %176 = icmp ult i64 %174, %175
  br i1 %176, label %177, label %388

177:                                              ; preds = %173
  %178 = load ptr, ptr %93, align 8
  store ptr %178, ptr %80, align 8
  store ptr @.str.5, ptr %81, align 8
  %179 = load ptr, ptr %80, align 8
  %180 = load ptr, ptr %81, align 8
  %181 = load ptr, ptr %81, align 8
  %182 = icmp ne ptr %181, null
  br i1 %182, label %183, label %186

183:                                              ; preds = %177
  %184 = load ptr, ptr %81, align 8
  %185 = call i64 @strlen(ptr noundef %184)
  br label %187

186:                                              ; preds = %177
  br label %187

187:                                              ; preds = %183, %186
  %188 = phi i64 [ %185, %183 ], [ 0, %186 ]
  store ptr %179, ptr %58, align 8
  store ptr %180, ptr %59, align 8
  store i64 %188, ptr %60, align 8
  %189 = load ptr, ptr %58, align 8
  store ptr %189, ptr %51, align 8
  %190 = load ptr, ptr %51, align 8
  %191 = icmp ne ptr %190, null
  br i1 %191, label %192, label %205

192:                                              ; preds = %187
  %193 = load ptr, ptr %51, align 8
  store ptr %193, ptr %4, align 8
  %194 = load ptr, ptr %4, align 8
  store ptr %194, ptr %2, align 8
  %195 = load ptr, ptr %2, align 8
  %196 = load i64, ptr %195, align 8
  %197 = trunc i64 %196 to i8
  store i8 %197, ptr %3, align 1
  %198 = load i8, ptr %3, align 1
  %199 = zext i8 %198 to i32
  %200 = and i32 %199, 7
  %201 = trunc i32 %200 to i8
  %202 = zext i8 %201 to i32
  %203 = icmp eq i32 %202, 7
  %204 = zext i1 %203 to i32
  br label %206

205:                                              ; preds = %187
  br label %206

206:                                              ; preds = %205, %192
  %207 = phi i32 [ %204, %192 ], [ 0, %205 ]
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %209, label %212

209:                                              ; preds = %206
  %210 = load ptr, ptr %59, align 8
  %211 = icmp ne ptr %210, null
  br label %212

212:                                              ; preds = %209, %206
  %213 = phi i1 [ false, %206 ], [ %211, %209 ]
  %214 = xor i1 %213, true
  %215 = zext i1 %213 to i32
  %216 = sext i32 %215 to i64
  br i1 %213, label %217, label %289

217:                                              ; preds = %212
  %218 = load ptr, ptr %58, align 8
  store ptr %218, ptr %50, align 8
  %219 = load ptr, ptr %50, align 8
  %220 = load i64, ptr %219, align 8
  %221 = lshr i64 %220, 8
  store i64 %221, ptr %61, align 8
  %222 = load ptr, ptr %58, align 8
  store ptr %222, ptr %49, align 8
  %223 = load ptr, ptr %49, align 8
  %224 = ptrtoint ptr %223 to i64
  %225 = getelementptr inbounds %struct.yyjson_val, ptr %223, i64 1
  store ptr %225, ptr %62, align 8
  br label %226

226:                                              ; preds = %281, %217
  %227 = load i64, ptr %61, align 8
  %228 = add i64 %227, -1
  store i64 %228, ptr %61, align 8
  %229 = icmp ugt i64 %227, 0
  br i1 %229, label %230, label %288

230:                                              ; preds = %226
  %231 = load ptr, ptr %62, align 8
  %232 = load ptr, ptr %59, align 8
  %233 = load i64, ptr %60, align 8
  store ptr %231, ptr %28, align 8
  store ptr %232, ptr %29, align 8
  store i64 %233, ptr %30, align 8
  %234 = load ptr, ptr %28, align 8
  store ptr %234, ptr %27, align 8
  %235 = load ptr, ptr %27, align 8
  %236 = load i64, ptr %235, align 8
  %237 = lshr i64 %236, 8
  %238 = load i64, ptr %30, align 8
  %239 = icmp eq i64 %237, %238
  br i1 %239, label %240, label %248

240:                                              ; preds = %230
  %241 = load ptr, ptr %28, align 8
  %242 = getelementptr inbounds nuw %struct.yyjson_val, ptr %241, i32 0, i32 1
  %243 = load ptr, ptr %242, align 8
  %244 = load ptr, ptr %29, align 8
  %245 = load i64, ptr %30, align 8
  %246 = call i32 @memcmp(ptr noundef %243, ptr noundef %244, i64 noundef %245)
  %247 = icmp eq i32 %246, 0
  br label %248

248:                                              ; preds = %230, %240
  %249 = phi i1 [ false, %230 ], [ %247, %240 ]
  br i1 %249, label %250, label %253

250:                                              ; preds = %248
  %251 = load ptr, ptr %62, align 8
  %252 = getelementptr inbounds %struct.yyjson_val, ptr %251, i64 1
  store ptr %252, ptr %57, align 8
  br label %290

253:                                              ; preds = %248
  %254 = load ptr, ptr %62, align 8
  %255 = getelementptr inbounds %struct.yyjson_val, ptr %254, i64 1
  store ptr %255, ptr %52, align 8
  %256 = load ptr, ptr %52, align 8
  store ptr %256, ptr %16, align 8
  store i8 6, ptr %17, align 1
  %257 = load ptr, ptr %16, align 8
  store ptr %257, ptr %10, align 8
  %258 = load ptr, ptr %10, align 8
  %259 = load i64, ptr %258, align 8
  %260 = trunc i64 %259 to i8
  store i8 %260, ptr %11, align 1
  %261 = load i8, ptr %11, align 1
  %262 = zext i8 %261 to i32
  %263 = and i32 %262, 255
  %264 = trunc i32 %263 to i8
  %265 = zext i8 %264 to i32
  %266 = load i8, ptr %17, align 1
  %267 = zext i8 %266 to i32
  %268 = and i32 %265, %267
  %269 = load i8, ptr %17, align 1
  %270 = zext i8 %269 to i32
  %271 = icmp eq i32 %268, %270
  %272 = zext i1 %271 to i8
  store i8 %272, ptr %53, align 1
  %273 = load ptr, ptr %52, align 8
  %274 = getelementptr inbounds nuw %struct.yyjson_val, ptr %273, i32 0, i32 1
  %275 = load i64, ptr %274, align 8
  store i64 %275, ptr %54, align 8
  %276 = load i8, ptr %53, align 1
  %277 = trunc i8 %276 to i1
  br i1 %277, label %278, label %280

278:                                              ; preds = %253
  %279 = load i64, ptr %54, align 8
  br label %281

280:                                              ; preds = %253
  br label %281

281:                                              ; preds = %280, %278
  %282 = phi i64 [ %279, %278 ], [ 16, %280 ]
  store i64 %282, ptr %55, align 8
  %283 = load ptr, ptr %52, align 8
  %284 = ptrtoint ptr %283 to i64
  store ptr %283, ptr %56, align 8
  %285 = load ptr, ptr %56, align 8
  %286 = load i64, ptr %55, align 8
  %287 = getelementptr inbounds nuw i8, ptr %285, i64 %286
  store ptr %287, ptr %62, align 8
  br label %226, !llvm.loop !9

288:                                              ; preds = %226
  br label %289

289:                                              ; preds = %288, %212
  store ptr null, ptr %57, align 8
  br label %290

290:                                              ; preds = %250, %289
  %291 = load ptr, ptr %57, align 8
  store ptr %291, ptr %94, align 8
  %292 = load ptr, ptr %94, align 8
  %293 = icmp ne ptr %292, null
  br i1 %293, label %294, label %351

294:                                              ; preds = %290
  %295 = load ptr, ptr %94, align 8
  store ptr %295, ptr %79, align 8
  %296 = load ptr, ptr %79, align 8
  %297 = icmp ne ptr %296, null
  br i1 %297, label %298, label %311

298:                                              ; preds = %294
  %299 = load ptr, ptr %79, align 8
  store ptr %299, ptr %23, align 8
  %300 = load ptr, ptr %23, align 8
  store ptr %300, ptr %21, align 8
  %301 = load ptr, ptr %21, align 8
  %302 = load i64, ptr %301, align 8
  %303 = trunc i64 %302 to i8
  store i8 %303, ptr %22, align 1
  %304 = load i8, ptr %22, align 1
  %305 = zext i8 %304 to i32
  %306 = and i32 %305, 7
  %307 = trunc i32 %306 to i8
  %308 = zext i8 %307 to i32
  %309 = icmp eq i32 %308, 5
  %310 = zext i1 %309 to i32
  br label %312

311:                                              ; preds = %294
  br label %312

312:                                              ; preds = %298, %311
  %313 = phi i32 [ %310, %298 ], [ 0, %311 ]
  %314 = icmp ne i32 %313, 0
  br i1 %314, label %315, label %351

315:                                              ; preds = %312
  %316 = load ptr, ptr %94, align 8
  store ptr %316, ptr %78, align 8
  %317 = load ptr, ptr %78, align 8
  store ptr %317, ptr %77, align 8
  %318 = load ptr, ptr %77, align 8
  %319 = icmp ne ptr %318, null
  br i1 %319, label %320, label %333

320:                                              ; preds = %315
  %321 = load ptr, ptr %77, align 8
  store ptr %321, ptr %26, align 8
  %322 = load ptr, ptr %26, align 8
  store ptr %322, ptr %24, align 8
  %323 = load ptr, ptr %24, align 8
  %324 = load i64, ptr %323, align 8
  %325 = trunc i64 %324 to i8
  store i8 %325, ptr %25, align 1
  %326 = load i8, ptr %25, align 1
  %327 = zext i8 %326 to i32
  %328 = and i32 %327, 7
  %329 = trunc i32 %328 to i8
  %330 = zext i8 %329 to i32
  %331 = icmp eq i32 %330, 5
  %332 = zext i1 %331 to i32
  br label %334

333:                                              ; preds = %315
  br label %334

334:                                              ; preds = %333, %320
  %335 = phi i32 [ %332, %320 ], [ 0, %333 ]
  %336 = icmp ne i32 %335, 0
  br i1 %336, label %337, label %342

337:                                              ; preds = %334
  %338 = load ptr, ptr %78, align 8
  store ptr %338, ptr %20, align 8
  %339 = load ptr, ptr %20, align 8
  %340 = getelementptr inbounds nuw %struct.yyjson_val, ptr %339, i32 0, i32 1
  %341 = load ptr, ptr %340, align 8
  br label %343

342:                                              ; preds = %334
  br label %343

343:                                              ; preds = %337, %342
  %344 = phi ptr [ %341, %337 ], [ null, %342 ]
  %345 = load ptr, ptr %90, align 8
  %346 = call i32 @strcmp(ptr noundef %344, ptr noundef %345)
  %347 = icmp eq i32 %346, 0
  br i1 %347, label %348, label %350

348:                                              ; preds = %343
  %349 = load ptr, ptr %93, align 8
  store ptr %349, ptr %89, align 8
  br label %505

350:                                              ; preds = %343
  br label %351

351:                                              ; preds = %350, %312, %290
  br label %352

352:                                              ; preds = %351
  %353 = load i64, ptr %91, align 8
  %354 = add i64 %353, 1
  store i64 %354, ptr %91, align 8
  %355 = load ptr, ptr %93, align 8
  store ptr %355, ptr %72, align 8
  %356 = load ptr, ptr %72, align 8
  store ptr %356, ptr %14, align 8
  store i8 6, ptr %15, align 1
  %357 = load ptr, ptr %14, align 8
  store ptr %357, ptr %12, align 8
  %358 = load ptr, ptr %12, align 8
  %359 = load i64, ptr %358, align 8
  %360 = trunc i64 %359 to i8
  store i8 %360, ptr %13, align 1
  %361 = load i8, ptr %13, align 1
  %362 = zext i8 %361 to i32
  %363 = and i32 %362, 255
  %364 = trunc i32 %363 to i8
  %365 = zext i8 %364 to i32
  %366 = load i8, ptr %15, align 1
  %367 = zext i8 %366 to i32
  %368 = and i32 %365, %367
  %369 = load i8, ptr %15, align 1
  %370 = zext i8 %369 to i32
  %371 = icmp eq i32 %368, %370
  %372 = zext i1 %371 to i8
  store i8 %372, ptr %73, align 1
  %373 = load ptr, ptr %72, align 8
  %374 = getelementptr inbounds nuw %struct.yyjson_val, ptr %373, i32 0, i32 1
  %375 = load i64, ptr %374, align 8
  store i64 %375, ptr %74, align 8
  %376 = load i8, ptr %73, align 1
  %377 = trunc i8 %376 to i1
  br i1 %377, label %378, label %380

378:                                              ; preds = %352
  %379 = load i64, ptr %74, align 8
  br label %381

380:                                              ; preds = %352
  br label %381

381:                                              ; preds = %378, %380
  %382 = phi i64 [ %379, %378 ], [ 16, %380 ]
  store i64 %382, ptr %75, align 8
  %383 = load ptr, ptr %72, align 8
  %384 = ptrtoint ptr %383 to i64
  store ptr %383, ptr %76, align 8
  %385 = load ptr, ptr %76, align 8
  %386 = load i64, ptr %75, align 8
  %387 = getelementptr inbounds nuw i8, ptr %385, i64 %386
  store ptr %387, ptr %93, align 8
  br label %173, !llvm.loop !12

388:                                              ; preds = %173
  store ptr null, ptr %89, align 8
  br label %505

389:                                              ; preds = %98
  %390 = load ptr, ptr @global_config_root, align 8
  %391 = load ptr, ptr %90, align 8
  store ptr %390, ptr %82, align 8
  store ptr %391, ptr %83, align 8
  %392 = load ptr, ptr %82, align 8
  %393 = load ptr, ptr %83, align 8
  %394 = load ptr, ptr %83, align 8
  %395 = icmp ne ptr %394, null
  br i1 %395, label %396, label %399

396:                                              ; preds = %389
  %397 = load ptr, ptr %83, align 8
  %398 = call i64 @strlen(ptr noundef %397)
  br label %400

399:                                              ; preds = %389
  br label %400

400:                                              ; preds = %396, %399
  %401 = phi i64 [ %398, %396 ], [ 0, %399 ]
  store ptr %392, ptr %44, align 8
  store ptr %393, ptr %45, align 8
  store i64 %401, ptr %46, align 8
  %402 = load ptr, ptr %44, align 8
  store ptr %402, ptr %37, align 8
  %403 = load ptr, ptr %37, align 8
  %404 = icmp ne ptr %403, null
  br i1 %404, label %405, label %418

405:                                              ; preds = %400
  %406 = load ptr, ptr %37, align 8
  store ptr %406, ptr %7, align 8
  %407 = load ptr, ptr %7, align 8
  store ptr %407, ptr %5, align 8
  %408 = load ptr, ptr %5, align 8
  %409 = load i64, ptr %408, align 8
  %410 = trunc i64 %409 to i8
  store i8 %410, ptr %6, align 1
  %411 = load i8, ptr %6, align 1
  %412 = zext i8 %411 to i32
  %413 = and i32 %412, 7
  %414 = trunc i32 %413 to i8
  %415 = zext i8 %414 to i32
  %416 = icmp eq i32 %415, 7
  %417 = zext i1 %416 to i32
  br label %419

418:                                              ; preds = %400
  br label %419

419:                                              ; preds = %418, %405
  %420 = phi i32 [ %417, %405 ], [ 0, %418 ]
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %422, label %425

422:                                              ; preds = %419
  %423 = load ptr, ptr %45, align 8
  %424 = icmp ne ptr %423, null
  br label %425

425:                                              ; preds = %422, %419
  %426 = phi i1 [ false, %419 ], [ %424, %422 ]
  %427 = xor i1 %426, true
  %428 = zext i1 %426 to i32
  %429 = sext i32 %428 to i64
  br i1 %426, label %430, label %502

430:                                              ; preds = %425
  %431 = load ptr, ptr %44, align 8
  store ptr %431, ptr %36, align 8
  %432 = load ptr, ptr %36, align 8
  %433 = load i64, ptr %432, align 8
  %434 = lshr i64 %433, 8
  store i64 %434, ptr %47, align 8
  %435 = load ptr, ptr %44, align 8
  store ptr %435, ptr %35, align 8
  %436 = load ptr, ptr %35, align 8
  %437 = ptrtoint ptr %436 to i64
  %438 = getelementptr inbounds %struct.yyjson_val, ptr %436, i64 1
  store ptr %438, ptr %48, align 8
  br label %439

439:                                              ; preds = %494, %430
  %440 = load i64, ptr %47, align 8
  %441 = add i64 %440, -1
  store i64 %441, ptr %47, align 8
  %442 = icmp ugt i64 %440, 0
  br i1 %442, label %443, label %501

443:                                              ; preds = %439
  %444 = load ptr, ptr %48, align 8
  %445 = load ptr, ptr %45, align 8
  %446 = load i64, ptr %46, align 8
  store ptr %444, ptr %32, align 8
  store ptr %445, ptr %33, align 8
  store i64 %446, ptr %34, align 8
  %447 = load ptr, ptr %32, align 8
  store ptr %447, ptr %31, align 8
  %448 = load ptr, ptr %31, align 8
  %449 = load i64, ptr %448, align 8
  %450 = lshr i64 %449, 8
  %451 = load i64, ptr %34, align 8
  %452 = icmp eq i64 %450, %451
  br i1 %452, label %453, label %461

453:                                              ; preds = %443
  %454 = load ptr, ptr %32, align 8
  %455 = getelementptr inbounds nuw %struct.yyjson_val, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = load ptr, ptr %33, align 8
  %458 = load i64, ptr %34, align 8
  %459 = call i32 @memcmp(ptr noundef %456, ptr noundef %457, i64 noundef %458)
  %460 = icmp eq i32 %459, 0
  br label %461

461:                                              ; preds = %443, %453
  %462 = phi i1 [ false, %443 ], [ %460, %453 ]
  br i1 %462, label %463, label %466

463:                                              ; preds = %461
  %464 = load ptr, ptr %48, align 8
  %465 = getelementptr inbounds %struct.yyjson_val, ptr %464, i64 1
  store ptr %465, ptr %43, align 8
  br label %503

466:                                              ; preds = %461
  %467 = load ptr, ptr %48, align 8
  %468 = getelementptr inbounds %struct.yyjson_val, ptr %467, i64 1
  store ptr %468, ptr %38, align 8
  %469 = load ptr, ptr %38, align 8
  store ptr %469, ptr %18, align 8
  store i8 6, ptr %19, align 1
  %470 = load ptr, ptr %18, align 8
  store ptr %470, ptr %8, align 8
  %471 = load ptr, ptr %8, align 8
  %472 = load i64, ptr %471, align 8
  %473 = trunc i64 %472 to i8
  store i8 %473, ptr %9, align 1
  %474 = load i8, ptr %9, align 1
  %475 = zext i8 %474 to i32
  %476 = and i32 %475, 255
  %477 = trunc i32 %476 to i8
  %478 = zext i8 %477 to i32
  %479 = load i8, ptr %19, align 1
  %480 = zext i8 %479 to i32
  %481 = and i32 %478, %480
  %482 = load i8, ptr %19, align 1
  %483 = zext i8 %482 to i32
  %484 = icmp eq i32 %481, %483
  %485 = zext i1 %484 to i8
  store i8 %485, ptr %39, align 1
  %486 = load ptr, ptr %38, align 8
  %487 = getelementptr inbounds nuw %struct.yyjson_val, ptr %486, i32 0, i32 1
  %488 = load i64, ptr %487, align 8
  store i64 %488, ptr %40, align 8
  %489 = load i8, ptr %39, align 1
  %490 = trunc i8 %489 to i1
  br i1 %490, label %491, label %493

491:                                              ; preds = %466
  %492 = load i64, ptr %40, align 8
  br label %494

493:                                              ; preds = %466
  br label %494

494:                                              ; preds = %493, %491
  %495 = phi i64 [ %492, %491 ], [ 16, %493 ]
  store i64 %495, ptr %41, align 8
  %496 = load ptr, ptr %38, align 8
  %497 = ptrtoint ptr %496 to i64
  store ptr %496, ptr %42, align 8
  %498 = load ptr, ptr %42, align 8
  %499 = load i64, ptr %41, align 8
  %500 = getelementptr inbounds nuw i8, ptr %498, i64 %499
  store ptr %500, ptr %48, align 8
  br label %439, !llvm.loop !9

501:                                              ; preds = %439
  br label %502

502:                                              ; preds = %501, %425
  store ptr null, ptr %43, align 8
  br label %503

503:                                              ; preds = %463, %502
  %504 = load ptr, ptr %43, align 8
  store ptr %504, ptr %89, align 8
  br label %505

505:                                              ; preds = %503, %388, %348, %97
  %506 = load ptr, ptr %89, align 8
  ret ptr %506
}

declare i64 @atoll(ptr noundef)

define dso_local ptr @Helper_config_s(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  %11 = alloca ptr, align 8
  %12 = alloca i8, align 1
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i8, align 1
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i8, align 1
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i64, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i8, align 1
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i64, align 8
  %36 = alloca i64, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  store ptr %0, ptr %45, align 8
  store ptr %1, ptr %46, align 8
  %49 = load ptr, ptr @global_config, align 8
  %50 = icmp ne ptr %49, null
  br i1 %50, label %54, label %51

51:                                               ; preds = %2
  %52 = load ptr, ptr @stderr, align 8
  %53 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %52, ptr noundef @.str.6)
  store ptr @.str.7, ptr %44, align 8
  br label %254

54:                                               ; preds = %2
  %55 = load ptr, ptr %45, align 8
  %56 = call ptr @find_class_obj(ptr noundef %55)
  store ptr %56, ptr %47, align 8
  %57 = load ptr, ptr %47, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %80

59:                                               ; preds = %54
  %60 = load ptr, ptr %47, align 8
  store ptr %60, ptr %38, align 8
  %61 = load ptr, ptr %38, align 8
  %62 = icmp ne ptr %61, null
  br i1 %62, label %63, label %76

63:                                               ; preds = %59
  %64 = load ptr, ptr %38, align 8
  store ptr %64, ptr %5, align 8
  %65 = load ptr, ptr %5, align 8
  store ptr %65, ptr %3, align 8
  %66 = load ptr, ptr %3, align 8
  %67 = load i64, ptr %66, align 8
  %68 = trunc i64 %67 to i8
  store i8 %68, ptr %4, align 1
  %69 = load i8, ptr %4, align 1
  %70 = zext i8 %69 to i32
  %71 = and i32 %70, 7
  %72 = trunc i32 %71 to i8
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 7
  %75 = zext i1 %74 to i32
  br label %77

76:                                               ; preds = %59
  br label %77

77:                                               ; preds = %63, %76
  %78 = phi i32 [ %75, %63 ], [ 0, %76 ]
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %84, label %80

80:                                               ; preds = %77, %54
  %81 = load ptr, ptr @stderr, align 8
  %82 = load ptr, ptr %45, align 8
  %83 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %81, ptr noundef @.str.8, ptr noundef %82)
  store ptr @.str.7, ptr %44, align 8
  br label %254

84:                                               ; preds = %77
  %85 = load ptr, ptr %47, align 8
  %86 = load ptr, ptr %46, align 8
  store ptr %85, ptr %42, align 8
  store ptr %86, ptr %43, align 8
  %87 = load ptr, ptr %42, align 8
  %88 = load ptr, ptr %43, align 8
  %89 = load ptr, ptr %43, align 8
  %90 = icmp ne ptr %89, null
  br i1 %90, label %91, label %94

91:                                               ; preds = %84
  %92 = load ptr, ptr %43, align 8
  %93 = call i64 @strlen(ptr noundef %92)
  br label %95

94:                                               ; preds = %84
  br label %95

95:                                               ; preds = %91, %94
  %96 = phi i64 [ %93, %91 ], [ 0, %94 ]
  store ptr %87, ptr %33, align 8
  store ptr %88, ptr %34, align 8
  store i64 %96, ptr %35, align 8
  %97 = load ptr, ptr %33, align 8
  store ptr %97, ptr %26, align 8
  %98 = load ptr, ptr %26, align 8
  %99 = icmp ne ptr %98, null
  br i1 %99, label %100, label %113

100:                                              ; preds = %95
  %101 = load ptr, ptr %26, align 8
  store ptr %101, ptr %8, align 8
  %102 = load ptr, ptr %8, align 8
  store ptr %102, ptr %6, align 8
  %103 = load ptr, ptr %6, align 8
  %104 = load i64, ptr %103, align 8
  %105 = trunc i64 %104 to i8
  store i8 %105, ptr %7, align 1
  %106 = load i8, ptr %7, align 1
  %107 = zext i8 %106 to i32
  %108 = and i32 %107, 7
  %109 = trunc i32 %108 to i8
  %110 = zext i8 %109 to i32
  %111 = icmp eq i32 %110, 7
  %112 = zext i1 %111 to i32
  br label %114

113:                                              ; preds = %95
  br label %114

114:                                              ; preds = %113, %100
  %115 = phi i32 [ %112, %100 ], [ 0, %113 ]
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %120

117:                                              ; preds = %114
  %118 = load ptr, ptr %34, align 8
  %119 = icmp ne ptr %118, null
  br label %120

120:                                              ; preds = %117, %114
  %121 = phi i1 [ false, %114 ], [ %119, %117 ]
  %122 = xor i1 %121, true
  %123 = zext i1 %121 to i32
  %124 = sext i32 %123 to i64
  br i1 %121, label %125, label %197

125:                                              ; preds = %120
  %126 = load ptr, ptr %33, align 8
  store ptr %126, ptr %25, align 8
  %127 = load ptr, ptr %25, align 8
  %128 = load i64, ptr %127, align 8
  %129 = lshr i64 %128, 8
  store i64 %129, ptr %36, align 8
  %130 = load ptr, ptr %33, align 8
  store ptr %130, ptr %24, align 8
  %131 = load ptr, ptr %24, align 8
  %132 = ptrtoint ptr %131 to i64
  %133 = getelementptr inbounds %struct.yyjson_val, ptr %131, i64 1
  store ptr %133, ptr %37, align 8
  br label %134

134:                                              ; preds = %189, %125
  %135 = load i64, ptr %36, align 8
  %136 = add i64 %135, -1
  store i64 %136, ptr %36, align 8
  %137 = icmp ugt i64 %135, 0
  br i1 %137, label %138, label %196

138:                                              ; preds = %134
  %139 = load ptr, ptr %37, align 8
  %140 = load ptr, ptr %34, align 8
  %141 = load i64, ptr %35, align 8
  store ptr %139, ptr %21, align 8
  store ptr %140, ptr %22, align 8
  store i64 %141, ptr %23, align 8
  %142 = load ptr, ptr %21, align 8
  store ptr %142, ptr %20, align 8
  %143 = load ptr, ptr %20, align 8
  %144 = load i64, ptr %143, align 8
  %145 = lshr i64 %144, 8
  %146 = load i64, ptr %23, align 8
  %147 = icmp eq i64 %145, %146
  br i1 %147, label %148, label %156

148:                                              ; preds = %138
  %149 = load ptr, ptr %21, align 8
  %150 = getelementptr inbounds nuw %struct.yyjson_val, ptr %149, i32 0, i32 1
  %151 = load ptr, ptr %150, align 8
  %152 = load ptr, ptr %22, align 8
  %153 = load i64, ptr %23, align 8
  %154 = call i32 @memcmp(ptr noundef %151, ptr noundef %152, i64 noundef %153)
  %155 = icmp eq i32 %154, 0
  br label %156

156:                                              ; preds = %138, %148
  %157 = phi i1 [ false, %138 ], [ %155, %148 ]
  br i1 %157, label %158, label %161

158:                                              ; preds = %156
  %159 = load ptr, ptr %37, align 8
  %160 = getelementptr inbounds %struct.yyjson_val, ptr %159, i64 1
  store ptr %160, ptr %32, align 8
  br label %198

161:                                              ; preds = %156
  %162 = load ptr, ptr %37, align 8
  %163 = getelementptr inbounds %struct.yyjson_val, ptr %162, i64 1
  store ptr %163, ptr %27, align 8
  %164 = load ptr, ptr %27, align 8
  store ptr %164, ptr %11, align 8
  store i8 6, ptr %12, align 1
  %165 = load ptr, ptr %11, align 8
  store ptr %165, ptr %9, align 8
  %166 = load ptr, ptr %9, align 8
  %167 = load i64, ptr %166, align 8
  %168 = trunc i64 %167 to i8
  store i8 %168, ptr %10, align 1
  %169 = load i8, ptr %10, align 1
  %170 = zext i8 %169 to i32
  %171 = and i32 %170, 255
  %172 = trunc i32 %171 to i8
  %173 = zext i8 %172 to i32
  %174 = load i8, ptr %12, align 1
  %175 = zext i8 %174 to i32
  %176 = and i32 %173, %175
  %177 = load i8, ptr %12, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp eq i32 %176, %178
  %180 = zext i1 %179 to i8
  store i8 %180, ptr %28, align 1
  %181 = load ptr, ptr %27, align 8
  %182 = getelementptr inbounds nuw %struct.yyjson_val, ptr %181, i32 0, i32 1
  %183 = load i64, ptr %182, align 8
  store i64 %183, ptr %29, align 8
  %184 = load i8, ptr %28, align 1
  %185 = trunc i8 %184 to i1
  br i1 %185, label %186, label %188

186:                                              ; preds = %161
  %187 = load i64, ptr %29, align 8
  br label %189

188:                                              ; preds = %161
  br label %189

189:                                              ; preds = %188, %186
  %190 = phi i64 [ %187, %186 ], [ 16, %188 ]
  store i64 %190, ptr %30, align 8
  %191 = load ptr, ptr %27, align 8
  %192 = ptrtoint ptr %191 to i64
  store ptr %191, ptr %31, align 8
  %193 = load ptr, ptr %31, align 8
  %194 = load i64, ptr %30, align 8
  %195 = getelementptr inbounds nuw i8, ptr %193, i64 %194
  store ptr %195, ptr %37, align 8
  br label %134, !llvm.loop !9

196:                                              ; preds = %134
  br label %197

197:                                              ; preds = %196, %120
  store ptr null, ptr %32, align 8
  br label %198

198:                                              ; preds = %158, %197
  %199 = load ptr, ptr %32, align 8
  store ptr %199, ptr %48, align 8
  %200 = load ptr, ptr %48, align 8
  %201 = icmp ne ptr %200, null
  br i1 %201, label %202, label %223

202:                                              ; preds = %198
  %203 = load ptr, ptr %48, align 8
  store ptr %203, ptr %41, align 8
  %204 = load ptr, ptr %41, align 8
  %205 = icmp ne ptr %204, null
  br i1 %205, label %206, label %219

206:                                              ; preds = %202
  %207 = load ptr, ptr %41, align 8
  store ptr %207, ptr %16, align 8
  %208 = load ptr, ptr %16, align 8
  store ptr %208, ptr %14, align 8
  %209 = load ptr, ptr %14, align 8
  %210 = load i64, ptr %209, align 8
  %211 = trunc i64 %210 to i8
  store i8 %211, ptr %15, align 1
  %212 = load i8, ptr %15, align 1
  %213 = zext i8 %212 to i32
  %214 = and i32 %213, 7
  %215 = trunc i32 %214 to i8
  %216 = zext i8 %215 to i32
  %217 = icmp eq i32 %216, 5
  %218 = zext i1 %217 to i32
  br label %220

219:                                              ; preds = %202
  br label %220

220:                                              ; preds = %206, %219
  %221 = phi i32 [ %218, %206 ], [ 0, %219 ]
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %224, label %223

223:                                              ; preds = %220, %198
  store ptr @.str.7, ptr %44, align 8
  br label %254

224:                                              ; preds = %220
  %225 = load ptr, ptr %48, align 8
  store ptr %225, ptr %40, align 8
  %226 = load ptr, ptr %40, align 8
  store ptr %226, ptr %39, align 8
  %227 = load ptr, ptr %39, align 8
  %228 = icmp ne ptr %227, null
  br i1 %228, label %229, label %242

229:                                              ; preds = %224
  %230 = load ptr, ptr %39, align 8
  store ptr %230, ptr %19, align 8
  %231 = load ptr, ptr %19, align 8
  store ptr %231, ptr %17, align 8
  %232 = load ptr, ptr %17, align 8
  %233 = load i64, ptr %232, align 8
  %234 = trunc i64 %233 to i8
  store i8 %234, ptr %18, align 1
  %235 = load i8, ptr %18, align 1
  %236 = zext i8 %235 to i32
  %237 = and i32 %236, 7
  %238 = trunc i32 %237 to i8
  %239 = zext i8 %238 to i32
  %240 = icmp eq i32 %239, 5
  %241 = zext i1 %240 to i32
  br label %243

242:                                              ; preds = %224
  br label %243

243:                                              ; preds = %242, %229
  %244 = phi i32 [ %241, %229 ], [ 0, %242 ]
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %251

246:                                              ; preds = %243
  %247 = load ptr, ptr %40, align 8
  store ptr %247, ptr %13, align 8
  %248 = load ptr, ptr %13, align 8
  %249 = getelementptr inbounds nuw %struct.yyjson_val, ptr %248, i32 0, i32 1
  %250 = load ptr, ptr %249, align 8
  br label %252

251:                                              ; preds = %243
  br label %252

252:                                              ; preds = %246, %251
  %253 = phi ptr [ %250, %246 ], [ null, %251 ]
  store ptr %253, ptr %44, align 8
  br label %254

254:                                              ; preds = %252, %223, %80, %51
  %255 = load ptr, ptr %44, align 8
  ret ptr %255
}

declare ptr @yyjson_read_opts(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef)

declare i64 @strlen(ptr noundef)

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare i32 @strcmp(ptr noundef, ptr noundef)


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
