; ModuleID = 'c/src/neural_net.c'
source_filename = "c/src/neural_net.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.NeuralNetData = type { i32, double, ptr }
%struct.NeuralNetwork = type { ptr, i32, ptr, i32, ptr, i32, ptr, i32, ptr, i32, i32 }
%struct.NeuralNetNeuron = type { ptr, i32, i32, ptr, i32, i32, double, double, double, double }
%struct.NeuralNetSynapse = type { double, double, ptr, ptr }

@__const.NeuralNet_run.inputs_10 = private unnamed_addr constant [2 x double] [double 1.000000e+00, double 0.000000e+00], align 16
@__const.NeuralNet_run.inputs_01 = private unnamed_addr constant [2 x double] [double 0.000000e+00, double 1.000000e+00], align 16
@__const.NeuralNet_run.targets_1 = private unnamed_addr constant [1 x double] [double 1.000000e+00], align 8
@__const.NeuralNet_run.inputs_11 = private unnamed_addr constant [2 x double] [double 1.000000e+00, double 1.000000e+00], align 16
@__const.NeuralNet_checksum.inputs_01 = private unnamed_addr constant [2 x double] [double 0.000000e+00, double 1.000000e+00], align 16
@__const.NeuralNet_checksum.inputs_10 = private unnamed_addr constant [2 x double] [double 1.000000e+00, double 0.000000e+00], align 16
@__const.NeuralNet_checksum.inputs_11 = private unnamed_addr constant [2 x double] [double 1.000000e+00, double 1.000000e+00], align 16
@.str = private unnamed_addr constant [15 x i8] c"Etc::NeuralNet\00", align 1

define dso_local void @NeuralNet_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %7, i32 0, i32 0
  store i32 0, ptr %8, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %9, i32 0, i32 1
  store double 0.000000e+00, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  call void @network_free(ptr noundef %18)
  br label %19

19:                                               ; preds = %15, %1
  call void @Helper_reset()
  %20 = call ptr @network_new(i32 noundef 2, i32 noundef 10, i32 noundef 1)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %21, i32 0, i32 2
  store ptr %20, ptr %22, align 8
  ret void
}

define internal void @network_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  br label %51

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %31, %7
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %34

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %17, i64 %19
  %21 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  call void @free(ptr noundef %22)
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %25, i64 %27
  %29 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %28, i32 0, i32 3
  %30 = load ptr, ptr %29, align 8
  call void @free(ptr noundef %30)
  br label %31

31:                                               ; preds = %14
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %8, !llvm.loop !6

34:                                               ; preds = %8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  call void @free(ptr noundef %37)
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  call void @free(ptr noundef %40)
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %44, i32 0, i32 6
  %46 = load ptr, ptr %45, align 8
  call void @free(ptr noundef %46)
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %47, i32 0, i32 8
  %49 = load ptr, ptr %48, align 8
  call void @free(ptr noundef %49)
  %50 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %50)
  br label %51

51:                                               ; preds = %34, %6
  ret void
}

declare void @Helper_reset()

