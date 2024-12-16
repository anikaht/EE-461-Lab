module tb_DFFAsynch();
    reg clk, reset, d;      // Testbench inputs
    wire q;                 // Testbench output

    // Instantiate the DFFAsynch module
    DFFAsynch dut (.clk(clk), .reset(reset), .d(d), .q(q));

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus: Apply input combinations to test the flip-flop
    initial begin
        reset = 1; d = 0;    // Reset active, q should go to 0 immediately
        #3 reset = 0; d = 1; // Release reset (mid-clock), set d to 1
        #7 d = 0;           // Change d
        #10 reset = 1;      // Activate reset again (mid-clock)
        #5 reset = 0; d = 1; // Release reset, set d to 1
        #10 $finish;        // End simulation
    end

    // Monitor values to view results in the terminal
    initial begin
        $monitor("Time: %0d | clk: %b | reset: %b | d: %b | q: %b", $time, clk, reset, d, q);
    end
endmodule
