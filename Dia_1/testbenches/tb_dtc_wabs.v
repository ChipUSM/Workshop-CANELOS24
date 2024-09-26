module tb_dtc_wabs;

    // Inputs
    reg [7:0] din;
    reg trig;
    reg clk;
    reg rst;

    // Outputs
    wire dtc_out;
    wire din_sign;

    // Instantiate the Unit Under Test (UUT)
    dtc_wabs uut (
        .din(din),
        .dtc_out(dtc_out),
        .din_sign(din_sign),
        .trig(trig),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end

    // Test stimulus
    initial begin
        // Open VCD file for waveform viewing
        $dumpfile("results/tb_dtc_wabs.vcd");
        $dumpvars(0, tb_dtc_wabs);

        // Monitor output changes
        $monitor("Time: %0d | din: %d | din_sign: %b | dtc_out: %b", 
                 $time, din, din_sign, dtc_out);

        // Apply reset
        rst = 1;
        trig = 0;
        din = 8'b00000000;  // Initialize din to 0
        #10;

        // Remove reset
        rst = 0;
        #10;

        // Test 1: Check with din = 50
        din = 8'd50;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger

        // Wait for module to process
        #600;

        // Test 2: Check with din = -50 (two's complement representation)
        din = -8'd50;  // Input is -50
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger

        // Wait for module to process
        #600;

        // Test 3: Apply reset during operation
        din = 8'd100;
        trig = 1;
        #10 trig = 0;
        #50 rst = 1;  // Apply reset during operation
        #10 rst = 0;  // Remove reset

        // Test 4: Test with maximum positive din
        din = 8'd255;
        trig = 1;
        #10 trig = 0;

        // Wait for module to process
        #100;

        // Test 5: Test with din = 0 (no action should happen)
        din = 8'd0;
        trig = 1;
        #10 trig = 0;

        // Wait for module to process
        #50;

        // Test complete, stop simulation
        $finish;
    end

endmodule
