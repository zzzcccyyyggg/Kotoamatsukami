; ModuleID = '_optimized.ll'
source_filename = "vm.c"
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @new_vm(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
new_entry:
  %.reg2mem8 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca ptr, align 8
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i64, align 8
  %outerLoopVar = alloca i32, align 4
  store i32 1, ptr %outerLoopVar, align 4
  %innerLoopVar = alloca i32, align 4
  store i32 0, ptr %innerLoopVar, align 4
  %quick_pow_mod = alloca i32, align 4
  store i32 123456789, ptr %quick_pow_mod, align 4
  %quick_pow_result = alloca i32, align 4
  store i32 0, ptr %quick_pow_result, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  %7 = call noalias ptr @malloc(i64 noundef 88) #6
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = getelementptr inbounds %struct.VM, ptr %9, i32 0, i32 1
  store ptr %8, ptr %10, align 8
  br label %outer.loop.cond

11:                                               ; No predecessors!
  br label %.split

.split:                                           ; preds = %inner.loop.body, %11
  store i32 2, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds %struct.VM, ptr %12, i32 0, i32 2
  store i32 0, ptr %13, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.VM, ptr %14, i32 0, i32 3
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 4, %17
  store i64 %18, ptr %.reg2mem, align 8
  br label %inner.loop.end

.split.split:                                     ; preds = %inner.loop.body
  store i32 4, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload = load volatile i64, ptr %.reg2mem, align 8
  %19 = call noalias ptr @malloc(i64 noundef %.reload) #6
  store ptr %19, ptr %.reg2mem1, align 8
  %20 = load ptr, ptr %6, align 8
  store ptr %20, ptr %.reg2mem3, align 8
  br label %inner.loop.end

.split.split.split:                               ; preds = %inner.loop.body
  %.reload4 = load volatile ptr, ptr %.reg2mem3, align 8
  %21 = getelementptr inbounds %struct.VM, ptr %.reload4, i32 0, i32 4
  %.reload2 = load volatile ptr, ptr %.reg2mem1, align 8
  store ptr %.reload2, ptr %21, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.VM, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %24, i8 0, i64 %26, i1 false)
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.VM, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds i8, ptr %29, i64 128
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %30, ptr align 16 @cmps, i64 34, i1 false)
  %31 = load ptr, ptr %6, align 8
  ret ptr %31

outer.loop.cond:                                  ; preds = %inner.loop.end, %new_entry
  %32 = load i32, ptr %outerLoopVar, align 4
  store i32 %32, ptr %.reg2mem5, align 4
  %.reload7 = load volatile i32, ptr %.reg2mem5, align 4
  %33 = icmp ult i32 %.reload7, 123456789
  br i1 %33, label %outer.loop.body, label %outer.loop.end

outer.loop.body:                                  ; preds = %outer.loop.cond
  %.reload6 = load volatile i32, ptr %.reg2mem5, align 4
  %34 = add i32 %.reload6, 1
  store i32 %34, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %inner.loop.cond

outer.loop.end:                                   ; preds = %outer.loop.end, %outer.loop.cond
  store i32 2, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %outer.loop.end

inner.loop.cond:                                  ; preds = %inner.loop.body, %outer.loop.body
  %35 = load i32, ptr %innerLoopVar, align 4
  store i32 %35, ptr %.reg2mem8, align 4
  %.reload10 = load volatile i32, ptr %.reg2mem8, align 4
  %36 = icmp ult i32 %.reload10, 4
  br i1 %36, label %inner.loop.body, label %inner.loop.end

inner.loop.body:                                  ; preds = %inner.loop.cond
  %.reload9 = load volatile i32, ptr %.reg2mem8, align 4
  %37 = add i32 %.reload9, 1
  store i32 %37, ptr %innerLoopVar, align 4
  %38 = load i32, ptr %outerLoopVar, align 4
  %39 = load i32, ptr %innerLoopVar, align 4
  %40 = load i32, ptr %quick_pow_mod, align 4
  %41 = call i32 @quick_pow(i32 %38, i32 %39, i32 %40)
  switch i32 %41, label %inner.loop.cond [
    i32 2, label %.split
    i32 3, label %.split.split
    i32 5, label %.split.split.split
  ]

inner.loop.end:                                   ; preds = %.split.split, %.split, %inner.loop.cond
  br label %outer.loop.cond
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @run_vm(ptr noundef %0) #0 {
new_entry:
  %.reg2mem126 = alloca i32, align 4
  %.reg2mem123 = alloca i32, align 4
  %.reg2mem120 = alloca ptr, align 8
  %.reg2mem118 = alloca ptr, align 8
  %.reg2mem115 = alloca i1, align 1
  %.reg2mem113 = alloca ptr, align 8
  %.reg2mem111 = alloca i32, align 4
  %.reg2mem109 = alloca ptr, align 8
  %.reg2mem107 = alloca i64, align 8
  %.reg2mem105 = alloca ptr, align 8
  %.reg2mem103 = alloca i32, align 4
  %.reg2mem100 = alloca ptr, align 8
  %.reg2mem98 = alloca ptr, align 8
  %.reg2mem96 = alloca ptr, align 8
  %.reg2mem93 = alloca i1, align 1
  %.reg2mem91 = alloca ptr, align 8
  %.reg2mem89 = alloca ptr, align 8
  %.reg2mem87 = alloca ptr, align 8
  %.reg2mem85 = alloca ptr, align 8
  %.reg2mem83 = alloca ptr, align 8
  %.reg2mem81 = alloca ptr, align 8
  %.reg2mem79 = alloca ptr, align 8
  %.reg2mem77 = alloca i32, align 4
  %.reg2mem75 = alloca ptr, align 8
  %.reg2mem73 = alloca i32, align 4
  %.reg2mem71 = alloca ptr, align 8
  %.reg2mem69 = alloca i32, align 4
  %.reg2mem67 = alloca i32, align 4
  %.reg2mem65 = alloca i64, align 8
  %.reg2mem63 = alloca ptr, align 8
  %.reg2mem61 = alloca i32, align 4
  %.reg2mem59 = alloca ptr, align 8
  %.reg2mem57 = alloca ptr, align 8
  %.reg2mem55 = alloca i32, align 4
  %.reg2mem53 = alloca i32, align 4
  %.reg2mem51 = alloca ptr, align 8
  %.reg2mem48 = alloca ptr, align 8
  %.reg2mem46 = alloca i64, align 8
  %.reg2mem44 = alloca ptr, align 8
  %.reg2mem42 = alloca i32, align 4
  %.reg2mem40 = alloca ptr, align 8
  %.reg2mem38 = alloca ptr, align 8
  %.reg2mem36 = alloca ptr, align 8
  %.reg2mem34 = alloca ptr, align 8
  %.reg2mem19 = alloca i32, align 4
  %.reg2mem17 = alloca ptr, align 8
  %.reg2mem15 = alloca ptr, align 8
  %.reg2mem13 = alloca i32, align 4
  %.reg2mem9 = alloca ptr, align 8
  %.reg2mem4 = alloca ptr, align 8
  %.reg2mem = alloca ptr, align 8
  %outerLoopVar = alloca i32, align 4
  store i32 1, ptr %outerLoopVar, align 4
  %innerLoopVar = alloca i32, align 4
  store i32 0, ptr %innerLoopVar, align 4
  %quick_pow_mod = alloca i32, align 4
  store i32 123456789, ptr %quick_pow_mod, align 4
  %quick_pow_result = alloca i32, align 4
  store i32 0, ptr %quick_pow_result, align 4
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %outer.loop.cond

6:                                                ; No predecessors!
  br label %.split

.split:                                           ; preds = %inner.loop.body, %6
  store i32 2, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %7 = alloca i32, align 4
  store ptr %7, ptr %.reg2mem, align 8
  %8 = alloca i32, align 4
  store ptr %8, ptr %.reg2mem4, align 8
  br label %inner.loop.end

.split.split:                                     ; preds = %inner.loop.body
  store i32 4, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %9 = alloca i32, align 4
  store ptr %9, ptr %.reg2mem9, align 8
  store ptr %0, ptr %1, align 8
  %.reload12 = load volatile ptr, ptr %.reg2mem9, align 8
  store i32 1, ptr %.reload12, align 4
  br label %inner.loop.end

