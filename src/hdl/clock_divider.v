module clock_divider (
	input clk_i,
	input rst_i,
	output clk_o
);

reg clk_d, clk_q;
assign clk_o = clk_q;

always @(*) begin
	clk_d = clk_q;
end

always @(posedge clk_i) begin
	if (rst_i)
		clk_q <= 1'b0;
	else
		clk_q <= clk_d;
end

endmodule