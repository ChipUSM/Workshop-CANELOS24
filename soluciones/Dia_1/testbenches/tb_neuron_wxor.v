module tb_neuron_wxor;

    // Inputs
    reg tac_in;
    reg sign_x;
    reg sign_w;
    reg [7:0] win;
    reg [7:0] bias;
    reg clk;
    reg rst;

    // Outputs
    wire [7:0] dout;

    // Instantiate the Unit Under Test (UUT)
    neuron_wxor uut (
        .tac_in(tac_in),
        .sign_x(sign_x),
        .sign_w(sign_w),
        .win(win),
        .bias(bias),
        .dout(dout),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end

    // Test stimulus
    initial begin
        // Open VCD file for waveform viewing
        $dumpfile("tb_neuron_wxor.vcd");
        $dumpvars(0, tb_neuron_wxor);

        // Monitor output
        $monitor("Time: %0d | tac_in: %b | sign_x: %b | sign_w: %b | win: %d | bias: %d | dout: %d",
                 $time, tac_in, sign_x, sign_w, win, bias, dout);

        // Initialize inputs
        rst = 1;
        tac_in = 0;
        sign_x = 0;
        sign_w = 0;
        win = 8'd0;
        bias = 8'd0;
        #20 rst = 0;  // Release reset

        // Test 1: Large step size with positive signs and large bias
        tac_in = 1'b1;  // Trigger input
        win = 8'd150;   // Large weight input
        sign_x = 1'b1;  // Positive sign_x
        sign_w = 1'b1;  // Positive sign_w
        bias = 8'd100;  // Large bias input
        #50;

        // Test 2: Large step size with mixed signs and large bias
        tac_in = 1'b1;
        win = 8'd200;   // Larger weight input
        sign_x = 1'b1;
        sign_w = 1'b0;  // Negative due to XOR of signs
        bias = 8'd120;  // Large bias
        #50;

        // Test 3: Maximum step size and maximum bias
        tac_in = 1'b1;
        win = 8'd255;   // Maximum weight
        sign_x = 1'b1;
        sign_w = 1'b1;  // Positive due to XOR
        bias = 8'd255;  // Maximum bias
        #50;

        // Test 4: Reset during operation with large values
        tac_in = 1'b1;
        win = 8'd180;   // Arbitrary large weight
        sign_x = 1'b1;
        sign_w = 1'b1;
        bias = 8'd200;  // Large bias
        #30 rst = 1;    // Apply reset
        #10 rst = 0;    #50;

        // Test 5: Step size of zero but large bias
        tac_in = 1'b1;
        win = 8'd0;     // Zero weight input
        sign_x = 1'b1;
        sign_w = 1'b1;
        bias = 8'd150;  // Large bias
        #50;

        // Test 6: Medium step size with no bias
        tac_in = 1'b1;
        win = 8'd100;   // Medium weight
        sign_x = 1'b1;
        sign_w = 1'b1;
        bias = 8'd0;    // No bias
        #50;

        // Test complete, stop simulation
        $finish;
    end

endmodule
