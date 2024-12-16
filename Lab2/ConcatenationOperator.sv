module ConcatenationOperator();
    initial begin
        $display("{4'b1001, 4'b0101} = %b", {4'b1001, 4'b0101}); // Concatenation
        #10 $finish;
    end
endmodule
