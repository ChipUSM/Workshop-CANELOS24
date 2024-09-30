// File bias_and_quantize.vhd translated with vhd2vl 3.0 VHDL to Verilog RTL translator
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

module bias_and_quantize(
input wire [17:0] dout_relu,
input wire [7:0] bias,
output wire [7:0] dout
);




reg [17:0] s_dout;
wire [7:0] s_abias;

  // Absolute Value of Bias
  assign s_abias = ( ( $signed(bias) < 0 ) ? -$signed(bias) : bias );
  always @(dout_relu, bias) begin
    if(bias == 8'b00000000) begin
      s_dout <= dout_relu;
    end
    else begin
      // -ve Bias
      if(bias[7] == 1'b1) begin
        s_dout <= (dout_relu) + ({10'b1111111111,s_abias});
        // +ve Bias
      end
      else begin
        s_dout <= (dout_relu) + ({10'b0000000000,s_abias});
      end
    end
  end

  // Bit Quantization
  assign dout = s_dout >> 10;

endmodule
