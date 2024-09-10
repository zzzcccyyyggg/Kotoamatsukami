import random
import chal
import os

# 保存原始的 urandom 函数
original_urandom = os.urandom
key = []
# 自定义的 urandom
def hooked_urandom(n):
    print(f"Hooked urandom called with n={hex(n)}")
    return original_urandom(n)
# Hook Random.seed() to add custom behavior
_original_seed = random.seed  # Save original seed function
_original_getrandbits = random.getrandbits
def hook_seed(a=None, version=2):
    print(f"Random.seed called with {hex(a)}")
    _original_seed(a, version)  # Call the original seed function

def hook_getrandbits(k):
    print(f"random.getrandbits called with {k} bits")
    result = _original_getrandbits(k)  # Call the original function
    
    # Add custom logic here
    print(f"Original getrandbits result: {hex(result)}")
    key.append(result)
    return result
# Replace random.seed with the hooked version
random.seed = hook_seed
random.getrandbits = hook_getrandbits
os.urandom = hooked_urandom
# Example flag input and calling chal.chal with modified flag
flag = input("flag: ")
# random.seed(42)  # This will trigger the hook and modify the flag
chal.chal(flag)
print(chal.__dict__)
# print(int.__dict__)

# print(key)