module DFFSynch(
    input clk, reset, d,    // Inputs: clock, reset, and data
    output reg q            // Output: flip-flop state
);
    always @(posedge clk) begin
        if (reset)          // On reset, clear q to 0
            q <= 0;
        else                // Otherwise, store d into q
            q <= d;
    end
endmodule
