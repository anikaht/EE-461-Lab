module counterckt (
    input wire [3:0] NumberIn, // 4-bit input
    input wire start, clock,   // Start and clock signals
    output reg [7:0] Count,    // 8-bit counter
    output reg Overflow        // Overflow flag
);
    wire Cout; // Carry-out signal

    // AND gate for Cout calculation
    assign Cout = &NumberIn; // Logical AND of all bits in NumberIn

    always @(posedge clock) begin
        if (start) begin
            // If start is high, initialize Count and Overflow
            Count <= {4'b0000, NumberIn}; // Concatenate 4 zeros with NumberIn
            Overflow <= 0;
        end else if (Cout) begin
            // If Cout is high, set Overflow and reset Count
            Overflow <= 1;
            Count <= 8'b0;
        end else begin
            // Increment Count otherwise
            Count <= Count + 1;
        end
    end
endmodule