define internal ptr @network_new(i32 noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca double, align 8
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca double, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %24 = call noalias ptr @malloc(i64 noundef 80)
  store ptr %24, ptr %7, align 8
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %30, i32 0, i32 1
  store i32 %29, ptr %31, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %32, i32 0, i32 1
  %34 = load i32, ptr %33, align 8
  %35 = sext i32 %34 to i64
  %36 = mul i64 %35, 64
  %37 = call noalias ptr @malloc(i64 noundef %36)
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %38, i32 0, i32 0
  store ptr %37, ptr %39, align 8
  store i32 0, ptr %8, align 4
  br label %40

40:                                               ; preds = %53, %3
  %41 = load i32, ptr %8, align 4
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 8
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %56

46:                                               ; preds = %40
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %49, i64 %51
  call void @neuron_init(ptr noundef %52)
  br label %53

53:                                               ; preds = %46
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  br label %40, !llvm.loop !8

56:                                               ; preds = %40
  %57 = load i32, ptr %4, align 4
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %58, i32 0, i32 3
  store i32 %57, ptr %59, align 8
  %60 = load i32, ptr %5, align 4
  %61 = load ptr, ptr %7, align 8
  %62 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %61, i32 0, i32 5
  store i32 %60, ptr %62, align 8
  %63 = load i32, ptr %6, align 4
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %64, i32 0, i32 7
  store i32 %63, ptr %65, align 8
  %66 = load i32, ptr %4, align 4
  %67 = sext i32 %66 to i64
  %68 = mul i64 %67, 4
  %69 = call noalias ptr @malloc(i64 noundef %68)
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %70, i32 0, i32 2
  store ptr %69, ptr %71, align 8
  %72 = load i32, ptr %5, align 4
  %73 = sext i32 %72 to i64
  %74 = mul i64 %73, 4
  %75 = call noalias ptr @malloc(i64 noundef %74)
  %76 = load ptr, ptr %7, align 8
  %77 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %76, i32 0, i32 4
  store ptr %75, ptr %77, align 8
  %78 = load i32, ptr %6, align 4
  %79 = sext i32 %78 to i64
  %80 = mul i64 %79, 4
  %81 = call noalias ptr @malloc(i64 noundef %80)
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %82, i32 0, i32 6
  store ptr %81, ptr %83, align 8
  store i32 0, ptr %9, align 4
  br label %84

84:                                               ; preds = %96, %56
  %85 = load i32, ptr %9, align 4
  %86 = load i32, ptr %4, align 4
  %87 = icmp slt i32 %85, %86
  br i1 %87, label %88, label %99

88:                                               ; preds = %84
  %89 = load i32, ptr %9, align 4
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %90, i32 0, i32 2
  %92 = load ptr, ptr %91, align 8
  %93 = load i32, ptr %9, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, ptr %92, i64 %94
  store i32 %89, ptr %95, align 4
  br label %96

96:                                               ; preds = %88
  %97 = load i32, ptr %9, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %9, align 4
  br label %84, !llvm.loop !9

99:                                               ; preds = %84
  store i32 0, ptr %10, align 4
  br label %100

100:                                              ; preds = %114, %99
  %101 = load i32, ptr %10, align 4
  %102 = load i32, ptr %5, align 4
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %117

104:                                              ; preds = %100
  %105 = load i32, ptr %4, align 4
  %106 = load i32, ptr %10, align 4
  %107 = add nsw i32 %105, %106
  %108 = load ptr, ptr %7, align 8
  %109 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %108, i32 0, i32 4
  %110 = load ptr, ptr %109, align 8
  %111 = load i32, ptr %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %110, i64 %112
  store i32 %107, ptr %113, align 4
  br label %114

114:                                              ; preds = %104
  %115 = load i32, ptr %10, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %10, align 4
  br label %100, !llvm.loop !10

117:                                              ; preds = %100
  store i32 0, ptr %11, align 4
  br label %118

118:                                              ; preds = %134, %117
  %119 = load i32, ptr %11, align 4
  %120 = load i32, ptr %6, align 4
  %121 = icmp slt i32 %119, %120
  br i1 %121, label %122, label %137

122:                                              ; preds = %118
  %123 = load i32, ptr %4, align 4
  %124 = load i32, ptr %5, align 4
  %125 = add nsw i32 %123, %124
  %126 = load i32, ptr %11, align 4
  %127 = add nsw i32 %125, %126
  %128 = load ptr, ptr %7, align 8
  %129 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %128, i32 0, i32 6
  %130 = load ptr, ptr %129, align 8
  %131 = load i32, ptr %11, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, ptr %130, i64 %132
  store i32 %127, ptr %133, align 4
  br label %134

134:                                              ; preds = %122
  %135 = load i32, ptr %11, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %11, align 4
  br label %118, !llvm.loop !11

137:                                              ; preds = %118
  %138 = load ptr, ptr %7, align 8
  %139 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %138, i32 0, i32 9
  store i32 0, ptr %139, align 8
  %140 = load i32, ptr %4, align 4
  %141 = load i32, ptr %5, align 4
  %142 = mul nsw i32 %140, %141
  %143 = load i32, ptr %5, align 4
  %144 = load i32, ptr %6, align 4
  %145 = mul nsw i32 %143, %144
  %146 = add nsw i32 %142, %145
  %147 = load ptr, ptr %7, align 8
  %148 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %147, i32 0, i32 10
  store i32 %146, ptr %148, align 4
  %149 = load ptr, ptr %7, align 8
  %150 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %149, i32 0, i32 10
  %151 = load i32, ptr %150, align 4
  %152 = sext i32 %151 to i64
  %153 = mul i64 %152, 32
  %154 = call noalias ptr @malloc(i64 noundef %153)
  %155 = load ptr, ptr %7, align 8
  %156 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %155, i32 0, i32 8
  store ptr %154, ptr %156, align 8
  store i32 0, ptr %12, align 4
  br label %157

157:                                              ; preds = %221, %137
  %158 = load i32, ptr %12, align 4
  %159 = load i32, ptr %4, align 4
  %160 = icmp slt i32 %158, %159
  br i1 %160, label %161, label %224

161:                                              ; preds = %157
  %162 = load ptr, ptr %7, align 8
  %163 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %162, i32 0, i32 0
  %164 = load ptr, ptr %163, align 8
  %165 = load ptr, ptr %7, align 8
  %166 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %165, i32 0, i32 2
  %167 = load ptr, ptr %166, align 8
  %168 = load i32, ptr %12, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i32, ptr %167, i64 %169
  %171 = load i32, ptr %170, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %164, i64 %172
  store ptr %173, ptr %13, align 8
  store i32 0, ptr %14, align 4
  br label %174

174:                                              ; preds = %217, %161
  %175 = load i32, ptr %14, align 4
  %176 = load i32, ptr %5, align 4
  %177 = icmp slt i32 %175, %176
  br i1 %177, label %178, label %220

178:                                              ; preds = %174
  %179 = load ptr, ptr %7, align 8
  %180 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %179, i32 0, i32 0
  %181 = load ptr, ptr %180, align 8
  %182 = load ptr, ptr %7, align 8
  %183 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %182, i32 0, i32 4
  %184 = load ptr, ptr %183, align 8
  %185 = load i32, ptr %14, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i32, ptr %184, i64 %186
  %188 = load i32, ptr %187, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %181, i64 %189
  store ptr %190, ptr %15, align 8
  %191 = load ptr, ptr %7, align 8
  %192 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %191, i32 0, i32 8
  %193 = load ptr, ptr %192, align 8
  %194 = load ptr, ptr %7, align 8
  %195 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %194, i32 0, i32 9
  %196 = load i32, ptr %195, align 8
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %195, align 8
  %198 = sext i32 %196 to i64
  %199 = getelementptr inbounds %struct.NeuralNetSynapse, ptr %193, i64 %198
  store ptr %199, ptr %16, align 8
  %200 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %200, ptr %17, align 8
  %201 = load double, ptr %17, align 8
  %202 = call double @llvm.fmuladd.f64(double %201, double 2.000000e+00, double -1.000000e+00)
  %203 = load ptr, ptr %16, align 8
  %204 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %203, i32 0, i32 1
  store double %202, ptr %204, align 8
  %205 = load ptr, ptr %16, align 8
  %206 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %205, i32 0, i32 0
  store double %202, ptr %206, align 8
  %207 = load ptr, ptr %13, align 8
  %208 = load ptr, ptr %16, align 8
  %209 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %208, i32 0, i32 2
  store ptr %207, ptr %209, align 8
  %210 = load ptr, ptr %15, align 8
  %211 = load ptr, ptr %16, align 8
  %212 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %211, i32 0, i32 3
  store ptr %210, ptr %212, align 8
  %213 = load ptr, ptr %13, align 8
  %214 = load ptr, ptr %16, align 8
  call void @neuron_add_synapse_out(ptr noundef %213, ptr noundef %214)
  %215 = load ptr, ptr %15, align 8
  %216 = load ptr, ptr %16, align 8
  call void @neuron_add_synapse_in(ptr noundef %215, ptr noundef %216)
  br label %217

217:                                              ; preds = %178
  %218 = load i32, ptr %14, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, ptr %14, align 4
  br label %174, !llvm.loop !12

220:                                              ; preds = %174
  br label %221

221:                                              ; preds = %220
  %222 = load i32, ptr %12, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, ptr %12, align 4
  br label %157, !llvm.loop !13

224:                                              ; preds = %157
  store i32 0, ptr %18, align 4
  br label %225

225:                                              ; preds = %289, %224
  %226 = load i32, ptr %18, align 4
  %227 = load i32, ptr %5, align 4
  %228 = icmp slt i32 %226, %227
  br i1 %228, label %229, label %292

229:                                              ; preds = %225
  %230 = load ptr, ptr %7, align 8
  %231 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %230, i32 0, i32 0
  %232 = load ptr, ptr %231, align 8
  %233 = load ptr, ptr %7, align 8
  %234 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %233, i32 0, i32 4
  %235 = load ptr, ptr %234, align 8
  %236 = load i32, ptr %18, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i32, ptr %235, i64 %237
  %239 = load i32, ptr %238, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %232, i64 %240
  store ptr %241, ptr %19, align 8
  store i32 0, ptr %20, align 4
  br label %242

242:                                              ; preds = %285, %229
  %243 = load i32, ptr %20, align 4
  %244 = load i32, ptr %6, align 4
  %245 = icmp slt i32 %243, %244
  br i1 %245, label %246, label %288

246:                                              ; preds = %242
  %247 = load ptr, ptr %7, align 8
  %248 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %247, i32 0, i32 0
  %249 = load ptr, ptr %248, align 8
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %250, i32 0, i32 6
  %252 = load ptr, ptr %251, align 8
  %253 = load i32, ptr %20, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i32, ptr %252, i64 %254
  %256 = load i32, ptr %255, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %249, i64 %257
  store ptr %258, ptr %21, align 8
  %259 = load ptr, ptr %7, align 8
  %260 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %259, i32 0, i32 8
  %261 = load ptr, ptr %260, align 8
  %262 = load ptr, ptr %7, align 8
  %263 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %262, i32 0, i32 9
  %264 = load i32, ptr %263, align 8
  %265 = add nsw i32 %264, 1
  store i32 %265, ptr %263, align 8
  %266 = sext i32 %264 to i64
  %267 = getelementptr inbounds %struct.NeuralNetSynapse, ptr %261, i64 %266
  store ptr %267, ptr %22, align 8
  %268 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %268, ptr %23, align 8
  %269 = load double, ptr %23, align 8
  %270 = call double @llvm.fmuladd.f64(double %269, double 2.000000e+00, double -1.000000e+00)
  %271 = load ptr, ptr %22, align 8
  %272 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %271, i32 0, i32 1
  store double %270, ptr %272, align 8
  %273 = load ptr, ptr %22, align 8
  %274 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %273, i32 0, i32 0
  store double %270, ptr %274, align 8
  %275 = load ptr, ptr %19, align 8
  %276 = load ptr, ptr %22, align 8
  %277 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %276, i32 0, i32 2
  store ptr %275, ptr %277, align 8
  %278 = load ptr, ptr %21, align 8
  %279 = load ptr, ptr %22, align 8
  %280 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %279, i32 0, i32 3
  store ptr %278, ptr %280, align 8
  %281 = load ptr, ptr %19, align 8
  %282 = load ptr, ptr %22, align 8
  call void @neuron_add_synapse_out(ptr noundef %281, ptr noundef %282)
  %283 = load ptr, ptr %21, align 8
  %284 = load ptr, ptr %22, align 8
  call void @neuron_add_synapse_in(ptr noundef %283, ptr noundef %284)
  br label %285

285:                                              ; preds = %246
  %286 = load i32, ptr %20, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, ptr %20, align 4
  br label %242, !llvm.loop !14

288:                                              ; preds = %242
  br label %289

289:                                              ; preds = %288
  %290 = load i32, ptr %18, align 4
  %291 = add nsw i32 %290, 1
  store i32 %291, ptr %18, align 4
  br label %225, !llvm.loop !15

292:                                              ; preds = %225
  %293 = load ptr, ptr %7, align 8
  ret ptr %293
}

