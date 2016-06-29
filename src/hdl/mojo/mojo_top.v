module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
	 output hsync,
	 output vsync,
	 output r,
	 output g,
	 output b
 );

wire rst = ~rst_n; // make reset active high

assign spi_miso = 1'bz;
assign spi_channel = 4'bzzzz;
assign led[7:0] = 8'b00000000;

chip_top chip_top (
  .clk_i(clk),
  .rst_i(rst),
  .hsync_o(hsync),
  .vsync_o(vsync),
  .r_o(r),
  .g_o(g),
  .b_o(b)
);

endmodule
