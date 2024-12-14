import re

def remove_assembly_code(input_file, output_file):
    with open(input_file, 'r') as infile:
        lines = infile.readlines()

    inside_block = False
    modified_lines = []

    for line in lines:
        # 检测到 callq 行时，设置标志
        if re.match(r'\s*calll\s+IndirectConditionalJumpFunc', line):
            inside_block = True
            modified_lines.append(line)
            continue  # 跳过这行，开始删除

        # 如果在删除块中，检测到 .Ltmp 行
        if inside_block and re.match(r'\s*\.Ltmp', line):
            inside_block = False
            modified_lines.append(line)
            continue  # 跳过 .Ltmp 行，保留后续内容

        # 如果不是在删除块中，则保留这行
        if not inside_block:
            modified_lines.append(line)

    # 写入修改后的内容到输出文件
    with open(output_file, 'w') as outfile:
        outfile.writelines(modified_lines)

# 示例用法
input_file = 'test-branch2call_32.s'   # 输入的汇编文件
output_file = 'test-branch2call_32.s'  # 输出的汇编文件_
remove_assembly_code(input_file, output_file)