define dso_local void @NeuralNet_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [2 x double], align 16
  %7 = alloca [1 x double], align 8
  %8 = alloca [2 x double], align 16
  %9 = alloca [2 x double], align 16
  %10 = alloca [1 x double], align 8
  %11 = alloca [2 x double], align 16
  %12 = alloca [1 x double], align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 11
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 16, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %8, ptr align 16 @__const.NeuralNet_run.inputs_10, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 @__const.NeuralNet_run.inputs_01, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 @__const.NeuralNet_run.targets_1, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %11, ptr align 16 @__const.NeuralNet_run.inputs_11, i64 16, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 8, i1 false)
  store i32 0, ptr %13, align 4
  br label %18

18:                                               ; preds = %42, %2
  %19 = load i32, ptr %13, align 4
  %20 = icmp slt i32 %19, 1000
  br i1 %20, label %21, label %45

21:                                               ; preds = %18
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds [2 x double], ptr %6, i64 0, i64 0
  %26 = getelementptr inbounds [1 x double], ptr %7, i64 0, i64 0
  call void @network_train(ptr noundef %24, ptr noundef %25, ptr noundef %26)
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds [2 x double], ptr %8, i64 0, i64 0
  %31 = getelementptr inbounds [1 x double], ptr %10, i64 0, i64 0
  call void @network_train(ptr noundef %29, ptr noundef %30, ptr noundef %31)
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds [2 x double], ptr %9, i64 0, i64 0
  %36 = getelementptr inbounds [1 x double], ptr %10, i64 0, i64 0
  call void @network_train(ptr noundef %34, ptr noundef %35, ptr noundef %36)
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds [2 x double], ptr %11, i64 0, i64 0
  %41 = getelementptr inbounds [1 x double], ptr %12, i64 0, i64 0
  call void @network_train(ptr noundef %39, ptr noundef %40, ptr noundef %41)
  br label %42

