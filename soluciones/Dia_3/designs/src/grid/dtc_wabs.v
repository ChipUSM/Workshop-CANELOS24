// File dtc_wabs.vhd translated with vhd2vl 3.0 VHDL to Verilog RTL translator
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

module dtc_wabs(
input wire [7:0] din,
output wire dtc_out,
output wire din_sign,
input wire trig,
input wire clk,
input wire rst
);




wire [7:0] s_dtc_in;

  abs_dtc abs_dtc_instant(
      .din(din),
    .din_sign(din_sign),
    .dtc_in_unsigned(s_dtc_in));

  dtc dtc_instant(
      .dtc_in(s_dtc_in),
    .dtc_out(dtc_out),
    .trig(trig),
    .clk(clk),
    .rst(rst));


endmodule
