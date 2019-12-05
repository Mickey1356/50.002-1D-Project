/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_controller_8 (
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
  
  
  
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  reg [1-1:0] M_alu_fail;
  alu_13 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .fail(M_alu_fail),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n),
    .out(M_alu_out)
  );
  
  wire [1-1:0] M_sc_out;
  state_counter_7 sc (
    .clk(clk),
    .rst(rst),
    .out(M_sc_out)
  );
  reg [4:0] M_player_pos_d, M_player_pos_q = 1'h0;
  reg [83:0] M_tiles_type_d, M_tiles_type_q = 1'h0;
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
  reg [(5'h1c+0)*3-1:0] M_tiles_type;
  
  genvar GEN_tiles0;
  generate
  for (GEN_tiles0=0;GEN_tiles0<5'h1c;GEN_tiles0=GEN_tiles0+1) begin: tiles_gen_0
    tile_led_14 tiles (
      .clk(clk),
      .rst(rst),
      .type(M_tiles_type[GEN_tiles0*(2'h3)+(2'h3)-1-:(2'h3)]),
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
    M_player_pos_d = M_player_pos_q;
    M_init_toggle_d = M_init_toggle_q;
    
    M_alu_fail = 1'h0;
    M_alu_a = M_step_counter_q;
    M_alu_b = M_req_steps_q;
    M_alu_alufn = 17'h1adbb;
    
    case (level_state)
      1'h0: begin
        M_tiles_type_d = 84'h6db6db6db6db6db6db6db;
        M_init_toggle_d = 1'h0;
      end
      1'h1: begin
        M_tiles_type_d[0+8-:9] = 9'h092;
        M_tiles_type_d[21+8-:9] = 9'h092;
        M_tiles_type_d[42+5-:6] = 6'h12;
        M_tiles_type_d[63+5-:6] = 6'h12;
        M_tiles_type_d[12+8-:9] = 9'h092;
        M_tiles_type_d[36+5-:6] = 6'h12;
        M_tiles_type_d[57+5-:6] = 6'h12;
        M_tiles_type_d[75+8-:9] = 9'h092;
        if (M_init_toggle_q == 1'h0) begin
          M_tiles_type_d[69+5-:6] = 6'h00;
          M_tiles_type_d[48+8-:9] = 9'h000;
          M_tiles_type_d[30+5-:6] = 6'h00;
          M_tiles_type_d[9+2-:3] = 3'h0;
          M_player_pos_d = 5'h18;
          M_step_counter_d = 1'h0;
          M_tiles_type_d[72+2-:3] = 2'h3;
          M_win_toggle_d = 1'h0;
          M_lose_toggle_d = 1'h0;
          M_init_toggle_d = 1'h1;
        end
        M_req_steps_d = 3'h7;
      end
      2'h2: begin
        M_tiles_type_d[0+2-:3] = 3'h2;
        M_tiles_type_d[21+2-:3] = 3'h2;
        M_tiles_type_d[42+2-:3] = 3'h2;
        M_tiles_type_d[63+5-:6] = 6'h12;
        M_tiles_type_d[12+8-:9] = 9'h092;
        M_tiles_type_d[39+2-:3] = 3'h2;
        M_tiles_type_d[60+2-:3] = 3'h2;
        M_tiles_type_d[81+2-:3] = 3'h2;
        M_tiles_type_d[75+2-:3] = 3'h2;
        if (M_init_toggle_q == 1'h0) begin
          M_tiles_type_d[69+5-:6] = 6'h00;
          M_tiles_type_d[45+14-:15] = 15'h0000;
          M_tiles_type_d[24+14-:15] = 15'h0000;
          M_tiles_type_d[3+8-:9] = 9'h000;
          M_player_pos_d = 5'h1a;
          M_step_counter_d = 1'h0;
          M_tiles_type_d[78+2-:3] = 2'h3;
          M_win_toggle_d = 1'h0;
          M_lose_toggle_d = 1'h0;
          M_init_toggle_d = 1'h1;
        end
        M_req_steps_d = 4'hf;
      end
      2'h3: begin
        M_tiles_type_d[45+2-:3] = 3'h2;
        M_tiles_type_d[30+2-:3] = 3'h2;
        M_tiles_type_d[18+2-:3] = 3'h2;
        M_tiles_type_d[24+2-:3] = 3'h4;
        M_tiles_type_d[51+2-:3] = 3'h4;
        if (M_init_toggle_q == 1'h0) begin
          M_tiles_type_d[63+20-:21] = 21'h000000;
          M_tiles_type_d[42+2-:3] = 3'h0;
          M_tiles_type_d[48+2-:3] = 3'h0;
          M_tiles_type_d[54+8-:9] = 9'h000;
          M_tiles_type_d[21+2-:3] = 3'h0;
          M_tiles_type_d[27+2-:3] = 3'h0;
          M_tiles_type_d[33+8-:9] = 9'h000;
          M_tiles_type_d[0+17-:18] = 18'h00000;
          M_player_pos_d = 5'h1b;
          M_step_counter_d = 1'h0;
          M_tiles_type_d[81+2-:3] = 3'h3;
          M_win_toggle_d = 1'h0;
          M_lose_toggle_d = 1'h0;
          M_init_toggle_d = 1'h1;
        end
        M_req_steps_d = 5'h17;
      end
      3'h4: begin
        M_tiles_type_d[24+2-:3] = 3'h2;
        M_tiles_type_d[18+2-:3] = 3'h2;
        M_tiles_type_d[9+2-:3] = 3'h4;
        M_tiles_type_d[45+2-:3] = 3'h4;
        if (M_init_toggle_q == 1'h0) begin
          M_tiles_type_d[63+20-:21] = 21'h000000;
          M_tiles_type_d[42+2-:3] = 3'h0;
          M_tiles_type_d[48+14-:15] = 15'h0000;
          M_tiles_type_d[21+2-:3] = 3'h0;
          M_tiles_type_d[27+14-:15] = 15'h0000;
          M_tiles_type_d[12+5-:6] = 6'h00;
          M_tiles_type_d[0+8-:9] = 9'h000;
          M_player_pos_d = 5'h17;
          M_step_counter_d = 1'h0;
          M_tiles_type_d[69+2-:3] = 3'h3;
          M_win_toggle_d = 1'h0;
          M_lose_toggle_d = 1'h0;
          M_init_toggle_d = 1'h1;
        end
        M_req_steps_d = 5'h18;
      end
      default: begin
        M_tiles_type_d = 84'h000000000000000000000;
        M_init_toggle_d = 1'h0;
      end
    endcase
    if (up & M_sc_out & M_up_cond_q == 1'h0) begin
      M_up_cond_d = 1'h1;
      if (M_player_pos_q > 3'h6) begin
        if (M_tiles_type_q[(M_player_pos_q - 3'h7)*3+2-:3] == 3'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
          M_tiles_type_d[(M_player_pos_q - 3'h7)*3+2-:3] = 3'h3;
          M_player_pos_d = M_player_pos_q - 3'h7;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q - 3'h7)*3+2-:3] == 3'h4) begin
            if (level_state == 2'h3) begin
              if (M_player_pos_q == 5'h18) begin
                M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                M_player_pos_d = 4'h8;
                M_tiles_type_d[24+2-:3] = 3'h3;
                M_step_counter_d = M_step_counter_q + 1'h1;
              end
            end else begin
              if (level_state == 3'h4) begin
                if (M_player_pos_q == 4'ha) begin
                  M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                  M_player_pos_d = 4'hf;
                  M_tiles_type_d[45+2-:3] = 3'h3;
                  M_step_counter_d = M_step_counter_q + 1'h1;
                end else begin
                  if (M_player_pos_q == 5'h16) begin
                    M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                    M_player_pos_d = 2'h3;
                    M_tiles_type_d[9+2-:3] = 3'h3;
                    M_step_counter_d = M_step_counter_q + 1'h1;
                  end
                end
              end
            end
          end else begin
            if (M_tiles_type_q[(M_player_pos_q - 3'h7)*3+2-:3] == 3'h1) begin
              M_win_toggle_d = 1'h0;
              M_lose_toggle_d = 1'h1;
            end
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
        if (M_tiles_type_q[(M_player_pos_q + 3'h7)*3+2-:3] == 3'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
          M_tiles_type_d[(M_player_pos_q + 3'h7)*3+2-:3] = 3'h3;
          M_player_pos_d = M_player_pos_q + 3'h7;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q + 3'h7)*3+2-:3] == 3'h4) begin
            if (level_state == 2'h3) begin
              if (M_player_pos_q == 1'h1) begin
                M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                M_player_pos_d = 5'h11;
                M_tiles_type_d[51+2-:3] = 3'h3;
                M_step_counter_d = M_step_counter_q + 1'h1;
              end
            end
          end else begin
            if (M_tiles_type_q[(M_player_pos_q + 3'h7)*3+2-:3] == 3'h1) begin
              M_win_toggle_d = 1'h0;
              M_lose_toggle_d = 1'h1;
            end
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
        if (M_tiles_type_q[(M_player_pos_q - 1'h1)*3+2-:3] == 3'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
          M_tiles_type_d[(M_player_pos_q - 1'h1)*3+2-:3] = 3'h3;
          M_player_pos_d = M_player_pos_q - 1'h1;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q - 1'h1)*3+2-:3] == 3'h4) begin
            if (level_state == 2'h3) begin
              if (M_player_pos_q == 4'h9) begin
                M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                M_player_pos_d = 5'h11;
                M_tiles_type_d[51+2-:3] = 3'h3;
                M_step_counter_d = M_step_counter_q + 1'h1;
              end else begin
                if (M_player_pos_q == 5'h12) begin
                  M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                  M_player_pos_d = 4'h8;
                  M_tiles_type_d[24+2-:3] = 3'h3;
                  M_step_counter_d = M_step_counter_q + 1'h1;
                end
              end
            end else begin
              if (level_state == 3'h4) begin
                if (M_player_pos_q == 3'h4) begin
                  M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                  M_player_pos_d = 4'hf;
                  M_tiles_type_d[45+2-:3] = 3'h3;
                  M_step_counter_d = M_step_counter_q + 1'h1;
                end else begin
                  if (M_player_pos_q == 5'h10) begin
                    M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                    M_player_pos_d = 2'h3;
                    M_tiles_type_d[9+2-:3] = 3'h3;
                    M_step_counter_d = M_step_counter_q + 1'h1;
                  end
                end
              end
            end
          end else begin
            if (M_tiles_type_q[(M_player_pos_q - 1'h1)*3+2-:3] == 3'h1) begin
              M_win_toggle_d = 1'h0;
              M_lose_toggle_d = 1'h1;
            end
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
        if (M_tiles_type_q[(M_player_pos_q + 1'h1)*3+2-:3] == 3'h0) begin
          M_step_counter_d = M_step_counter_q + 1'h1;
          M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
          M_tiles_type_d[(M_player_pos_q + 1'h1)*3+2-:3] = 3'h3;
          M_player_pos_d = M_player_pos_q + 1'h1;
        end else begin
          if (M_tiles_type_q[(M_player_pos_q + 1'h1)*3+2-:3] == 3'h4) begin
            if (level_state == 2'h3) begin
              if (M_player_pos_q == 3'h7) begin
                M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                M_player_pos_d = 5'h11;
                M_tiles_type_d[51+2-:3] = 3'h3;
                M_step_counter_d = M_step_counter_q + 1'h1;
              end else begin
                if (M_player_pos_q == 5'h10) begin
                  M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                  M_player_pos_d = 4'h8;
                  M_tiles_type_d[24+2-:3] = 3'h3;
                  M_step_counter_d = M_step_counter_q + 1'h1;
                end
              end
            end else begin
              if (level_state == 3'h4) begin
                if (M_player_pos_q == 2'h2) begin
                  M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                  M_player_pos_d = 4'hf;
                  M_tiles_type_d[45+2-:3] = 3'h3;
                  M_step_counter_d = M_step_counter_q + 1'h1;
                end else begin
                  if (M_player_pos_q == 4'he) begin
                    M_tiles_type_d[(M_player_pos_q)*3+2-:3] = 3'h1;
                    M_player_pos_d = 2'h3;
                    M_tiles_type_d[9+2-:3] = 3'h3;
                    M_step_counter_d = M_step_counter_q + 1'h1;
                  end
                end
              end
            end
          end else begin
            if (M_tiles_type_q[(M_player_pos_q + 1'h1)*3+2-:3] == 3'h1) begin
              M_win_toggle_d = 1'h0;
              M_lose_toggle_d = 1'h1;
            end
          end
        end
      end
    end
    if (!right & M_sc_out) begin
      M_right_cond_d = 1'h0;
    end
    if (M_player_pos_q == 2'h3 & M_sc_out & M_alu_out) begin
      M_win_toggle_d = 1'h1;
      M_lose_toggle_d = 1'h0;
    end
    if (level_state == 2'h3 & M_player_pos_q == 5'h11) begin
      M_tiles_type_d[51+2-:3] = 3'h3;
    end else begin
      if (level_state == 2'h3 & M_player_pos_q == 4'h8) begin
        M_tiles_type_d[24+2-:3] = 3'h3;
      end else begin
        if (level_state == 3'h4 & M_player_pos_q == 4'hf) begin
          M_tiles_type_d[45+2-:3] = 3'h3;
        end else begin
          if (level_state == 3'h4 & M_player_pos_q == 2'h3) begin
            M_tiles_type_d[9+2-:3] = 3'h3;
          end
        end
      end
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