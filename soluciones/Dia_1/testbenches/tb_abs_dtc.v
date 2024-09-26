module tb_abs_dtc;

    // Inputs
    reg [7:0] din;

    // Outputs
    wire din_sign;
    wire [7:0] dtc_in_unsigned;

    // Create an intermediate wire for signed display
    wire signed [7:0] din_signed;

    // Instantiate the Unit Under Test (UUT)
    abs_dtc uut (
        .din(din),
        .din_sign(din_sign),
        .dtc_in_unsigned(dtc_in_unsigned)
    );

    // Assign the signed version of din
    assign din_signed = $signed(din);

    // Test stimulus
    initial begin
        // Open a VCD file for waveform generation
        $dumpfile("results/tb_abs_dtc.vcd"); // VCD output file
        $dumpvars(0, tb_abs_dtc);    // Dump all variables in the module
        // Monitor changes
        $monitor("Time: %0d | din: %d | dtc_in_unsigned: %d | din_sign: %b", 
                 $time, din_signed, dtc_in_unsigned, din_sign);

        // Exhaustive testing: iterate through all 8-bit values
        for (integer i = -128; i <= 127; i = i + 1) begin
            din = i[7:0]; // Assigning each value of i to din
            #5; // Wait 5 time units before the next iteration
        end

        // Stop simulation after the test completes
        $finish;
    end

endmodule
