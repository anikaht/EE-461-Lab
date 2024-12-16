module tb_adder_hier();

    reg [3:0] r1_r, r2_r;    // 4-bit inputs for the adder
    reg ci_r;                // Carry-in
    wire [3:0] result_w;     // Sum output
    wire carry_w;            // Carry-out

    // Instantiate the adder_hier module
    adder_hier UUT (
        .r1_i(r1_r), 
        .r2_i(r2_r), 
        .ci_i(ci_r), 
        .result_o(result_w), 
        .carry_o(carry_w)
    );

    // Stimulus block
    initial begin
        // Initialize inputs
        r1_r = 4'b0000; r2_r = 4'b0000; ci_r = 1'b0;
        #10 r1_r = 4'b1010; r2_r = 4'b0010; ci_r = 1'b1; // Add 10 + 2 + 1
        #10 r1_r = 4'b1111; r2_r = 4'b1111; ci_r = 1'b0; // Add 15 + 15
        #10 r1_r = 4'b0101; r2_r = 4'b1010; ci_r = 1'b0; // Add 5 + 10
        #10 $finish;                                    // End simulation
    end

    // Monitor results
    initial begin
        $monitor("Time: %0d | r1: %b | r2: %b | cin: %b | sum: %b | cout: %b", 
                 $time, r1_r, r2_r, ci_r, result_w, carry_w);
    end

endmodule
