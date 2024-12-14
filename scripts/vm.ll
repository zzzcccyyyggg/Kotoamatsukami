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
@AllFunctions_IndirectBrTargets = private global [2 x [92 x ptr]] [[92 x ptr] [ptr blockaddress(@main, %3), ptr blockaddress(@main, %4), ptr blockaddress(@main, %6), ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null, ptr null], [92 x ptr] zeroinitializer]
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
  br label %9

9:                                                ; preds = %1
  %10 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  br label %11

11:                                               ; preds = %9
  store i32 1, ptr %10, align 4
  br label %12

12:                                               ; preds = %11
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %14

14:                                               ; preds = %621, %12
  %15 = load i32, ptr %10, align 4
  br label %16

16:                                               ; preds = %14
  %17 = icmp ne i32 %15, 0
  br label %18

18:                                               ; preds = %16
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x50006005a, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %17)
  br i1 %17, label %19, label %622

19:                                               ; preds = %18
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %20 = load ptr, ptr %2, align 8
  br label %21

21:                                               ; preds = %19
  %22 = getelementptr inbounds %struct.VM, ptr %20, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.VM, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %23, i64 %27
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %3, align 4
  %30 = load i32, ptr %3, align 4
  %31 = icmp eq i32 %30, 0
  br label %32

32:                                               ; preds = %21
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x80009000b, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %31)
  br i1 %31, label %33, label %35

33:                                               ; preds = %32
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %34

34:                                               ; preds = %33
  store i32 0, ptr %10, align 4
  br label %621

35:                                               ; preds = %32
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %3, align 4
  %38 = icmp eq i32 %37, 1
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0xc000d000f, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %38)
  br i1 %38, label %39, label %71

39:                                               ; preds = %36
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.VM, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.VM, ptr %43, i32 0, i32 2
  %45 = load i32, ptr %44, align 8
  %46 = add nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %42, i64 %47
  %49 = load i32, ptr %48, align 4
  store i32 %49, ptr %4, align 4
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.VM, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.VM, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %54, align 8
  %56 = add nsw i32 %55, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %52, i64 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %7, align 4
  %60 = load i32, ptr %7, align 4
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds %struct.VM, ptr %61, i32 0, i32 0
  %63 = load i32, ptr %4, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [16 x i32], ptr %62, i64 0, i64 %64
  store i32 %60, ptr %65, align 4
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds %struct.VM, ptr %66, i32 0, i32 2
  br label %68

68:                                               ; preds = %39
  %69 = load i32, ptr %67, align 8
  %70 = add nsw i32 %69, 3
  store i32 %70, ptr %67, align 8
  br label %620

71:                                               ; preds = %36
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %72 = load i32, ptr %3, align 4
  %73 = icmp eq i32 %72, 2
  br label %74

74:                                               ; preds = %71
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x1000110013, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %73)
  br i1 %73, label %75, label %112

75:                                               ; preds = %74
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr inbounds %struct.VM, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr inbounds %struct.VM, ptr %79, i32 0, i32 2
  %81 = load i32, ptr %80, align 8
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %78, i64 %83
  %85 = load i32, ptr %84, align 4
  store i32 %85, ptr %4, align 4
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds %struct.VM, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.VM, ptr %89, i32 0, i32 2
  %91 = load i32, ptr %90, align 8
  %92 = add nsw i32 %91, 2
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %88, i64 %93
  %95 = load i32, ptr %94, align 4
  store i32 %95, ptr %5, align 4
  %96 = load ptr, ptr %2, align 8
  %97 = getelementptr inbounds %struct.VM, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %4, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [16 x i32], ptr %97, i64 0, i64 %99
  br label %101

101:                                              ; preds = %75
  %102 = load i32, ptr %100, align 4
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds %struct.VM, ptr %103, i32 0, i32 0
  %105 = load i32, ptr %5, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [16 x i32], ptr %104, i64 0, i64 %106
  store i32 %102, ptr %107, align 4
  %108 = load ptr, ptr %2, align 8
  %109 = getelementptr inbounds %struct.VM, ptr %108, i32 0, i32 2
  %110 = load i32, ptr %109, align 8
  %111 = add nsw i32 %110, 3
  store i32 %111, ptr %109, align 8
  br label %619

112:                                              ; preds = %74
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %113 = load i32, ptr %3, align 4
  %114 = icmp eq i32 %113, 3
  br label %115

