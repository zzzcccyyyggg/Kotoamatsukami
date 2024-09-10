define dso_local i32 @main() #0 {
  %outerLoopVar = alloca i32, align 4
  store i32 0, ptr %outerLoopVar, align 4
  %innerLoopVar = alloca i32, align 4
  store i32 0, ptr %innerLoopVar, align 4
  %quick_pow_mod = alloca i32, align 4
  store i32 123456789, ptr %quick_pow_mod, align 4
  %quick_pow_result = alloca i32, align 4
  store i32 0, ptr %quick_pow_result, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 4, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  store i32 %4, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br label %outer.loop.cond

outer.loop.cond:                                  ; preds = %0
  %7 = load i32, ptr %outerLoopVar, align 4
  %8 = icmp ult i32 %7, 987654321
  br i1 %8, label %outer.loop.body, label %outer.loop.end

outer.loop.body:                                  ; preds = %outer.loop.cond
  %9 = add i32 %7, 1
  store i32 %9, ptr %outerLoopVar, align 4
  br label %inner.loop.cond

outer.loop.end:                                   ; preds = %outer.loop.end, %outer.loop.cond
  store i32 2, ptr %outerLoopVar, align 4
  store i32 0, ptr %innerLoopVar, align 4
  br label %outer.loop.end

inner.loop.cond:                                  ; preds = %outer.loop.body
  %10 = load i32, ptr %innerLoopVar, align 4
  %11 = icmp ult i32 %10, 987654321
  br i1 %11, label %inner.loop.body, label %inner.loop.end

inner.loop.body:                                  ; preds = %inner.loop.cond
  %12 = add i32 %10, 1
  store i32 %12, i32 %10, align 4
  %13 = load i32, ptr %outerLoopVar, align 4
  %14 = load i32, ptr %innerLoopVar, align 4
  %15 = load i32, ptr %quick_pow_mod, align 4
  %16 = call i32 @quick_pow(i32 %13, i32 %14, i32 %15)
  switch i32 %16, label %inner.loop.end [
    i32 0, label %newBB
    i32 2097152, label %19
    i32 86087512, label %21
  ]

newBB:                                            ; preds = %inner.loop.body
  %17 = select i1 %6, i32 1, i32 1
  %18 = select i1 %6, i32 21, i32 30
  store i32 %17, ptr %outerLoopVar, align 4
  store i32 %18, ptr %innerLoopVar, align 4
  br label %inner.loop.end

19:                                               ; preds = %inner.loop.body
  store i32 0, ptr %outerLoopVar, align 4
  store i32 30, ptr %innerLoopVar, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %21

21:                                               ; preds = %inner.loop.body, %19
  ret i32 0

inner.loop.end:                                   ; preds = <null operand!>, %newBB, %inner.loop.body, %inner.loop.cond
}