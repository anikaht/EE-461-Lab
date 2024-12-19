module counter_tb;
    reg clock;               // Clock signal
    reg [3:0] in;            // Starting count
    reg latch, dec;          // Latch and decrement control signals
    wire zero;               // Zero flag output

    // Instantiate the counter module
    counter uut (
        .clock(clock),
        .in(in),
        .latch(latch),
        .dec(dec),
        .zero(zero)
    );

    // Clock generation: Toggle every 5 time units
    always begin
        #5 clock = ~clock;
    end

    initial begin
        // Initialize signals
        clock = 0;
        latch = 0;
        dec = 0;
        in = 4'b0000;

        // Monitor the signals
        $monitor($time, " latch=%b, dec=%b, in=%b, value=%b, zero=%b", latch, dec, in, uut.value, zero);

        // Test Case 1: Load initial value and decrement by 2
        #10 latch = 1; in = 4'b1010;   // Load value 10
        #10 latch = 0; dec = 1;       // Start decrementing

        // Test Case 2: Decrement to 0 or 1
        #100;                         // Let it decrement by 2 each clock cycle

        // Test Case 3: Reload value
        #10 latch = 1; in = 4'b0110;  // Load value 6
        #10 latch = 0; dec = 1;       // Start decrementing again

        // End simulation
        #100 $finish;
    end
endmodule