42:                                               ; preds = %21
  %43 = load i32, ptr %13, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %13, align 4
  br label %18, !llvm.loop !16

45:                                               ; preds = %18
  ret void
}

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal void @network_train(ptr noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %12

12:                                               ; preds = %37, %3
  %13 = load i32, ptr %7, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %15, align 8
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %40

18:                                               ; preds = %12
  %19 = load ptr, ptr %5, align 8
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, ptr %19, i64 %21
  %23 = load double, ptr %22, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %26, i64 %34
  %36 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %35, i32 0, i32 9
  store double %23, ptr %36, align 8
  br label %37

37:                                               ; preds = %18
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %7, align 4
  br label %12, !llvm.loop !17

40:                                               ; preds = %12
  store i32 0, ptr %8, align 4
  br label %41

41:                                               ; preds = %60, %40
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %43, i32 0, i32 5
  %45 = load i32, ptr %44, align 8
  %46 = icmp slt i32 %42, %45
  br i1 %46, label %47, label %63

47:                                               ; preds = %41
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %51, i32 0, i32 4
  %53 = load ptr, ptr %52, align 8
  %54 = load i32, ptr %8, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %53, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %50, i64 %58
  call void @neuron_calculate_output(ptr noundef %59)
  br label %60

60:                                               ; preds = %47
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %8, align 4
  br label %41, !llvm.loop !18

63:                                               ; preds = %41
  store i32 0, ptr %9, align 4
  br label %64

64:                                               ; preds = %83, %63
  %65 = load i32, ptr %9, align 4
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %66, i32 0, i32 7
  %68 = load i32, ptr %67, align 8
  %69 = icmp slt i32 %65, %68
  br i1 %69, label %70, label %86

70:                                               ; preds = %64
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %71, i32 0, i32 0
  %73 = load ptr, ptr %72, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %74, i32 0, i32 6
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %9, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, ptr %76, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %73, i64 %81
  call void @neuron_calculate_output(ptr noundef %82)
  br label %83

83:                                               ; preds = %70
  %84 = load i32, ptr %9, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %9, align 4
  br label %64, !llvm.loop !19

86:                                               ; preds = %64
  store i32 0, ptr %10, align 4
  br label %87

87:                                               ; preds = %111, %86
  %88 = load i32, ptr %10, align 4
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %89, i32 0, i32 7
  %91 = load i32, ptr %90, align 8
  %92 = icmp slt i32 %88, %91
  br i1 %92, label %93, label %114

93:                                               ; preds = %87
  %94 = load ptr, ptr %4, align 8
  %95 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %94, i32 0, i32 0
  %96 = load ptr, ptr %95, align 8
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %97, i32 0, i32 6
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %10, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, ptr %99, i64 %101
  %103 = load i32, ptr %102, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %96, i64 %104
  %106 = load ptr, ptr %6, align 8
  %107 = load i32, ptr %10, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, ptr %106, i64 %108
  %110 = load double, ptr %109, align 8
  call void @neuron_output_train(ptr noundef %105, double noundef %110)
  br label %111

111:                                              ; preds = %93
  %112 = load i32, ptr %10, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %10, align 4
  br label %87, !llvm.loop !20

114:                                              ; preds = %87
  store i32 0, ptr %11, align 4
  br label %115

115:                                              ; preds = %134, %114
  %116 = load i32, ptr %11, align 4
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %117, i32 0, i32 5
  %119 = load i32, ptr %118, align 8
  %120 = icmp slt i32 %116, %119
  br i1 %120, label %121, label %137

121:                                              ; preds = %115
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %122, i32 0, i32 0
  %124 = load ptr, ptr %123, align 8
  %125 = load ptr, ptr %4, align 8
  %126 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %125, i32 0, i32 4
  %127 = load ptr, ptr %126, align 8
  %128 = load i32, ptr %11, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, ptr %127, i64 %129
  %131 = load i32, ptr %130, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %124, i64 %132
  call void @neuron_hidden_train(ptr noundef %133)
  br label %134

134:                                              ; preds = %121
  %135 = load i32, ptr %11, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %11, align 4
  br label %115, !llvm.loop !21

137:                                              ; preds = %115
  ret void
}

