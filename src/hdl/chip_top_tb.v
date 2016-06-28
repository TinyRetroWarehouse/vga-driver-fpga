`timescale 1ns / 1ps

module chip_top_tb;
    reg clk;
    reg rst;
    
    wire hsync;
    wire vsync;
    wire r;
    wire g;
    wire b;
    
    chip_top chip_top0 (
        .clk_i(clk),
        .rst_i(rst),
        .hsync_o(hsync),
        .vsync_o(vsync),
        .r_o(r),
        .g_o(g),
        .b_o(b)
    );
    
    initial begin
        clk = 1'b0;
        forever begin
            #10 clk = ~clk;
        end
    end
    
    initial begin
        rst = 1'b0;
        #5 rst = 1'b1;
        #20 rst = 1'b0;
    end
endmodule