.split.split.split:                               ; preds = %inner.loop.body
  store i32 7, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %inner.loop.end

11:                                               ; preds = %inner.loop.body
  store i32 10, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  br label %inner.loop.end

.split1:                                          ; preds = %inner.loop.body
  store i32 11, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload11 = load volatile ptr, ptr %.reg2mem9, align 8
  %12 = load i32, ptr %.reload11, align 4
  store i32 %12, ptr %.reg2mem13, align 4
  br label %inner.loop.end

.split1.split:                                    ; preds = %inner.loop.body
  %.reload14 = load volatile i32, ptr %.reg2mem13, align 4
  %13 = icmp ne i32 %.reload14, 0
  %14 = select i1 %13, i32 12, i32 173
  %15 = select i1 %13, i32 1, i32 1
  store i32 %14, ptr %outerLoopVar, align 4
  store i32 %15, ptr %innerLoopVar, align 4
  br label %inner.loop.end

16:                                               ; preds = %inner.loop.body
  store i32 13, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %17 = load ptr, ptr %1, align 8
  %18 = getelementptr inbounds %struct.VM, ptr %17, i32 0, i32 1
  store ptr %18, ptr %.reg2mem15, align 8
  br label %inner.loop.end

.split2:                                          ; preds = %inner.loop.body
  store i32 17, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload16 = load volatile ptr, ptr %.reg2mem15, align 8
  %19 = load ptr, ptr %.reload16, align 8
  store ptr %19, ptr %.reg2mem17, align 8
  br label %inner.loop.end

.split2.split:                                    ; preds = %inner.loop.body
  %20 = load ptr, ptr %1, align 8
  %21 = getelementptr inbounds %struct.VM, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = sext i32 %22 to i64
  %.reload18 = load volatile ptr, ptr %.reg2mem17, align 8
  %24 = getelementptr inbounds i32, ptr %.reload18, i64 %23
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %2, align 4
  %26 = load i32, ptr %2, align 4
  store i32 %26, ptr %.reg2mem19, align 4
  %.reload33 = load volatile i32, ptr %.reg2mem19, align 4
  %27 = icmp eq i32 %.reload33, 0
  %28 = select i1 %27, i32 45, i32 19
  %29 = select i1 %27, i32 2, i32 1
  store i32 %28, ptr %outerLoopVar, align 4
  store i32 %29, ptr %innerLoopVar, align 4
  br label %inner.loop.end

30:                                               ; preds = %inner.loop.body
  %.reload32 = load volatile i32, ptr %.reg2mem19, align 4
  %31 = icmp eq i32 %.reload32, 1
  %32 = select i1 %31, i32 47, i32 20
  %33 = select i1 %31, i32 1, i32 1
  store i32 %32, ptr %outerLoopVar, align 4
  store i32 %33, ptr %innerLoopVar, align 4
  br label %inner.loop.end

34:                                               ; preds = %inner.loop.body
  %.reload31 = load volatile i32, ptr %.reg2mem19, align 4
  %35 = icmp eq i32 %.reload31, 2
  %36 = select i1 %35, i32 51, i32 26
  %37 = select i1 %35, i32 1, i32 1
  store i32 %36, ptr %outerLoopVar, align 4
  store i32 %37, ptr %innerLoopVar, align 4
  br label %inner.loop.end

38:                                               ; preds = %inner.loop.body
  %.reload30 = load volatile i32, ptr %.reg2mem19, align 4
  %39 = icmp eq i32 %.reload30, 3
  %40 = select i1 %39, i32 65, i32 29
  %41 = select i1 %39, i32 1, i32 1
  store i32 %40, ptr %outerLoopVar, align 4
  store i32 %41, ptr %innerLoopVar, align 4
  br label %inner.loop.end

42:                                               ; preds = %inner.loop.body
  %.reload29 = load volatile i32, ptr %.reg2mem19, align 4
  %43 = icmp eq i32 %.reload29, 4
  %44 = select i1 %43, i32 71, i32 30
  %45 = select i1 %43, i32 1, i32 1
  store i32 %44, ptr %outerLoopVar, align 4
  store i32 %45, ptr %innerLoopVar, align 4
  br label %inner.loop.end

46:                                               ; preds = %inner.loop.body
  %.reload28 = load volatile i32, ptr %.reg2mem19, align 4
  %47 = icmp eq i32 %.reload28, 5
  %48 = select i1 %47, i32 76, i32 31
  %49 = select i1 %47, i32 2, i32 1
  store i32 %48, ptr %outerLoopVar, align 4
  store i32 %49, ptr %innerLoopVar, align 4
  br label %inner.loop.end

50:                                               ; preds = %inner.loop.body
  %.reload27 = load volatile i32, ptr %.reg2mem19, align 4
  %51 = icmp eq i32 %.reload27, 6
  %52 = select i1 %51, i32 83, i32 33
  %53 = select i1 %51, i32 3, i32 1
  store i32 %52, ptr %outerLoopVar, align 4
  store i32 %53, ptr %innerLoopVar, align 4
  br label %inner.loop.end

54:                                               ; preds = %inner.loop.body
  %.reload26 = load volatile i32, ptr %.reg2mem19, align 4
  %55 = icmp eq i32 %.reload26, 7
  %56 = select i1 %55, i32 90, i32 34
  %57 = select i1 %55, i32 3, i32 2
  store i32 %56, ptr %outerLoopVar, align 4
  store i32 %57, ptr %innerLoopVar, align 4
  br label %inner.loop.end

58:                                               ; preds = %inner.loop.body
  %.reload25 = load volatile i32, ptr %.reg2mem19, align 4
  %59 = icmp eq i32 %.reload25, 8
  %60 = select i1 %59, i32 96, i32 36
  %61 = select i1 %59, i32 1, i32 3
  store i32 %60, ptr %outerLoopVar, align 4
  store i32 %61, ptr %innerLoopVar, align 4
  br label %inner.loop.end

62:                                               ; preds = %inner.loop.body
  %.reload24 = load volatile i32, ptr %.reg2mem19, align 4
  %63 = icmp eq i32 %.reload24, 9
  %64 = select i1 %63, i32 102, i32 37
  %65 = select i1 %63, i32 3, i32 1
  store i32 %64, ptr %outerLoopVar, align 4
  store i32 %65, ptr %innerLoopVar, align 4
  br label %inner.loop.end

66:                                               ; preds = %inner.loop.body
  %.reload23 = load volatile i32, ptr %.reg2mem19, align 4
  %67 = icmp eq i32 %.reload23, 10
  %68 = select i1 %67, i32 109, i32 40
  %69 = select i1 %67, i32 1, i32 3
  store i32 %68, ptr %outerLoopVar, align 4
  store i32 %69, ptr %innerLoopVar, align 4
  br label %inner.loop.end

70:                                               ; preds = %inner.loop.body
  %.reload22 = load volatile i32, ptr %.reg2mem19, align 4
  %71 = icmp eq i32 %.reload22, 11
  %72 = select i1 %71, i32 115, i32 42
  %73 = select i1 %71, i32 2, i32 1
  store i32 %72, ptr %outerLoopVar, align 4
  store i32 %73, ptr %innerLoopVar, align 4
  br label %inner.loop.end

74:                                               ; preds = %inner.loop.body
  %.reload21 = load volatile i32, ptr %.reg2mem19, align 4
  %75 = icmp eq i32 %.reload21, 12
  %76 = select i1 %75, i32 139, i32 43
  %77 = select i1 %75, i32 1, i32 1
  store i32 %76, ptr %outerLoopVar, align 4
  store i32 %77, ptr %innerLoopVar, align 4
  br label %inner.loop.end

78:                                               ; preds = %inner.loop.body
  %.reload20 = load volatile i32, ptr %.reg2mem19, align 4
  %79 = icmp eq i32 %.reload20, 13
  %80 = select i1 %79, i32 147, i32 44
  %81 = select i1 %79, i32 3, i32 3
  store i32 %80, ptr %outerLoopVar, align 4
  store i32 %81, ptr %innerLoopVar, align 4
  br label %inner.loop.end