define dso_local i32 @NeuralNet_checksum(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [2 x double], align 16
  %6 = alloca [2 x double], align 16
  %7 = alloca [2 x double], align 16
  %8 = alloca [2 x double], align 16
  %9 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %4, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %13, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %64

18:                                               ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 @__const.NeuralNet_checksum.inputs_01, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 16 @__const.NeuralNet_checksum.inputs_10, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %8, ptr align 16 @__const.NeuralNet_checksum.inputs_11, i64 16, i1 false)
  store double 0.000000e+00, ptr %9, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds [2 x double], ptr %5, i64 0, i64 0
  call void @network_feed_forward(ptr noundef %21, ptr noundef %22)
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = call double @network_get_output(ptr noundef %25)
  %27 = load double, ptr %9, align 8
  %28 = fadd double %27, %26
  store double %28, ptr %9, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds [2 x double], ptr %6, i64 0, i64 0
  call void @network_feed_forward(ptr noundef %31, ptr noundef %32)
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = call double @network_get_output(ptr noundef %35)
  %37 = load double, ptr %9, align 8
  %38 = fadd double %37, %36
  store double %38, ptr %9, align 8
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %39, i32 0, i32 2
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds [2 x double], ptr %7, i64 0, i64 0
  call void @network_feed_forward(ptr noundef %41, ptr noundef %42)
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %43, i32 0, i32 2
  %45 = load ptr, ptr %44, align 8
  %46 = call double @network_get_output(ptr noundef %45)
  %47 = load double, ptr %9, align 8
  %48 = fadd double %47, %46
  store double %48, ptr %9, align 8
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %49, i32 0, i32 2
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds [2 x double], ptr %8, i64 0, i64 0
  call void @network_feed_forward(ptr noundef %51, ptr noundef %52)
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %53, i32 0, i32 2
  %55 = load ptr, ptr %54, align 8
  %56 = call double @network_get_output(ptr noundef %55)
  %57 = load double, ptr %9, align 8
  %58 = fadd double %57, %56
  store double %58, ptr %9, align 8
  %59 = load double, ptr %9, align 8
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %60, i32 0, i32 1
  store double %59, ptr %61, align 8
  %62 = load double, ptr %9, align 8
  %63 = call i32 @Helper_checksum_f64(double noundef %62)
  store i32 %63, ptr %2, align 4
  br label %64

