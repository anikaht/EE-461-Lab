module caseTest();
        reg [3:0] X;
        reg [3:0] Y;
        initial begin
                X=4'b101x;
                Y=4'b101z;
                case(X)
                        4'b1010: $display("Statement 1 has been selected!");
                        4'b101x: $display("Statement 2 has been selected!");
                        4'b101z: $display("Statement 3 has been selected!");
                        4'bxxxx: $display("Statement 4 has been selected!");
                        4'bzzzz: $display("Statement 5 has been selected!");
                        default: $display("Default has been selected!");
                endcase
        end
endmodule

