; ModuleID = '../tests/vm.c'
source_filename = "../tests/vm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.VM = type { [16 x i32], ptr, i32, i32, ptr }

@cmps = dso_local global [34 x i8] c"\AB\BC\A8\A8\AA\BD\AF\92\D8\9A\B6\BF\A4\B6\8B\8C\88\9C\9D\D8\8F\9C\D8\B6\8F\86\9B\B6\BB\AC\AC\BB\D6\94", align 16
@.str = private unnamed_addr constant [7 x i8] c"input\0A\00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"righhhhhhhhht!\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"wronnnnnnnnng!\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Invalid opcode: %d\0A\00", align 1
@prog = dso_local global [51 x i32] [i32 9, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 128, i32 1, i32 13, i32 34, i32 1, i32 14, i32 1, i32 1, i32 15, i32 233, i32 12, i32 2, i32 0, i32 7, i32 3, i32 2, i32 15, i32 12, i32 4, i32 1, i32 10, i32 4, i32 3, i32 11, i32 48, i32 3, i32 0, i32 0, i32 14, i32 3, i32 1, i32 1, i32 14, i32 10, i32 0, i32 13, i32 11, i32 17, i32 13, i32 1, i32 0, i32 13, i32 0, i32 0], align 16
@AllFunctions_IndirectBrTargets = private global [1 x [26 x ptr]] [[26 x ptr] [ptr blockaddress(@run_vm, %11), ptr blockaddress(@run_vm, %14), ptr blockaddress(@run_vm, %25), ptr blockaddress(@run_vm, %26), ptr blockaddress(@run_vm, %57), ptr blockaddress(@run_vm, %93), ptr blockaddress(@run_vm, %146), ptr blockaddress(@run_vm, %199), ptr blockaddress(@run_vm, %252), ptr blockaddress(@run_vm, %305), ptr blockaddress(@run_vm, %358), ptr blockaddress(@run_vm, %372), ptr blockaddress(@run_vm, %395), ptr blockaddress(@run_vm, %436), ptr blockaddress(@run_vm, %441), ptr blockaddress(@run_vm, %454), ptr blockaddress(@run_vm, %459), ptr blockaddress(@run_vm, %460), ptr blockaddress(@run_vm, %504), ptr blockaddress(@run_vm, %516), ptr blockaddress(@run_vm, %518), ptr blockaddress(@run_vm, %520), ptr blockaddress(@run_vm, %525), ptr blockaddress(@run_vm, %528), ptr blockaddress(@run_vm, %529), ptr null]]
@llvm.compiler.used = appending global [1 x ptr] [ptr @AllFunctions_IndirectBrTargets], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @new_vm(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 88) #7
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
  %19 = call noalias ptr @malloc(i64 noundef %18) #7
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
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 16 @cmps, i64 34, i1 false)
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
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %11

11:                                               ; preds = %528, %1
  %12 = load i32, ptr %9, align 4
  %13 = icmp ne i32 %12, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0Apop %rbx\0Apop %rax\0A", "r, r"(i64 65560, i1 %13)
  br i1 %13, label %14, label %529

14:                                               ; preds = %11
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.VM, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.VM, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %17, i64 %21
  %23 = load i32, ptr %22, align 4
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %3, align 4
  switch i32 %24, label %525 [
    i32 0, label %25
    i32 1, label %26
    i32 2, label %57
    i32 3, label %93
    i32 4, label %146
    i32 5, label %199
    i32 6, label %252
    i32 7, label %305
    i32 8, label %358
    i32 9, label %372
    i32 10, label %395
    i32 11, label %436
    i32 12, label %460
    i32 13, label %504
  ]

25:                                               ; preds = %14
  store i32 0, ptr %9, align 4
  br label %528

