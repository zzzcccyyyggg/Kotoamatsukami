import random
import math
import json

# 用于存储生成的方程的解
generated_solutions = set()

def generate_integer_solution_quadratic():
    while True:
        # 随机生成 a, b, c 系数
        a = random.randint(1, 10)
        x1 = random.randint(-20, 20)
        x2 = random.randint(-20, 20)
        
        # 使用反向生成公式 a(x - x1)(x - x2) => ax^2 - a(x1+x2)x + a*x1*x2
        b = -a * (x1 + x2)
        c = a * x1 * x2

        # 将解存储为一个元组，并确保解不重复
        solutions = tuple(sorted([x1, x2]))  # 排序以便于比较
        if solutions not in generated_solutions:
            # 如果解是新的，存储并返回方程和解
            generated_solutions.add(solutions)
            return a, b, c, x1, x2

# 生成多个不重复解的方程
def generate_unique_quadratic_equations(num_equations):
    equations = []
    for _ in range(num_equations):
        a, b, c, x1, x2 = generate_integer_solution_quadratic()
        equations.append((a, b, c, x1, x2))
    return equations

# 生成 JSON 风格的结构，包含 C 函数模板
def generate_json_from_equations(equations):
    json_data = []
    for i, (a, b, c, x1, x2) in enumerate(equations):
        c_func_name = f"forpass_judge{i+1}"

        c_func_template = f"""
int {c_func_name}(int x, int y, int z,int e) {{
    if({a}*x*x + {b}*x + {c} != 0 || {a}*y*y + {b}*y + {c} != 0 || e == 1){{
        return 0;
    }}
    switch (quick_pow(z,e)) {{
        case {27}:
            return 1;
        case {4}:
            return 2;
        case {9}:
            return 3;
        case {25}:
            return 4;
    }}
    return 0;
}}"""

        json_entry = {
            "C-Func": c_func_template.strip(),
            "solve_value1": str(x1),
            "solve_value2": str(x2)
        }

        json_data.append(json_entry)

    return json_data

# 测试函数，生成 100 个不重复解的一元二次方程并生成 JSON 文件
if __name__ == "__main__":
    num_equations = 100
    equations = generate_unique_quadratic_equations(num_equations)
    
    # 生成 JSON 风格的结构
    json_data = generate_json_from_equations(equations)

    # 输出 JSON 到文件
    with open('quadratic_equations.json', 'w') as json_file:
        json.dump(json_data, json_file, indent=4)

    # 打印一些示例数据
    print(json.dumps(json_data[:3], indent=4))
