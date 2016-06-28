module horizontal_counter (
  input clk_i,
  input rst_i,
  output [9:0] x_o
);

reg [9:0] x_d, x_q;
assign x_o = x_q;

always @(*) begin
  if (~rst_i)
    x_d = x_q + 1;
  else
    x_d = 0;
end

always @(posedge clk_i) begin
  x_q <= x_d;
end

endmodule
