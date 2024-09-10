# 初始化地址字典
addresses = {
    "qword_291B0": 0x291B0,
    "qword_29030": 0x29030,
    "qword_29250": 0x29250,
    "qword_29278": 0x29278,
    "qword_29180": 0x29180,
    "qword_29518": 0x29518,
    "qword_29390": 0x29390,
    "qword_28FF0": 0x28FF0,
    "qword_29558": 0x29558,
    "qword_28E70": 0x28E70,
    "qword_29508": 0x29508,
    "qword_29078": 0x29078,
    "qword_293C8": 0x293C8,
    "qword_28FF8": 0x28FF8,
    "qword_28E48": 0x28E48,
    "qword_29288": 0x29288,
    "qword_294F0": 0x294F0,
    "qword_295E0": 0x295E0,
    "qword_295D8": 0x295D8,
    "qword_28F60": 0x28F60,
    "qword_28E98": 0x28E98,
    "qword_29300": 0x29300,
    "qword_295B8": 0x295B8,
    "qword_294D8": 0x294D8,
    "qword_29210": 0x29210,
    "qword_28F00": 0x28F00,
    "qword_29528": 0x29528,
    "qword_29138": 0x29138,
    "qword_29368": 0x29368
}

# 定义基地址
base_address = 0x28DE8

# 计算每个变量的值
for name, address in addresses.items():
    value = (address - base_address) // 8
    print(f"{name}: {hex(value)}")