82:                                               ; preds = %inner.loop.body
  store i32 164, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  br label %inner.loop.end

83:                                               ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload10 = load volatile ptr, ptr %.reg2mem9, align 8
  store i32 0, ptr %.reload10, align 4
  br label %inner.loop.end

84:                                               ; preds = %inner.loop.body
  store i32 49, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %85 = load ptr, ptr %1, align 8
  %86 = getelementptr inbounds %struct.VM, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  store ptr %87, ptr %.reg2mem34, align 8
  %88 = load ptr, ptr %1, align 8
  store ptr %88, ptr %.reg2mem36, align 8
  br label %inner.loop.end

.split3:                                          ; preds = %inner.loop.body
  store i32 50, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload37 = load volatile ptr, ptr %.reg2mem36, align 8
  %89 = getelementptr inbounds %struct.VM, ptr %.reload37, i32 0, i32 2
  %90 = load i32, ptr %89, align 8
  %91 = add nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %.reload35 = load volatile ptr, ptr %.reg2mem34, align 8
  %93 = getelementptr inbounds i32, ptr %.reload35, i64 %92
  %94 = load i32, ptr %93, align 4
  store i32 %94, ptr %3, align 4
  %95 = load ptr, ptr %1, align 8
  %96 = getelementptr inbounds %struct.VM, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = load ptr, ptr %1, align 8
  %99 = getelementptr inbounds %struct.VM, ptr %98, i32 0, i32 2
  %100 = load i32, ptr %99, align 8
  %101 = add nsw i32 %100, 2
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, ptr %97, i64 %102
  store ptr %103, ptr %.reg2mem38, align 8
  br label %inner.loop.end

.split3.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload39 = load volatile ptr, ptr %.reg2mem38, align 8
  %104 = load i32, ptr %.reload39, align 4
  %.reload3 = load volatile ptr, ptr %.reg2mem, align 8
  store i32 %104, ptr %.reload3, align 4
  %.reload2 = load volatile ptr, ptr %.reg2mem, align 8
  %105 = load i32, ptr %.reload2, align 4
  %106 = load ptr, ptr %1, align 8
  %107 = getelementptr inbounds %struct.VM, ptr %106, i32 0, i32 0
  %108 = load i32, ptr %3, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [16 x i32], ptr %107, i64 0, i64 %109
  store i32 %105, ptr %110, align 4
  %111 = load ptr, ptr %1, align 8
  %112 = getelementptr inbounds %struct.VM, ptr %111, i32 0, i32 2
  %113 = load i32, ptr %112, align 8
  %114 = add nsw i32 %113, 3
  store i32 %114, ptr %112, align 8
  br label %inner.loop.end

115:                                              ; preds = %inner.loop.body
  store i32 55, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %116 = load ptr, ptr %1, align 8
  %117 = getelementptr inbounds %struct.VM, ptr %116, i32 0, i32 1
  %118 = load ptr, ptr %117, align 8
  store ptr %118, ptr %.reg2mem40, align 8
  br label %inner.loop.end

.split4:                                          ; preds = %inner.loop.body
  store i32 56, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %119 = load ptr, ptr %1, align 8
  %120 = getelementptr inbounds %struct.VM, ptr %119, i32 0, i32 2
  %121 = load i32, ptr %120, align 8
  store i32 %121, ptr %.reg2mem42, align 4
  br label %inner.loop.end

.split4.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload43 = load volatile i32, ptr %.reg2mem42, align 4
  %122 = add nsw i32 %.reload43, 1
  %123 = sext i32 %122 to i64
  %.reload41 = load volatile ptr, ptr %.reg2mem40, align 8
  %124 = getelementptr inbounds i32, ptr %.reload41, i64 %123
  %125 = load i32, ptr %124, align 4
  store i32 %125, ptr %3, align 4
  %126 = load ptr, ptr %1, align 8
  %127 = getelementptr inbounds %struct.VM, ptr %126, i32 0, i32 1
  %128 = load ptr, ptr %127, align 8
  %129 = load ptr, ptr %1, align 8
  %130 = getelementptr inbounds %struct.VM, ptr %129, i32 0, i32 2
  %131 = load i32, ptr %130, align 8
  %132 = add nsw i32 %131, 2
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, ptr %128, i64 %133
  %135 = load i32, ptr %134, align 4
  store i32 %135, ptr %4, align 4
  %136 = load ptr, ptr %1, align 8
  %137 = getelementptr inbounds %struct.VM, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %3, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [16 x i32], ptr %137, i64 0, i64 %139
  %141 = load i32, ptr %140, align 4
  %142 = load ptr, ptr %1, align 8
  %143 = getelementptr inbounds %struct.VM, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %4, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [16 x i32], ptr %143, i64 0, i64 %145
  store i32 %141, ptr %146, align 4
  %147 = load ptr, ptr %1, align 8
  %148 = getelementptr inbounds %struct.VM, ptr %147, i32 0, i32 2
  %149 = load i32, ptr %148, align 8
  %150 = add nsw i32 %149, 3
  store i32 %150, ptr %148, align 8
  br label %inner.loop.end

151:                                              ; preds = %inner.loop.body
  store i32 68, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %152 = load ptr, ptr %1, align 8
  %153 = getelementptr inbounds %struct.VM, ptr %152, i32 0, i32 1
  %154 = load ptr, ptr %153, align 8
  %155 = load ptr, ptr %1, align 8
  %156 = getelementptr inbounds %struct.VM, ptr %155, i32 0, i32 2
  %157 = load i32, ptr %156, align 8
  %158 = add nsw i32 %157, 3
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %154, i64 %159
  %161 = load i32, ptr %160, align 4
  store i32 %161, ptr %3, align 4
  %162 = load ptr, ptr %1, align 8
  %163 = getelementptr inbounds %struct.VM, ptr %162, i32 0, i32 1
  %164 = load ptr, ptr %163, align 8
  %165 = load ptr, ptr %1, align 8
  %166 = getelementptr inbounds %struct.VM, ptr %165, i32 0, i32 2
  %167 = load i32, ptr %166, align 8
  %168 = add nsw i32 %167, 2
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i32, ptr %164, i64 %169
  %171 = load i32, ptr %170, align 4
  store i32 %171, ptr %4, align 4
  %172 = load ptr, ptr %1, align 8
  %173 = getelementptr inbounds %struct.VM, ptr %172, i32 0, i32 1
  %174 = load ptr, ptr %173, align 8
  store ptr %174, ptr %.reg2mem44, align 8
  %175 = load ptr, ptr %1, align 8
  %176 = getelementptr inbounds %struct.VM, ptr %175, i32 0, i32 2
  %177 = load i32, ptr %176, align 8
  %178 = add nsw i32 %177, 1
  %179 = sext i32 %178 to i64
  store i64 %179, ptr %.reg2mem46, align 8
  br label %inner.loop.end

.split5:                                          ; preds = %inner.loop.body
  store i32 70, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload45 = load volatile ptr, ptr %.reg2mem44, align 8
  %.reload47 = load volatile i64, ptr %.reg2mem46, align 8
  %180 = getelementptr inbounds i32, ptr %.reload45, i64 %.reload47
  %181 = load i32, ptr %180, align 4
  store i32 %181, ptr %5, align 4
  %182 = load ptr, ptr %1, align 8
  %183 = getelementptr inbounds %struct.VM, ptr %182, i32 0, i32 0
  %184 = load i32, ptr %3, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [16 x i32], ptr %183, i64 0, i64 %185
  %187 = load i32, ptr %186, align 4
  %188 = load ptr, ptr %1, align 8
  %189 = getelementptr inbounds %struct.VM, ptr %188, i32 0, i32 0
  %190 = load i32, ptr %4, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [16 x i32], ptr %189, i64 0, i64 %191
  %193 = load i32, ptr %192, align 4
  %194 = add nsw i32 %187, %193
  %195 = load ptr, ptr %1, align 8
  %196 = getelementptr inbounds %struct.VM, ptr %195, i32 0, i32 0
  %197 = load i32, ptr %5, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [16 x i32], ptr %196, i64 0, i64 %198
  store i32 %194, ptr %199, align 4
  %200 = load ptr, ptr %1, align 8
  %201 = getelementptr inbounds %struct.VM, ptr %200, i32 0, i32 2
  store ptr %201, ptr %.reg2mem48, align 8
  br label %inner.loop.end