26:                                               ; preds = %14
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.VM, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.VM, ptr %30, i32 0, i32 2
  %32 = load i32, ptr %31, align 8
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %29, i64 %34
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %4, align 4
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds %struct.VM, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.VM, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = add nsw i32 %42, 2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %39, i64 %44
  %46 = load i32, ptr %45, align 4
  store i32 %46, ptr %7, align 4
  %47 = load i32, ptr %7, align 4
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds %struct.VM, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %4, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [16 x i32], ptr %49, i64 0, i64 %51
  store i32 %47, ptr %52, align 4
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.VM, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %54, align 8
  %56 = add nsw i32 %55, 3
  store i32 %56, ptr %54, align 8
  br label %528

57:                                               ; preds = %14
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.VM, ptr %58, i32 0, i32 1
  %60 = load ptr, ptr %59, align 8
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds %struct.VM, ptr %61, i32 0, i32 2
  %63 = load i32, ptr %62, align 8
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %60, i64 %65
  %67 = load i32, ptr %66, align 4
  store i32 %67, ptr %4, align 4
  %68 = load ptr, ptr %2, align 8
  %69 = getelementptr inbounds %struct.VM, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  %71 = load ptr, ptr %2, align 8
  %72 = getelementptr inbounds %struct.VM, ptr %71, i32 0, i32 2
  %73 = load i32, ptr %72, align 8
  %74 = add nsw i32 %73, 2
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, ptr %70, i64 %75
  %77 = load i32, ptr %76, align 4
  store i32 %77, ptr %5, align 4
  %78 = load ptr, ptr %2, align 8
  %79 = getelementptr inbounds %struct.VM, ptr %78, i32 0, i32 0
  %80 = load i32, ptr %4, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [16 x i32], ptr %79, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = load ptr, ptr %2, align 8
  %85 = getelementptr inbounds %struct.VM, ptr %84, i32 0, i32 0
  %86 = load i32, ptr %5, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [16 x i32], ptr %85, i64 0, i64 %87
  store i32 %83, ptr %88, align 4
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.VM, ptr %89, i32 0, i32 2
  %91 = load i32, ptr %90, align 8
  %92 = add nsw i32 %91, 3
  store i32 %92, ptr %90, align 8
  br label %528

93:                                               ; preds = %14
  %94 = load ptr, ptr %2, align 8
  %95 = getelementptr inbounds %struct.VM, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = load ptr, ptr %2, align 8
  %98 = getelementptr inbounds %struct.VM, ptr %97, i32 0, i32 2
  %99 = load i32, ptr %98, align 8
  %100 = add nsw i32 %99, 3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, ptr %96, i64 %101
  %103 = load i32, ptr %102, align 4
  store i32 %103, ptr %4, align 4
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr inbounds %struct.VM, ptr %104, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  %107 = load ptr, ptr %2, align 8
  %108 = getelementptr inbounds %struct.VM, ptr %107, i32 0, i32 2
  %109 = load i32, ptr %108, align 8
  %110 = add nsw i32 %109, 2
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, ptr %106, i64 %111
  %113 = load i32, ptr %112, align 4
  store i32 %113, ptr %5, align 4
  %114 = load ptr, ptr %2, align 8
  %115 = getelementptr inbounds %struct.VM, ptr %114, i32 0, i32 1
  %116 = load ptr, ptr %115, align 8
  %117 = load ptr, ptr %2, align 8
  %118 = getelementptr inbounds %struct.VM, ptr %117, i32 0, i32 2
  %119 = load i32, ptr %118, align 8
  %120 = add nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, ptr %116, i64 %121
  %123 = load i32, ptr %122, align 4
  store i32 %123, ptr %6, align 4
  %124 = load ptr, ptr %2, align 8
  %125 = getelementptr inbounds %struct.VM, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %4, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [16 x i32], ptr %125, i64 0, i64 %127
  %129 = load i32, ptr %128, align 4
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr inbounds %struct.VM, ptr %130, i32 0, i32 0
  %132 = load i32, ptr %5, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [16 x i32], ptr %131, i64 0, i64 %133
  %135 = load i32, ptr %134, align 4
  %136 = add nsw i32 %129, %135
  %137 = load ptr, ptr %2, align 8
  %138 = getelementptr inbounds %struct.VM, ptr %137, i32 0, i32 0
  %139 = load i32, ptr %6, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [16 x i32], ptr %138, i64 0, i64 %140
  store i32 %136, ptr %141, align 4
  %142 = load ptr, ptr %2, align 8
  %143 = getelementptr inbounds %struct.VM, ptr %142, i32 0, i32 2
  %144 = load i32, ptr %143, align 8
  %145 = add nsw i32 %144, 4
  store i32 %145, ptr %143, align 8
  br label %528

