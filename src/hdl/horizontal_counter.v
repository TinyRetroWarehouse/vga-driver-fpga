module horizontal_counter (
  input clk_i,
  input rst_i,
  output [9:0] x_o
);

reg [9:0] x_d, x_q;
assign x_o = x_q;

always @(*) begin
  x_d = x_q + 1;
end

always @(posedge clk_i) begin
  if (rst_i)
    x_q <= 8'd0;
  else
    x_q <= x_d;
end

endmodule
