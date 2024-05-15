module fifo
    #(
        parameter WIDTH = 16,
        parameter DEPTH = 8
    )
    (
        input clk,
        input rst_n,

        input wr_en,
        input [WIDTH-1:0] wr_data,

        input rd_en,
        output reg [WIDTH-1:0] rd_data,

        output full,
        output empty
    );

    parameter ADDR_WIDTH = $clog2(DEPTH);

    reg [WIDTH-1:0] mem_fifo [DEPTH-1:0];

    reg [ADDR_WIDTH:0] wr_ptr;
    reg [ADDR_WIDTH:0] rd_ptr;

    wire [ADDR_WIDTH-1:0] wr_data_ptr;
    wire [ADDR_WIDTH-1:0] rd_data_ptr;

    assign wr_data_ptr = wr_ptr[ADDR_WIDTH-1:0];
    assign rd_data_ptr = rd_ptr[ADDR_WIDTH-1:0];

    integer i;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            for(i = 0; i < DEPTH; i = i + 1) begin
                mem_fifo[i] <= 0;
            end
            wr_ptr <= 0;
            rd_ptr <= 0;
        end else begin
            if(wr_en && !full) begin
                mem_fifo[wr_data_ptr] <= wr_data;
                wr_ptr <= wr_ptr + 1;
            end
            if(rd_en && !empty) begin
                rd_data <= mem_fifo[rd_data_ptr];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end
 
    wire [ADDR_WIDTH:0] wr_ptr_gray;
    wire [ADDR_WIDTH:0] rd_ptr_gray;
    
    reg [ADDR_WIDTH:0] wr_ptr_gray1;
    reg [ADDR_WIDTH:0] rd_ptr_gray1;

    reg [ADDR_WIDTH:0] wr_ptr_gray2;
    reg [ADDR_WIDTH:0] rd_ptr_gray2;

    assign wr_ptr_gray = wr_ptr ^ (wr_ptr >> 1);
    assign rd_ptr_gray = rd_ptr ^ (rd_ptr >> 1);

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wr_ptr_gray1 <= 0;
            rd_ptr_gray1 <= 0;
            wr_ptr_gray2 <= 0;
            rd_ptr_gray2 <= 0;
        end else begin
            wr_ptr_gray1 <= wr_ptr_gray;
            rd_ptr_gray1 <= rd_ptr_gray;
            wr_ptr_gray2 <= wr_ptr_gray1;
            rd_ptr_gray2 <= rd_ptr_gray1;
        end
    end

    assign empty = (rd_ptr_gray == wr_ptr_gray2) ? 1 : 0;
    assign full = (wr_ptr_gray[ADDR_WIDTH:ADDR_WIDTH-1] != rd_ptr_gray2[ADDR_WIDTH:ADDR_WIDTH-1]) && (wr_ptr_gray1[ADDR_WIDTH-2:0] == rd_ptr_gray2[ADDR_WIDTH-2:0]);

endmodule