115:                                              ; preds = %112
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x1400150017, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %114)
  br i1 %114, label %116, label %170

116:                                              ; preds = %115
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %117 = load ptr, ptr %2, align 8
  %118 = getelementptr inbounds %struct.VM, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = load ptr, ptr %2, align 8
  %121 = getelementptr inbounds %struct.VM, ptr %120, i32 0, i32 2
  %122 = load i32, ptr %121, align 8
  %123 = add nsw i32 %122, 3
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, ptr %119, i64 %124
  %126 = load i32, ptr %125, align 4
  store i32 %126, ptr %4, align 4
  %127 = load ptr, ptr %2, align 8
  %128 = getelementptr inbounds %struct.VM, ptr %127, i32 0, i32 1
  %129 = load ptr, ptr %128, align 8
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr inbounds %struct.VM, ptr %130, i32 0, i32 2
  %132 = load i32, ptr %131, align 8
  %133 = add nsw i32 %132, 2
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, ptr %129, i64 %134
  %136 = load i32, ptr %135, align 4
  store i32 %136, ptr %5, align 4
  %137 = load ptr, ptr %2, align 8
  %138 = getelementptr inbounds %struct.VM, ptr %137, i32 0, i32 1
  %139 = load ptr, ptr %138, align 8
  %140 = load ptr, ptr %2, align 8
  %141 = getelementptr inbounds %struct.VM, ptr %140, i32 0, i32 2
  %142 = load i32, ptr %141, align 8
  %143 = add nsw i32 %142, 1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %139, i64 %144
  br label %146

146:                                              ; preds = %116
  %147 = load i32, ptr %145, align 4
  store i32 %147, ptr %6, align 4
  %148 = load ptr, ptr %2, align 8
  %149 = getelementptr inbounds %struct.VM, ptr %148, i32 0, i32 0
  %150 = load i32, ptr %4, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [16 x i32], ptr %149, i64 0, i64 %151
  %153 = load i32, ptr %152, align 4
  %154 = load ptr, ptr %2, align 8
  %155 = getelementptr inbounds %struct.VM, ptr %154, i32 0, i32 0
  %156 = load i32, ptr %5, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [16 x i32], ptr %155, i64 0, i64 %157
  %159 = load i32, ptr %158, align 4
  %160 = add nsw i32 %153, %159
  %161 = load ptr, ptr %2, align 8
  %162 = getelementptr inbounds %struct.VM, ptr %161, i32 0, i32 0
  %163 = load i32, ptr %6, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [16 x i32], ptr %162, i64 0, i64 %164
  store i32 %160, ptr %165, align 4
  %166 = load ptr, ptr %2, align 8
  %167 = getelementptr inbounds %struct.VM, ptr %166, i32 0, i32 2
  %168 = load i32, ptr %167, align 8
  %169 = add nsw i32 %168, 4
  store i32 %169, ptr %167, align 8
  br label %618

170:                                              ; preds = %115
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %171 = load i32, ptr %3, align 4
  %172 = icmp eq i32 %171, 4
  br label %173

173:                                              ; preds = %170
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x180019001b, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %172)
  br i1 %172, label %174, label %228

