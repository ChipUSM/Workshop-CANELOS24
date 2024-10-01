// File tac_signed_wxor.vhd translated with vhd2vl 3.0 VHDL to Verilog RTL translator
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

module tac_signed_wxor(
input wire [7:0] tac_w,
input wire tac_in,
output wire [11:0] tac_lsb,
output wire [5:0] tac_msb,
input wire sign_x,
input wire sign_w,
input wire clk,
input wire rst
);




reg [11:0] s_count_lsb;
reg [5:0] s_count_msb;
wire s_sign;

  assign s_sign =  ~(sign_x ^ sign_w);
  // TAC State Machine
  always @(posedge clk, posedge rst) begin : P1
    reg [11:0] s_step_size;
    reg [12:0] s_count_buf;

    if(rst == 1'b1) begin
      s_count_lsb <= 12'b000000000000;
      s_count_msb <= 6'b000000;
    end else begin
      if(tac_in == 1'b1) begin
        // Setting Step Size
        s_step_size = {4'd0, tac_w};
        // Positive Accumlation
        if(s_sign == 1'b1) begin
          s_count_buf = ({1'b0,s_count_lsb}) + ({1'b0,s_step_size});
          s_count_lsb <= s_count_buf[11:0];
          if(s_count_buf[12] == 1'b1) begin
            s_count_msb <= s_count_msb + 6'b000001;
          end
          else begin
            s_count_msb <= s_count_msb;
          end
        end
        else begin
          s_count_buf = ({1'b0,s_count_lsb}) - ({1'b0,s_step_size});
          s_count_lsb <= s_count_buf[11:0];
          if(s_count_buf[12] == 1'b1) begin
            s_count_msb <= s_count_msb - 6'b000001;
          end
          else begin
            s_count_msb <= s_count_msb;
          end
        end
      end
    end
  end

  assign tac_lsb = s_count_lsb;
  assign tac_msb = s_count_msb;

endmodule