.split5.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload50 = load volatile ptr, ptr %.reg2mem48, align 8
  %202 = load i32, ptr %.reload50, align 8
  %203 = add nsw i32 %202, 4
  %.reload49 = load volatile ptr, ptr %.reg2mem48, align 8
  store i32 %203, ptr %.reload49, align 8
  br label %inner.loop.end

204:                                              ; preds = %inner.loop.body
  store i32 72, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %205 = load ptr, ptr %1, align 8
  %206 = getelementptr inbounds %struct.VM, ptr %205, i32 0, i32 1
  %207 = load ptr, ptr %206, align 8
  store ptr %207, ptr %.reg2mem51, align 8
  %208 = load ptr, ptr %1, align 8
  %209 = getelementptr inbounds %struct.VM, ptr %208, i32 0, i32 2
  %210 = load i32, ptr %209, align 8
  %211 = add nsw i32 %210, 3
  store i32 %211, ptr %.reg2mem53, align 4
  br label %inner.loop.end

.split6:                                          ; preds = %inner.loop.body
  store i32 74, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %.reload54 = load volatile i32, ptr %.reg2mem53, align 4
  %212 = sext i32 %.reload54 to i64
  %.reload52 = load volatile ptr, ptr %.reg2mem51, align 8
  %213 = getelementptr inbounds i32, ptr %.reload52, i64 %212
  %214 = load i32, ptr %213, align 4
  store i32 %214, ptr %3, align 4
  %215 = load ptr, ptr %1, align 8
  %216 = getelementptr inbounds %struct.VM, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  %218 = load ptr, ptr %1, align 8
  %219 = getelementptr inbounds %struct.VM, ptr %218, i32 0, i32 2
  %220 = load i32, ptr %219, align 8
  %221 = add nsw i32 %220, 2
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i32, ptr %217, i64 %222
  %224 = load i32, ptr %223, align 4
  store i32 %224, ptr %4, align 4
  %225 = load ptr, ptr %1, align 8
  %226 = getelementptr inbounds %struct.VM, ptr %225, i32 0, i32 1
  %227 = load ptr, ptr %226, align 8
  %228 = load ptr, ptr %1, align 8
  %229 = getelementptr inbounds %struct.VM, ptr %228, i32 0, i32 2
  %230 = load i32, ptr %229, align 8
  %231 = add nsw i32 %230, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, ptr %227, i64 %232
  %234 = load i32, ptr %233, align 4
  store i32 %234, ptr %5, align 4
  %235 = load ptr, ptr %1, align 8
  %236 = getelementptr inbounds %struct.VM, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %3, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [16 x i32], ptr %236, i64 0, i64 %238
  %240 = load i32, ptr %239, align 4
  store i32 %240, ptr %.reg2mem55, align 4
  %241 = load ptr, ptr %1, align 8
  %242 = getelementptr inbounds %struct.VM, ptr %241, i32 0, i32 0
  %243 = load i32, ptr %4, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [16 x i32], ptr %242, i64 0, i64 %244
  store ptr %245, ptr %.reg2mem57, align 8
  br label %inner.loop.end

.split6.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload58 = load volatile ptr, ptr %.reg2mem57, align 8
  %246 = load i32, ptr %.reload58, align 4
  %.reload56 = load volatile i32, ptr %.reg2mem55, align 4
  %247 = sub nsw i32 %.reload56, %246
  %248 = load ptr, ptr %1, align 8
  %249 = getelementptr inbounds %struct.VM, ptr %248, i32 0, i32 0
  %250 = load i32, ptr %5, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [16 x i32], ptr %249, i64 0, i64 %251
  store i32 %247, ptr %252, align 4
  %253 = load ptr, ptr %1, align 8
  %254 = getelementptr inbounds %struct.VM, ptr %253, i32 0, i32 2
  %255 = load i32, ptr %254, align 8
  %256 = add nsw i32 %255, 4
  store i32 %256, ptr %254, align 8
  br label %inner.loop.end

257:                                              ; preds = %inner.loop.body
  store i32 77, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %258 = load ptr, ptr %1, align 8
  %259 = getelementptr inbounds %struct.VM, ptr %258, i32 0, i32 1
  %260 = load ptr, ptr %259, align 8
  %261 = load ptr, ptr %1, align 8
  %262 = getelementptr inbounds %struct.VM, ptr %261, i32 0, i32 2
  %263 = load i32, ptr %262, align 8
  %264 = add nsw i32 %263, 3
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i32, ptr %260, i64 %265
  %267 = load i32, ptr %266, align 4
  store i32 %267, ptr %3, align 4
  %268 = load ptr, ptr %1, align 8
  %269 = getelementptr inbounds %struct.VM, ptr %268, i32 0, i32 1
  %270 = load ptr, ptr %269, align 8
  %271 = load ptr, ptr %1, align 8
  %272 = getelementptr inbounds %struct.VM, ptr %271, i32 0, i32 2
  %273 = load i32, ptr %272, align 8
  %274 = add nsw i32 %273, 2
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, ptr %270, i64 %275
  %277 = load i32, ptr %276, align 4
  store i32 %277, ptr %4, align 4
  %278 = load ptr, ptr %1, align 8
  %279 = getelementptr inbounds %struct.VM, ptr %278, i32 0, i32 1
  %280 = load ptr, ptr %279, align 8
  %281 = load ptr, ptr %1, align 8
  %282 = getelementptr inbounds %struct.VM, ptr %281, i32 0, i32 2
  %283 = load i32, ptr %282, align 8
  %284 = add nsw i32 %283, 1
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i32, ptr %280, i64 %285
  %287 = load i32, ptr %286, align 4
  store i32 %287, ptr %5, align 4
  %288 = load ptr, ptr %1, align 8
  store ptr %288, ptr %.reg2mem59, align 8
  br label %inner.loop.end

.split7:                                          ; preds = %inner.loop.body
  store i32 79, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload60 = load volatile ptr, ptr %.reg2mem59, align 8
  %289 = getelementptr inbounds %struct.VM, ptr %.reload60, i32 0, i32 0
  %290 = load i32, ptr %3, align 4
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [16 x i32], ptr %289, i64 0, i64 %291
  %293 = load i32, ptr %292, align 4
  store i32 %293, ptr %.reg2mem61, align 4
  %294 = load ptr, ptr %1, align 8
  %295 = getelementptr inbounds %struct.VM, ptr %294, i32 0, i32 0
  store ptr %295, ptr %.reg2mem63, align 8
  %296 = load i32, ptr %4, align 4
  %297 = sext i32 %296 to i64
  store i64 %297, ptr %.reg2mem65, align 8
  br label %inner.loop.end

.split7.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload64 = load volatile ptr, ptr %.reg2mem63, align 8
  %.reload66 = load volatile i64, ptr %.reg2mem65, align 8
  %298 = getelementptr inbounds [16 x i32], ptr %.reload64, i64 0, i64 %.reload66
  %299 = load i32, ptr %298, align 4
  %.reload62 = load volatile i32, ptr %.reg2mem61, align 4
  %300 = mul nsw i32 %.reload62, %299
  %301 = load ptr, ptr %1, align 8
  %302 = getelementptr inbounds %struct.VM, ptr %301, i32 0, i32 0
  %303 = load i32, ptr %5, align 4
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [16 x i32], ptr %302, i64 0, i64 %304
  store i32 %300, ptr %305, align 4
  %306 = load ptr, ptr %1, align 8
  %307 = getelementptr inbounds %struct.VM, ptr %306, i32 0, i32 2
  %308 = load i32, ptr %307, align 8
  %309 = add nsw i32 %308, 4
  store i32 %309, ptr %307, align 8
  br label %inner.loop.end