174:                                              ; preds = %173
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %175 = load ptr, ptr %2, align 8
  %176 = getelementptr inbounds %struct.VM, ptr %175, i32 0, i32 1
  %177 = load ptr, ptr %176, align 8
  %178 = load ptr, ptr %2, align 8
  %179 = getelementptr inbounds %struct.VM, ptr %178, i32 0, i32 2
  %180 = load i32, ptr %179, align 8
  %181 = add nsw i32 %180, 3
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, ptr %177, i64 %182
  %184 = load i32, ptr %183, align 4
  store i32 %184, ptr %4, align 4
  %185 = load ptr, ptr %2, align 8
  %186 = getelementptr inbounds %struct.VM, ptr %185, i32 0, i32 1
  %187 = load ptr, ptr %186, align 8
  %188 = load ptr, ptr %2, align 8
  %189 = getelementptr inbounds %struct.VM, ptr %188, i32 0, i32 2
  %190 = load i32, ptr %189, align 8
  %191 = add nsw i32 %190, 2
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds i32, ptr %187, i64 %192
  %194 = load i32, ptr %193, align 4
  store i32 %194, ptr %5, align 4
  %195 = load ptr, ptr %2, align 8
  %196 = getelementptr inbounds %struct.VM, ptr %195, i32 0, i32 1
  %197 = load ptr, ptr %196, align 8
  %198 = load ptr, ptr %2, align 8
  %199 = getelementptr inbounds %struct.VM, ptr %198, i32 0, i32 2
  %200 = load i32, ptr %199, align 8
  %201 = add nsw i32 %200, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i32, ptr %197, i64 %202
  %204 = load i32, ptr %203, align 4
  store i32 %204, ptr %6, align 4
  %205 = load ptr, ptr %2, align 8
  %206 = getelementptr inbounds %struct.VM, ptr %205, i32 0, i32 0
  %207 = load i32, ptr %4, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [16 x i32], ptr %206, i64 0, i64 %208
  %210 = load i32, ptr %209, align 4
  %211 = load ptr, ptr %2, align 8
  %212 = getelementptr inbounds %struct.VM, ptr %211, i32 0, i32 0
  %213 = load i32, ptr %5, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [16 x i32], ptr %212, i64 0, i64 %214
  %216 = load i32, ptr %215, align 4
  %217 = sub nsw i32 %210, %216
  %218 = load ptr, ptr %2, align 8
  %219 = getelementptr inbounds %struct.VM, ptr %218, i32 0, i32 0
  %220 = load i32, ptr %6, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [16 x i32], ptr %219, i64 0, i64 %221
  store i32 %217, ptr %222, align 4
  br label %223

223:                                              ; preds = %174
  %224 = load ptr, ptr %2, align 8
  %225 = getelementptr inbounds %struct.VM, ptr %224, i32 0, i32 2
  %226 = load i32, ptr %225, align 8
  %227 = add nsw i32 %226, 4
  store i32 %227, ptr %225, align 8
  br label %617

228:                                              ; preds = %173
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %229

229:                                              ; preds = %228
  %230 = load i32, ptr %3, align 4
  %231 = icmp eq i32 %230, 5
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x1c001d001f, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %231)
  br i1 %231, label %232, label %286

232:                                              ; preds = %229
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %233 = load ptr, ptr %2, align 8
  %234 = getelementptr inbounds %struct.VM, ptr %233, i32 0, i32 1
  %235 = load ptr, ptr %234, align 8
  %236 = load ptr, ptr %2, align 8
  %237 = getelementptr inbounds %struct.VM, ptr %236, i32 0, i32 2
  %238 = load i32, ptr %237, align 8
  %239 = add nsw i32 %238, 3
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i32, ptr %235, i64 %240
  %242 = load i32, ptr %241, align 4
  store i32 %242, ptr %4, align 4
  %243 = load ptr, ptr %2, align 8
  %244 = getelementptr inbounds %struct.VM, ptr %243, i32 0, i32 1
  %245 = load ptr, ptr %244, align 8
  %246 = load ptr, ptr %2, align 8
  %247 = getelementptr inbounds %struct.VM, ptr %246, i32 0, i32 2
  %248 = load i32, ptr %247, align 8
  %249 = add nsw i32 %248, 2
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i32, ptr %245, i64 %250
  %252 = load i32, ptr %251, align 4
  store i32 %252, ptr %5, align 4
  %253 = load ptr, ptr %2, align 8
  %254 = getelementptr inbounds %struct.VM, ptr %253, i32 0, i32 1
  %255 = load ptr, ptr %254, align 8
  %256 = load ptr, ptr %2, align 8
  %257 = getelementptr inbounds %struct.VM, ptr %256, i32 0, i32 2
  %258 = load i32, ptr %257, align 8
  %259 = add nsw i32 %258, 1
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i32, ptr %255, i64 %260
  %262 = load i32, ptr %261, align 4
  store i32 %262, ptr %6, align 4
  %263 = load ptr, ptr %2, align 8
  %264 = getelementptr inbounds %struct.VM, ptr %263, i32 0, i32 0
  %265 = load i32, ptr %4, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [16 x i32], ptr %264, i64 0, i64 %266
  %268 = load i32, ptr %267, align 4
  %269 = load ptr, ptr %2, align 8
  %270 = getelementptr inbounds %struct.VM, ptr %269, i32 0, i32 0
  %271 = load i32, ptr %5, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [16 x i32], ptr %270, i64 0, i64 %272
  %274 = load i32, ptr %273, align 4
  %275 = mul nsw i32 %268, %274
  %276 = load ptr, ptr %2, align 8
  %277 = getelementptr inbounds %struct.VM, ptr %276, i32 0, i32 0
  %278 = load i32, ptr %6, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [16 x i32], ptr %277, i64 0, i64 %279
  store i32 %275, ptr %280, align 4
  %281 = load ptr, ptr %2, align 8
  %282 = getelementptr inbounds %struct.VM, ptr %281, i32 0, i32 2
  br label %283

