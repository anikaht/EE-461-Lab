module tb_gates_always();

    // Inputs
    reg [1:0] a, b;  // 2-bit inputs
    reg in;          // Single-bit input for NOT gate

    // Outputs
    wire [1:0] y_and, y_or, y_nand, y_nor, y_xor, y_xnor; // 2-bit outputs
    wire y_not;                                           // Single-bit output

    // Instantiate the `always` block modules
    not_gate_always     U1 (.a(in), .y(y_not));
    and_gate_always     U2 (.a(a), .b(b), .y(y_and));
    or_gate_always      U3 (.a(a), .b(b), .y(y_or));
    nand_gate_always    U4 (.a(a), .b(b), .y(y_nand));
    nor_gate_always     U5 (.a(a), .b(b), .y(y_nor));
    xor_gate_always     U6 (.a(a), .b(b), .y(y_xor));
    xnor_gate_always    U7 (.a(a), .b(b), .y(y_xnor));

    // Stimulus block
    initial begin
        $monitor("Time: %0d | a: %b | b: %b | in: %b | NOT: %b | AND: %b | OR: %b | NAND: %b | NOR: %b | XOR: %b | XNOR: %b",
                 $time, a, b, in, y_not, y_and, y_or, y_nand, y_nor, y_xor, y_xnor);

        // Test cases
        a = 2'b00; b = 2'b00; in = 1'b0; #10; // Test 1
        a = 2'b01; b = 2'b01; in = 1'b1; #10; // Test 2
        a = 2'b10; b = 2'b10; in = 1'b0; #10; // Test 3
        a = 2'b11; b = 2'b11; in = 1'b1; #10; // Test 4

        $finish; // End simulation
    end

    // Dump waveform data to a .vcd file for GTKWave or EPWave
    initial begin
        $dumpfile("gates_always.vcd"); // Name of the waveform file
        $dumpvars(0, tb_gates_always); // Dump all variables in this scope
    end

endmodule