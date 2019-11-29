module mojo_top_0 (
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
    
//    output [23:0] io_led,   // LEDs on IO Shield
//    output [7:0] io_seg,      // 7-segment LEDs on IO Shield
//    output [3:0] io_sel,      // Digit select on IO Shield
    input [5:0] io_button,    // 5 buttons on IO Shield
//    input [23:0] io_dip     // DIP switches on IO Shield

    output [27:0] led_p,
    output [27:0] led_g,
    
    //output r,
    //output g,
    //output b,
    //output vs,
    //output hs
    output power
  );

  wire rst = ~rst_n; // make reset active high
  
  // these signals should be high-z when not used
  assign spi_miso = 1'bz;
  assign avr_rx = 1'bz;
  assign spi_channel = 4'bzzzz;
  
  assign led = 8'b0;
  assign power = 1;
  
  assign led_p = tiles_p;
  assign led_g = tiles_g;
  //assign io_led[23:1] = 23'b0;
  
  //assign r = rval;
  //assign g = gval;
  //assign b = bval;
  //assign vs = vsync;
  //assign hs = hsync;
  
//  assign io_seg = iseg;
//  assign io_sel = isel;
//  assign io_led = ioled;
  
  wire [9:0] x;
  wire [9:0] y;
  
  wire [27:0] tiles_g;
  wire [27:0] tiles_p;
  
//  wire [7:0] iseg;
//  wire [3:0] isel;
  
//  wire [23:0] ioled;
  
//  wire [9:0] sq1_xl, sq1_xr, sq1_yt, sq1_yb;
//  wire [9:0] sq2_xl, sq2_xr, sq2_yt, sq2_yb;
//  wire [9:0] sq3_xl, sq3_xr, sq3_yt, sq3_yb;
    
//  vga vga (
//    .clk(clk),
//    .rst(rst),
//    .x(x[9:0]),
//    .y(y[9:0]),
//    .valid(valid),
//    .hsync(hsync),
//    .vsync(vsync),
//    .newframe(newframe),
//    .newline(newline),
//    .pixclk(pixclk)
//  );
  
//  square #(.IX(10'd160), .IY(10'd120), .H_SIZE(10'd60), .X_DIR(1), .Y_DIR(1)) square1 (
//    .clk(clk),
//    .rst(rst),
//    .pixclk(pixclk),
//    .animate(newframe),
//    .o_xl(sq1_xl),
//    .o_xr(sq1_xr),
//    .o_yt(sq1_yt),
//    .o_yb(sq1_yb)
//  );
  
//  square #(.IX(10'd400), .IY(10'd240), .H_SIZE(10'd80), .X_DIR(0), .Y_DIR(1)) square2 (
//    .clk(clk),
//    .rst(rst),
//    .pixclk(pixclk),
//    .animate(newframe),
//    .o_xl(sq2_xl),
//    .o_xr(sq2_xr),
//    .o_yt(sq2_yt),
//    .o_yb(sq2_yb)
//  );
  
//  square #(.IX(10'd300), .IY(10'd320), .H_SIZE(10'd40), .X_DIR(1), .Y_DIR(0)) square3 (
//    .clk(clk),
//    .rst(rst),
//    .pixclk(pixclk),
//    .animate(newframe),
//    .o_xl(sq3_xl),
//    .o_xr(sq3_xr),
//    .o_yt(sq3_yt),
//    .o_yb(sq3_yb)
//  );

//  alu_tester tester (
//    .clk(clk),
//    .rst(rst),
//    .auto_sel(io_button[2]), // down button
//    .auto_next(io_button[1]), // middle button
//    .man_sel(io_button[0]), // up button
//    .man_next(io_button[4]), // right button
//    .man_out(io_button[3]), // left button
//    .switches(io_dip[23:0]),
//    .seg(iseg[7:0]),
//    .sel(isel[3:0]),
//    .leds(ioled[23:0])
//  );

    game_loop_1 gl (
      .clk(clk),
      .rst(rst),
      .up(io_button[0]),
      .down(io_button[2]),
      .left(io_button[3]),
      .right(io_button[4]),
      .tiles_g(tiles_g[27:0]),
      .tiles_p(tiles_p[27:0])
    );
        
//    assign io_led[20:0] = tiles_g[20:0];
//    assign io_led[23:21] = 2'b000;

//  tiles tiles (
//    .clk(clk),
//    .rst(rst),
//    .x(x[9:0]),
//    .y(y[9:0]),
//    .up(io_button[0]),
//    .down(io_button[2]),
//    .left(io_button[3]),
//    .right(io_button[4]),
//    .tile1(tile1),
//    .tile2(tile2),
//    .tile3(tile3),
//    .tile4(tile4),
//    .tile5(tile5),
//    .tile6(tile6),
//    .tile7(tile7),
//    .tile8(tile8),
//    .tile9(tile9)
//  );
  
  //reg rval, bval, gval;
  
  always @(*) begin
  
    //rval = 0;
    //gval = 0;
    //bval = 0;
    
    //if (valid) begin
      //rval = (x < 320);
      //bval = (x < 160 || (x < 480 && x > 320));
      //gval = (x < 80 || (x < 240 && x > 160) || (x < 400 && x > 320) || (x < 560 && x > 480));
      //rval = ((x > sq1_xl) & (x < sq1_xr) & (y > sq1_yt) & (y < sq1_yb));
      //bval = ((x > sq2_xl) & (x < sq2_xr) & (y > sq2_yt) & (y < sq2_yb));
      //gval = ((x > sq3_xl) & (x < sq3_xr) & (y > sq3_yt) & (y < sq3_yb));
      
      //rval = tile1 | tile2 | tile3 | tile4 | tile5 | tile6 | tile7 | tile8 | tile9;
      //gval = tile1 | tile2 | tile3 | tile4 | tile5 | tile6 | tile7 | tile8 | tile9;
      //bval = tile1 | tile2 | tile3 | tile4 | tile5 | tile6 | tile7 | tile8 | tile9;
      
    //end
  end
  
endmodule