283:                                              ; preds = %232
  %284 = load i32, ptr %282, align 8
  %285 = add nsw i32 %284, 4
  store i32 %285, ptr %282, align 8
  br label %616

286:                                              ; preds = %229
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %287 = load i32, ptr %3, align 4
  br label %288

288:                                              ; preds = %286
  %289 = icmp eq i32 %287, 6
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x2000210023, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %289)
  br i1 %289, label %290, label %344

290:                                              ; preds = %288
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %291 = load ptr, ptr %2, align 8
  %292 = getelementptr inbounds %struct.VM, ptr %291, i32 0, i32 1
  %293 = load ptr, ptr %292, align 8
  %294 = load ptr, ptr %2, align 8
  %295 = getelementptr inbounds %struct.VM, ptr %294, i32 0, i32 2
  %296 = load i32, ptr %295, align 8
  %297 = add nsw i32 %296, 3
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds i32, ptr %293, i64 %298
  %300 = load i32, ptr %299, align 4
  store i32 %300, ptr %4, align 4
  %301 = load ptr, ptr %2, align 8
  %302 = getelementptr inbounds %struct.VM, ptr %301, i32 0, i32 1
  %303 = load ptr, ptr %302, align 8
  %304 = load ptr, ptr %2, align 8
  %305 = getelementptr inbounds %struct.VM, ptr %304, i32 0, i32 2
  %306 = load i32, ptr %305, align 8
  %307 = add nsw i32 %306, 2
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds i32, ptr %303, i64 %308
  %310 = load i32, ptr %309, align 4
  store i32 %310, ptr %5, align 4
  %311 = load ptr, ptr %2, align 8
  %312 = getelementptr inbounds %struct.VM, ptr %311, i32 0, i32 1
  %313 = load ptr, ptr %312, align 8
  %314 = load ptr, ptr %2, align 8
  %315 = getelementptr inbounds %struct.VM, ptr %314, i32 0, i32 2
  %316 = load i32, ptr %315, align 8
  %317 = add nsw i32 %316, 1
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i32, ptr %313, i64 %318
  %320 = load i32, ptr %319, align 4
  store i32 %320, ptr %6, align 4
  %321 = load ptr, ptr %2, align 8
  %322 = getelementptr inbounds %struct.VM, ptr %321, i32 0, i32 0
  %323 = load i32, ptr %4, align 4
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds [16 x i32], ptr %322, i64 0, i64 %324
  %326 = load i32, ptr %325, align 4
  %327 = load ptr, ptr %2, align 8
  %328 = getelementptr inbounds %struct.VM, ptr %327, i32 0, i32 0
  %329 = load i32, ptr %5, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [16 x i32], ptr %328, i64 0, i64 %330
  br label %332

332:                                              ; preds = %290
  %333 = load i32, ptr %331, align 4
  %334 = sdiv i32 %326, %333
  %335 = load ptr, ptr %2, align 8
  %336 = getelementptr inbounds %struct.VM, ptr %335, i32 0, i32 0
  %337 = load i32, ptr %6, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [16 x i32], ptr %336, i64 0, i64 %338
  store i32 %334, ptr %339, align 4
  %340 = load ptr, ptr %2, align 8
  %341 = getelementptr inbounds %struct.VM, ptr %340, i32 0, i32 2
  %342 = load i32, ptr %341, align 8
  %343 = add nsw i32 %342, 4
  store i32 %343, ptr %341, align 8
  br label %615

344:                                              ; preds = %288
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %345 = load i32, ptr %3, align 4
  %346 = icmp eq i32 %345, 7
  br label %347

347:                                              ; preds = %344
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x2400250027, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %346)
  br i1 %346, label %348, label %402