310:                                              ; preds = %inner.loop.body
  store i32 84, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %311 = load ptr, ptr %1, align 8
  %312 = getelementptr inbounds %struct.VM, ptr %311, i32 0, i32 1
  %313 = load ptr, ptr %312, align 8
  %314 = load ptr, ptr %1, align 8
  %315 = getelementptr inbounds %struct.VM, ptr %314, i32 0, i32 2
  %316 = load i32, ptr %315, align 8
  %317 = add nsw i32 %316, 3
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i32, ptr %313, i64 %318
  %320 = load i32, ptr %319, align 4
  store i32 %320, ptr %.reg2mem67, align 4
  br label %inner.loop.end

.split8:                                          ; preds = %inner.loop.body
  store i32 88, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %.reload68 = load volatile i32, ptr %.reg2mem67, align 4
  store i32 %.reload68, ptr %3, align 4
  %321 = load ptr, ptr %1, align 8
  %322 = getelementptr inbounds %struct.VM, ptr %321, i32 0, i32 1
  %323 = load ptr, ptr %322, align 8
  %324 = load ptr, ptr %1, align 8
  %325 = getelementptr inbounds %struct.VM, ptr %324, i32 0, i32 2
  %326 = load i32, ptr %325, align 8
  %327 = add nsw i32 %326, 2
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i32, ptr %323, i64 %328
  %330 = load i32, ptr %329, align 4
  store i32 %330, ptr %4, align 4
  %331 = load ptr, ptr %1, align 8
  %332 = getelementptr inbounds %struct.VM, ptr %331, i32 0, i32 1
  %333 = load ptr, ptr %332, align 8
  %334 = load ptr, ptr %1, align 8
  %335 = getelementptr inbounds %struct.VM, ptr %334, i32 0, i32 2
  %336 = load i32, ptr %335, align 8
  %337 = add nsw i32 %336, 1
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds i32, ptr %333, i64 %338
  %340 = load i32, ptr %339, align 4
  store i32 %340, ptr %5, align 4
  %341 = load ptr, ptr %1, align 8
  %342 = getelementptr inbounds %struct.VM, ptr %341, i32 0, i32 0
  %343 = load i32, ptr %3, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [16 x i32], ptr %342, i64 0, i64 %344
  %346 = load i32, ptr %345, align 4
  %347 = load ptr, ptr %1, align 8
  %348 = getelementptr inbounds %struct.VM, ptr %347, i32 0, i32 0
  %349 = load i32, ptr %4, align 4
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds [16 x i32], ptr %348, i64 0, i64 %350
  %352 = load i32, ptr %351, align 4
  %353 = sdiv i32 %346, %352
  store i32 %353, ptr %.reg2mem69, align 4
  %354 = load ptr, ptr %1, align 8
  %355 = getelementptr inbounds %struct.VM, ptr %354, i32 0, i32 0
  store ptr %355, ptr %.reg2mem71, align 8
  %356 = load i32, ptr %5, align 4
  store i32 %356, ptr %.reg2mem73, align 4
  br label %inner.loop.end

.split8.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload74 = load volatile i32, ptr %.reg2mem73, align 4
  %357 = sext i32 %.reload74 to i64
  %.reload72 = load volatile ptr, ptr %.reg2mem71, align 8
  %358 = getelementptr inbounds [16 x i32], ptr %.reload72, i64 0, i64 %357
  %.reload70 = load volatile i32, ptr %.reg2mem69, align 4
  store i32 %.reload70, ptr %358, align 4
  %359 = load ptr, ptr %1, align 8
  %360 = getelementptr inbounds %struct.VM, ptr %359, i32 0, i32 2
  %361 = load i32, ptr %360, align 8
  %362 = add nsw i32 %361, 4
  store i32 %362, ptr %360, align 8
  br label %inner.loop.end

363:                                              ; preds = %inner.loop.body
  store i32 93, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %364 = load ptr, ptr %1, align 8
  %365 = getelementptr inbounds %struct.VM, ptr %364, i32 0, i32 1
  %366 = load ptr, ptr %365, align 8
  %367 = load ptr, ptr %1, align 8
  %368 = getelementptr inbounds %struct.VM, ptr %367, i32 0, i32 2
  %369 = load i32, ptr %368, align 8
  %370 = add nsw i32 %369, 3
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds i32, ptr %366, i64 %371
  %373 = load i32, ptr %372, align 4
  store i32 %373, ptr %3, align 4
  %374 = load ptr, ptr %1, align 8
  %375 = getelementptr inbounds %struct.VM, ptr %374, i32 0, i32 1
  %376 = load ptr, ptr %375, align 8
  %377 = load ptr, ptr %1, align 8
  %378 = getelementptr inbounds %struct.VM, ptr %377, i32 0, i32 2
  %379 = load i32, ptr %378, align 8
  %380 = add nsw i32 %379, 2
  %381 = sext i32 %380 to i64
  %382 = getelementptr inbounds i32, ptr %376, i64 %381
  %383 = load i32, ptr %382, align 4
  store i32 %383, ptr %4, align 4
  %384 = load ptr, ptr %1, align 8
  %385 = getelementptr inbounds %struct.VM, ptr %384, i32 0, i32 1
  %386 = load ptr, ptr %385, align 8
  %387 = load ptr, ptr %1, align 8
  %388 = getelementptr inbounds %struct.VM, ptr %387, i32 0, i32 2
  %389 = load i32, ptr %388, align 8
  %390 = add nsw i32 %389, 1
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds i32, ptr %386, i64 %391
  %393 = load i32, ptr %392, align 4
  store i32 %393, ptr %5, align 4
  %394 = load ptr, ptr %1, align 8
  store ptr %394, ptr %.reg2mem75, align 8
  br label %inner.loop.end

.split9:                                          ; preds = %inner.loop.body
  store i32 94, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload76 = load volatile ptr, ptr %.reg2mem75, align 8
  %395 = getelementptr inbounds %struct.VM, ptr %.reload76, i32 0, i32 0
  %396 = load i32, ptr %3, align 4
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds [16 x i32], ptr %395, i64 0, i64 %397
  %399 = load i32, ptr %398, align 4
  %400 = load ptr, ptr %1, align 8
  %401 = getelementptr inbounds %struct.VM, ptr %400, i32 0, i32 0
  %402 = load i32, ptr %4, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [16 x i32], ptr %401, i64 0, i64 %403
  %405 = load i32, ptr %404, align 4
  %406 = xor i32 %399, %405
  store i32 %406, ptr %.reg2mem77, align 4
  br label %inner.loop.end

.split9.split:                                    ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %407 = load ptr, ptr %1, align 8
  %408 = getelementptr inbounds %struct.VM, ptr %407, i32 0, i32 0
  %409 = load i32, ptr %5, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [16 x i32], ptr %408, i64 0, i64 %410
  %.reload78 = load volatile i32, ptr %.reg2mem77, align 4
  store i32 %.reload78, ptr %411, align 4
  %412 = load ptr, ptr %1, align 8
  %413 = getelementptr inbounds %struct.VM, ptr %412, i32 0, i32 2
  %414 = load i32, ptr %413, align 8
  %415 = add nsw i32 %414, 4
  store i32 %415, ptr %413, align 8
  br label %inner.loop.end

416:                                              ; preds = %inner.loop.body
  store i32 97, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %417 = load ptr, ptr %1, align 8
  %418 = getelementptr inbounds %struct.VM, ptr %417, i32 0, i32 1
  %419 = load ptr, ptr %418, align 8
  store ptr %419, ptr %.reg2mem79, align 8
  br label %inner.loop.end

.split10:                                         ; preds = %inner.loop.body
  store i32 98, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %420 = load ptr, ptr %1, align 8
  %421 = getelementptr inbounds %struct.VM, ptr %420, i32 0, i32 2
  %422 = load i32, ptr %421, align 8
  %423 = add nsw i32 %422, 1
  %424 = sext i32 %423 to i64
  %.reload80 = load volatile ptr, ptr %.reg2mem79, align 8
  %425 = getelementptr inbounds i32, ptr %.reload80, i64 %424
  %426 = load i32, ptr %425, align 4
  %.reload1 = load volatile ptr, ptr %.reg2mem, align 8
  store i32 %426, ptr %.reload1, align 4
  %.reload = load volatile ptr, ptr %.reg2mem, align 8
  %427 = load i32, ptr %.reload, align 4
  %428 = load ptr, ptr %1, align 8
  %429 = getelementptr inbounds %struct.VM, ptr %428, i32 0, i32 2
  store i32 %427, ptr %429, align 8
  br label %inner.loop.end

