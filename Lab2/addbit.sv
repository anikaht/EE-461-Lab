module addbit (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin; // XOR for sum
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry logic
endmodule

module adder_hier(
    input [3:0] r1_i, r2_i,  // 4-bit inputs to be added
    input ci_i,              // Carry-in
    output [3:0] result_o,   // 4-bit sum output
    output carry_o           // Final carry-out
);

    // Internal wires for carry propagation
    wire c1_w, c2_w, c3_w;

    // Instantiate the 1-bit adders
    addbit u0 (.a(r1_i[0]), .b(r2_i[0]), .cin(ci_i), .sum(result_o[0]), .cout(c1_w));
    addbit u1 (.a(r1_i[1]), .b(r2_i[1]), .cin(c1_w), .sum(result_o[1]), .cout(c2_w));
    addbit u2 (.a(r1_i[2]), .b(r2_i[2]), .cin(c2_w), .sum(result_o[2]), .cout(c3_w));
    addbit u3 (.a(r1_i[3]), .b(r2_i[3]), .cin(c3_w), .sum(result_o[3]), .cout(carry_o));

endmodule