module tb_bias_and_quantize;

    // Inputs
    reg signed [17:0] dout_relu;  // Declare dout_relu as signed
    reg signed [7:0] bias;

    // Outputs
    wire [7:0] dout;

    // Intermediate wires for monitoring
    wire signed [17:0] dout_relu_signed;
    wire signed [7:0] bias_signed;

    // Instantiate the Unit Under Test (UUT)
    bias_and_quantize uut (
        .dout_relu(dout_relu),
        .bias(bias),
        .dout(dout)
    );

    // Assign signed values for display in monitor
    assign dout_relu_signed = dout_relu;
    assign bias_signed = bias;

    // Test stimulus
    initial begin
        // Open a VCD file for waveform generation
        $dumpfile("results/tb_bias_and_quantize.vcd"); // VCD output file
        $dumpvars(0, tb_bias_and_quantize);    // Dump all variables in the module

        // Monitor output
        $monitor("Time: %0d | dout_relu: %d | bias: %d | dout: %d", 
                 $time, dout_relu_signed, bias_signed, dout);

        // Test for various representative values of dout_relu
        // Exhaustively test bias for these values

        // Test with dout_relu = 65536 (Mid-range positive value)
        dout_relu = 18'sd65536;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test with dout_relu = 131071 (Max positive value for 18-bit signed)
        dout_relu = 18'sd131071;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test with dout_relu = 0 (Zero value)
        dout_relu = 18'sd0;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test with dout_relu = 18'sd1 (Small positive value)
        dout_relu = 18'sd1;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test with dout_relu = -18'sd1 (Small negative value)
        dout_relu = -18'sd1;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test with dout_relu = -131072 (Min negative value for 18-bit signed)
        dout_relu = -18'sd131072;
        for (integer i = -128; i <= 127; i = i + 1) begin
            bias = i[7:0];  // Iterate through all possible bias values
            #5;             // Wait 5 time units
        end

        // Test complete, finish simulation
        $finish;
    end

endmodule