348:                                              ; preds = %347
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %349 = load ptr, ptr %2, align 8
  %350 = getelementptr inbounds %struct.VM, ptr %349, i32 0, i32 1
  %351 = load ptr, ptr %350, align 8
  %352 = load ptr, ptr %2, align 8
  %353 = getelementptr inbounds %struct.VM, ptr %352, i32 0, i32 2
  %354 = load i32, ptr %353, align 8
  %355 = add nsw i32 %354, 3
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i32, ptr %351, i64 %356
  %358 = load i32, ptr %357, align 4
  store i32 %358, ptr %4, align 4
  %359 = load ptr, ptr %2, align 8
  %360 = getelementptr inbounds %struct.VM, ptr %359, i32 0, i32 1
  %361 = load ptr, ptr %360, align 8
  %362 = load ptr, ptr %2, align 8
  %363 = getelementptr inbounds %struct.VM, ptr %362, i32 0, i32 2
  %364 = load i32, ptr %363, align 8
  %365 = add nsw i32 %364, 2
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds i32, ptr %361, i64 %366
  %368 = load i32, ptr %367, align 4
  store i32 %368, ptr %5, align 4
  %369 = load ptr, ptr %2, align 8
  %370 = getelementptr inbounds %struct.VM, ptr %369, i32 0, i32 1
  %371 = load ptr, ptr %370, align 8
  %372 = load ptr, ptr %2, align 8
  %373 = getelementptr inbounds %struct.VM, ptr %372, i32 0, i32 2
  %374 = load i32, ptr %373, align 8
  %375 = add nsw i32 %374, 1
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i32, ptr %371, i64 %376
  %378 = load i32, ptr %377, align 4
  store i32 %378, ptr %6, align 4
  %379 = load ptr, ptr %2, align 8
  br label %380

380:                                              ; preds = %348
  %381 = getelementptr inbounds %struct.VM, ptr %379, i32 0, i32 0
  %382 = load i32, ptr %4, align 4
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [16 x i32], ptr %381, i64 0, i64 %383
  %385 = load i32, ptr %384, align 4
  %386 = load ptr, ptr %2, align 8
  %387 = getelementptr inbounds %struct.VM, ptr %386, i32 0, i32 0
  %388 = load i32, ptr %5, align 4
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [16 x i32], ptr %387, i64 0, i64 %389
  %391 = load i32, ptr %390, align 4
  %392 = xor i32 %385, %391
  %393 = load ptr, ptr %2, align 8
  %394 = getelementptr inbounds %struct.VM, ptr %393, i32 0, i32 0
  %395 = load i32, ptr %6, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [16 x i32], ptr %394, i64 0, i64 %396
  store i32 %392, ptr %397, align 4
  %398 = load ptr, ptr %2, align 8
  %399 = getelementptr inbounds %struct.VM, ptr %398, i32 0, i32 2
  %400 = load i32, ptr %399, align 8
  %401 = add nsw i32 %400, 4
  store i32 %401, ptr %399, align 8
  br label %614

402:                                              ; preds = %347
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %403

403:                                              ; preds = %402
  %404 = load i32, ptr %3, align 4
  %405 = icmp eq i32 %404, 8
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x280029002b, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %405)
  br i1 %405, label %406, label %421

406:                                              ; preds = %403
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %407 = load ptr, ptr %2, align 8
  %408 = getelementptr inbounds %struct.VM, ptr %407, i32 0, i32 1
  %409 = load ptr, ptr %408, align 8
  %410 = load ptr, ptr %2, align 8
  %411 = getelementptr inbounds %struct.VM, ptr %410, i32 0, i32 2
  %412 = load i32, ptr %411, align 8
  %413 = add nsw i32 %412, 1
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i32, ptr %409, i64 %414
  %416 = load i32, ptr %415, align 4
  store i32 %416, ptr %7, align 4
  %417 = load i32, ptr %7, align 4
  %418 = load ptr, ptr %2, align 8
  br label %419

419:                                              ; preds = %406
  %420 = getelementptr inbounds %struct.VM, ptr %418, i32 0, i32 2
  store i32 %417, ptr %420, align 8
  br label %613

421:                                              ; preds = %403
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %422 = load i32, ptr %3, align 4
  %423 = icmp eq i32 %422, 9
  br label %424

424:                                              ; preds = %421
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x2c002d002f, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %423)
  br i1 %423, label %425, label %449

