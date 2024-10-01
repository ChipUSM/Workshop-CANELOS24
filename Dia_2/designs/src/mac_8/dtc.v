module dtc (
    input wire [7:0] dtc_in,   // 8-bit input signal
    output reg dtc_out,        // Output signal
    input wire trig,           // Trigger signal
    input wire clk,            // Clock signal
    input wire rst             // Reset signal
);

    // Internal signals
    reg [7:0] s_count;         // 8-bit counter signal
    reg s_hold;                // Hold signal for state machine

    // DTC State Machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s_count <= 8'b00000000;  // Reset counter
            s_hold  <= 1'b0;         // Hold state to OFF
            dtc_out <= 1'b0;         // Reset output
        end else if (trig) begin
            s_count <= 8'b00000000;  // Reset counter
            s_hold  <= 1'b1;         // Enable state transition ON
            dtc_out <= 1'b0;         // Reset output
        end else if (s_hold == 1'b1) begin
            if (s_count < dtc_in) begin
                s_count <= s_count + 8'b00000001;  // Increment counter
                dtc_out <= 1'b1;                   // Set output to 1
            end else begin
                dtc_out <= 1'b0;  // Wait for a new operation
                s_hold  <= 1'b0;  // Disable hold state
            end
        end
    end

endmodule
