; ModuleID = 'quick_pow.c'
source_filename = "quick_pow.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @quick_pow(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %6, align 4
  %10 = urem i32 %8, %9
  store i32 %10, ptr %4, align 4
  br label %11

11:                                               ; preds = %24, %3
  %12 = load i32, ptr %5, align 4
  %13 = icmp ugt i32 %12, 0
  br i1 %13, label %14, label %32

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = urem i32 %15, 2
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %24

18:                                               ; preds = %14
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = mul i32 %19, %20
  %22 = load i32, ptr %6, align 4
  %23 = urem i32 %21, %22
  store i32 %23, ptr %7, align 4
  br label %24

24:                                               ; preds = %18, %14
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %4, align 4
  %27 = mul i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = urem i32 %27, %28
  store i32 %29, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = udiv i32 %30, 2
  store i32 %31, ptr %5, align 4
  br label %11, !llvm.loop !6

32:                                               ; preds = %11
  %33 = load i32, ptr %7, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i64 2, ptr %2, align 8
  store i64 10, ptr %3, align 8
  store i64 987654321, ptr %4, align 8
  store i32 1000000, ptr %5, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
