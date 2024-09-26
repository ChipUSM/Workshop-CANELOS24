module tb_relu;

    // Inputs
    reg [5:0] dout_msb;
    reg [11:0] dout_lsb;

    // Outputs
    wire [17:0] dout_relu;

    // Instantiate the Unit Under Test (UUT)
    relu uut (
        .dout_msb(dout_msb),
        .dout_lsb(dout_lsb),
        .dout_relu(dout_relu)
    );

    // Test stimulus
    initial begin
        // Open VCD file for waveform viewing
        $dumpfile("results/tb_relu.vcd");
        $dumpvars(0, tb_relu);

        // Monitor output
        $monitor("Time: %0d | dout_msb: %b | dout_lsb: %b | dout_relu: %b",
                 $time, dout_msb, dout_lsb, dout_relu);

        // Test 1: Positive number (MSB is positive)
        dout_msb = 6'b000001;  // Positive MSB
        dout_lsb = 12'b000000000001;  // Small positive LSB
        #10;

        // Test 2: Positive number with large LSB
        dout_msb = 6'b000001;  // Positive MSB
        dout_lsb = 12'b111111111111;  // Large positive LSB
        #10;

        // Test 3: Negative number (MSB is negative)
        dout_msb = 6'b100001;  // Negative MSB
        dout_lsb = 12'b000000000001;  // LSB
        #10;

        // Test 4: Zero value
        dout_msb = 6'b000000;  // Zero MSB
        dout_lsb = 12'b000000000000;  // Zero LSB
        #10;

        // Test 5: Maximum positive value
        dout_msb = 6'b011111;  // Max positive MSB
        dout_lsb = 12'b111111111111;  // Max LSB
        #10;

        // Test 6: Maximum negative value (should result in zero output)
        dout_msb = 6'b111111;  // Max negative MSB
        dout_lsb = 12'b111111111111;  // Max LSB
        #10;

        // Test 7: Small negative value (should result in zero output)
        dout_msb = 6'b100000;  // Negative MSB
        dout_lsb = 12'b000000000001;  // Small LSB
        #10;

        // Test complete, stop simulation
        $finish;
    end

endmodule
