module vertical_state_machine (
  input clk_i,
  input rst_i,
  input [8:0] vertical_counter_i,

  // Mealy Outputs
  output reg horizontal_state_machine_rst_o,
  output reg vertical_counter_rst_o,

  // Moore Outputs
  output reg vertical_active_video_o,
  output reg sync_pulse_o
);

reg [1:0] state, nextstate;

localparam STATE_FRONT_PORCH = 0;
localparam STATE_SYNC_PULSE = 1;
localparam STATE_BACK_PORCH = 2;
localparam STATE_ACTIVE_VIDEO = 3;

always @(posedge clk_i) begin
	if (rst_i) begin
		state <= STATE_FRONT_PORCH;
	end else begin
		state <= nextstate;
	end
end

// Mealy Outputs and nextstate
always @(*) begin
  horizontal_state_machine_rst_o = 1'b0;
  vertical_counter_rst_o = 1'b0;

  case (state)
    STATE_FRONT_PORCH:
      if (vertical_counter_i == 9'd9) begin
        vertical_counter_rst_o = 1'b1;
        nextstate = STATE_SYNC_PULSE;
      end else begin
        nextstate = STATE_FRONT_PORCH;
      end

    STATE_SYNC_PULSE:
      if (vertical_counter_i == 9'd1) begin
        vertical_counter_rst_o = 1'b1;
        nextstate = STATE_BACK_PORCH;
      end else begin
        nextstate = STATE_SYNC_PULSE;
      end

    STATE_BACK_PORCH:
      if (vertical_counter_i == 9'd32) begin
        vertical_counter_rst_o = 1'b1;
        horizontal_state_machine_rst_o = 1'b1;
        nextstate = STATE_ACTIVE_VIDEO;
      end else begin
        nextstate = STATE_BACK_PORCH;
      end

    STATE_ACTIVE_VIDEO:
      if (vertical_counter_i == 9'd479) begin
        vertical_counter_rst_o = 1'b1;
        nextstate = STATE_FRONT_PORCH;
      end else begin
        nextstate = STATE_ACTIVE_VIDEO;
      end
  endcase
end

// Moore Outputs
always @(*) begin
  vertical_active_video_o = 1'b0;
  sync_pulse_o = 1'b1;

  case (state)
    STATE_SYNC_PULSE:
    begin
      sync_pulse_o = 1'b0;
    end
    STATE_ACTIVE_VIDEO:
    begin
      vertical_active_video_o = 1'b1;
    end
  endcase
end

endmodule
