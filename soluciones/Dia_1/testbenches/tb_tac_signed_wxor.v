module tb_tac_signed_wxor;

    // Inputs
    reg [7:0] tac_w;
    reg tac_in;
    reg sign_x;
    reg sign_w;
    reg clk;
    reg rst;

    // Outputs
    wire [11:0] tac_lsb;
    wire [5:0] tac_msb;

    // Instantiate the Unit Under Test (UUT)
    tac_signed_wxor uut (
        .tac_w(tac_w),
        .tac_in(tac_in),
        .sign_x(sign_x),
        .sign_w(sign_w),
        .clk(clk),
        .rst(rst),
        .tac_lsb(tac_lsb),
        .tac_msb(tac_msb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Open VCD file for waveform viewing
        $dumpfile("results/tb_tac_signed_wxor.vcd");
        $dumpvars(0, tb_tac_signed_wxor);

        // Initialize inputs
        rst = 1;  // Start with reset active
        tac_in = 0;
        tac_w = 8'd0;  // Default step size
        sign_x = 1'b0;
        sign_w = 1'b0;
        #20 rst = 0;  // Release reset

        // Test 1: Positive step size incrementing
        tac_w = 8'd5;  // Step size of 5
        tac_in = 1'b1;
        sign_x = 1'b1;  // Positive accumulation
        sign_w = 1'b1;
        #50 tac_in = 0;  // Let it accumulate for a while

        // Test 2: Negative step size decrementing
        tac_w = 8'd3;  // Step size of 3
        tac_in = 1'b1;
        sign_x = 1'b1;  // Negative accumulation (sign_w XOR sign_x = 0)
        sign_w = 1'b0;
        #50 tac_in = 0;

        // Test 3: Large step size with positive accumulation
        tac_w = 8'd255;  // Maximum step size
        tac_in = 1'b1;
        sign_x = 1'b1;  // Positive accumulation
        sign_w = 1'b1;
        #50 tac_in = 0;

        // Test 4: Reset while accumulating
        tac_w = 8'd100;  // Some arbitrary step size
        tac_in = 1'b1;
        sign_x = 1'b1;  // Positive accumulation
        sign_w = 1'b1;
        #30 rst = 1;  // Assert reset during operation
        #10 rst = 0;  // Release reset
        #50 tac_in = 0;

        // Test 5: Negative accumulation after reset
        tac_w = 8'd1;  // Small step size
        tac_in = 1'b1;
        sign_x = 1'b0;  // Negative accumulation (sign_w XOR sign_x = 0)
        sign_w = 1'b1;
        #50 tac_in = 0;

        // Test 6: Edge case - Step size of 0 (no change should happen)
        tac_w = 8'd0;  // Step size of 0
        tac_in = 1'b1;
        sign_x = 1'b1;  // Positive accumulation
        sign_w = 1'b1;
        #50 tac_in = 0;

        // Finish the simulation
        $finish;
    end

endmodule