.split10.split:                                   ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  br label %inner.loop.end

430:                                              ; preds = %inner.loop.body
  store i32 105, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %431 = load ptr, ptr %1, align 8
  %432 = getelementptr inbounds %struct.VM, ptr %431, i32 0, i32 1
  store ptr %432, ptr %.reg2mem81, align 8
  br label %inner.loop.end

.split11:                                         ; preds = %inner.loop.body
  store i32 107, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload82 = load volatile ptr, ptr %.reg2mem81, align 8
  %433 = load ptr, ptr %.reload82, align 8
  store ptr %433, ptr %.reg2mem83, align 8
  %434 = load ptr, ptr %1, align 8
  store ptr %434, ptr %.reg2mem85, align 8
  br label %inner.loop.end

.split11.split:                                   ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload86 = load volatile ptr, ptr %.reg2mem85, align 8
  %435 = getelementptr inbounds %struct.VM, ptr %.reload86, i32 0, i32 2
  %436 = load i32, ptr %435, align 8
  %437 = add nsw i32 %436, 1
  %438 = sext i32 %437 to i64
  %.reload84 = load volatile ptr, ptr %.reg2mem83, align 8
  %439 = getelementptr inbounds i32, ptr %.reload84, i64 %438
  %440 = load i32, ptr %439, align 4
  %.reload8 = load volatile ptr, ptr %.reg2mem4, align 8
  store i32 %440, ptr %.reload8, align 4
  %441 = load ptr, ptr %1, align 8
  %442 = getelementptr inbounds %struct.VM, ptr %441, i32 0, i32 4
  %443 = load ptr, ptr %442, align 8
  %.reload7 = load volatile ptr, ptr %.reg2mem4, align 8
  %444 = load i32, ptr %.reload7, align 4
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds i8, ptr %443, i64 %445
  %447 = load ptr, ptr @stdin, align 8
  %448 = call ptr @fgets(ptr noundef %446, i32 noundef 256, ptr noundef %447)
  %449 = load ptr, ptr %1, align 8
  %450 = getelementptr inbounds %struct.VM, ptr %449, i32 0, i32 2
  %451 = load i32, ptr %450, align 8
  %452 = add nsw i32 %451, 2
  store i32 %452, ptr %450, align 8
  br label %inner.loop.end

453:                                              ; preds = %inner.loop.body
  store i32 112, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %454 = load ptr, ptr %1, align 8
  %455 = getelementptr inbounds %struct.VM, ptr %454, i32 0, i32 1
  %456 = load ptr, ptr %455, align 8
  store ptr %456, ptr %.reg2mem87, align 8
  br label %inner.loop.end

.split12:                                         ; preds = %inner.loop.body
  store i32 114, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %457 = load ptr, ptr %1, align 8
  %458 = getelementptr inbounds %struct.VM, ptr %457, i32 0, i32 2
  %459 = load i32, ptr %458, align 8
  %460 = add nsw i32 %459, 1
  %461 = sext i32 %460 to i64
  %.reload88 = load volatile ptr, ptr %.reg2mem87, align 8
  %462 = getelementptr inbounds i32, ptr %.reload88, i64 %461
  %463 = load i32, ptr %462, align 4
  store i32 %463, ptr %3, align 4
  %464 = load ptr, ptr %1, align 8
  %465 = getelementptr inbounds %struct.VM, ptr %464, i32 0, i32 1
  %466 = load ptr, ptr %465, align 8
  %467 = load ptr, ptr %1, align 8
  %468 = getelementptr inbounds %struct.VM, ptr %467, i32 0, i32 2
  %469 = load i32, ptr %468, align 8
  %470 = add nsw i32 %469, 2
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i32, ptr %466, i64 %471
  %473 = load i32, ptr %472, align 4
  store i32 %473, ptr %4, align 4
  %474 = load ptr, ptr %1, align 8
  %475 = getelementptr inbounds %struct.VM, ptr %474, i32 0, i32 0
  %476 = load i32, ptr %3, align 4
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds [16 x i32], ptr %475, i64 0, i64 %477
  store ptr %478, ptr %.reg2mem89, align 8
  br label %inner.loop.end

.split12.split:                                   ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload90 = load volatile ptr, ptr %.reg2mem89, align 8
  %479 = load i32, ptr %.reload90, align 4
  %480 = load ptr, ptr %1, align 8
  %481 = getelementptr inbounds %struct.VM, ptr %480, i32 0, i32 0
  %482 = load i32, ptr %4, align 4
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds [16 x i32], ptr %481, i64 0, i64 %483
  %485 = load i32, ptr %484, align 4
  %486 = icmp eq i32 %479, %485
  %487 = zext i1 %486 to i32
  %488 = load ptr, ptr %1, align 8
  %489 = getelementptr inbounds %struct.VM, ptr %488, i32 0, i32 3
  store i32 %487, ptr %489, align 4
  %490 = load ptr, ptr %1, align 8
  %491 = getelementptr inbounds %struct.VM, ptr %490, i32 0, i32 2
  %492 = load i32, ptr %491, align 8
  %493 = add nsw i32 %492, 3
  store i32 %493, ptr %491, align 8
  br label %inner.loop.end

494:                                              ; preds = %inner.loop.body
  store i32 119, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %495 = load ptr, ptr %1, align 8
  %496 = getelementptr inbounds %struct.VM, ptr %495, i32 0, i32 3
  store ptr %496, ptr %.reg2mem91, align 8
  br label %inner.loop.end

.split13:                                         ; preds = %inner.loop.body
  store i32 123, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload92 = load volatile ptr, ptr %.reg2mem91, align 8
  %497 = load i32, ptr %.reload92, align 4
  %498 = icmp ne i32 %497, 0
  store i1 %498, ptr %.reg2mem93, align 1
  br label %inner.loop.end

.split13.split:                                   ; preds = %inner.loop.body
  %.reload95 = load volatile i1, ptr %.reg2mem93, align 1
  %499 = select i1 %.reload95, i32 129, i32 124
  %.reload94 = load volatile i1, ptr %.reg2mem93, align 1
  %500 = select i1 %.reload94, i32 1, i32 1
  store i32 %499, ptr %outerLoopVar, align 4
  store i32 %500, ptr %innerLoopVar, align 4
  br label %inner.loop.end

501:                                              ; preds = %inner.loop.body
  store i32 125, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  br label %inner.loop.end

.split14:                                         ; preds = %inner.loop.body
  store i32 127, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %502 = load ptr, ptr %1, align 8
  store ptr %502, ptr %.reg2mem96, align 8
  br label %inner.loop.end

.split14.split:                                   ; preds = %inner.loop.body
  store i32 136, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %.reload97 = load volatile ptr, ptr %.reg2mem96, align 8
  %503 = getelementptr inbounds %struct.VM, ptr %.reload97, i32 0, i32 1
  %504 = load ptr, ptr %503, align 8
  %505 = load ptr, ptr %1, align 8
  %506 = getelementptr inbounds %struct.VM, ptr %505, i32 0, i32 2
  %507 = load i32, ptr %506, align 8
  %508 = add nsw i32 %507, 1
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds i32, ptr %504, i64 %509
  %511 = load i32, ptr %510, align 4
  %512 = load ptr, ptr %1, align 8
  %513 = getelementptr inbounds %struct.VM, ptr %512, i32 0, i32 2
  store i32 %511, ptr %513, align 8
  br label %inner.loop.end

514:                                              ; preds = %inner.loop.body
  store i32 133, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %515 = load ptr, ptr %1, align 8
  store ptr %515, ptr %.reg2mem98, align 8
  br label %inner.loop.end

