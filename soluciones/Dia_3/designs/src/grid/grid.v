module grid (
    input [7:0] din,
    input [7:0] sign,  // Single 8-bit vector
    input [7:0] win0, win1, win2, win3, win4, win5, win6, win7,  // Individual inputs for win
    input [7:0] bias0, bias1, bias2, bias3, bias4, bias5, bias6, bias7,  // Individual inputs for bias
    output [7:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7,  // Individual outputs
    input trig,
    input clk,
    input rst
);

    wire s_dtc_out;
    wire s_sign_x;

    // Instantiate dtc_wabs
    dtc_wabs dtc_instant (
        .din(din),
        .dtc_out(s_dtc_out),
        .din_sign(s_sign_x),
        .trig(trig),
        .clk(clk),
        .rst(rst)
    );

    // Instantiate neuron_wxor for each of the 8 instances, passing individual signals
    neuron_wxor neuron_instant_0 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[7]),  // LSB of sign vector
        .win(win0),
        .bias(bias0),
        .dout(dout0),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_1 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[6]),  // 2nd bit of sign vector
        .win(win1),
        .bias(bias1),
        .dout(dout1),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_2 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[5]),  // 3rd bit of sign vector
        .win(win2),
        .bias(bias2),
        .dout(dout2),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_3 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[4]),  // 4th bit of sign vector
        .win(win3),
        .bias(bias3),
        .dout(dout3),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_4 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[3]),  // 5th bit of sign vector
        .win(win4),
        .bias(bias4),
        .dout(dout4),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_5 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[2]),  // 6th bit of sign vector
        .win(win5),
        .bias(bias5),
        .dout(dout5),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_6 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[1]),  // 7th bit of sign vector
        .win(win6),
        .bias(bias6),
        .dout(dout6),
        .clk(clk),
        .rst(rst)
    );

    neuron_wxor neuron_instant_7 (
        .tac_in(s_dtc_out),
        .sign_x(s_sign_x),
        .sign_w(sign[0]),  // 8th bit of sign vector
        .win(win7),
        .bias(bias7),
        .dout(dout7),
        .clk(clk),
        .rst(rst)
    );

endmodule
