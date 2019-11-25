/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_controller_3 (
    input clk,
    input rst,
    input up,
    input down,
    input left,
    input right,
    input [2:0] level_state,
    output reg win,
    output reg lose,
    output reg [27:0] tiles_g,
    output reg [27:0] tiles_p
  );
  
  
  
  wire [1-1:0] M_sc_out;
  state_counter_2 sc (
    .clk(clk),
    .rst(rst),
    .out(M_sc_out)
  );
  reg [4:0] M_player_pos_d, M_player_pos_q = 1'h0;
  reg [55:0] M_tiles_type_d, M_tiles_type_q = 1'h0;
  reg [4:0] M_step_counter_d, M_step_counter_q = 1'h0;
  reg [4:0] M_req_steps_d, M_req_steps_q = 1'h0;
  reg [0:0] M_up_cond_d, M_up_cond_q = 1'h0;
  reg [0:0] M_down_cond_d, M_down_cond_q = 1'h0;
  reg [0:0] M_left_cond_d, M_left_cond_q = 1'h0;
  reg [0:0] M_right_cond_d, M_right_cond_q = 1'h0;
  reg [0:0] M_init_toggle_d, M_init_toggle_q = 1'h0;
  reg [0:0] M_win_toggle_d, M_win_toggle_q = 1'h0;
  reg [0:0] M_lose_toggle_d, M_lose_toggle_q = 1'h0;
  wire [(5'h1c+0)-1:0] M_tiles_led_p;
  wire [(5'h1c+0)-1:0] M_tiles_led_g;
  reg [(5'h1c+0)*2-1:0] M_tiles_type;
  
  genvar GEN_tiles0;
  generate
  for (GEN_tiles0=0;GEN_tiles0<5'h1c;GEN_tiles0=GEN_tiles0+1) begin: tiles_gen_0
    tile_led_4 tiles (
      .clk(clk),
      .rst(rst),
      .type(M_tiles_type[GEN_tiles0*(2'h2)+(2'h2)-1-:(2'h2)]),
      .led_p(M_tiles_led_p[GEN_tiles0*(1)+(1)-1-:(1)]),
      .led_g(M_tiles_led_g[GEN_tiles0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_right_cond_d = M_right_cond_q;
    M_req_steps_d = M_req_steps_q;
    M_lose_toggle_d = M_lose_toggle_q;
    M_tiles_type_d = M_tiles_type_q;
    M_win_toggle_d = M_win_toggle_q;
    M_down_cond_d = M_down_cond_q;
    M_up_cond_d = M_up_cond_q;
    M_step_counter_d = M_step_counter_q;
    M_left_cond_d = M_left_cond_q;
    M_init_toggle_d = M_init_toggle_q;
    M_player_pos_d = M_player_pos_q;
    
    
    case (level_state)
      1'h1: begin
        M_tiles_type_d[42+13-:14] = 14'h2aaa;
        M_tiles_type_d[0+3-:4] = 4'ha;
        M_tiles_type_d[14+3-:4] = 4'ha;
        M_tiles_type_d[28+5-:6] = 6'h2a;
        M_tiles_type_d[8+5-:6] = 6'h2a;
        M_tiles_type_d[24+3-:4] = 4'ha;
        M_tiles_type_d[38+3-:4] = 4'ha;
        if (M_init_toggle_q == 1'h0) begin
          M_tiles_type_d[32+5-:6] = 6'h00;
          M_tiles_type_d[18+5-:6] = 6'h00;
          M_tiles_type_d[4+5-:6] = 6'h00;
          M_player_pos_d = 5'h11;
          M_step_counter_d = 1'h0;
          M_tiles_type_d[34+1-:2] = 2'h3;
          M_win_toggle_d = 1'h0;
          M_lose_toggle_d = 1'h0;
          M_init_toggle_d = 1'h1;
        end
        M_req_steps_d = 3'h6;
      end
      default: begin
        M_tiles_type_d = 56'h00000000000000;
        M_init_toggle_d = 1'h0;
      end
    endcase
    if (up & M_sc_out & M_up_cond_q == 1'h0) begin
      M_up_cond_d = 1'h1;
      if (M_player_pos_q > 3'h6) begin
        if (M_tiles_type_q[(M_player_pos_q - 3'h7)*2+1-:2] == 2'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*2+1-:2] = 2'h1;
          M_tiles_type_d[(M_player_pos_q - 3'h7)*2+1-:2] = 2'h3;
          M_player_pos_d = M_player_pos_q - 3'h7;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q - 3'h7)*2+1-:2] == 2'h1) begin
            M_win_toggle_d = 1'h0;
            M_lose_toggle_d = 1'h1;
          end
        end
      end
    end
    if (!up & M_sc_out) begin
      M_up_cond_d = 1'h0;
    end
    if (down & M_sc_out & M_down_cond_q == 1'h0) begin
      M_down_cond_d = 1'h1;
      if (M_player_pos_q < 5'h15) begin
        if (M_tiles_type_q[(M_player_pos_q + 3'h7)*2+1-:2] == 2'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*2+1-:2] = 2'h1;
          M_tiles_type_d[(M_player_pos_q + 3'h7)*2+1-:2] = 2'h3;
          M_player_pos_d = M_player_pos_q + 3'h7;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q + 3'h7)*2+1-:2] == 2'h1) begin
            M_win_toggle_d = 1'h0;
            M_lose_toggle_d = 1'h1;
          end
        end
      end
    end
    if (!down & M_sc_out) begin
      M_down_cond_d = 1'h0;
    end
    if (left & M_sc_out & M_left_cond_q == 1'h0) begin
      M_left_cond_d = 1'h1;
      if (M_player_pos_q != 1'h0 & M_player_pos_q != 3'h7 & M_player_pos_q != 4'he & M_player_pos_q != 5'h15) begin
        if (M_tiles_type_q[(M_player_pos_q - 1'h1)*2+1-:2] == 2'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*2+1-:2] = 2'h1;
          M_tiles_type_d[(M_player_pos_q - 1'h1)*2+1-:2] = 2'h3;
          M_player_pos_d = M_player_pos_q - 1'h1;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q - 1'h1)*2+1-:2] == 2'h1) begin
            M_win_toggle_d = 1'h0;
            M_lose_toggle_d = 1'h1;
          end
        end
      end
    end
    if (!left & M_sc_out) begin
      M_left_cond_d = 1'h0;
    end
    if (right & M_sc_out & M_right_cond_q == 1'h0) begin
      M_right_cond_d = 1'h1;
      if (M_player_pos_q != 3'h6 & M_player_pos_q != 4'hd & M_player_pos_q != 5'h14 & M_player_pos_q != 5'h1b) begin
        if (M_tiles_type_q[(M_player_pos_q + 1'h1)*2+1-:2] == 2'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*2+1-:2] = 2'h1;
          M_tiles_type_d[(M_player_pos_q + 1'h1)*2+1-:2] = 2'h3;
          M_player_pos_d = M_player_pos_q + 1'h1;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q + 1'h1)*2+1-:2] == 2'h1) begin
            M_win_toggle_d = 1'h0;
            M_lose_toggle_d = 1'h1;
          end
        end
      end
    end
    if (!right & M_sc_out) begin
      M_right_cond_d = 1'h0;
    end
    if (M_player_pos_q == 2'h3 & M_sc_out & M_step_counter_q == M_req_steps_q) begin
      M_win_toggle_d = 1'h1;
      M_lose_toggle_d = 1'h0;
    end
    M_tiles_type = M_tiles_type_q;
    tiles_g = M_tiles_led_g;
    tiles_p = M_tiles_led_p;
    win = M_win_toggle_q;
    lose = M_lose_toggle_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_player_pos_q <= 1'h0;
      M_tiles_type_q <= 1'h0;
      M_step_counter_q <= 1'h0;
      M_req_steps_q <= 1'h0;
      M_up_cond_q <= 1'h0;
      M_down_cond_q <= 1'h0;
      M_left_cond_q <= 1'h0;
      M_right_cond_q <= 1'h0;
      M_init_toggle_q <= 1'h0;
      M_win_toggle_q <= 1'h0;
      M_lose_toggle_q <= 1'h0;
    end else begin
      M_player_pos_q <= M_player_pos_d;
      M_tiles_type_q <= M_tiles_type_d;
      M_step_counter_q <= M_step_counter_d;
      M_req_steps_q <= M_req_steps_d;
      M_up_cond_q <= M_up_cond_d;
      M_down_cond_q <= M_down_cond_d;
      M_left_cond_q <= M_left_cond_d;
      M_right_cond_q <= M_right_cond_d;
      M_init_toggle_q <= M_init_toggle_d;
      M_win_toggle_q <= M_win_toggle_d;
      M_lose_toggle_q <= M_lose_toggle_d;
    end
  end
  
endmodule
