module tb_dtc;

    // Inputs
    reg [7:0] dtc_in;
    reg trig;
    reg clk;
    reg rst;

    // Outputs
    wire dtc_out;

    // Instantiate the Unit Under Test (UUT)
    dtc uut (
        .dtc_in(dtc_in),
        .dtc_out(dtc_out),
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
        $dumpfile("results/tb_dtc.vcd");
        $dumpvars(0, tb_dtc);

        // Monitor output changes
        $monitor("Time: %0d | dtc_in: %d | trig: %b | dtc_out: %b", 
                 $time, dtc_in, trig, dtc_out);

        // Start by applying reset
        rst = 1;
        trig = 0;
        dtc_in = 8'd0;  // Default value
        #10;

        // Remove reset
        rst = 0;
        #10;

        // Test 1: Small dtc_in value (e.g., dtc_in = 5)
        dtc_in = 8'd5;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger

        // Wait for the module to complete counting
        wait (dtc_out === 0);
        #60;

        // Test 2: Larger dtc_in value (e.g., dtc_in = 50)
        dtc_in = 8'd50;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger

        // Wait for the module to complete counting
        wait (dtc_out == 0);
        #520;

        // Test 3: Maximum dtc_in value (dtc_in = 255)
        dtc_in = 8'd255;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger

        // Wait for the module to complete counting
        wait (dtc_out == 0);
        #2570;

        // Test 4: Reset the module while counting
        dtc_in = 8'd100;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger
        #50
        #50 rst = 1;  // Apply reset during counting
        #10 rst = 0;  // Remove reset

        // Test 5: Edge case with dtc_in = 0
        dtc_in = 8'd0;
        trig = 1;  // Trigger the DTC
        #10 trig = 0;  // Deactivate trigger
        #100

        // Wait for the module to complete counting
        wait (dtc_out == 0);
        #20;

        // Stop simulation
        $finish;
    end

endmodule
