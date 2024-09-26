# abs_dtc:
echo 'starting abs_dtc Verification'
iverilog -o results/abs_dtc src/abs_dtc.v testbenches/tb_abs_dtc.v
vvp results/abs_dtc > results/abs_dtc.log
echo 'abs_dtc Verification ended'

# dtc.v

echo 'starting dtc Verification'
iverilog -o results/dtc src/dtc.v testbenches/tb_dtc.v
vvp results/dtc > results/dtc.log
echo 'dtc Verification ended'

# dtc_wabs

echo 'starting dtc_wabs Verification'
iverilog -o results/dtc_wabs src/dtc_wabs.v src/dtc.v src/abs_dtc.v testbenches/tb_dtc_wabs.v
vvp results/dtc_wabs > results/dtc_wabs.log
echo 'dtc_wabs Verification ended'

# bias and quantizes

echo 'starting bias_and_quantize'
iverilog -o results/bias_and_quantize src/bias_and_quantize.v testbenches/tb_bias_and_quantizes.v
vvp results/bias_and_quantize > results/bias_and_quantize.log
echo 'bias_and_quantize verification ended'

# relu 

echo 'starting relu verification'
iverilog -o results/relu src/relu.v testbenches/tb_relu.v 
vvp results/relu > results/relu.log
echo 'relu verification ended'

# tac_signed_wxor 

echo 'starting tac_signed_wxor verification'
iverilog -o results/tac_signed_wxor src/tac_signed_wxor.v testbenches/tb_tac_signed_wxor.v
vvp results/tac_signed_wxor > results/tac_signed_wxor.log
echo 'tac_signed_wxor verification ended' 

# neuron_wxor

echo 'starting neuron_wxor verification'
iverilog -o results/neuron_wxor src/neuron_wxor.v src/tac_signed_wxor.v src/relu.v src/bias_and_quantize.v testbenches/tb_neuron_wxor.v
vvp results/neuron_wxor > results/neuron_wxor.log
echo 'neuron_wxor verification ended' 

# grid

echo 'starting grid verification'
iverilog -o results/grid src/grid.v src/neuron_wxor.v src/tac_signed_wxor.v src/relu.v src/bias_and_quantize.v src/dtc_wabs.v src/abs_dtc.v src/dtc.v testbenches/tb_grid.v
vvp results/grid > results/grid.log
echo 'grid verification ended'  

##
# gtkwave results/$FILE.vcd