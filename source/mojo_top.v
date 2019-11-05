module mojo_top (
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output [7:0] led,
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
    input avr_rx_busy,      // AVR RX buffer full
    
    output [23:0] io_led,   // LEDs on IO Shield
    output [7:0] io_seg,      // 7-segment LEDs on IO Shield
    output [3:0] io_sel,      // Digit select on IO Shield
    input [5:0] io_button,    // 5 buttons on IO Shield
    input [23:0] io_dip,     // DIP switches on IO Shield
    
    output r,
    output g,
    output b,
    output vs,
    output hs
  );

  wire rst = ~rst_n; // make reset active high
  
  // these signals should be high-z when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_channel = 4'bzzzz;
  
  assign led = 8'b0;
  
  assign r = rval;
  assign g = gval;
  assign b = bval;
  assign vs = vsync;
  assign hs = hsync;
  
  assign io_seg = iseg;
  assign io_sel = isel;
  assign io_led = ioled;
  
  wire [9:0] x;
  wire [9:0] y;
  
  wire [7:0] iseg;
  wire [3:0] isel;
  
  wire [23:0] ioled;
  
  vga vga(
    .clk(clk),
    .rst(rst),
    .x(x[9:0]),
    .y(y[9:0]),
    .valid(valid),
    .hsync(hsync),
    .vsync(vsync),
    .newframe(newframe),
    .newline(newline)
  );
  
  alu_tester tester(
    .clk(clk),
    .rst(rst),
    .auto_sel(io_button[2]), // down button
    .auto_next(io_button[1]), // middle button
    .man_sel(io_button[0]), // up button
    .man_next(io_button[4]), // right button
    .switches(io_dip[23:0]),
    .seg(iseg[7:0]),
    .sel(isel[3:0]),
    .leds(ioled[23:0])
  );

  reg rval, bval, gval;
  
  always @(*) begin
  
    rval = 0;
    gval = 0;
    bval = 0;
    
    if (valid) begin
      rval = (x < 320);
      bval = (x < 160 || (x < 480 && x > 320));
      gval = (x < 80 || (x < 240 && x > 160) || (x < 400 && x > 320) || (x < 560 && x > 480));
    end
  end
  
endmodule