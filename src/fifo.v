module fifo
    #(
        parameter WIDTH = 16,
        parameter DEPTH = 8
    )
    (
        input clk,
        input rst,

        input wr_en,
        input [WIDTH-1:0] wr_data,

        input rd_en,
        output [WIDTH-1:0] rd_data,

        output nfull,
        output nempty
    );

    parameter ADDR_WIDTH = $clog2(DEPTH);

    reg [WIDTH-1:0] mem_fifo [DEPTH-1:0];

    wire [ADDR_WIDTH-1:0] wr_ptr;
    wire [ADDR_WIDTH-1:0] rd_ptr;

    reg [ADDR_WIDTH:0] wr_ptr_ex;
    reg [ADDR_WIDTH:0] rd_ptr_ex;    

    assign wr_ptr = wr_ptr_ex[ADDR_WIDTH-1:0];
    assign rd_ptr = rd_ptr_ex[ADDR_WIDTH-1:0];

    integer i;

    always @(posedge clk) begin
        if(rst) begin
            for(i = 0; i < DEPTH; i = i + 1) begin
                mem_fifo[i] <= 0;
            end
            wr_ptr_ex <= 0;
            rd_ptr_ex <= 0;
        end else begin
            if(wr_en && nfull) begin
                mem_fifo[wr_ptr] <= wr_data;
                wr_ptr_ex <= wr_ptr_ex + 1;
            end
            if(rd_en && nempty) begin
                rd_ptr_ex <= rd_ptr_ex + 1;
            end
        end
    end
 
    wire [ADDR_WIDTH:0] wr_ptr_gray;
    wire [ADDR_WIDTH:0] rd_ptr_gray;
    
    assign wr_ptr_gray = wr_ptr_ex ^ (wr_ptr_ex >> 1);
    assign rd_ptr_gray = rd_ptr_ex ^ (rd_ptr_ex >> 1);

    wire empty = (rd_ptr_gray == wr_ptr_gray) ? 1 : 0;
    wire full = (wr_ptr_gray[ADDR_WIDTH:ADDR_WIDTH-1] != rd_ptr_gray[ADDR_WIDTH:ADDR_WIDTH-1]) && (wr_ptr_gray[ADDR_WIDTH-1:0] == rd_ptr_gray[ADDR_WIDTH-1:0]);

    assign nempty = ~empty;
    assign nfull = ~full;
    
    assign rd_data = mem_fifo[rd_ptr];
    
endmodule

