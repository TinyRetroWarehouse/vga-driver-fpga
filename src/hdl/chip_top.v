module chip_top (
  input clk_i,
  input rst_i,
  output hsync_o,
  output vsync_o,
  output r_o,
  output g_o,
  output b_o
);

wire hsync;
wire vsync;
wire r;
wire g;
wire b;
wire [9:0] x;
wire [8:0] y;
wire active_video_horizontal;
wire active_video_vertical;
wire horizontal_state_machine_rst;
wire horizontal_counter_rst;
wire vertical_counter_increment;
wire vertical_counter_rst;

assign hsync_o = hsync;
assign vsync_o = vsync;
assign r_o = active_video_horizontal & active_video_vertical & r;
assign g_o = active_video_horizontal & active_video_vertical & g;
assign b_o = active_video_horizontal & active_video_vertical & b;

horizontal_counter horizontal_counter0 (
  .clk_i(clk_i),
  .rst_i(horizontal_counter_rst),
  .x_o(x)
);

vertical_counter vertical_counter0 (
  .clk_i(clk_i),
  .increment_i(vertical_counter_increment),
  .rst_i(vertical_counter_rst),
  .y_o(y)
);

horizontal_state_machine horizontal_state_machine0 (
  .clk_i(clk_i),
  .rst_i(horizontal_state_machine_rst),
  .vertical_active_video_i(active_video_vertical),
  .horizontal_counter_i(x),
  .horizontal_counter_rst_o(horizontal_counter_rst),
  .vertical_counter_increment_o(vertical_counter_increment),
  .horizontal_active_video_o(active_video_horizontal),
  .sync_pulse_o(hsync)
);

vertical_state_machine vertical_state_machine0 (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .vertical_counter_i(y),
  .horizontal_state_machine_rst_o(horizontal_state_machine_rst),
  .vertical_counter_rst_o(vertical_counter_rst),
  .vertical_active_video_o(active_video_vertical),
  .sync_pulse_o(vsync)
);

kord_logo_lut kord_logo_lut0 (
	.x_i(x),
	.y_i(y),
	.red_o(r),
	.green_o(g),
	.blue_o(b)
);

endmodule
