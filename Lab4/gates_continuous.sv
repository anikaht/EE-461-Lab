//1
module not_gate_continuous(
    input a,
    output y
);
    assign y = ~a; // NOT operation
endmodule


//2
module and_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = a & b; // 2-bit AND operation
endmodule

//3
module or_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = a | b; // 2-bit OR operation
endmodule

//4
module nand_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = ~(a & b); // 2-bit NAND operation
endmodule


//5
module nor_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = ~(a | b); // 2-bit NOR operation
endmodule


//6
module xor_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = a ^ b; // 2-bit XOR operation
endmodule


//7
module xnor_gate_continuous(
    input [1:0] a, b,
    output [1:0] y
);
    assign y = ~(a ^ b); // 2-bit XNOR operation
endmodule
