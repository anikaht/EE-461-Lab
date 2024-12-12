module full_circuit_tb;

    reg a, b, c;        // Input signals
    wire or_result;      // Intermediate result from the OR gate
    wire out;            // Final output from the AND gate

    // Instantiate the full circuit
    full_circuit uut (
        .out(out),
        .a(a),
        .b(b),
        .c(c)
    );

    // Initial block for stimuli and waveform
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, full_circuit_tb);

        // Monitor the intermediate OR gate result and final AND gate result
        $monitor("Time = %0t | a = %b, b = %b, c = %b | or_result = %b | out = %b", 
                 $time, a, b, c, uut.or_result, out);

        // Test cases
        a = 0; b = 0; c = 0; #10; // Expect or_result = 0, out = 0
        a = 0; b = 0; c = 1; #10; // Expect or_result = 1, out = 0
        a = 0; b = 1; c = 0; #10; // Expect or_result = 1, out = 0
        a = 0; b = 1; c = 1; #10; // Expect or_result = 1, out = 0
        a = 1; b = 0; c = 0; #10; // Expect or_result = 0, out = 0
        a = 1; b = 0; c = 1; #10; // Expect or_result = 1, out = 1
        a = 1; b = 1; c = 0; #10; // Expect or_result = 1, out = 1
        a = 1; b = 1; c = 1; #10; // Expect or_result = 1, out = 1

        $finish;
    end

endmodule





