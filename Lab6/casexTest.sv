module casexTest();
        reg [3:0] X;
        reg [3:0] Y;
        initial begin
                X=4'b101x;
                Y=4'b101z;
                casex(X)
                        4'b100z: $display("Statement 1 has been selected!");
                        4'b10xx: $display("Statement 2 has been selected!");
                        4'b11xz: $display("Statement 3 has been selected!");
                        4'bxxxx: $display("Statement 4 has been selected!");
                        4'bzzzz: $display("Statement 5 has been selected!");
                        default: $display("Default has been selected!");
                endcase
        end
endmodule
