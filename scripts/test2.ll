; ModuleID = '../tests/test2.c'
source_filename = "../tests/test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"Node 1: a is greater than 0\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Adding %d to sum, current sum: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Node 2: Sum is greater than 10\0A\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c"Node 3: Sum is less than or equal to 10\0A\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"Node 4: a is not greater than 0\0A\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"The result of the calculation is: %d\0A\00", align 1
@AllFunctions_IndirectBrTargets = private global [1 x [11 x ptr]] [[11 x ptr] [ptr blockaddress(@main, %11), ptr blockaddress(@main, %13), ptr blockaddress(@main, %17), ptr blockaddress(@main, %24), ptr blockaddress(@main, %27), ptr blockaddress(@main, %30), ptr blockaddress(@main, %32), ptr blockaddress(@main, %34), ptr blockaddress(@main, %35), ptr blockaddress(@main, %37), ptr null]]
@llvm.compiler.used = appending global [1 x ptr] [ptr @AllFunctions_IndirectBrTargets], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 4, ptr %3, align 4
  store i32 2, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  store i32 %8, ptr %2, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 8, i1 %10)
  br i1 %10, label %11, label %35

11:                                               ; preds = %0
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 1, ptr %6, align 4
  br label %13

13:                                               ; preds = %24, %11
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp sle i32 %14, %15
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 4295098372, i1 %16)
  br i1 %16, label %17, label %27

17:                                               ; preds = %13
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %21, i32 noundef %22)
  br label %24

24:                                               ; preds = %17
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %6, align 4
  br label %13, !llvm.loop !6

27:                                               ; preds = %13
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %28 = load i32, ptr %5, align 4
  %29 = icmp sgt i32 %28, 10
  call void asm sideeffect "push %rax\0Apush %rbx\0Amov %rax, $0\0Axor %rbx, %rbx\0Amov %bl, $1\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 17180196870, i1 %29)
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %34

32:                                               ; preds = %27
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %34

34:                                               ; preds = %32, %30
  br label %37

35:                                               ; preds = %0
  call void asm sideeffect "pop %rax\0Apop %rbx\0Apop %rax\0A", ""()
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %37

37:                                               ; preds = %35, %34
  %38 = load i32, ptr %2, align 4
  %39 = load i32, ptr %4, align 4
  %40 = call i32 @calculateSum(i32 noundef %38, i32 noundef %39)
  store i32 %40, ptr %7, align 4
  %41 = load i32, ptr %7, align 4
  call void @printResult(i32 noundef %41)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calculateSum(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printResult(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %3)
  ret void
}

; Function Attrs: naked
define void @IndirectCallFunc() #2 {
  %1 = call i64 asm sideeffect "mov $0, %rax", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 32
  %5 = trunc i64 %4 to i16
  %6 = getelementptr [1 x [11 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %7 = getelementptr [11 x ptr], ptr %6, i32 0, i16 %5
  %8 = load ptr, ptr %7, align 8
  call void asm sideeffect "push $0", "r"(ptr %8)
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
  %8 = getelementptr [1 x [11 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %9 = getelementptr [11 x ptr], ptr %8, i32 0, i16 %5
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr [1 x [11 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %12 = getelementptr [11 x ptr], ptr %11, i32 0, i16 %6
  %13 = load ptr, ptr %12, align 8
  %14 = icmp eq i64 %7, 1
  %15 = select i1 %14, ptr %10, ptr %13
  call void asm sideeffect "push $0", "r"(ptr %15)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { naked }

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