.split15:                                         ; preds = %inner.loop.body
  store i32 135, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload99 = load volatile ptr, ptr %.reg2mem98, align 8
  %516 = getelementptr inbounds %struct.VM, ptr %.reload99, i32 0, i32 2
  store ptr %516, ptr %.reg2mem100, align 8
  %.reload102 = load volatile ptr, ptr %.reg2mem100, align 8
  %517 = load i32, ptr %.reload102, align 8
  %518 = add nsw i32 %517, 2
  store i32 %518, ptr %.reg2mem103, align 4
  br label %inner.loop.end

.split15.split:                                   ; preds = %inner.loop.body
  store i32 136, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %.reload101 = load volatile ptr, ptr %.reg2mem100, align 8
  %.reload104 = load volatile i32, ptr %.reg2mem103, align 4
  store i32 %.reload104, ptr %.reload101, align 8
  br label %inner.loop.end

519:                                              ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  br label %inner.loop.end

520:                                              ; preds = %inner.loop.body
  store i32 140, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %521 = load ptr, ptr %1, align 8
  %522 = getelementptr inbounds %struct.VM, ptr %521, i32 0, i32 1
  %523 = load ptr, ptr %522, align 8
  store ptr %523, ptr %.reg2mem105, align 8
  %524 = load ptr, ptr %1, align 8
  %525 = getelementptr inbounds %struct.VM, ptr %524, i32 0, i32 2
  %526 = load i32, ptr %525, align 8
  %527 = add nsw i32 %526, 1
  %528 = sext i32 %527 to i64
  store i64 %528, ptr %.reg2mem107, align 8
  br label %inner.loop.end

.split16:                                         ; preds = %inner.loop.body
  store i32 146, ptr %outerLoopVar, align 4
  store i32 3, ptr %innerLoopVar, align 4
  %.reload106 = load volatile ptr, ptr %.reg2mem105, align 8
  %.reload108 = load volatile i64, ptr %.reg2mem107, align 8
  %529 = getelementptr inbounds i32, ptr %.reload106, i64 %.reload108
  %530 = load i32, ptr %529, align 4
  store i32 %530, ptr %3, align 4
  %531 = load ptr, ptr %1, align 8
  %532 = getelementptr inbounds %struct.VM, ptr %531, i32 0, i32 1
  %533 = load ptr, ptr %532, align 8
  store ptr %533, ptr %.reg2mem109, align 8
  %534 = load ptr, ptr %1, align 8
  %535 = getelementptr inbounds %struct.VM, ptr %534, i32 0, i32 2
  %536 = load i32, ptr %535, align 8
  %537 = add nsw i32 %536, 2
  store i32 %537, ptr %.reg2mem111, align 4
  br label %inner.loop.end

.split16.split:                                   ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload112 = load volatile i32, ptr %.reg2mem111, align 4
  %538 = sext i32 %.reload112 to i64
  %.reload110 = load volatile ptr, ptr %.reg2mem109, align 8
  %539 = getelementptr inbounds i32, ptr %.reload110, i64 %538
  %540 = load i32, ptr %539, align 4
  store i32 %540, ptr %4, align 4
  %541 = load ptr, ptr %1, align 8
  %542 = getelementptr inbounds %struct.VM, ptr %541, i32 0, i32 0
  %543 = load i32, ptr %4, align 4
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds [16 x i32], ptr %542, i64 0, i64 %544
  %546 = load i32, ptr %545, align 4
  %.reload6 = load volatile ptr, ptr %.reg2mem4, align 8
  store i32 %546, ptr %.reload6, align 4
  %547 = load ptr, ptr %1, align 8
  %548 = getelementptr inbounds %struct.VM, ptr %547, i32 0, i32 4
  %549 = load ptr, ptr %548, align 8
  %.reload5 = load volatile ptr, ptr %.reg2mem4, align 8
  %550 = load i32, ptr %.reload5, align 4
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds i8, ptr %549, i64 %551
  %553 = load i8, ptr %552, align 1
  %554 = zext i8 %553 to i32
  %555 = load ptr, ptr %1, align 8
  %556 = getelementptr inbounds %struct.VM, ptr %555, i32 0, i32 0
  %557 = load i32, ptr %3, align 4
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds [16 x i32], ptr %556, i64 0, i64 %558
  store i32 %554, ptr %559, align 4
  %560 = load ptr, ptr %1, align 8
  %561 = getelementptr inbounds %struct.VM, ptr %560, i32 0, i32 2
  %562 = load i32, ptr %561, align 8
  %563 = add nsw i32 %562, 3
  store i32 %563, ptr %561, align 8
  br label %inner.loop.end

564:                                              ; preds = %inner.loop.body
  store i32 151, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %565 = load ptr, ptr %1, align 8
  %566 = getelementptr inbounds %struct.VM, ptr %565, i32 0, i32 1
  %567 = load ptr, ptr %566, align 8
  %568 = load ptr, ptr %1, align 8
  %569 = getelementptr inbounds %struct.VM, ptr %568, i32 0, i32 2
  %570 = load i32, ptr %569, align 8
  %571 = add nsw i32 %570, 1
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds i32, ptr %567, i64 %572
  store ptr %573, ptr %.reg2mem113, align 8
  br label %inner.loop.end

.split17:                                         ; preds = %inner.loop.body
  store i32 156, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload114 = load volatile ptr, ptr %.reg2mem113, align 8
  %574 = load i32, ptr %.reload114, align 4
  %575 = icmp ne i32 %574, 0
  store i1 %575, ptr %.reg2mem115, align 1
  br label %inner.loop.end

.split17.split:                                   ; preds = %inner.loop.body
  %.reload117 = load volatile i1, ptr %.reg2mem115, align 1
  %576 = select i1 %.reload117, i32 157, i32 158
  %.reload116 = load volatile i1, ptr %.reg2mem115, align 1
  %577 = select i1 %.reload116, i32 2, i32 1
  store i32 %576, ptr %outerLoopVar, align 4
  store i32 %577, ptr %innerLoopVar, align 4
  br label %inner.loop.end

578:                                              ; preds = %inner.loop.body
  store i32 161, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %579 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %inner.loop.end

580:                                              ; preds = %inner.loop.body
  store i32 161, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %581 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %inner.loop.end

582:                                              ; preds = %inner.loop.body
  store i32 162, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %583 = load ptr, ptr %1, align 8
  store ptr %583, ptr %.reg2mem118, align 8
  br label %inner.loop.end

.split18:                                         ; preds = %inner.loop.body
  store i32 163, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload119 = load volatile ptr, ptr %.reg2mem118, align 8
  %584 = getelementptr inbounds %struct.VM, ptr %.reload119, i32 0, i32 2
  store ptr %584, ptr %.reg2mem120, align 8
  br label %inner.loop.end

.split18.split:                                   ; preds = %inner.loop.body
  store i32 172, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  %.reload122 = load volatile ptr, ptr %.reg2mem120, align 8
  %585 = load i32, ptr %.reload122, align 8
  %586 = add nsw i32 %585, 1
  %.reload121 = load volatile ptr, ptr %.reg2mem120, align 8
  store i32 %586, ptr %.reload121, align 8
  br label %inner.loop.end

587:                                              ; preds = %inner.loop.body
  store i32 166, ptr %outerLoopVar, align 4
  store i32 2, ptr %innerLoopVar, align 4
  br label %inner.loop.end

.split19:                                         ; preds = %inner.loop.body
  store i32 171, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %588 = load i32, ptr %2, align 4
  %589 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %588)
  br label %inner.loop.end

.split19.split:                                   ; preds = %inner.loop.body
  call void @exit(i32 noundef 1) #7
  unreachable

590:                                              ; preds = %inner.loop.body
  store i32 7, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  br label %inner.loop.end

591:                                              ; preds = %inner.loop.body
  ret void

outer.loop.cond:                                  ; preds = %inner.loop.end, %new_entry
  %592 = load i32, ptr %outerLoopVar, align 4
  store i32 %592, ptr %.reg2mem123, align 4
  %.reload125 = load volatile i32, ptr %.reg2mem123, align 4
  %593 = icmp ult i32 %.reload125, 123456789
  br i1 %593, label %outer.loop.body, label %outer.loop.end