425:                                              ; preds = %424
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %426 = load ptr, ptr %2, align 8
  %427 = getelementptr inbounds %struct.VM, ptr %426, i32 0, i32 1
  %428 = load ptr, ptr %427, align 8
  %429 = load ptr, ptr %2, align 8
  %430 = getelementptr inbounds %struct.VM, ptr %429, i32 0, i32 2
  br label %431

431:                                              ; preds = %425
  %432 = load i32, ptr %430, align 8
  %433 = add nsw i32 %432, 1
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds i32, ptr %428, i64 %434
  %436 = load i32, ptr %435, align 4
  store i32 %436, ptr %8, align 4
  %437 = load ptr, ptr %2, align 8
  %438 = getelementptr inbounds %struct.VM, ptr %437, i32 0, i32 4
  %439 = load ptr, ptr %438, align 8
  %440 = load i32, ptr %8, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i8, ptr %439, i64 %441
  %443 = load ptr, ptr @stdin, align 8
  %444 = call ptr @fgets(ptr noundef %442, i32 noundef 256, ptr noundef %443)
  %445 = load ptr, ptr %2, align 8
  %446 = getelementptr inbounds %struct.VM, ptr %445, i32 0, i32 2
  %447 = load i32, ptr %446, align 8
  %448 = add nsw i32 %447, 2
  store i32 %448, ptr %446, align 8
  br label %612

449:                                              ; preds = %424
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %450 = load i32, ptr %3, align 4
  %451 = icmp eq i32 %450, 10
  br label %452

452:                                              ; preds = %449
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x3000310033, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %451)
  br i1 %451, label %453, label %495

453:                                              ; preds = %452
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %454 = load ptr, ptr %2, align 8
  %455 = getelementptr inbounds %struct.VM, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  %457 = load ptr, ptr %2, align 8
  %458 = getelementptr inbounds %struct.VM, ptr %457, i32 0, i32 2
  %459 = load i32, ptr %458, align 8
  %460 = add nsw i32 %459, 1
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i32, ptr %456, i64 %461
  %463 = load i32, ptr %462, align 4
  store i32 %463, ptr %4, align 4
  %464 = load ptr, ptr %2, align 8
  %465 = getelementptr inbounds %struct.VM, ptr %464, i32 0, i32 1
  br label %466

466:                                              ; preds = %453
  %467 = load ptr, ptr %465, align 8
  %468 = load ptr, ptr %2, align 8
  %469 = getelementptr inbounds %struct.VM, ptr %468, i32 0, i32 2
  %470 = load i32, ptr %469, align 8
  %471 = add nsw i32 %470, 2
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds i32, ptr %467, i64 %472
  %474 = load i32, ptr %473, align 4
  store i32 %474, ptr %5, align 4
  %475 = load ptr, ptr %2, align 8
  %476 = getelementptr inbounds %struct.VM, ptr %475, i32 0, i32 0
  %477 = load i32, ptr %4, align 4
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds [16 x i32], ptr %476, i64 0, i64 %478
  %480 = load i32, ptr %479, align 4
  %481 = load ptr, ptr %2, align 8
  %482 = getelementptr inbounds %struct.VM, ptr %481, i32 0, i32 0
  %483 = load i32, ptr %5, align 4
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds [16 x i32], ptr %482, i64 0, i64 %484
  %486 = load i32, ptr %485, align 4
  %487 = icmp eq i32 %480, %486
  %488 = zext i1 %487 to i32
  %489 = load ptr, ptr %2, align 8
  %490 = getelementptr inbounds %struct.VM, ptr %489, i32 0, i32 3
  store i32 %488, ptr %490, align 4
  %491 = load ptr, ptr %2, align 8
  %492 = getelementptr inbounds %struct.VM, ptr %491, i32 0, i32 2
  %493 = load i32, ptr %492, align 8
  %494 = add nsw i32 %493, 3
  store i32 %494, ptr %492, align 8
  br label %611

495:                                              ; preds = %452
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %496 = load i32, ptr %3, align 4
  br label %497

497:                                              ; preds = %495
  %498 = icmp eq i32 %496, 11
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x340035003c, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %498)
  br i1 %498, label %499, label %526

499:                                              ; preds = %497
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %500

