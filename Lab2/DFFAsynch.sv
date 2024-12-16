module DFFAsynch(
    input clk, reset, d,    // Inputs: clock, reset, and data
    output reg q            // Output: flip-flop state
);
    always @(posedge clk or posedge reset) begin
        if (reset)          // Asynchronous reset, active immediately
            q <= 0;
        else                // On clock edge, store d into q
            q <= d;
    end
endmodule