64:                                               ; preds = %18, %17
  %65 = load i32, ptr %2, align 4
  ret i32 %65
}

define internal void @network_feed_forward(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %33, %2
  %9 = load i32, ptr %5, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %10, i32 0, i32 3
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %36

14:                                               ; preds = %8
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, ptr %15, i64 %17
  %19 = load double, ptr %18, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %22, i64 %30
  %32 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %31, i32 0, i32 9
  store double %19, ptr %32, align 8
  br label %33

33:                                               ; preds = %14
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %8, !llvm.loop !22

36:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %37

37:                                               ; preds = %56, %36
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %39, i32 0, i32 5
  %41 = load i32, ptr %40, align 8
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %43, label %59

43:                                               ; preds = %37
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %46, i64 %54
  call void @neuron_calculate_output(ptr noundef %55)
  br label %56

56:                                               ; preds = %43
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %6, align 4
  br label %37, !llvm.loop !23

59:                                               ; preds = %37
  store i32 0, ptr %7, align 4
  br label %60

60:                                               ; preds = %79, %59
  %61 = load i32, ptr %7, align 4
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %62, i32 0, i32 7
  %64 = load i32, ptr %63, align 8
  %65 = icmp slt i32 %61, %64
  br i1 %65, label %66, label %82

66:                                               ; preds = %60
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %70, i32 0, i32 6
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %7, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr %72, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %69, i64 %77
  call void @neuron_calculate_output(ptr noundef %78)
  br label %79

79:                                               ; preds = %66
  %80 = load i32, ptr %7, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %7, align 4
  br label %60, !llvm.loop !24

82:                                               ; preds = %60
  ret void
}