500:                                              ; preds = %499
  %501 = load ptr, ptr %2, align 8
  %502 = getelementptr inbounds %struct.VM, ptr %501, i32 0, i32 3
  %503 = load i32, ptr %502, align 4
  %504 = icmp ne i32 %503, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x3600390037, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %504)
  br i1 %504, label %519, label %505

505:                                              ; preds = %500
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %506 = load ptr, ptr %2, align 8
  %507 = getelementptr inbounds %struct.VM, ptr %506, i32 0, i32 1
  %508 = load ptr, ptr %507, align 8
  %509 = load ptr, ptr %2, align 8
  %510 = getelementptr inbounds %struct.VM, ptr %509, i32 0, i32 2
  br label %511

511:                                              ; preds = %505
  %512 = load i32, ptr %510, align 8
  %513 = add nsw i32 %512, 1
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds i32, ptr %508, i64 %514
  %516 = load i32, ptr %515, align 4
  %517 = load ptr, ptr %2, align 8
  %518 = getelementptr inbounds %struct.VM, ptr %517, i32 0, i32 2
  store i32 %516, ptr %518, align 8
  br label %525

519:                                              ; preds = %500
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %520

520:                                              ; preds = %519
  %521 = load ptr, ptr %2, align 8
  %522 = getelementptr inbounds %struct.VM, ptr %521, i32 0, i32 2
  %523 = load i32, ptr %522, align 8
  %524 = add nsw i32 %523, 2
  store i32 %524, ptr %522, align 8
  br label %525

525:                                              ; preds = %520, %511
  br label %610

526:                                              ; preds = %497
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %527

527:                                              ; preds = %526
  %528 = load i32, ptr %3, align 4
  %529 = icmp eq i32 %528, 12
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x3d003e0040, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %529)
  br i1 %529, label %530, label %575

530:                                              ; preds = %527
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %531 = load ptr, ptr %2, align 8
  %532 = getelementptr inbounds %struct.VM, ptr %531, i32 0, i32 1
  %533 = load ptr, ptr %532, align 8
  %534 = load ptr, ptr %2, align 8
  %535 = getelementptr inbounds %struct.VM, ptr %534, i32 0, i32 2
  %536 = load i32, ptr %535, align 8
  %537 = add nsw i32 %536, 1
  %538 = sext i32 %537 to i64
  %539 = getelementptr inbounds i32, ptr %533, i64 %538
  %540 = load i32, ptr %539, align 4
  store i32 %540, ptr %4, align 4
  %541 = load ptr, ptr %2, align 8
  %542 = getelementptr inbounds %struct.VM, ptr %541, i32 0, i32 1
  %543 = load ptr, ptr %542, align 8
  %544 = load ptr, ptr %2, align 8
  %545 = getelementptr inbounds %struct.VM, ptr %544, i32 0, i32 2
  %546 = load i32, ptr %545, align 8
  %547 = add nsw i32 %546, 2
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds i32, ptr %543, i64 %548
  %550 = load i32, ptr %549, align 4
  store i32 %550, ptr %5, align 4
  %551 = load ptr, ptr %2, align 8
  %552 = getelementptr inbounds %struct.VM, ptr %551, i32 0, i32 0
  %553 = load i32, ptr %5, align 4
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds [16 x i32], ptr %552, i64 0, i64 %554
  %556 = load i32, ptr %555, align 4
  store i32 %556, ptr %8, align 4
  %557 = load ptr, ptr %2, align 8
  %558 = getelementptr inbounds %struct.VM, ptr %557, i32 0, i32 4
  %559 = load ptr, ptr %558, align 8
  %560 = load i32, ptr %8, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds i8, ptr %559, i64 %561
  %563 = load i8, ptr %562, align 1
  %564 = zext i8 %563 to i32
  %565 = load ptr, ptr %2, align 8
  %566 = getelementptr inbounds %struct.VM, ptr %565, i32 0, i32 0
  %567 = load i32, ptr %4, align 4
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds [16 x i32], ptr %566, i64 0, i64 %568
  store i32 %564, ptr %569, align 4
  %570 = load ptr, ptr %2, align 8
  %571 = getelementptr inbounds %struct.VM, ptr %570, i32 0, i32 2
  %572 = load i32, ptr %571, align 8
  %573 = add nsw i32 %572, 3
  br label %574

