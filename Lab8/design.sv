`timescale 1ns/1ps

// UART Transmitter
module UART_Transmitter (
    input wire sys_clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire byteReady,
    output reg serialOut,
    output reg ready
);

    typedef enum logic [2:0] {IDLE, LOAD, START, SEND, STOP} state_t;
    state_t state;
    reg [8:0] shiftReg; // Start + 8 Data + Stop
    reg [3:0] bitCnt;

    always @(posedge sys_clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            serialOut <= 1;
            ready <= 1;
            bitCnt <= 0;
        end else begin
            case (state)
                IDLE: if (byteReady) begin state <= LOAD; ready <= 0; end
                LOAD: begin shiftReg <= {1'b1, data_in, 1'b0}; state <= START; end
                START: begin serialOut <= shiftReg[0]; shiftReg <= shiftReg >> 1; state <= SEND; bitCnt <= 1; end
                SEND: begin
                    serialOut <= shiftReg[0];
                    shiftReg <= shiftReg >> 1;
                    bitCnt <= bitCnt + 1;
                    if (bitCnt == 8) state <= STOP;
                end
                STOP: begin serialOut <= 1; ready <= 1; state <= IDLE; end
                default: state <= IDLE;
            endcase
        end
    end
endmodule

// UART Receiver
module UART_Receiver (
    input wire sys_clk,
    input wire reset,
    input wire serialIn,
    output reg [7:0] data_out,
    output reg ready,
    output reg error
);

    typedef enum logic [2:0] {IDLE, START, RECEIVE, STOP, ERROR} state_t;
    state_t state;
    reg [3:0] sampleCnt;
    reg [2:0] bitCnt;
    reg [7:0] shiftReg;

    parameter SAMPLE_POINT = 7;

    always @(posedge sys_clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            ready <= 0;
            error <= 0;
            bitCnt <= 0;
            sampleCnt <= 0;
            shiftReg <= 0;
            data_out <= 0;
        end else begin
            case (state)
                IDLE: if (!serialIn) begin state <= START; sampleCnt <= 0; end
                START: if (sampleCnt == SAMPLE_POINT) begin
                    if (!serialIn) begin state <= RECEIVE; bitCnt <= 0; sampleCnt <= 0; end else state <= ERROR;
                end else sampleCnt <= sampleCnt + 1;
                RECEIVE: if (sampleCnt == SAMPLE_POINT) begin
                    shiftReg[bitCnt] <= serialIn;
                    bitCnt <= bitCnt + 1;
                    sampleCnt <= 0;
                    if (bitCnt == 7) state <= STOP;
                end else sampleCnt <= sampleCnt + 1;
                STOP: if (sampleCnt == SAMPLE_POINT) begin
                    if (serialIn) begin data_out <= shiftReg; ready <= 1; state <= IDLE; end else state <= ERROR;
                end else sampleCnt <= sampleCnt + 1;
                ERROR: begin error <= 1; state <= IDLE; end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
