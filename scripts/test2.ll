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
@AllFunctions_IndirectBrTargets = private global [1 x [28 x ptr]] [[28 x ptr] [ptr blockaddress(@main, %8), ptr blockaddress(@main, %9), ptr blockaddress(@main, %12), ptr blockaddress(@main, %14), ptr blockaddress(@main, %16), ptr blockaddress(@main, %17), ptr blockaddress(@main, %18), ptr blockaddress(@main, %21), ptr blockaddress(@main, %23), ptr blockaddress(@main, %24), ptr blockaddress(@main, %26), ptr blockaddress(@main, %29), ptr blockaddress(@main, %33), ptr blockaddress(@main, %35), ptr blockaddress(@main, %37), ptr blockaddress(@main, %38), ptr blockaddress(@main, %40), ptr blockaddress(@main, %42), ptr blockaddress(@main, %43), ptr blockaddress(@main, %45), ptr blockaddress(@main, %46), ptr blockaddress(@main, %48), ptr blockaddress(@main, %49), ptr blockaddress(@main, %50), ptr blockaddress(@main, %51), ptr blockaddress(@main, %53), ptr blockaddress(@main, %57), ptr null]]
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
  br label %8

8:                                                ; preds = %0
  store i32 4, ptr %3, align 4
  br label %9

9:                                                ; preds = %8
  store i32 2, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  br label %12

12:                                               ; preds = %9
  %13 = icmp sgt i32 %11, 0
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x200030017, %rax\0Axor %rbx, %rbx\0Amov $1, %bl\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 8590131223, i1 %13)
  br i1 %13, label %14, label %50

14:                                               ; preds = %12
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %16

16:                                               ; preds = %14
  store i32 1, ptr %6, align 4
  br label %17

17:                                               ; preds = %16
  br label %18

18:                                               ; preds = %37, %17
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %2, align 4
  br label %21

21:                                               ; preds = %18
  %22 = icmp sle i32 %19, %20
  br label %23

23:                                               ; preds = %21
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x80009000f, %rax\0Axor %rbx, %rbx\0Amov $1, %bl\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 34360328207, i1 %22)
  br i1 %22, label %24, label %38

24:                                               ; preds = %23
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %25 = load i32, ptr %6, align 4
  br label %26

26:                                               ; preds = %24
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, %25
  store i32 %28, ptr %5, align 4
  br label %29

29:                                               ; preds = %26
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %30, i32 noundef %31)
  br label %33

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  br label %35

35:                                               ; preds = %33
  %36 = add nsw i32 %34, 1
  br label %37

37:                                               ; preds = %35
  store i32 %36, ptr %6, align 4
  br label %18, !llvm.loop !6

38:                                               ; preds = %23
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %39 = load i32, ptr %5, align 4
  br label %40

40:                                               ; preds = %38
  %41 = icmp sgt i32 %39, 10
  br label %42

42:                                               ; preds = %40
  call void asm sideeffect "push %rax\0Apush %rbx\0Apush %rcx\0Apush %rdx\0Amov $$0x1100120014, %rax\0Axor %rbx, %rbx\0Amov $1, %bl\0Acall IndirectConditionalJumpFunc\0A", "r, r"(i64 73015623700, i1 %41)
  br i1 %41, label %43, label %46

43:                                               ; preds = %42
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %45

45:                                               ; preds = %43
  br label %49

46:                                               ; preds = %42
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %48

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %48, %45
  br label %53

50:                                               ; preds = %12
  call void asm sideeffect "pop %rax\0Apop %rdx\0Apop %rcx\0Apop %rbx\0Apop %rax\0A", ""()
  br label %51

51:                                               ; preds = %50
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %53

53:                                               ; preds = %51, %49
  %54 = load i32, ptr %2, align 4
  %55 = load i32, ptr %4, align 4
  %56 = call i32 @calculateSum(i32 noundef %54, i32 noundef %55)
  br label %57

57:                                               ; preds = %53
  store i32 %56, ptr %7, align 4
  %58 = load i32, ptr %7, align 4
  call void @printResult(i32 noundef %58)
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
  %1 = call i64 asm sideeffect "mov %rax, $0", "=r"()
  %2 = lshr i64 %1, 48
  %3 = trunc i64 %2 to i16
  %4 = lshr i64 %1, 16
  %5 = trunc i64 %4 to i16
  %6 = getelementptr [1 x [28 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %7 = getelementptr [28 x ptr], ptr %6, i32 0, i16 %5
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
  %8 = getelementptr [1 x [28 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %9 = getelementptr [28 x ptr], ptr %8, i32 0, i16 %5
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr [1 x [28 x ptr]], ptr @AllFunctions_IndirectBrTargets, i32 0, i16 %3
  %12 = getelementptr [28 x ptr], ptr %11, i32 0, i16 %6
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