574:                                              ; preds = %530
  store i32 %573, ptr %571, align 8
  br label %609

575:                                              ; preds = %527
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %576 = load i32, ptr %3, align 4
  %577 = icmp eq i32 %576, 13
  br label %578

578:                                              ; preds = %575
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x410042004a, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %577)
  br i1 %577, label %579, label %604

579:                                              ; preds = %578
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %580 = load ptr, ptr %2, align 8
  %581 = getelementptr inbounds %struct.VM, ptr %580, i32 0, i32 1
  %582 = load ptr, ptr %581, align 8
  br label %583

583:                                              ; preds = %579
  %584 = load ptr, ptr %2, align 8
  %585 = getelementptr inbounds %struct.VM, ptr %584, i32 0, i32 2
  %586 = load i32, ptr %585, align 8
  %587 = add nsw i32 %586, 1
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds i32, ptr %582, i64 %588
  %590 = load i32, ptr %589, align 4
  %591 = icmp ne i32 %590, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x4300440046, %rax\0Axor %rbx, %rbx\0Amov $0, %bl\0Acall IndirectConditionalJumpFunc\0A", "r"(i1 %591)
  br i1 %591, label %592, label %595

592:                                              ; preds = %583
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %593 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %594

594:                                              ; preds = %592
  br label %598

595:                                              ; preds = %583
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %596

596:                                              ; preds = %595
  %597 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %598

598:                                              ; preds = %596, %594
  %599 = load ptr, ptr %2, align 8
  br label %600

600:                                              ; preds = %598
  %601 = getelementptr inbounds %struct.VM, ptr %599, i32 0, i32 2
  %602 = load i32, ptr %601, align 8
  %603 = add nsw i32 %602, 1
  store i32 %603, ptr %601, align 8
  br label %608

604:                                              ; preds = %578
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %605 = load i32, ptr %3, align 4
  %606 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %605)
  br label %607

607:                                              ; preds = %604
  call void @exit(i32 noundef 1) #8
  unreachable

608:                                              ; preds = %600
  br label %609

609:                                              ; preds = %608, %574
  br label %610

610:                                              ; preds = %609, %525
  br label %611

611:                                              ; preds = %610, %466
  br label %612

612:                                              ; preds = %611, %431
  br label %613

613:                                              ; preds = %612, %419
  br label %614

614:                                              ; preds = %613, %380
  br label %615

615:                                              ; preds = %614, %332
  br label %616

616:                                              ; preds = %615, %283
  br label %617

617:                                              ; preds = %616, %223
  br label %618

618:                                              ; preds = %617, %146
  br label %619

619:                                              ; preds = %618, %101
  br label %620

620:                                              ; preds = %619, %68
  br label %621

621:                                              ; preds = %620, %34
  br label %14, !llvm.loop !6

622:                                              ; preds = %18
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
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
  br label %3

3:                                                ; preds = %0
  store ptr %2, ptr %1, align 8
  br label %4

4:                                                ; preds = %3
  %5 = load ptr, ptr %1, align 8
  call void @run_vm(ptr noundef %5)
  br label %6

6:                                                ; preds = %4
  ret i32 0
}

; Function Attrs: naked
define void @IndirectCallFunc() #6 {
  %1 = call i64 asm sideeffect "mov %rax, $0", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 16
  %5 = trunc i64 %4 to i16
  %6 = getelementptr [2 x [92 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %7 = getelementptr [92 x ptr], ptr %6, i32 0, i16 %5
  %8 = load ptr, ptr %7, align 8
  call void asm sideeffect "push $0", "r"(ptr %8)
  ret void
}

define void @IndirectConditionalJumpFunc() {
  %1 = call i64 asm sideeffect "mov %rax, $0", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 16
  %5 = trunc i64 %4 to i16
  %6 = trunc i64 %1 to i16
  %7 = call i64 asm sideeffect "mov %rbx, $0", "=r"()
  %8 = getelementptr [2 x [92 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %9 = getelementptr [92 x ptr], ptr %8, i32 0, i16 %5
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr [2 x [92 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %12 = getelementptr [92 x ptr], ptr %11, i32 0, i16 %6
  %13 = load ptr, ptr %12, align 8
  %14 = icmp eq i64 %7, 1
  %15 = select i1 %14, ptr %10, ptr %13
  call void asm sideeffect "push $0", "r"(ptr %15)
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