146:                                              ; preds = %14
  %147 = load ptr, ptr %2, align 8
  %148 = getelementptr inbounds %struct.VM, ptr %147, i32 0, i32 1
  %149 = load ptr, ptr %148, align 8
  %150 = load ptr, ptr %2, align 8
  %151 = getelementptr inbounds %struct.VM, ptr %150, i32 0, i32 2
  %152 = load i32, ptr %151, align 8
  %153 = add nsw i32 %152, 3
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i32, ptr %149, i64 %154
  %156 = load i32, ptr %155, align 4
  store i32 %156, ptr %4, align 4
  %157 = load ptr, ptr %2, align 8
  %158 = getelementptr inbounds %struct.VM, ptr %157, i32 0, i32 1
  %159 = load ptr, ptr %158, align 8
  %160 = load ptr, ptr %2, align 8
  %161 = getelementptr inbounds %struct.VM, ptr %160, i32 0, i32 2
  %162 = load i32, ptr %161, align 8
  %163 = add nsw i32 %162, 2
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, ptr %159, i64 %164
  %166 = load i32, ptr %165, align 4
  store i32 %166, ptr %5, align 4
  %167 = load ptr, ptr %2, align 8
  %168 = getelementptr inbounds %struct.VM, ptr %167, i32 0, i32 1
  %169 = load ptr, ptr %168, align 8
  %170 = load ptr, ptr %2, align 8
  %171 = getelementptr inbounds %struct.VM, ptr %170, i32 0, i32 2
  %172 = load i32, ptr %171, align 8
  %173 = add nsw i32 %172, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i32, ptr %169, i64 %174
  %176 = load i32, ptr %175, align 4
  store i32 %176, ptr %6, align 4
  %177 = load ptr, ptr %2, align 8
  %178 = getelementptr inbounds %struct.VM, ptr %177, i32 0, i32 0
  %179 = load i32, ptr %4, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [16 x i32], ptr %178, i64 0, i64 %180
  %182 = load i32, ptr %181, align 4
  %183 = load ptr, ptr %2, align 8
  %184 = getelementptr inbounds %struct.VM, ptr %183, i32 0, i32 0
  %185 = load i32, ptr %5, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [16 x i32], ptr %184, i64 0, i64 %186
  %188 = load i32, ptr %187, align 4
  %189 = sub nsw i32 %182, %188
  %190 = load ptr, ptr %2, align 8
  %191 = getelementptr inbounds %struct.VM, ptr %190, i32 0, i32 0
  %192 = load i32, ptr %6, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [16 x i32], ptr %191, i64 0, i64 %193
  store i32 %189, ptr %194, align 4
  %195 = load ptr, ptr %2, align 8
  %196 = getelementptr inbounds %struct.VM, ptr %195, i32 0, i32 2
  %197 = load i32, ptr %196, align 8
  %198 = add nsw i32 %197, 4
  store i32 %198, ptr %196, align 8
  br label %528

