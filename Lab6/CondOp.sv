module CondOp();
        reg [3:0] X;
        reg [3:0] Y;
        wire Z;
        assign Z=(X==Y)? 1'b1:1'b0;
        //assign Z=(X===Y)? 1'b1:1'b0;
        //assign Z=(X!==Y)? 1'b1:1'b0;
        initial begin
                X=4'b101x;
                Y=4'b101z;
                $monitor("Z's values: %d\n", Z);
        end
endmodule
