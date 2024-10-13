def process_assembly_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        skip_lines = False  # 标志是否要跳过行
        for line in infile:
            # 检查是否遇到了 'b ConditionalJumpFunc_byX10'
            if 'b\tConditionalJumpFunc_byX10' in line:
                skip_lines = True  # 遇到此行后开始跳过
                outfile.write(line)
                continue  # 跳过该行

            # 检查是否遇到以 .L 开头的顶格行
            if skip_lines and line.startswith('.L'):
                skip_lines = False  # 停止跳过
                # 将该行以及后续行写入输出文件
                outfile.write(line)
            elif not skip_lines:
                # 如果不在跳过行的状态，则继续写入输出文件
                outfile.write(line)

# 调用函数处理汇编文件
process_assembly_file('rc4.s', 'rc41.s')
