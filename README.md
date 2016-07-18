# vga-driver-fgpa

This is a working Verilog design to display image through VGA on an FPGA. It generates a 640x480 VGA signal using two state machines, one a [horizontal sync state machine](https://github.com/dankirkham/vga-driver-fpga/blob/master/src/hdl/horizontal_state_machine.v) and the other a [vertical sync state machine](https://github.com/dankirkham/vga-driver-fpga/blob/master/src/hdl/vertical_state_machine.v). It uses a [lookup table (LUT)](https://github.com/dankirkham/vga-driver-fpga/blob/master/src/hdl/kord_logo_lut.v) to find the color of each individual pixel. This LUT can be generated using a [Python script](https://github.com/dankirkham/vga-driver-fpga/blob/master/src/python/generate_logo_lut.py).

This design can be verified using a [test bench](https://github.com/dankirkham/vga-driver-fpga/blob/master/src/hdl/chip_top_tb.v) and looking at the resulting waveform using a simulation tool, such as Vivado Simulator. This design has been tested and verified on real hardware.
