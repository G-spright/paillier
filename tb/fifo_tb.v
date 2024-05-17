`timescale 1ns / 1ps

module fifo_tb();

    // Parameters
    localparam WIDTH = 16;
    localparam DEPTH = 8;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg wr_en;
    reg [WIDTH-1:0] wr_data;
    reg rd_en;
    wire [WIDTH-1:0] rd_data;
    wire full;
    wire empty;

    // Instantiate the FIFO
    fifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .push(wr_en),
        .wr_data(wr_data),
        .pop(rd_en),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        wr_en = 0;
        wr_data = 0;
        rd_en = 0;

        // Reset the FIFO
        #10;
        rst_n = 1;

        // Write to the FIFO
        repeat (DEPTH) begin
            @(posedge clk);
            wr_en = 1;
            wr_data = wr_data + 1;
        end
        wr_en = 0;

        // Read from the FIFO
        repeat (DEPTH) begin
            @(posedge clk);
            rd_en = 1;
        end
        rd_en = 0;

        // Finish the simulation
        #100;
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time: %t, wr_data: %h, rd_data: %h, full: %b, empty: %b", $time, wr_data, rd_data, full, empty);
    end

endmodule

