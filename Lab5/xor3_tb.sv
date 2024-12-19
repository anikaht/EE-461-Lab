`timescale 1ns/100ps
module xor3_tb;
    reg B_i, D_i, sel_i, clock;  // Declare inputs
    wire E_o;                   // Declare output

    // Instantiate the xor3 module
    xor3 uut (
        .B_i(B_i),
        .D_i(D_i),
        .sel_i(sel_i),
        .clock(clock),
        .E_o(E_o)
    );

    // Generate a clock signal (toggle every 5 time units)
    always begin
        #5 clock = ~clock;
    end

    initial begin
        // Initialize signals
        clock = 0;
        B_i = 0;
        D_i = 0;
        sel_i = 0;

        // Monitor the signals
        $monitor($time, " B_i=%b, D_i=%b, sel_i=%b, clock=%b, E_o=%b", B_i, D_i, sel_i, clock, E_o);

        // Test Case 1: sel_i = 0, D_i + B_i = 0
        #10 B_i = 0; D_i = 0; sel_i = 0; // Expected E_o = 0
        #10 B_i = 1; D_i = 0; sel_i = 0; // Expected E_o = 1
        #10 B_i = 1; D_i = 1; sel_i = 0; // Expected E_o = 0 (carry ignored)

        // Test Case 2: sel_i = 1, Output = B_i
        #10 B_i = 0; D_i = 1; sel_i = 1; // Expected E_o = 0
        #10 B_i = 1; D_i = 0; sel_i = 1; // Expected E_o = 1

        // End simulation
        #50 $finish;
    end
endmodule