199:                                              ; preds = %14
  %200 = load ptr, ptr %2, align 8
  %201 = getelementptr inbounds %struct.VM, ptr %200, i32 0, i32 1
  %202 = load ptr, ptr %201, align 8
  %203 = load ptr, ptr %2, align 8
  %204 = getelementptr inbounds %struct.VM, ptr %203, i32 0, i32 2
  %205 = load i32, ptr %204, align 8
  %206 = add nsw i32 %205, 3
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i32, ptr %202, i64 %207
  %209 = load i32, ptr %208, align 4
  store i32 %209, ptr %4, align 4
  %210 = load ptr, ptr %2, align 8
  %211 = getelementptr inbounds %struct.VM, ptr %210, i32 0, i32 1
  %212 = load ptr, ptr %211, align 8
  %213 = load ptr, ptr %2, align 8
  %214 = getelementptr inbounds %struct.VM, ptr %213, i32 0, i32 2
  %215 = load i32, ptr %214, align 8
  %216 = add nsw i32 %215, 2
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i32, ptr %212, i64 %217
  %219 = load i32, ptr %218, align 4
  store i32 %219, ptr %5, align 4
  %220 = load ptr, ptr %2, align 8
  %221 = getelementptr inbounds %struct.VM, ptr %220, i32 0, i32 1
  %222 = load ptr, ptr %221, align 8
  %223 = load ptr, ptr %2, align 8
  %224 = getelementptr inbounds %struct.VM, ptr %223, i32 0, i32 2
  %225 = load i32, ptr %224, align 8
  %226 = add nsw i32 %225, 1
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i32, ptr %222, i64 %227
  %229 = load i32, ptr %228, align 4
  store i32 %229, ptr %6, align 4
  %230 = load ptr, ptr %2, align 8
  %231 = getelementptr inbounds %struct.VM, ptr %230, i32 0, i32 0
  %232 = load i32, ptr %4, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [16 x i32], ptr %231, i64 0, i64 %233
  %235 = load i32, ptr %234, align 4
  %236 = load ptr, ptr %2, align 8
  %237 = getelementptr inbounds %struct.VM, ptr %236, i32 0, i32 0
  %238 = load i32, ptr %5, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [16 x i32], ptr %237, i64 0, i64 %239
  %241 = load i32, ptr %240, align 4
  %242 = mul nsw i32 %235, %241
  %243 = load ptr, ptr %2, align 8
  %244 = getelementptr inbounds %struct.VM, ptr %243, i32 0, i32 0
  %245 = load i32, ptr %6, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [16 x i32], ptr %244, i64 0, i64 %246
  store i32 %242, ptr %247, align 4
  %248 = load ptr, ptr %2, align 8
  %249 = getelementptr inbounds %struct.VM, ptr %248, i32 0, i32 2
  %250 = load i32, ptr %249, align 8
  %251 = add nsw i32 %250, 4
  store i32 %251, ptr %249, align 8
  br label %528

252:                                              ; preds = %14
  %253 = load ptr, ptr %2, align 8
  %254 = getelementptr inbounds %struct.VM, ptr %253, i32 0, i32 1
  %255 = load ptr, ptr %254, align 8
  %256 = load ptr, ptr %2, align 8
  %257 = getelementptr inbounds %struct.VM, ptr %256, i32 0, i32 2
  %258 = load i32, ptr %257, align 8
  %259 = add nsw i32 %258, 3
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i32, ptr %255, i64 %260
  %262 = load i32, ptr %261, align 4
  store i32 %262, ptr %4, align 4
  %263 = load ptr, ptr %2, align 8
  %264 = getelementptr inbounds %struct.VM, ptr %263, i32 0, i32 1
  %265 = load ptr, ptr %264, align 8
  %266 = load ptr, ptr %2, align 8
  %267 = getelementptr inbounds %struct.VM, ptr %266, i32 0, i32 2
  %268 = load i32, ptr %267, align 8
  %269 = add nsw i32 %268, 2
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i32, ptr %265, i64 %270
  %272 = load i32, ptr %271, align 4
  store i32 %272, ptr %5, align 4
  %273 = load ptr, ptr %2, align 8
  %274 = getelementptr inbounds %struct.VM, ptr %273, i32 0, i32 1
  %275 = load ptr, ptr %274, align 8
  %276 = load ptr, ptr %2, align 8
  %277 = getelementptr inbounds %struct.VM, ptr %276, i32 0, i32 2
  %278 = load i32, ptr %277, align 8
  %279 = add nsw i32 %278, 1
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i32, ptr %275, i64 %280
  %282 = load i32, ptr %281, align 4
  store i32 %282, ptr %6, align 4
  %283 = load ptr, ptr %2, align 8
  %284 = getelementptr inbounds %struct.VM, ptr %283, i32 0, i32 0
  %285 = load i32, ptr %4, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [16 x i32], ptr %284, i64 0, i64 %286
  %288 = load i32, ptr %287, align 4
  %289 = load ptr, ptr %2, align 8
  %290 = getelementptr inbounds %struct.VM, ptr %289, i32 0, i32 0
  %291 = load i32, ptr %5, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [16 x i32], ptr %290, i64 0, i64 %292
  %294 = load i32, ptr %293, align 4
  %295 = sdiv i32 %288, %294
  %296 = load ptr, ptr %2, align 8
  %297 = getelementptr inbounds %struct.VM, ptr %296, i32 0, i32 0
  %298 = load i32, ptr %6, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [16 x i32], ptr %297, i64 0, i64 %299
  store i32 %295, ptr %300, align 4
  %301 = load ptr, ptr %2, align 8
  %302 = getelementptr inbounds %struct.VM, ptr %301, i32 0, i32 2
  %303 = load i32, ptr %302, align 8
  %304 = add nsw i32 %303, 4
  store i32 %304, ptr %302, align 8
  br label %528

