module tb_gates_continuous();

    // Inputs
    reg [1:0] a, b;  // 2-bit inputs
    reg in;          // Single-bit input for NOT gate

    // Outputs
    wire [1:0] y_and, y_or, y_nand, y_nor, y_xor, y_xnor; // 2-bit outputs
    wire y_not;                                           // Single-bit output

    // Instantiate continuous assignment modules
    not_gate_continuous     U1 (.a(in), .y(y_not));
    and_gate_continuous     U2 (.a(a), .b(b), .y(y_and));
    or_gate_continuous      U3 (.a(a), .b(b), .y(y_or));
    nand_gate_continuous    U4 (.a(a), .b(b), .y(y_nand));
    nor_gate_continuous     U5 (.a(a), .b(b), .y(y_nor));
    xor_gate_continuous     U6 (.a(a), .b(b), .y(y_xor));
    xnor_gate_continuous    U7 (.a(a), .b(b), .y(y_xnor));

    // Clock not required (combinational logic), directly apply inputs
    initial begin
        // Monitor output values
        $monitor("Time: %0d | a: %b | b: %b | in: %b | NOT: %b | AND: %b | OR: %b | NAND: %b | NOR: %b | XOR: %b | XNOR: %b",
                 $time, a, b, in, y_not, y_and, y_or, y_nand, y_nor, y_xor, y_xnor);

        // Test cases
        a = 2'b00; b = 2'b00; in = 1'b0; #10; // Test 1
        a = 2'b01; b = 2'b01; in = 1'b1; #10; // Test 2
        a = 2'b10; b = 2'b10; in = 1'b0; #10; // Test 3
        a = 2'b11; b = 2'b11; in = 1'b1; #10; // Test 4

        $finish; // End simulation
    end

    // Dump waveform data to a .vcd file for GTKWave
    initial begin
        $dumpfile("gates_continuous.vcd"); // Name of the waveform dump file
        $dumpvars(0, tb_gates_continuous); // Dump all signals in this scope
    end

endmodule
