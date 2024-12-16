module ShiftOperators();
    initial begin
        $display("4'b1001 << 1 = %b", (4'b1001 << 1)); // Left Shift
        $display("4'b1001 >> 1 = %b", (4'b1001 >> 1)); // Right Shift
        #10 $finish;
    end
endmodule
