// File neuron_wxor.vhd translated with vhd2vl 3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001-2023 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2023 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// no timescale needed

module neuron_wxor(
input wire tac_in,
input wire sign_x,
input wire sign_w,
input wire [7:0] win,
input wire [7:0] bias,
output wire [7:0] dout,
input wire clk,
input wire rst
);




wire [11:0] s_tac_lsb;
wire [5:0] s_tac_msb;
wire [17:0] s_dout_relu;

  tac_signed_wxor tac_instant(
      .tac_w(win),
    .tac_in(tac_in),
    .tac_lsb(s_tac_lsb),
    .tac_msb(s_tac_msb),
    .sign_x(sign_x),
    .sign_w(sign_w),
    .clk(clk),
    .rst(rst));

  relu relu_instant(
      .dout_msb(s_tac_msb),
    .dout_lsb(s_tac_lsb),
    .dout_relu(s_dout_relu));

  bias_and_quantize bias_instant(
      .dout_relu(s_dout_relu),
    .bias(bias),
    .dout(dout));


endmodule
