module counter (
    input clock,            // Clock signal
    input [3:0] in,         // Starting count (4-bit input)
    input latch,            // Latch 'in' when high
    input dec,              // Decrement count when high
    output zero             // High when count is 0 or 1
);
    reg [3:0] value;        // Current count value

    always @(posedge clock) begin
        if (latch) 
            value <= in;              // Load the input value when latch is high
        else if (dec && !zero) begin  // Decrement by 2 if zero flag is not set
            if (value > 2) 
                value <= value - 2;
            else 
                value <= 4'b0000;     // Ensure the counter stops at 0 or 1
        end
    end

    // Set the zero flag when the count is 0000 or 0001
    assign zero = (value == 4'b0000 || value == 4'b0001);
endmodule
