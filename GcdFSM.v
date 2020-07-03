module GcdFSM(
    input clk,
    input rst,
    input [31:0] a,
    input [31:0] b,
    input is_zero_result,
    output reg [4:0] rf_read_addr1,
    output reg [4:0] rf_read_addr2,
    output reg [4:0] rf_write_addr,
    output reg rf_write_en,
    output reg rf_write_data_sel,
    output reg [31:0] const_val,
    output reg alu_sel,
    output reg [1:0] alu_oper
);

endmodule