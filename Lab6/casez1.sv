module casez1();
        reg [3:0] X;
        initial begin
                X=4'b1x00;
                casez(X)
                        4'b???1: $display("Statement 1 has been selected!");
                        4'b??1?: $display("Statement 2 has been selected!");
                        4'b?1??: $display("Statement 3 has been selected!");
                        4'b1???: $display("Statement 4 has been selected!");
                        default: $display("Default has been selected!");
                endcase
        end
endmodule