305:                                              ; preds = %14
  %306 = load ptr, ptr %2, align 8
  %307 = getelementptr inbounds %struct.VM, ptr %306, i32 0, i32 1
  %308 = load ptr, ptr %307, align 8
  %309 = load ptr, ptr %2, align 8
  %310 = getelementptr inbounds %struct.VM, ptr %309, i32 0, i32 2
  %311 = load i32, ptr %310, align 8
  %312 = add nsw i32 %311, 3
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i32, ptr %308, i64 %313
  %315 = load i32, ptr %314, align 4
  store i32 %315, ptr %4, align 4
  %316 = load ptr, ptr %2, align 8
  %317 = getelementptr inbounds %struct.VM, ptr %316, i32 0, i32 1
  %318 = load ptr, ptr %317, align 8
  %319 = load ptr, ptr %2, align 8
  %320 = getelementptr inbounds %struct.VM, ptr %319, i32 0, i32 2
  %321 = load i32, ptr %320, align 8
  %322 = add nsw i32 %321, 2
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds i32, ptr %318, i64 %323
  %325 = load i32, ptr %324, align 4
  store i32 %325, ptr %5, align 4
  %326 = load ptr, ptr %2, align 8
  %327 = getelementptr inbounds %struct.VM, ptr %326, i32 0, i32 1
  %328 = load ptr, ptr %327, align 8
  %329 = load ptr, ptr %2, align 8
  %330 = getelementptr inbounds %struct.VM, ptr %329, i32 0, i32 2
  %331 = load i32, ptr %330, align 8
  %332 = add nsw i32 %331, 1
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds i32, ptr %328, i64 %333
  %335 = load i32, ptr %334, align 4
  store i32 %335, ptr %6, align 4
  %336 = load ptr, ptr %2, align 8
  %337 = getelementptr inbounds %struct.VM, ptr %336, i32 0, i32 0
  %338 = load i32, ptr %4, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [16 x i32], ptr %337, i64 0, i64 %339
  %341 = load i32, ptr %340, align 4
  %342 = load ptr, ptr %2, align 8
  %343 = getelementptr inbounds %struct.VM, ptr %342, i32 0, i32 0
  %344 = load i32, ptr %5, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [16 x i32], ptr %343, i64 0, i64 %345
  %347 = load i32, ptr %346, align 4
  %348 = xor i32 %341, %347
  %349 = load ptr, ptr %2, align 8
  %350 = getelementptr inbounds %struct.VM, ptr %349, i32 0, i32 0
  %351 = load i32, ptr %6, align 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds [16 x i32], ptr %350, i64 0, i64 %352
  store i32 %348, ptr %353, align 4
  %354 = load ptr, ptr %2, align 8
  %355 = getelementptr inbounds %struct.VM, ptr %354, i32 0, i32 2
  %356 = load i32, ptr %355, align 8
  %357 = add nsw i32 %356, 4
  store i32 %357, ptr %355, align 8
  br label %528

