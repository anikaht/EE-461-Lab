module counterckt_tb;
    reg [3:0] NumberIn;  // Input for 4-bit number
    reg start, clock;    // Start signal and clock
    wire [7:0] Count;    // 8-bit counter output
    wire Overflow;       // Overflow flag

    // Instantiate the counter module
    counterckt uut (
        .NumberIn(NumberIn),
        .start(start),
        .clock(clock),
        .Count(Count),
        .Overflow(Overflow)
    );

    // Clock generation: Toggle every 5 time units
    always begin
        #5 clock = ~clock;
    end

    initial begin
        // Initialize signals
        clock = 0;
        start = 0;
        NumberIn = 4'b0000;

        // Display signal values
        $monitor($time, " NumberIn=%b, start=%b, Count=%b, Overflow=%b", NumberIn, start, Count, Overflow);

        // Test Case 1: Initialize with NumberIn = 4
        #10 start = 1; NumberIn = 4'b0100; #10 start = 0;

        // Let the counter increment
        #100;

        // Test Case 2: Initialize with NumberIn = 15 (Overflow scenario)
        #10 start = 1; NumberIn = 4'b1111; #10 start = 0;

        // Allow the counter to increment and reach overflow
        #50;

        // End simulation
        $finish;
    end
endmodule
