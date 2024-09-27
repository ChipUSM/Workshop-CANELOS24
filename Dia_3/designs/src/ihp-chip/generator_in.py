
def generate_verilog_code(N):
    template = '''  sg13g2_IOPadIn sg13g2_chip_in_{0} (
      .p2c(chip_in[{0}]),
      .pad({{chip_in_PAD[{0}]}})
  );
'''
    verilog_code = ""
    for i in range(N):
        verilog_code += template.format(i)
    
    return verilog_code

# Specify the value of N
N = 14  # Example: Generates code for XX = 0 to 9

# Generate the Verilog code
verilog_code = generate_verilog_code(N)

# Specify the output file path
output_file_path = 'verilog_inputs.txt'

# Write the generated Verilog code to the text file
with open(output_file_path, 'w') as file:
    file.write(verilog_code)

print(f"Verilog code has been written to {output_file_path}")
