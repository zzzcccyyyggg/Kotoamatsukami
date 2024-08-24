; ModuleID = 'vm.c'
source_filename = "vm.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.VM = type { [16 x i32], ptr, i32, i32, ptr }

@cmps = dso_local global [34 x i8] c"\AB\BC\A8\A8\AA\BD\AF\92\D8\9A\B6\BF\A4\B6\8B\8C\88\9C\9D\D8\8F\9C\D8\B6\8F\86\9B\B6\BB\AC\AC\BB\D6\94", align 1
@stdin = external global ptr, align 8
@.str = private unnamed_addr constant [16 x i8] c"righhhhhhhhht!\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"wronnnnnnnnng!\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Invalid opcode: %d\0A\00", align 1
@prog = dso_local global [51 x i32] [i32 9, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 128, i32 1, i32 13, i32 34, i32 1, i32 14, i32 1, i32 1, i32 15, i32 233, i32 12, i32 2, i32 0, i32 7, i32 3, i32 2, i32 15, i32 12, i32 4, i32 1, i32 10, i32 4, i32 3, i32 11, i32 48, i32 3, i32 0, i32 0, i32 14, i32 3, i32 1, i32 1, i32 14, i32 10, i32 0, i32 13, i32 11, i32 17, i32 13, i32 1, i32 0, i32 13, i32 0, i32 0], align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @new_vm(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 88) #6
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.VM, ptr %10, i32 0, i32 1
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.VM, ptr %12, i32 0, i32 2
  store i32 0, ptr %13, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.VM, ptr %14, i32 0, i32 3
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 4, %17
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.VM, ptr %20, i32 0, i32 4
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.VM, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %24, i8 0, i64 %26, i1 false)
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.VM, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds i8, ptr %29, i64 128
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 1 @cmps, i64 34, i1 false)
  %31 = load ptr, ptr %7, align 8
  ret ptr %31
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @run_vm(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 1, ptr %9, align 4
  br label %10

10:                                               ; preds = %527, %1
  %11 = load i32, ptr %9, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %528

13:                                               ; preds = %10
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.VM, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.VM, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %18, align 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %16, i64 %20
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr %3, align 4
  %23 = load i32, ptr %3, align 4
  switch i32 %23, label %524 [
    i32 0, label %24
    i32 1, label %25
    i32 2, label %56
    i32 3, label %92
    i32 4, label %145
    i32 5, label %198
    i32 6, label %251
    i32 7, label %304
    i32 8, label %357
    i32 9, label %371
    i32 10, label %394
    i32 11, label %435
    i32 12, label %459
    i32 13, label %503
  ]

24:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %527

25:                                               ; preds = %13
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.VM, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.VM, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %28, i64 %33
  %35 = load i32, ptr %34, align 4
  store i32 %35, ptr %4, align 4
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.VM, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds %struct.VM, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %40, align 8
  %42 = add nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %38, i64 %43
  %45 = load i32, ptr %44, align 4
  store i32 %45, ptr %7, align 4
  %46 = load i32, ptr %7, align 4
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.VM, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %4, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [16 x i32], ptr %48, i64 0, i64 %50
  store i32 %46, ptr %51, align 4
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.VM, ptr %52, i32 0, i32 2
  %54 = load i32, ptr %53, align 8
  %55 = add nsw i32 %54, 3
  store i32 %55, ptr %53, align 8
  br label %527

56:                                               ; preds = %13
  %57 = load ptr, ptr %2, align 8
  %58 = getelementptr inbounds %struct.VM, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.VM, ptr %60, i32 0, i32 2
  %62 = load i32, ptr %61, align 8
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %59, i64 %64
  %66 = load i32, ptr %65, align 4
  store i32 %66, ptr %4, align 4
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds %struct.VM, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %2, align 8
  %71 = getelementptr inbounds %struct.VM, ptr %70, i32 0, i32 2
  %72 = load i32, ptr %71, align 8
  %73 = add nsw i32 %72, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr %69, i64 %74
  %76 = load i32, ptr %75, align 4
  store i32 %76, ptr %5, align 4
  %77 = load ptr, ptr %2, align 8
  %78 = getelementptr inbounds %struct.VM, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %4, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [16 x i32], ptr %78, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.VM, ptr %83, i32 0, i32 0
  %85 = load i32, ptr %5, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [16 x i32], ptr %84, i64 0, i64 %86
  store i32 %82, ptr %87, align 4
  %88 = load ptr, ptr %2, align 8
  %89 = getelementptr inbounds %struct.VM, ptr %88, i32 0, i32 2
  %90 = load i32, ptr %89, align 8
  %91 = add nsw i32 %90, 3
  store i32 %91, ptr %89, align 8
  br label %527

92:                                               ; preds = %13
  %93 = load ptr, ptr %2, align 8
  %94 = getelementptr inbounds %struct.VM, ptr %93, i32 0, i32 1
  %95 = load ptr, ptr %94, align 8
  %96 = load ptr, ptr %2, align 8
  %97 = getelementptr inbounds %struct.VM, ptr %96, i32 0, i32 2
  %98 = load i32, ptr %97, align 8
  %99 = add nsw i32 %98, 3
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, ptr %95, i64 %100
  %102 = load i32, ptr %101, align 4
  store i32 %102, ptr %4, align 4
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds %struct.VM, ptr %103, i32 0, i32 1
  %105 = load ptr, ptr %104, align 8
  %106 = load ptr, ptr %2, align 8
  %107 = getelementptr inbounds %struct.VM, ptr %106, i32 0, i32 2
  %108 = load i32, ptr %107, align 8
  %109 = add nsw i32 %108, 2
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr %105, i64 %110
  %112 = load i32, ptr %111, align 4
  store i32 %112, ptr %5, align 4
  %113 = load ptr, ptr %2, align 8
  %114 = getelementptr inbounds %struct.VM, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds %struct.VM, ptr %116, i32 0, i32 2
  %118 = load i32, ptr %117, align 8
  %119 = add nsw i32 %118, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, ptr %115, i64 %120
  %122 = load i32, ptr %121, align 4
  store i32 %122, ptr %6, align 4
  %123 = load ptr, ptr %2, align 8
  %124 = getelementptr inbounds %struct.VM, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %4, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [16 x i32], ptr %124, i64 0, i64 %126
  %128 = load i32, ptr %127, align 4
  %129 = load ptr, ptr %2, align 8
  %130 = getelementptr inbounds %struct.VM, ptr %129, i32 0, i32 0
  %131 = load i32, ptr %5, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [16 x i32], ptr %130, i64 0, i64 %132
  %134 = load i32, ptr %133, align 4
  %135 = add nsw i32 %128, %134
  %136 = load ptr, ptr %2, align 8
  %137 = getelementptr inbounds %struct.VM, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %6, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [16 x i32], ptr %137, i64 0, i64 %139
  store i32 %135, ptr %140, align 4
  %141 = load ptr, ptr %2, align 8
  %142 = getelementptr inbounds %struct.VM, ptr %141, i32 0, i32 2
  %143 = load i32, ptr %142, align 8
  %144 = add nsw i32 %143, 4
  store i32 %144, ptr %142, align 8
  br label %527

145:                                              ; preds = %13
  %146 = load ptr, ptr %2, align 8
  %147 = getelementptr inbounds %struct.VM, ptr %146, i32 0, i32 1
  %148 = load ptr, ptr %147, align 8
  %149 = load ptr, ptr %2, align 8
  %150 = getelementptr inbounds %struct.VM, ptr %149, i32 0, i32 2
  %151 = load i32, ptr %150, align 8
  %152 = add nsw i32 %151, 3
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %148, i64 %153
  %155 = load i32, ptr %154, align 4
  store i32 %155, ptr %4, align 4
  %156 = load ptr, ptr %2, align 8
  %157 = getelementptr inbounds %struct.VM, ptr %156, i32 0, i32 1
  %158 = load ptr, ptr %157, align 8
  %159 = load ptr, ptr %2, align 8
  %160 = getelementptr inbounds %struct.VM, ptr %159, i32 0, i32 2
  %161 = load i32, ptr %160, align 8
  %162 = add nsw i32 %161, 2
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, ptr %158, i64 %163
  %165 = load i32, ptr %164, align 4
  store i32 %165, ptr %5, align 4
  %166 = load ptr, ptr %2, align 8
  %167 = getelementptr inbounds %struct.VM, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  %169 = load ptr, ptr %2, align 8
  %170 = getelementptr inbounds %struct.VM, ptr %169, i32 0, i32 2
  %171 = load i32, ptr %170, align 8
  %172 = add nsw i32 %171, 1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i32, ptr %168, i64 %173
  %175 = load i32, ptr %174, align 4
  store i32 %175, ptr %6, align 4
  %176 = load ptr, ptr %2, align 8
  %177 = getelementptr inbounds %struct.VM, ptr %176, i32 0, i32 0
  %178 = load i32, ptr %4, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [16 x i32], ptr %177, i64 0, i64 %179
  %181 = load i32, ptr %180, align 4
  %182 = load ptr, ptr %2, align 8
  %183 = getelementptr inbounds %struct.VM, ptr %182, i32 0, i32 0
  %184 = load i32, ptr %5, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [16 x i32], ptr %183, i64 0, i64 %185
  %187 = load i32, ptr %186, align 4
  %188 = sub nsw i32 %181, %187
  %189 = load ptr, ptr %2, align 8
  %190 = getelementptr inbounds %struct.VM, ptr %189, i32 0, i32 0
  %191 = load i32, ptr %6, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [16 x i32], ptr %190, i64 0, i64 %192
  store i32 %188, ptr %193, align 4
  %194 = load ptr, ptr %2, align 8
  %195 = getelementptr inbounds %struct.VM, ptr %194, i32 0, i32 2
  %196 = load i32, ptr %195, align 8
  %197 = add nsw i32 %196, 4
  store i32 %197, ptr %195, align 8
  br label %527

198:                                              ; preds = %13
  %199 = load ptr, ptr %2, align 8
  %200 = getelementptr inbounds %struct.VM, ptr %199, i32 0, i32 1
  %201 = load ptr, ptr %200, align 8
  %202 = load ptr, ptr %2, align 8
  %203 = getelementptr inbounds %struct.VM, ptr %202, i32 0, i32 2
  %204 = load i32, ptr %203, align 8
  %205 = add nsw i32 %204, 3
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, ptr %201, i64 %206
  %208 = load i32, ptr %207, align 4
  store i32 %208, ptr %4, align 4
  %209 = load ptr, ptr %2, align 8
  %210 = getelementptr inbounds %struct.VM, ptr %209, i32 0, i32 1
  %211 = load ptr, ptr %210, align 8
  %212 = load ptr, ptr %2, align 8
  %213 = getelementptr inbounds %struct.VM, ptr %212, i32 0, i32 2
  %214 = load i32, ptr %213, align 8
  %215 = add nsw i32 %214, 2
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32, ptr %211, i64 %216
  %218 = load i32, ptr %217, align 4
  store i32 %218, ptr %5, align 4
  %219 = load ptr, ptr %2, align 8
  %220 = getelementptr inbounds %struct.VM, ptr %219, i32 0, i32 1
  %221 = load ptr, ptr %220, align 8
  %222 = load ptr, ptr %2, align 8
  %223 = getelementptr inbounds %struct.VM, ptr %222, i32 0, i32 2
  %224 = load i32, ptr %223, align 8
  %225 = add nsw i32 %224, 1
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i32, ptr %221, i64 %226
  %228 = load i32, ptr %227, align 4
  store i32 %228, ptr %6, align 4
  %229 = load ptr, ptr %2, align 8
  %230 = getelementptr inbounds %struct.VM, ptr %229, i32 0, i32 0
  %231 = load i32, ptr %4, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [16 x i32], ptr %230, i64 0, i64 %232
  %234 = load i32, ptr %233, align 4
  %235 = load ptr, ptr %2, align 8
  %236 = getelementptr inbounds %struct.VM, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %5, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [16 x i32], ptr %236, i64 0, i64 %238
  %240 = load i32, ptr %239, align 4
  %241 = mul nsw i32 %234, %240
  %242 = load ptr, ptr %2, align 8
  %243 = getelementptr inbounds %struct.VM, ptr %242, i32 0, i32 0
  %244 = load i32, ptr %6, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [16 x i32], ptr %243, i64 0, i64 %245
  store i32 %241, ptr %246, align 4
  %247 = load ptr, ptr %2, align 8
  %248 = getelementptr inbounds %struct.VM, ptr %247, i32 0, i32 2
  %249 = load i32, ptr %248, align 8
  %250 = add nsw i32 %249, 4
  store i32 %250, ptr %248, align 8
  br label %527

251:                                              ; preds = %13
  %252 = load ptr, ptr %2, align 8
  %253 = getelementptr inbounds %struct.VM, ptr %252, i32 0, i32 1
  %254 = load ptr, ptr %253, align 8
  %255 = load ptr, ptr %2, align 8
  %256 = getelementptr inbounds %struct.VM, ptr %255, i32 0, i32 2
  %257 = load i32, ptr %256, align 8
  %258 = add nsw i32 %257, 3
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i32, ptr %254, i64 %259
  %261 = load i32, ptr %260, align 4
  store i32 %261, ptr %4, align 4
  %262 = load ptr, ptr %2, align 8
  %263 = getelementptr inbounds %struct.VM, ptr %262, i32 0, i32 1
  %264 = load ptr, ptr %263, align 8
  %265 = load ptr, ptr %2, align 8
  %266 = getelementptr inbounds %struct.VM, ptr %265, i32 0, i32 2
  %267 = load i32, ptr %266, align 8
  %268 = add nsw i32 %267, 2
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i32, ptr %264, i64 %269
  %271 = load i32, ptr %270, align 4
  store i32 %271, ptr %5, align 4
  %272 = load ptr, ptr %2, align 8
  %273 = getelementptr inbounds %struct.VM, ptr %272, i32 0, i32 1
  %274 = load ptr, ptr %273, align 8
  %275 = load ptr, ptr %2, align 8
  %276 = getelementptr inbounds %struct.VM, ptr %275, i32 0, i32 2
  %277 = load i32, ptr %276, align 8
  %278 = add nsw i32 %277, 1
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds i32, ptr %274, i64 %279
  %281 = load i32, ptr %280, align 4
  store i32 %281, ptr %6, align 4
  %282 = load ptr, ptr %2, align 8
  %283 = getelementptr inbounds %struct.VM, ptr %282, i32 0, i32 0
  %284 = load i32, ptr %4, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [16 x i32], ptr %283, i64 0, i64 %285
  %287 = load i32, ptr %286, align 4
  %288 = load ptr, ptr %2, align 8
  %289 = getelementptr inbounds %struct.VM, ptr %288, i32 0, i32 0
  %290 = load i32, ptr %5, align 4
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [16 x i32], ptr %289, i64 0, i64 %291
  %293 = load i32, ptr %292, align 4
  %294 = sdiv i32 %287, %293
  %295 = load ptr, ptr %2, align 8
  %296 = getelementptr inbounds %struct.VM, ptr %295, i32 0, i32 0
  %297 = load i32, ptr %6, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [16 x i32], ptr %296, i64 0, i64 %298
  store i32 %294, ptr %299, align 4
  %300 = load ptr, ptr %2, align 8
  %301 = getelementptr inbounds %struct.VM, ptr %300, i32 0, i32 2
  %302 = load i32, ptr %301, align 8
  %303 = add nsw i32 %302, 4
  store i32 %303, ptr %301, align 8
  br label %527

304:                                              ; preds = %13
  %305 = load ptr, ptr %2, align 8
  %306 = getelementptr inbounds %struct.VM, ptr %305, i32 0, i32 1
  %307 = load ptr, ptr %306, align 8
  %308 = load ptr, ptr %2, align 8
  %309 = getelementptr inbounds %struct.VM, ptr %308, i32 0, i32 2
  %310 = load i32, ptr %309, align 8
  %311 = add nsw i32 %310, 3
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds i32, ptr %307, i64 %312
  %314 = load i32, ptr %313, align 4
  store i32 %314, ptr %4, align 4
  %315 = load ptr, ptr %2, align 8
  %316 = getelementptr inbounds %struct.VM, ptr %315, i32 0, i32 1
  %317 = load ptr, ptr %316, align 8
  %318 = load ptr, ptr %2, align 8
  %319 = getelementptr inbounds %struct.VM, ptr %318, i32 0, i32 2
  %320 = load i32, ptr %319, align 8
  %321 = add nsw i32 %320, 2
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds i32, ptr %317, i64 %322
  %324 = load i32, ptr %323, align 4
  store i32 %324, ptr %5, align 4
  %325 = load ptr, ptr %2, align 8
  %326 = getelementptr inbounds %struct.VM, ptr %325, i32 0, i32 1
  %327 = load ptr, ptr %326, align 8
  %328 = load ptr, ptr %2, align 8
  %329 = getelementptr inbounds %struct.VM, ptr %328, i32 0, i32 2
  %330 = load i32, ptr %329, align 8
  %331 = add nsw i32 %330, 1
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i32, ptr %327, i64 %332
  %334 = load i32, ptr %333, align 4
  store i32 %334, ptr %6, align 4
  %335 = load ptr, ptr %2, align 8
  %336 = getelementptr inbounds %struct.VM, ptr %335, i32 0, i32 0
  %337 = load i32, ptr %4, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [16 x i32], ptr %336, i64 0, i64 %338
  %340 = load i32, ptr %339, align 4
  %341 = load ptr, ptr %2, align 8
  %342 = getelementptr inbounds %struct.VM, ptr %341, i32 0, i32 0
  %343 = load i32, ptr %5, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [16 x i32], ptr %342, i64 0, i64 %344
  %346 = load i32, ptr %345, align 4
  %347 = xor i32 %340, %346
  %348 = load ptr, ptr %2, align 8
  %349 = getelementptr inbounds %struct.VM, ptr %348, i32 0, i32 0
  %350 = load i32, ptr %6, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [16 x i32], ptr %349, i64 0, i64 %351
  store i32 %347, ptr %352, align 4
  %353 = load ptr, ptr %2, align 8
  %354 = getelementptr inbounds %struct.VM, ptr %353, i32 0, i32 2
  %355 = load i32, ptr %354, align 8
  %356 = add nsw i32 %355, 4
  store i32 %356, ptr %354, align 8
  br label %527

357:                                              ; preds = %13
  %358 = load ptr, ptr %2, align 8
  %359 = getelementptr inbounds %struct.VM, ptr %358, i32 0, i32 1
  %360 = load ptr, ptr %359, align 8
  %361 = load ptr, ptr %2, align 8
  %362 = getelementptr inbounds %struct.VM, ptr %361, i32 0, i32 2
  %363 = load i32, ptr %362, align 8
  %364 = add nsw i32 %363, 1
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i32, ptr %360, i64 %365
  %367 = load i32, ptr %366, align 4
  store i32 %367, ptr %7, align 4
  %368 = load i32, ptr %7, align 4
  %369 = load ptr, ptr %2, align 8
  %370 = getelementptr inbounds %struct.VM, ptr %369, i32 0, i32 2
  store i32 %368, ptr %370, align 8
  br label %527

371:                                              ; preds = %13
  %372 = load ptr, ptr %2, align 8
  %373 = getelementptr inbounds %struct.VM, ptr %372, i32 0, i32 1
  %374 = load ptr, ptr %373, align 8
  %375 = load ptr, ptr %2, align 8
  %376 = getelementptr inbounds %struct.VM, ptr %375, i32 0, i32 2
  %377 = load i32, ptr %376, align 8
  %378 = add nsw i32 %377, 1
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i32, ptr %374, i64 %379
  %381 = load i32, ptr %380, align 4
  store i32 %381, ptr %8, align 4
  %382 = load ptr, ptr %2, align 8
  %383 = getelementptr inbounds %struct.VM, ptr %382, i32 0, i32 4
  %384 = load ptr, ptr %383, align 8
  %385 = load i32, ptr %8, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i8, ptr %384, i64 %386
  %388 = load ptr, ptr @stdin, align 8
  %389 = call ptr @fgets(ptr noundef %387, i32 noundef 256, ptr noundef %388)
  %390 = load ptr, ptr %2, align 8
  %391 = getelementptr inbounds %struct.VM, ptr %390, i32 0, i32 2
  %392 = load i32, ptr %391, align 8
  %393 = add nsw i32 %392, 2
  store i32 %393, ptr %391, align 8
  br label %527

394:                                              ; preds = %13
  %395 = load ptr, ptr %2, align 8
  %396 = getelementptr inbounds %struct.VM, ptr %395, i32 0, i32 1
  %397 = load ptr, ptr %396, align 8
  %398 = load ptr, ptr %2, align 8
  %399 = getelementptr inbounds %struct.VM, ptr %398, i32 0, i32 2
  %400 = load i32, ptr %399, align 8
  %401 = add nsw i32 %400, 1
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i32, ptr %397, i64 %402
  %404 = load i32, ptr %403, align 4
  store i32 %404, ptr %4, align 4
  %405 = load ptr, ptr %2, align 8
  %406 = getelementptr inbounds %struct.VM, ptr %405, i32 0, i32 1
  %407 = load ptr, ptr %406, align 8
  %408 = load ptr, ptr %2, align 8
  %409 = getelementptr inbounds %struct.VM, ptr %408, i32 0, i32 2
  %410 = load i32, ptr %409, align 8
  %411 = add nsw i32 %410, 2
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds i32, ptr %407, i64 %412
  %414 = load i32, ptr %413, align 4
  store i32 %414, ptr %5, align 4
  %415 = load ptr, ptr %2, align 8
  %416 = getelementptr inbounds %struct.VM, ptr %415, i32 0, i32 0
  %417 = load i32, ptr %4, align 4
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds [16 x i32], ptr %416, i64 0, i64 %418
  %420 = load i32, ptr %419, align 4
  %421 = load ptr, ptr %2, align 8
  %422 = getelementptr inbounds %struct.VM, ptr %421, i32 0, i32 0
  %423 = load i32, ptr %5, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds [16 x i32], ptr %422, i64 0, i64 %424
  %426 = load i32, ptr %425, align 4
  %427 = icmp eq i32 %420, %426
  %428 = zext i1 %427 to i32
  %429 = load ptr, ptr %2, align 8
  %430 = getelementptr inbounds %struct.VM, ptr %429, i32 0, i32 3
  store i32 %428, ptr %430, align 4
  %431 = load ptr, ptr %2, align 8
  %432 = getelementptr inbounds %struct.VM, ptr %431, i32 0, i32 2
  %433 = load i32, ptr %432, align 8
  %434 = add nsw i32 %433, 3
  store i32 %434, ptr %432, align 8
  br label %527

435:                                              ; preds = %13
  %436 = load ptr, ptr %2, align 8
  %437 = getelementptr inbounds %struct.VM, ptr %436, i32 0, i32 3
  %438 = load i32, ptr %437, align 4
  %439 = icmp ne i32 %438, 0
  br i1 %439, label %453, label %440

440:                                              ; preds = %435
  %441 = load ptr, ptr %2, align 8
  %442 = getelementptr inbounds %struct.VM, ptr %441, i32 0, i32 1
  %443 = load ptr, ptr %442, align 8
  %444 = load ptr, ptr %2, align 8
  %445 = getelementptr inbounds %struct.VM, ptr %444, i32 0, i32 2
  %446 = load i32, ptr %445, align 8
  %447 = add nsw i32 %446, 1
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds i32, ptr %443, i64 %448
  %450 = load i32, ptr %449, align 4
  %451 = load ptr, ptr %2, align 8
  %452 = getelementptr inbounds %struct.VM, ptr %451, i32 0, i32 2
  store i32 %450, ptr %452, align 8
  br label %458

453:                                              ; preds = %435
  %454 = load ptr, ptr %2, align 8
  %455 = getelementptr inbounds %struct.VM, ptr %454, i32 0, i32 2
  %456 = load i32, ptr %455, align 8
  %457 = add nsw i32 %456, 2
  store i32 %457, ptr %455, align 8
  br label %458

458:                                              ; preds = %453, %440
  br label %527

459:                                              ; preds = %13
  %460 = load ptr, ptr %2, align 8
  %461 = getelementptr inbounds %struct.VM, ptr %460, i32 0, i32 1
  %462 = load ptr, ptr %461, align 8
  %463 = load ptr, ptr %2, align 8
  %464 = getelementptr inbounds %struct.VM, ptr %463, i32 0, i32 2
  %465 = load i32, ptr %464, align 8
  %466 = add nsw i32 %465, 1
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds i32, ptr %462, i64 %467
  %469 = load i32, ptr %468, align 4
  store i32 %469, ptr %4, align 4
  %470 = load ptr, ptr %2, align 8
  %471 = getelementptr inbounds %struct.VM, ptr %470, i32 0, i32 1
  %472 = load ptr, ptr %471, align 8
  %473 = load ptr, ptr %2, align 8
  %474 = getelementptr inbounds %struct.VM, ptr %473, i32 0, i32 2
  %475 = load i32, ptr %474, align 8
  %476 = add nsw i32 %475, 2
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds i32, ptr %472, i64 %477
  %479 = load i32, ptr %478, align 4
  store i32 %479, ptr %5, align 4
  %480 = load ptr, ptr %2, align 8
  %481 = getelementptr inbounds %struct.VM, ptr %480, i32 0, i32 0
  %482 = load i32, ptr %5, align 4
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds [16 x i32], ptr %481, i64 0, i64 %483
  %485 = load i32, ptr %484, align 4
  store i32 %485, ptr %8, align 4
  %486 = load ptr, ptr %2, align 8
  %487 = getelementptr inbounds %struct.VM, ptr %486, i32 0, i32 4
  %488 = load ptr, ptr %487, align 8
  %489 = load i32, ptr %8, align 4
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds i8, ptr %488, i64 %490
  %492 = load i8, ptr %491, align 1
  %493 = zext i8 %492 to i32
  %494 = load ptr, ptr %2, align 8
  %495 = getelementptr inbounds %struct.VM, ptr %494, i32 0, i32 0
  %496 = load i32, ptr %4, align 4
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds [16 x i32], ptr %495, i64 0, i64 %497
  store i32 %493, ptr %498, align 4
  %499 = load ptr, ptr %2, align 8
  %500 = getelementptr inbounds %struct.VM, ptr %499, i32 0, i32 2
  %501 = load i32, ptr %500, align 8
  %502 = add nsw i32 %501, 3
  store i32 %502, ptr %500, align 8
  br label %527

503:                                              ; preds = %13
  %504 = load ptr, ptr %2, align 8
  %505 = getelementptr inbounds %struct.VM, ptr %504, i32 0, i32 1
  %506 = load ptr, ptr %505, align 8
  %507 = load ptr, ptr %2, align 8
  %508 = getelementptr inbounds %struct.VM, ptr %507, i32 0, i32 2
  %509 = load i32, ptr %508, align 8
  %510 = add nsw i32 %509, 1
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds i32, ptr %506, i64 %511
  %513 = load i32, ptr %512, align 4
  %514 = icmp ne i32 %513, 0
  br i1 %514, label %515, label %517

515:                                              ; preds = %503
  %516 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %519

517:                                              ; preds = %503
  %518 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %519

519:                                              ; preds = %517, %515
  %520 = load ptr, ptr %2, align 8
  %521 = getelementptr inbounds %struct.VM, ptr %520, i32 0, i32 2
  %522 = load i32, ptr %521, align 8
  %523 = add nsw i32 %522, 1
  store i32 %523, ptr %521, align 8
  br label %527

524:                                              ; preds = %13
  %525 = load i32, ptr %3, align 4
  %526 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %525)
  call void @exit(i32 noundef 1) #7
  unreachable

527:                                              ; preds = %519, %459, %458, %394, %371, %357, %304, %251, %198, %145, %92, %56, %25, %24
  br label %10, !llvm.loop !6

528:                                              ; preds = %10
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @new_vm(ptr noundef @prog, i32 noundef 51, i32 noundef 256)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  call void @run_vm(ptr noundef %3)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #5 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