outer.loop.body:                                  ; preds = %outer.loop.cond
  %.reload124 = load volatile i32, ptr %.reg2mem123, align 4
  %594 = add i32 %.reload124, 1
  store i32 %594, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %inner.loop.cond

outer.loop.end:                                   ; preds = %outer.loop.end, %outer.loop.cond
  store i32 2, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %outer.loop.end

inner.loop.cond:                                  ; preds = %inner.loop.body, %outer.loop.body
  %595 = load i32, ptr %innerLoopVar, align 4
  store i32 %595, ptr %.reg2mem126, align 4
  %.reload128 = load volatile i32, ptr %.reg2mem126, align 4
  %596 = icmp ult i32 %.reload128, 4
  br i1 %596, label %inner.loop.body, label %inner.loop.end

inner.loop.body:                                  ; preds = %inner.loop.cond
  %.reload127 = load volatile i32, ptr %.reg2mem126, align 4
  %597 = add i32 %.reload127, 1
  store i32 %597, ptr %innerLoopVar, align 4
  %598 = load i32, ptr %outerLoopVar, align 4
  %599 = load i32, ptr %innerLoopVar, align 4
  %600 = load i32, ptr %quick_pow_mod, align 4
  %601 = call i32 @quick_pow(i32 %598, i32 %599, i32 %600)
  switch i32 %601, label %inner.loop.cond [
    i32 2, label %.split
    i32 3, label %.split.split
    i32 5, label %.split.split.split
    i32 8, label %11
    i32 11, label %.split1
    i32 12, label %.split1.split
    i32 13, label %16
    i32 196, label %.split2
    i32 18, label %.split2.split
    i32 20, label %30
    i32 21, label %34
    i32 27, label %38
    i32 30, label %42
    i32 31, label %46
    i32 32, label %50
    i32 34, label %54
    i32 1225, label %58
    i32 50653, label %62
    i32 38, label %66
    i32 68921, label %70
    i32 43, label %74
    i32 44, label %78
    i32 91125, label %82
    i32 2116, label %83
    i32 48, label %84
    i32 125000, label %.split3
    i32 2601, label %.split3.split
    i32 52, label %115
    i32 56, label %.split4
    i32 57, label %.split4.split
    i32 66, label %151
    i32 69, label %.split5
    i32 5041, label %.split5.split
    i32 72, label %204
    i32 73, label %.split6
    i32 421875, label %.split6.split
    i32 5929, label %257
    i32 6084, label %.split7
    i32 6400, label %.split7.split
    i32 592704, label %310
    i32 614125, label %.split8
    i32 704969, label %.split8.split
    i32 753571, label %363
    i32 830584, label %.split9
    i32 95, label %.split9.split
    i32 97, label %416
    i32 98, label %.split10
    i32 9801, label %.split10.split
    i32 1092727, label %430
    i32 106, label %.split11
    i32 11664, label %.split11.split
    i32 110, label %453
    i32 113, label %.split12
    i32 115, label %.split12.split
    i32 13456, label %494
    i32 120, label %.split13
    i32 124, label %.split13.split
    i32 125, label %501
    i32 126, label %.split14
    i32 128, label %.split14.split
    i32 130, label %514
    i32 134, label %.split15
    i32 18496, label %.split15.split
    i32 2571353, label %519
    i32 140, label %520
    i32 141, label %.split16
    i32 3176523, label %.split16.split
    i32 3241792, label %564
    i32 23104, label %.split17
    i32 157, label %.split17.split
    i32 24964, label %578
    i32 159, label %580
    i32 162, label %582
    i32 26569, label %.split18
    i32 164, label %.split18.split
    i32 165, label %587
    i32 27889, label %.split19
    i32 172, label %.split19.split
    i32 29929, label %590
    i32 174, label %591
  ]

inner.loop.end:                                   ; preds = %590, %.split19, %587, %.split18.split, %.split18, %582, %580, %578, %.split17.split, %.split17, %564, %.split16.split, %.split16, %520, %519, %.split15.split, %.split15, %514, %.split14.split, %.split14, %501, %.split13.split, %.split13, %494, %.split12.split, %.split12, %453, %.split11.split, %.split11, %430, %.split10.split, %.split10, %416, %.split9.split, %.split9, %363, %.split8.split, %.split8, %310, %.split7.split, %.split7, %257, %.split6.split, %.split6, %204, %.split5.split, %.split5, %151, %.split4.split, %.split4, %115, %.split3.split, %.split3, %84, %83, %82, %78, %74, %70, %66, %62, %58, %54, %50, %46, %42, %38, %34, %30, %.split2.split, %.split2, %16, %.split1.split, %.split1, %11, %.split.split.split, %.split.split, %.split, %inner.loop.cond
  br label %outer.loop.cond
}

declare i32 @printf(ptr noundef, ...) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
new_entry:
  %.reg2mem4 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca ptr, align 8
  %outerLoopVar = alloca i32, align 4
  store i32 1, ptr %outerLoopVar, align 4
  %innerLoopVar = alloca i32, align 4
  store i32 0, ptr %innerLoopVar, align 4
  %quick_pow_mod = alloca i32, align 4
  store i32 123456789, ptr %quick_pow_mod, align 4
  %quick_pow_result = alloca i32, align 4
  store i32 0, ptr %quick_pow_result, align 4
  br label %outer.loop.cond

0:                                                ; No predecessors!
  br label %.split

.split:                                           ; preds = %inner.loop.body, %0
  store i32 2, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %1 = alloca ptr, align 8
  %2 = call ptr @new_vm(ptr noundef @prog, i32 noundef 51, i32 noundef 256)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  store ptr %3, ptr %.reg2mem, align 8
  br label %inner.loop.end

.split.split:                                     ; preds = %inner.loop.body
  store i32 4, ptr %outerLoopVar, align 4
  store i32 1, ptr %innerLoopVar, align 4
  %.reload = load volatile ptr, ptr %.reg2mem, align 8
  call void @run_vm(ptr noundef %.reload)
  br label %inner.loop.end

.split.split.split:                               ; preds = %inner.loop.body
  ret i32 0

outer.loop.cond:                                  ; preds = %inner.loop.end, %new_entry
  %4 = load i32, ptr %outerLoopVar, align 4
  store i32 %4, ptr %.reg2mem1, align 4
  %.reload3 = load volatile i32, ptr %.reg2mem1, align 4
  %5 = icmp ult i32 %.reload3, 123456789
  br i1 %5, label %outer.loop.body, label %outer.loop.end

outer.loop.body:                                  ; preds = %outer.loop.cond
  %.reload2 = load volatile i32, ptr %.reg2mem1, align 4
  %6 = add i32 %.reload2, 1
  store i32 %6, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %inner.loop.cond

outer.loop.end:                                   ; preds = %outer.loop.end, %outer.loop.cond
  store i32 2, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %outer.loop.end

inner.loop.cond:                                  ; preds = %inner.loop.body, %outer.loop.body
  %7 = load i32, ptr %innerLoopVar, align 4
  store i32 %7, ptr %.reg2mem4, align 4
  %.reload6 = load volatile i32, ptr %.reg2mem4, align 4
  %8 = icmp ult i32 %.reload6, 4
  br i1 %8, label %inner.loop.body, label %inner.loop.end

inner.loop.body:                                  ; preds = %inner.loop.cond
  %.reload5 = load volatile i32, ptr %.reg2mem4, align 4
  %9 = add i32 %.reload5, 1
  store i32 %9, ptr %innerLoopVar, align 4
  %10 = load i32, ptr %outerLoopVar, align 4
  %11 = load i32, ptr %innerLoopVar, align 4
  %12 = load i32, ptr %quick_pow_mod, align 4
  %13 = call i32 @quick_pow(i32 %10, i32 %11, i32 %12)
  switch i32 %13, label %inner.loop.cond [
    i32 2, label %.split
    i32 3, label %.split.split
    i32 5, label %.split.split.split
  ]

inner.loop.end:                                   ; preds = %.split.split, %.split, %inner.loop.cond
  br label %outer.loop.cond
}

; Function Attrs: noinline nounwind optnone uwtable
define private i32 @quick_pow(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}
!llvm.dbg.cu = !{}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
