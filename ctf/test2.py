# 初始化地址字典
addresses = {
    "qword_28E48": 0x28E48,
    "qword_29580": 0x29580,
    "qword_29210": 0x29210,
    "qword_29280": 0x29280,
    "qword_28E20": 0x28E20,
    "qword_28F08": 0x28F08,
    "qword_28ED0": 0x28ED0,
    "qword_28F70": 0x28F70,
    "qword_294F8": 0x294F8,
    "qword_29480": 0x29480,
    "qword_292C8": 0x292C8,
    "qword_28FA8": 0x28FA8,
    "qword_29258": 0x29258,
    "qword_29058": 0x29058,
    "qword_295D8": 0x295D8,
    "qword_28D70": 0x28E48
}

# 定义基地址
base_address = 0x28DE8

# 计算每个变量的值
for name, address in addresses.items():
    value = (address - base_address) // 8
    print(f"{name}: {hex(value)}")

# 21E37799Bh
# 0x21E3779B9