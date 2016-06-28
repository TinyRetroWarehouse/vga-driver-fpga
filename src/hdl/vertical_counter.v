module vertical_counter (
  input clk_i,
  input increment_i,
  input rst_i,
  output [8:0] y_o
);

reg [8:0] y_d, y_q;
assign y_o = y_q;

always @(*) begin
  if (rst_i)
    y_d = 0;
  else if (increment_i)
    y_d = y_q + 1;
  else
    y_d = y_q;
end

always @(posedge clk_i) begin
  y_q <= y_d;
end

endmodule
