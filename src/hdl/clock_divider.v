module clock_divider (
	input clk_i,
	output clk_o
);

reg clk_d, clk_q;
assign clk_o = clk_q;

always @(*) begin
	clk_d = clk_q;
end

always @(posedge clk_i) begin
	clk_q <= clk_d;
end

endmodule