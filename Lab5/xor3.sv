`timescale 1ns/100ps
module xor3 (
    input B_i, D_i, sel_i, clock,
    output reg E_o
);
    always @(posedge clock) begin
        case (sel_i)
            1'b0: E_o <= D_i + B_i;  // Perform 1-bit addition
            1'b1: E_o <= B_i;       // Pass the value of B_i
        endcase
    end
endmodule