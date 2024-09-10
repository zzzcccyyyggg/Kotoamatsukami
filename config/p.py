import sympy
def find_all_primitive_roots(p):
    """找到素数 p 的所有生成元"""
    if not sympy.isprime(p):
        return None
    
    factors = sympy.factorint(p - 1)  # 找到 p-1 的质因数分解
    primitive_roots = []
    
    # 检查每个候选数是否为生成元
    for g in range(2, p):
        is_primitive_root = True
        for factor in factors.keys():
            if pow(g, (p - 1) // factor, p) == 1:  # 检查生成元条件
                is_primitive_root = False
                break
        if is_primitive_root:
            primitive_roots.append(g)
    
    return primitive_roots
def find_primitive_root(p):
    """找到给定素数 p 的生成元"""
    if not sympy.isprime(p):
        return None
    
    factors = sympy.factorint(p - 1)
    for g in range(2, p):
        is_primitive_root = True
        for factor in factors.keys():
            if pow(g, (p - 1) // factor, p) == 1:
                is_primitive_root = False
                break
        if is_primitive_root:
            return g
    return None

# 找到一个 32 位范围内的素数
prime = sympy.randprime(2**13, 2**14)

# 找到该素数的生成元
gen = find_all_primitive_roots(prime)

print(f"素数: {prime}")
print(f"生成元: {gen[:233]}")
