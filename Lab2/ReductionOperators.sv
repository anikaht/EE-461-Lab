module ReductionOperators();
    initial begin
        $display("& 4'b1001 = %b", (&4'b1001)); // Bitwise AND reduction
        $display("~& 4'b1001 = %b", (~&4'b1001)); // Bitwise NAND reduction
        #10 $finish;
    end
endmodule
