`timescale 1ns/1ps

module UART_Integration_tb;
    reg sys_clk, reset, byteReady;
    reg [7:0] tx_data_in;
    wire tx_serialOut, tx_ready;

    wire [7:0] rx_data_out;
    wire rx_ready, rx_error;

    UART_Transmitter transmitter (
        .sys_clk(sys_clk),
        .reset(reset),
        .data_in(tx_data_in),
        .byteReady(byteReady),
        .serialOut(tx_serialOut),
        .ready(tx_ready)
    );

    UART_Receiver receiver (
        .sys_clk(sys_clk),
        .reset(reset),
        .serialIn(tx_serialOut),
        .data_out(rx_data_out),
        .ready(rx_ready),
        .error(rx_error)
    );

    always #5 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, UART_Integration_tb);

        sys_clk = 0;
        reset = 1;
        byteReady = 0;
        tx_data_in = 8'hA5;

        #20 reset = 0;

        #10 byteReady = 1;
        #10 byteReady = 0;

        wait (rx_ready);

        if (rx_data_out == tx_data_in) begin
            $display("Test Passed: Data received correctly - %h", rx_data_out);
        end else begin
            $display("Test Failed: Expected %h but got %h.", tx_data_in, rx_data_out);
        end

        #100 $finish;
    end
endmodule