358:                                              ; preds = %14
  %359 = load ptr, ptr %2, align 8
  %360 = getelementptr inbounds %struct.VM, ptr %359, i32 0, i32 1
  %361 = load ptr, ptr %360, align 8
  %362 = load ptr, ptr %2, align 8
  %363 = getelementptr inbounds %struct.VM, ptr %362, i32 0, i32 2
  %364 = load i32, ptr %363, align 8
  %365 = add nsw i32 %364, 1
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i32, ptr %361, i64 %366
  %368 = load i32, ptr %367, align 4
  store i32 %368, ptr %7, align 4
  %369 = load i32, ptr %7, align 4
  %370 = load ptr, ptr %2, align 8
  %371 = getelementptr inbounds %struct.VM, ptr %370, i32 0, i32 2
  store i32 %369, ptr %371, align 8
  br label %528

372:                                              ; preds = %14
  %373 = load ptr, ptr %2, align 8
  %374 = getelementptr inbounds %struct.VM, ptr %373, i32 0, i32 1
  %375 = load ptr, ptr %374, align 8
  %376 = load ptr, ptr %2, align 8
  %377 = getelementptr inbounds %struct.VM, ptr %376, i32 0, i32 2
  %378 = load i32, ptr %377, align 8
  %379 = add nsw i32 %378, 1
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds i32, ptr %375, i64 %380
  %382 = load i32, ptr %381, align 4
  store i32 %382, ptr %8, align 4
  %383 = load ptr, ptr %2, align 8
  %384 = getelementptr inbounds %struct.VM, ptr %383, i32 0, i32 4
  %385 = load ptr, ptr %384, align 8
  %386 = load i32, ptr %8, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds i8, ptr %385, i64 %387
  %389 = load ptr, ptr @stdin, align 8
  %390 = call ptr @fgets(ptr noundef %388, i32 noundef 256, ptr noundef %389)
  %391 = load ptr, ptr %2, align 8
  %392 = getelementptr inbounds %struct.VM, ptr %391, i32 0, i32 2
  %393 = load i32, ptr %392, align 8
  %394 = add nsw i32 %393, 2
  store i32 %394, ptr %392, align 8
  br label %528

395:                                              ; preds = %14
  %396 = load ptr, ptr %2, align 8
  %397 = getelementptr inbounds %struct.VM, ptr %396, i32 0, i32 1
  %398 = load ptr, ptr %397, align 8
  %399 = load ptr, ptr %2, align 8
  %400 = getelementptr inbounds %struct.VM, ptr %399, i32 0, i32 2
  %401 = load i32, ptr %400, align 8
  %402 = add nsw i32 %401, 1
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i32, ptr %398, i64 %403
  %405 = load i32, ptr %404, align 4
  store i32 %405, ptr %4, align 4
  %406 = load ptr, ptr %2, align 8
  %407 = getelementptr inbounds %struct.VM, ptr %406, i32 0, i32 1
  %408 = load ptr, ptr %407, align 8
  %409 = load ptr, ptr %2, align 8
  %410 = getelementptr inbounds %struct.VM, ptr %409, i32 0, i32 2
  %411 = load i32, ptr %410, align 8
  %412 = add nsw i32 %411, 2
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds i32, ptr %408, i64 %413
  %415 = load i32, ptr %414, align 4
  store i32 %415, ptr %5, align 4
  %416 = load ptr, ptr %2, align 8
  %417 = getelementptr inbounds %struct.VM, ptr %416, i32 0, i32 0
  %418 = load i32, ptr %4, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [16 x i32], ptr %417, i64 0, i64 %419
  %421 = load i32, ptr %420, align 4
  %422 = load ptr, ptr %2, align 8
  %423 = getelementptr inbounds %struct.VM, ptr %422, i32 0, i32 0
  %424 = load i32, ptr %5, align 4
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [16 x i32], ptr %423, i64 0, i64 %425
  %427 = load i32, ptr %426, align 4
  %428 = icmp eq i32 %421, %427
  %429 = zext i1 %428 to i32
  %430 = load ptr, ptr %2, align 8
  %431 = getelementptr inbounds %struct.VM, ptr %430, i32 0, i32 3
  store i32 %429, ptr %431, align 4
  %432 = load ptr, ptr %2, align 8
  %433 = getelementptr inbounds %struct.VM, ptr %432, i32 0, i32 2
  %434 = load i32, ptr %433, align 8
  %435 = add nsw i32 %434, 3
  store i32 %435, ptr %433, align 8
  br label %528

