`default_nettype none

module ihp_top (
    inout [13:0] chip_in_PAD,
    inout [13:0] chip_out_PAD,
    inout [13:0] chip_inout_PAD,
    inout clk_PAD,
    inout rst_n_PAD,
    inout loopback_in_PAD,
    inout loopback_out_PAD,
);

  wire [13:0] chip_in;
  wire [13:0] chip_out;
  wire [13:0] chip_io_i;
  wire [13:0] chip_io_o;
  wire [13:0] chip_oe;
  wire clk;
  wire rst_n;
  wire loopback;

  /* inputs */
  sg13g2_IOPadIn sg13g2_chip_in_0 (
      .p2c(chip_in[0]),
      .pad({chip_in_PAD[0]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_1 (
      .p2c(chip_in[1]),
      .pad({chip_in_PAD[1]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_2 (
      .p2c(chip_in[2]),
      .pad({chip_in_PAD[2]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_3 (
      .p2c(chip_in[3]),
      .pad({chip_in_PAD[3]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_4 (
      .p2c(chip_in[4]),
      .pad({chip_in_PAD[4]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_5 (
      .p2c(chip_in[5]),
      .pad({chip_in_PAD[5]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_6 (
      .p2c(chip_in[6]),
      .pad({chip_in_PAD[6]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_7 (
      .p2c(chip_in[7]),
      .pad({chip_in_PAD[7]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_8 (
      .p2c(chip_in[8]),
      .pad({chip_in_PAD[8]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_9 (
      .p2c(chip_in[9]),
      .pad({chip_in_PAD[9]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_10 (
      .p2c(chip_in[10]),
      .pad({chip_in_PAD[10]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_11 (
      .p2c(chip_in[11]),
      .pad({chip_in_PAD[11]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_12 (
      .p2c(chip_in[12]),
      .pad({chip_in_PAD[12]})
  );
  sg13g2_IOPadIn sg13g2_chip_in_13 (
      .p2c(chip_in[13]),
      .pad({chip_in_PAD[13]})
  );

  sg13g2_IOPadIn sg13g2_clk (
      .p2c(clk),
      .pad({clk_PAD})
  );
  sg13g2_IOPadIn sg13g2_rst_n (
      .p2c(rst_n),
      .pad(rst_n_PAD)
  );

  sg13g2_IOPadIn sg13g2_loopback_in (
      .p2c(loopback),
      .pad({loopback_in_PAD})
  );

  /* bidirectional outputs */
  sg13g2_IOPadInOut4mA sg13g2_chipio_0 (
      .c2p   (chip_io_o[0]),
      .c2p_en(chip_oe[0]),
      .p2c   (chip_io_i[0]),
      .pad   (chip_inout_PAD[0])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_1 (
      .c2p   (chip_io_o[1]),
      .c2p_en(chip_oe[1]),
      .p2c   (chip_io_i[1]),
      .pad   (chip_inout_PAD[1])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_2 (
      .c2p   (chip_io_o[2]),
      .c2p_en(chip_oe[2]),
      .p2c   (chip_io_i[2]),
      .pad   (chip_inout_PAD[2])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_3 (
      .c2p   (chip_io_o[3]),
      .c2p_en(chip_oe[3]),
      .p2c   (chip_io_i[3]),
      .pad   (chip_inout_PAD[3])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_4 (
      .c2p   (chip_io_o[4]),
      .c2p_en(chip_oe[4]),
      .p2c   (chip_io_i[4]),
      .pad   (chip_inout_PAD[4])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_5 (
      .c2p   (chip_io_o[5]),
      .c2p_en(chip_oe[5]),
      .p2c   (chip_io_i[5]),
      .pad   (chip_inout_PAD[5])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_6 (
      .c2p   (chip_io_o[6]),
      .c2p_en(chip_oe[6]),
      .p2c   (chip_io_i[6]),
      .pad   (chip_inout_PAD[6])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_7 (
      .c2p   (chip_io_o[7]),
      .c2p_en(chip_oe[7]),
      .p2c   (chip_io_i[7]),
      .pad   (chip_inout_PAD[7])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_8 (
      .c2p   (chip_io_o[8]),
      .c2p_en(chip_oe[8]),
      .p2c   (chip_io_i[8]),
      .pad   (chip_inout_PAD[8])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_9 (
      .c2p   (chip_io_o[9]),
      .c2p_en(chip_oe[9]),
      .p2c   (chip_io_i[9]),
      .pad   (chip_inout_PAD[9])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_10 (
      .c2p   (chip_io_o[10]),
      .c2p_en(chip_oe[10]),
      .p2c   (chip_io_i[10]),
      .pad   (chip_inout_PAD[10])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_11 (
      .c2p   (chip_io_o[11]),
      .c2p_en(chip_oe[11]),
      .p2c   (chip_io_i[11]),
      .pad   (chip_inout_PAD[11])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_12 (
      .c2p   (chip_io_o[12]),
      .c2p_en(chip_oe[12]),
      .p2c   (chip_io_i[12]),
      .pad   (chip_inout_PAD[12])
  );

  sg13g2_IOPadInOut4mA sg13g2_chipio_13 (
      .c2p   (chip_io_o[13]),
      .c2p_en(chip_oe[13]),
      .p2c   (chip_io_i[13]),
      .pad   (chip_inout_PAD[13])
  );


  /* outputs */
 sg13g2_IOPadOut4mA sg13g2_chip_out_0 (
      .c2p(chip_out[0]),
      .pad(chip_out_PAD[0])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_1 (
      .c2p(chip_out[1]),
      .pad(chip_out_PAD[1])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_2 (
      .c2p(chip_out[2]),
      .pad(chip_out_PAD[2])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_3 (
      .c2p(chip_out[3]),
      .pad(chip_out_PAD[3])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_4 (
      .c2p(chip_out[4]),
      .pad(chip_out_PAD[4])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_5 (
      .c2p(chip_out[5]),
      .pad(chip_out_PAD[5])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_6 (
      .c2p(chip_out[6]),
      .pad(chip_out_PAD[6])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_7 (
      .c2p(chip_out[7]),
      .pad(chip_out_PAD[7])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_8 (
      .c2p(chip_out[8]),
      .pad(chip_out_PAD[8])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_9 (
      .c2p(chip_out[9]),
      .pad(chip_out_PAD[9])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_10 (
      .c2p(chip_out[10]),
      .pad(chip_out_PAD[10])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_11 (
      .c2p(chip_out[11]),
      .pad(chip_out_PAD[11])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_12 (
      .c2p(chip_out[12]),
      .pad(chip_out_PAD[12])
  );

 sg13g2_IOPadOut4mA sg13g2_chip_out_13 (
      .c2p(chip_out[13]),
      .pad(chip_out_PAD[13])
  );


  sg13g2_IOPadOut4mA sg13g2_loopback_out (
      .c2p(loopback),
      .pad({loopback_out_PAD})
  );




assign chip_out = out_reg;

reg [13:0] out_reg;

always@(posedge clk) begin 
  if(rst_n == 1)
    out_reg <= 0;
  else
    out_reg <= chip_in;
end 




endmodule
