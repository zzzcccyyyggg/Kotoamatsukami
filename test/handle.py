import re

def modify_s_file(input_filename, output_filename):
    with open(input_filename, 'r') as f:
        lines = f.readlines()

    modified_lines = []
    skip_lines = 0

    # Regular expressions for matching specific patterns
    bl_conditional_jump_func_pattern = re.compile(r'^\s*b\s+ConditionalJumpFunc_byX10\s*$')
    bl_func1_pattern = re.compile(r'^\s*bl\s+func1\s*$')

    for i, line in enumerate(lines):
        # Check for the exact 'bl ConditionalJumpFunc_byX10' pattern
        if bl_conditional_jump_func_pattern.match(line):
            # Replace 'bl' with 'b'
            modified_lines.append(line.replace('bl', 'b', 1))
            # Start skipping the next 3 non-empty lines
            skip_lines = 2
        # Check for the exact 'bl func1' pattern
        elif bl_func1_pattern.match(line):
            # Replace 'bl' with 'b'
            modified_lines.append(line.replace('bl', 'b', 1))
            # No need to skip lines in this case
        elif skip_lines > 0:
            # Skip non-empty lines only
            if line.strip():
                skip_lines -= 1
        else:
            # Otherwise, keep the line
            modified_lines.append(line)

    # Write the modified lines to the output file
    with open(output_filename, 'w') as f:
        f.writelines(modified_lines)

# Usage example
modify_s_file('in.s', 'output.s')
