import re

def modify_verilog(input_file, output_file):
    with open(input_file, 'r') as file:
        verilog_code = file.readlines()

    modified_code = []
    inside_stereo_match = False
    inside_shd_inst = False
    inside_shd_module = False
    stereo_match_modified = False
    shd_module_modified = False

    for line in verilog_code:
        # Modify the Stereo_Match module
        if re.match(r'\s*module\s+Stereo_Match\b', line) and not stereo_match_modified:
            inside_stereo_match = True
            # Add new ports to module declaration
            modified_code.append(
                line.strip()[:-1] + ", i_FI_CONTROL_PORT, i_SI, o_SI);\n"
            )
            modified_code.append("    input [3:0] i_FI_CONTROL_PORT;\n")
            modified_code.append("    input i_SI;\n")
            modified_code.append("    output o_SI;\n\n")
            stereo_match_modified = True
            continue

        if inside_stereo_match and re.match(r'\s*shd_13_450_64_7\s+shd\b', line):
            inside_shd_inst = True
            # Modify the existing instantiation of shd_13_450_64_7
            modified_code.append(line)  # Keep the instantiation line as is
            continue

        if inside_shd_inst and re.match(r'\s*\);\s*', line):
            inside_shd_inst = False
            # Add the new port connections to the instantiation
            modified_code.insert(-1, "    .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT),\n")
            modified_code.insert(-1, "    .i_SI(i_SI),\n")
            modified_code.insert(-1, "    .o_SI(o_SI),\n")
            modified_code.append(line)  # Append the closing parenthesis
            continue

        # Modify the shd_13_450_64_7 module
        if re.match(r'\s*module\s+shd_13_450_64_7\b', line) and not shd_module_modified:
            inside_shd_module = True
            # Add new ports to module declaration
            modified_code.append(
                line.strip()[:-1] + ", i_FI_CONTROL_PORT, i_SI, o_SI);\n"
            )
            modified_code.append("    input [3:0] i_FI_CONTROL_PORT;\n")
            modified_code.append("    input i_SI;\n")
            modified_code.append("    output o_SI;\n\n")
            shd_module_modified = True
            continue

        if inside_shd_module and re.match(r'\s*endmodule\b', line):
            inside_shd_module = False

        # Append the unmodified lines
        modified_code.append(line)

    with open(output_file, 'w') as file:
        file.writelines(modified_code)

    print(f"Modified Verilog code written to {output_file}.")



def modify_verilog2(input_file, output_file):
    with open(input_file, 'r') as file:
        verilog_code = file.readlines()

    modified_code = []
    inside_shd_module = False
    inside_cmp_instance = False
    shd_module_modified = False

    for line in verilog_code:
        # Identify the start of the shd_13_450_64_7 module
        if re.match(r'\s*module\s+shd_13_450_64_7\b', line):
            inside_shd_module = True
            modified_code.append(line)
            continue

        # Identify the end of the shd_13_450_64_7 module
        if inside_shd_module and re.match(r'\s*endmodule\b', line):
            inside_shd_module = False
            modified_code.append(line)
            continue

        # Modify instances of disp_cmp_13_64_7 inside shd_13_450_64_7
        if inside_shd_module and re.match(r'\s*disp_cmp_13_64_7\s+\\?cmp:\d+\.comparador\b', line):
            inside_cmp_instance = True
            # Replace module name with disp_cmp_13_64_7_sbtr
            modified_code.append(re.sub(r'disp_cmp_13_64_7', 'disp_cmp_13_64_7_sbtr', line))
            continue

        if inside_cmp_instance:
            # Add the new port connection for i_FI_CONTROL_PORT
            if re.match(r'\s*\)\s*;\s*', line):  # Closing parenthesis of the instance
                modified_code.insert(-1, "    .i_FI_CONTROL_PORT(i_FI_CONTROL_PORT),\n")
                inside_cmp_instance = False
            modified_code.append(line)
            continue

        # Append unmodified lines
        modified_code.append(line)

    with open(output_file, 'w') as file:
        file.writelines(modified_code)

    print(f"Modified Verilog code written to {output_file}.")

def modify_verilog3(input_file, output_file):
    with open(input_file, 'r') as file:
        verilog_code = file.readlines()

    modified_code = []
    inside_shd_module = False
    inside_cmp_instance = False
    comparator_counter = 1  # Tracks the comparator index
    si_signals = []

    for line in verilog_code:
        # Detect the start of shd_13_450_64_7 module
        if re.match(r'\s*module\s+shd_13_450_64_7\b', line):
            inside_shd_module = True
            modified_code.append(line)
            continue

        # Detect the end of shd_13_450_64_7 module
        if inside_shd_module and re.match(r'\s*endmodule\b', line):
            # Add SI signal declarations before closing the module
            for i in range(1, 65):
                si_signals.append(f"    wire SI_signal_{i};\n")
            modified_code.extend(si_signals)
            inside_shd_module = False
            modified_code.append(line)
            continue

        # Modify instances of disp_cmp_13_64_7_sbtr to add SI connections
        if inside_shd_module and re.match(r'\s*disp_cmp_13_64_7_sbtr\s+\\?cmp:\d+\.comparador\b', line):
            instance_lines = []
            instance_lines.append(line)  # Keep the instance header line as is
            inside_cmp_instance = True
            continue

        if inside_cmp_instance:
            # Look for closing parenthesis of the instance
            if re.match(r'\s*\)\s*;\s*', line):
                # Add the i_SI and o_SI connections
                instance_lines.insert(-1, f"    .i_SI(SI_signal_{comparator_counter}),\n")
                instance_lines.insert(-1, f"    .o_SI(SI_signal_{comparator_counter + 1}),\n")
                modified_code.extend(instance_lines)  # Add the modified instance
                comparator_counter += 1
                inside_cmp_instance = False
            else:
                instance_lines.append(line)
            continue

        # Append unmodified lines
        modified_code.append(line)

    with open(output_file, 'w') as file:
        file.writelines(modified_code)

    print(f"Modified Verilog code written to {output_file}.")


def modify_verilog4(input_file, output_file):
    with open(input_file, 'r') as file:
        verilog_code = file.readlines()

    modified_code = []
    inside_shd_module = False
    si_connections_added = False

    for line in verilog_code:
        # Detect the start of shd_13_450_64_7 module
        if re.match(r'\s*module\s+shd_13_450_64_7\b', line):
            inside_shd_module = True
            modified_code.append(line)
            continue

        # Detect the end of shd_13_450_64_7 module
        if inside_shd_module and re.match(r'\s*endmodule\b', line):
            # Add connections for i_SI and o_SI before closing the module
            if not si_connections_added:
                modified_code.append("    assign SI_signal_1 = i_SI;\n")
                modified_code.append("    assign o_SI = SI_signal_64;\n")
                si_connections_added = True
            inside_shd_module = False
            modified_code.append(line)
            continue

        # Append unmodified lines
        modified_code.append(line)

    with open(output_file, 'w') as file:
        file.writelines(modified_code)

    print(f"Connections for i_SI and o_SI added inside shd_13_450_64_7 module. Modified Verilog code written to {output_file}.")

# Call the function with input and output file paths



input_file_path = r"C:\Users\berka\Desktop\dsadwsqadsa\Stereo_Match.v"
output_file_path = r"C:\Users\berka\Desktop\dsadwsqadsa\Stereo_Match_Modified.v"
modify_verilog(input_file_path, output_file_path)
modify_verilog2(output_file_path, output_file_path)
modify_verilog3(output_file_path, output_file_path)
modify_verilog4(output_file_path, output_file_path)