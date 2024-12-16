module ReplicationOperator();
    initial begin
        $display("{4{4'b1001}} = %b", {4{4'b1001}}); // Replication
        #10 $finish;
    end
endmodule