436:                                              ; preds = %14
  %437 = load ptr, ptr %2, align 8
  %438 = getelementptr inbounds %struct.VM, ptr %437, i32 0, i32 3
  %439 = load i32, ptr %438, align 4
  %440 = icmp ne i32 %439, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0Apop %rbx\0Apop %rax\0A", "r, r"(i64 55835557902, i1 %440)
  br i1 %440, label %454, label %441

441:                                              ; preds = %436
  %442 = load ptr, ptr %2, align 8
  %443 = getelementptr inbounds %struct.VM, ptr %442, i32 0, i32 1
  %444 = load ptr, ptr %443, align 8
  %445 = load ptr, ptr %2, align 8
  %446 = getelementptr inbounds %struct.VM, ptr %445, i32 0, i32 2
  %447 = load i32, ptr %446, align 8
  %448 = add nsw i32 %447, 1
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds i32, ptr %444, i64 %449
  %451 = load i32, ptr %450, align 4
  %452 = load ptr, ptr %2, align 8
  %453 = getelementptr inbounds %struct.VM, ptr %452, i32 0, i32 2
  store i32 %451, ptr %453, align 8
  br label %459

454:                                              ; preds = %436
  %455 = load ptr, ptr %2, align 8
  %456 = getelementptr inbounds %struct.VM, ptr %455, i32 0, i32 2
  %457 = load i32, ptr %456, align 8
  %458 = add nsw i32 %457, 2
  store i32 %458, ptr %456, align 8
  br label %459

459:                                              ; preds = %454, %441
  br label %528

460:                                              ; preds = %14
  %461 = load ptr, ptr %2, align 8
  %462 = getelementptr inbounds %struct.VM, ptr %461, i32 0, i32 1
  %463 = load ptr, ptr %462, align 8
  %464 = load ptr, ptr %2, align 8
  %465 = getelementptr inbounds %struct.VM, ptr %464, i32 0, i32 2
  %466 = load i32, ptr %465, align 8
  %467 = add nsw i32 %466, 1
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds i32, ptr %463, i64 %468
  %470 = load i32, ptr %469, align 4
  store i32 %470, ptr %4, align 4
  %471 = load ptr, ptr %2, align 8
  %472 = getelementptr inbounds %struct.VM, ptr %471, i32 0, i32 1
  %473 = load ptr, ptr %472, align 8
  %474 = load ptr, ptr %2, align 8
  %475 = getelementptr inbounds %struct.VM, ptr %474, i32 0, i32 2
  %476 = load i32, ptr %475, align 8
  %477 = add nsw i32 %476, 2
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds i32, ptr %473, i64 %478
  %480 = load i32, ptr %479, align 4
  store i32 %480, ptr %5, align 4
  %481 = load ptr, ptr %2, align 8
  %482 = getelementptr inbounds %struct.VM, ptr %481, i32 0, i32 0
  %483 = load i32, ptr %5, align 4
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds [16 x i32], ptr %482, i64 0, i64 %484
  %486 = load i32, ptr %485, align 4
  store i32 %486, ptr %8, align 4
  %487 = load ptr, ptr %2, align 8
  %488 = getelementptr inbounds %struct.VM, ptr %487, i32 0, i32 4
  %489 = load ptr, ptr %488, align 8
  %490 = load i32, ptr %8, align 4
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds i8, ptr %489, i64 %491
  %493 = load i8, ptr %492, align 1
  %494 = zext i8 %493 to i32
  %495 = load ptr, ptr %2, align 8
  %496 = getelementptr inbounds %struct.VM, ptr %495, i32 0, i32 0
  %497 = load i32, ptr %4, align 4
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds [16 x i32], ptr %496, i64 0, i64 %498
  store i32 %494, ptr %499, align 4
  %500 = load ptr, ptr %2, align 8
  %501 = getelementptr inbounds %struct.VM, ptr %500, i32 0, i32 2
  %502 = load i32, ptr %501, align 8
  %503 = add nsw i32 %502, 3
  store i32 %503, ptr %501, align 8
  br label %528