define internal double @network_get_output(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.NeuralNetwork, ptr %6, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds i32, ptr %8, i64 0
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.NeuralNetNeuron, ptr %5, i64 %11
  %13 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %12, i32 0, i32 9
  %14 = load double, ptr %13, align 8
  ret double %14
}

declare i32 @Helper_checksum_f64(double noundef)

define dso_local void @NeuralNet_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  call void @network_free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.NeuralNetData, ptr %15, i32 0, i32 2
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @NeuralNet_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str)
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
  store ptr @NeuralNet_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @NeuralNet_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @NeuralNet_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @NeuralNet_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @free(ptr noundef)

define internal void @neuron_init(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  %4 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %4, ptr %3, align 8
  %5 = load double, ptr %3, align 8
  %6 = call double @llvm.fmuladd.f64(double %5, double 2.000000e+00, double -1.000000e+00)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %7, i32 0, i32 7
  store double %6, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %9, i32 0, i32 6
  store double %6, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %11, i32 0, i32 9
  store double 0.000000e+00, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 8
  store double 0.000000e+00, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %15, i32 0, i32 1
  store i32 0, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %17, i32 0, i32 2
  store i32 4, ptr %18, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = sext i32 %21 to i64
  %23 = mul i64 %22, 8
  %24 = call noalias ptr @malloc(i64 noundef %23)
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %25, i32 0, i32 0
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %27, i32 0, i32 4
  store i32 0, ptr %28, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %29, i32 0, i32 5
  store i32 4, ptr %30, align 4
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %31, i32 0, i32 5
  %33 = load i32, ptr %32, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 8
  %36 = call noalias ptr @malloc(i64 noundef %35)
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %37, i32 0, i32 3
  store ptr %36, ptr %38, align 8
  ret void
}

declare double @Helper_next_float(double noundef)

declare double @llvm.fmuladd.f64(double, double, double)

define internal void @neuron_add_synapse_out(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %5, i32 0, i32 4
  %7 = load i32, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %8, i32 0, i32 5
  %10 = load i32, ptr %9, align 4
  %11 = icmp sge i32 %7, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 5
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %14, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %17, i32 0, i32 3
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %20, i32 0, i32 5
  %22 = load i32, ptr %21, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = call ptr @realloc(ptr noundef %19, i64 noundef %24)
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %26, i32 0, i32 3
  store ptr %25, ptr %27, align 8
  br label %28

28:                                               ; preds = %12, %2
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %33, i32 0, i32 4
  %35 = load i32, ptr %34, align 8
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %34, align 8
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds ptr, ptr %32, i64 %37
  store ptr %29, ptr %38, align 8
  ret void
}

define internal void @neuron_add_synapse_in(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = icmp sge i32 %7, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %14, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = call ptr @realloc(ptr noundef %19, i64 noundef %24)
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  br label %28

28:                                               ; preds = %12, %2
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %34, align 8
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds ptr, ptr %32, i64 %37
  store ptr %29, ptr %38, align 8
  ret void
}

declare ptr @realloc(ptr noundef, i64 noundef)

define internal void @neuron_calculate_output(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %30, %1
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %33

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds ptr, ptr %15, i64 %17
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %5, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %20, i32 0, i32 0
  %22 = load double, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %25, i32 0, i32 9
  %27 = load double, ptr %26, align 8
  %28 = load double, ptr %3, align 8
  %29 = call double @llvm.fmuladd.f64(double %22, double %27, double %28)
  store double %29, ptr %3, align 8
  br label %30

30:                                               ; preds = %12
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %6, !llvm.loop !25

33:                                               ; preds = %6
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %34, i32 0, i32 6
  %36 = load double, ptr %35, align 8
  %37 = load double, ptr %3, align 8
  %38 = fsub double %37, %36
  store double %38, ptr %3, align 8
  %39 = load double, ptr %3, align 8
  %40 = fneg double %39
  %41 = call double @exp(double noundef %40)
  %42 = fadd double 1.000000e+00, %41
  %43 = fdiv double 1.000000e+00, %42
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %44, i32 0, i32 9
  store double %43, ptr %45, align 8
  ret void
}

