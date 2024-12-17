//1
module not_gate_always(
    input a,
    output reg y
);
    always @(*) begin
        y = ~a; // NOT operation
    end
endmodule

//2
module and_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = a & b; // 2-bit AND operation
    end
endmodule

//3
module or_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = a | b; // 2-bit OR operation
    end
endmodule

//4
module nand_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = ~(a & b); // 2-bit NAND operation
    end
endmodule

//5
module nor_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = ~(a | b); // 2-bit NOR operation
    end
endmodule

//6
module xor_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = a ^ b; // 2-bit XOR operation
    end
endmodule

//7
module xnor_gate_always(
    input [1:0] a, b,
    output reg [1:0] y
);
    always @(*) begin
        y = ~(a ^ b); // 2-bit XNOR operation
    end
endmodule