504:                                              ; preds = %14
  %505 = load ptr, ptr %2, align 8
  %506 = getelementptr inbounds %struct.VM, ptr %505, i32 0, i32 1
  %507 = load ptr, ptr %506, align 8
  %508 = load ptr, ptr %2, align 8
  %509 = getelementptr inbounds %struct.VM, ptr %508, i32 0, i32 2
  %510 = load i32, ptr %509, align 8
  %511 = add nsw i32 %510, 1
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds i32, ptr %507, i64 %512
  %514 = load i32, ptr %513, align 4
  %515 = icmp ne i32 %514, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0Apop %rbx\0Apop %rax\0A", "r, r"(i64 77310656532, i1 %515)
  br i1 %515, label %516, label %518

516:                                              ; preds = %504
  %517 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %520

518:                                              ; preds = %504
  %519 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %520

520:                                              ; preds = %518, %516
  %521 = load ptr, ptr %2, align 8
  %522 = getelementptr inbounds %struct.VM, ptr %521, i32 0, i32 2
  %523 = load i32, ptr %522, align 8
  %524 = add nsw i32 %523, 1
  store i32 %524, ptr %522, align 8
  br label %528

525:                                              ; preds = %14
  %526 = load i32, ptr %3, align 4
  %527 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %526)
  call void @exit(i32 noundef 1) #8
  unreachable

528:                                              ; preds = %520, %460, %459, %395, %372, %358, %305, %252, %199, %146, %93, %57, %26, %25
  br label %11, !llvm.loop !6

529:                                              ; preds = %11
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

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

; Function Attrs: naked
define void @IndirectCallFunc() #6 {
  %1 = call i64 asm sideeffect "mov $0, %rax", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 32
  %5 = trunc i64 %4 to i16
  %6 = getelementptr [1 x [26 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %7 = getelementptr [26 x ptr], ptr %6, i32 0, i16 %5
  %8 = load ptr, ptr %7, align 8
  call void asm sideeffect "pop %rax", ""()
  call void asm sideeffect "pop %rax", ""()
  call void asm sideeffect "jmp *$0", "r"(ptr %8)
  ret void
}

define void @IndirectConditionalJumpFunc() {
  %1 = call i64 asm sideeffect "mov $0, %rax", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 16
  %5 = trunc i64 %4 to i16
  %6 = trunc i64 %1 to i16
  %7 = call i64 asm sideeffect "mov $0, %rbx", "=r"()
  %8 = getelementptr [1 x [26 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %9 = getelementptr [26 x ptr], ptr %8, i32 0, i16 %5
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr [1 x [26 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %12 = getelementptr [26 x ptr], ptr %11, i32 0, i16 %6
  %13 = load ptr, ptr %12, align 8
  %14 = icmp eq i64 %7, 1
  %15 = select i1 %14, ptr %10, ptr %13
  call void asm sideeffect "pop %rax", ""()
  call void asm sideeffect "pop %rbx", ""()
  call void asm sideeffect "pop %rax", ""()
  call void asm sideeffect "jmp *$0", "r"(ptr %15)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { naked }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