define internal void @neuron_output_train(ptr noundef %0, double noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  %5 = load double, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %6, i32 0, i32 9
  %8 = load double, ptr %7, align 8
  %9 = fsub double %5, %8
  %10 = load ptr, ptr %3, align 8
  %11 = call double @neuron_derivative(ptr noundef %10)
  %12 = fmul double %9, %11
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 8
  store double %12, ptr %14, align 8
  %15 = load ptr, ptr %3, align 8
  call void @neuron_update_weights(ptr noundef %15)
  ret void
}

define internal void @neuron_hidden_train(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %30, %1
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %8, i32 0, i32 4
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %33

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %13, i32 0, i32 3
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds ptr, ptr %15, i64 %17
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %5, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %20, i32 0, i32 1
  %22 = load double, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %23, i32 0, i32 3
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %25, i32 0, i32 8
  %27 = load double, ptr %26, align 8
  %28 = load double, ptr %3, align 8
  %29 = call double @llvm.fmuladd.f64(double %22, double %27, double %28)
  store double %29, ptr %3, align 8
  br label %30

30:                                               ; preds = %12
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %6, !llvm.loop !26

33:                                               ; preds = %6
  %34 = load double, ptr %3, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = call double @neuron_derivative(ptr noundef %35)
  %37 = fmul double %34, %36
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %38, i32 0, i32 8
  store double %37, ptr %39, align 8
  %40 = load ptr, ptr %2, align 8
  call void @neuron_update_weights(ptr noundef %40)
  ret void
}

declare double @exp(double noundef)

define internal double @neuron_derivative(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %3, i32 0, i32 9
  %5 = load double, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %6, i32 0, i32 9
  %8 = load double, ptr %7, align 8
  %9 = fsub double 1.000000e+00, %8
  %10 = fmul double %5, %9
  ret double %10
}

define internal void @neuron_update_weights(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %49, %1
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %52

13:                                               ; preds = %7
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %4, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %21, i32 0, i32 0
  %23 = load double, ptr %22, align 8
  store double %23, ptr %5, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %24, i32 0, i32 8
  %26 = load double, ptr %25, align 8
  %27 = fmul double 3.000000e-01, %26
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %30, i32 0, i32 9
  %32 = load double, ptr %31, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %33, i32 0, i32 0
  %35 = load double, ptr %34, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %36, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = fsub double %35, %38
  %40 = fmul double 3.000000e-01, %39
  %41 = call double @llvm.fmuladd.f64(double %27, double %32, double %40)
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %42, i32 0, i32 0
  %44 = load double, ptr %43, align 8
  %45 = fadd double %44, %41
  store double %45, ptr %43, align 8
  %46 = load double, ptr %5, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds nuw %struct.NeuralNetSynapse, ptr %47, i32 0, i32 1
  store double %46, ptr %48, align 8
  br label %49

49:                                               ; preds = %13
  %50 = load i32, ptr %3, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %3, align 4
  br label %7, !llvm.loop !27

52:                                               ; preds = %7
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %53, i32 0, i32 6
  %55 = load double, ptr %54, align 8
  store double %55, ptr %6, align 8
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %56, i32 0, i32 8
  %58 = load double, ptr %57, align 8
  %59 = fmul double 3.000000e-01, %58
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %60, i32 0, i32 6
  %62 = load double, ptr %61, align 8
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %63, i32 0, i32 7
  %65 = load double, ptr %64, align 8
  %66 = fsub double %62, %65
  %67 = fmul double 3.000000e-01, %66
  %68 = call double @llvm.fmuladd.f64(double %59, double -1.000000e+00, double %67)
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %69, i32 0, i32 6
  %71 = load double, ptr %70, align 8
  %72 = fadd double %71, %68
  store double %72, ptr %70, align 8
  %73 = load double, ptr %6, align 8
  %74 = load ptr, ptr %2, align 8
  %75 = getelementptr inbounds nuw %struct.NeuralNetNeuron, ptr %74, i32 0, i32 7
  store double %73, ptr %75, align 8
  ret void
}


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
