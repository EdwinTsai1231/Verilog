`define UnitTime 32'd 25000
module Unit_fd(clk_in ,reset, clk_out) ; // Time Frequency Divider
    input clk_in,reset ;
    output reg clk_out ;
    reg [31:0] count ;

    always@(posedge clk_in)
    begin
        if(!reset)
            begin
                count<=32'd 0 ;
                clk_out <= 1'b 0;
            end
        else
            begin
                if(count==`UnitTime)
                    begin
                        count <= 0;
                        clk_out <= ~clk_out;
                    end
                else
                    begin
                        count = count+1 ;//Is the notation between count and count+1 '=' or '<='?
                    end
            end
    end
endmodule

`define Time2 32'd 3125000
module fd2(clk_in ,reset, clk_out) ; // Time Frequency Divider
    input clk_in,reset ;
    output reg clk_out ;
    reg [31:0] count ;

    always@(posedge clk_in)
    begin
        if(!reset)
            begin
                count<=32'd 0 ;
                clk_out <= 1'b 0;
            end
        else
            begin
                if(count==`Time2)
                    begin
                        count <= 0;
                        clk_out <= ~clk_out;
                    end
                else
                    begin
                        count = count+1 ;//Is the notation between count and count+1 '=' or '<='?
                    end
            end
    end
endmodule

`define Time 32'd 2500000
module fd(clk_in ,reset, clk_out) ; // Time Frequency Divider
    input clk_in,reset ;
    output reg clk_out ;
    reg [31:0] count ;

    always@(posedge clk_in)
    begin
        if(!reset)
            begin
                count<=32'd 0 ;
                clk_out <= 1'b 0;
            end
        else
            begin
                if(count==`Time)
                    begin
                        count <= 0;
                        clk_out <= ~clk_out;
                    end
                else
                    begin
                        count = count+1 ;//Is the notation between count and count+1 '=' or '<='?
                    end
            end
    end
endmodule

module Obstacle (clk  , reset , gap , spawn_obstacle_7 , spawn_obstacle_6 , spawn_obstacle_5 , spawn_obstacle_4 , spawn_obstacle_3
    ,spawn_obstacle_2 , spawn_obstacle_1 , spawn_obstacle_0 ) ;

    input clk ;
    input reset ;
    input [1:0] gap ;
    output reg [1:0] spawn_obstacle_7 ;
    output reg [1:0] spawn_obstacle_6 ;
    output reg [1:0] spawn_obstacle_5 ;
    output reg [1:0] spawn_obstacle_4 ;
    output reg [1:0] spawn_obstacle_3 ;
    output reg [1:0] spawn_obstacle_2 ;
    output reg [1:0] spawn_obstacle_1 ;
    output reg [1:0] spawn_obstacle_0 ;
    wire[2:0] ran ;
    wire[31:0] random ;
    reg i_Seed_DV;
	reg [31:0] i_Seed_Data;
	wire [31:0] o_LFSR_Data;
	wire o_LFSR_Done;

    LFSR #(.NUM_BITS(32)) dut( clk , reset, i_Seed_DV , i_Seed_Data , o_LFSR_Data , o_LFSR_Done );
    assign ran = o_LFSR_Data [2:0] ;


    always@(posedge clk , negedge reset)
    begin
        if(!reset)
            begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 00 ;  
            end
        else
            begin
            case(ran)
            3'd 0 :begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 11 ;
                spawn_obstacle_6 <= 2'b 11 ;
                spawn_obstacle_7 <= 2'b 11 ;
            end
            3'd 1 :begin
                spawn_obstacle_0 <= 2'b 11 ;
                spawn_obstacle_1 <= 2'b 11 ;
                spawn_obstacle_2 <= 2'b 11 ;
                spawn_obstacle_3 <= 2'b 11 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 00 ;
            end
            3'd 2 :begin
                spawn_obstacle_0 <= 2'b 11 ;
                spawn_obstacle_1 <= 2'b 11 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 11 ;
                spawn_obstacle_7 <= 2'b 11 ;
            end
            3'd 3 :begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 11 ;
                spawn_obstacle_6 <= 2'b 11 ;
                spawn_obstacle_7 <= 2'b 11 ;
            end
            3'd 4 :begin
                spawn_obstacle_0 <= 2'b 11 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 11 ;
            end
            3'd 5 :begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 00 ;
            end
            3'd 6 :begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 00 ;
            end
            3'd 7 :begin
                spawn_obstacle_0 <= 2'b 00 ;
                spawn_obstacle_1 <= 2'b 00 ;
                spawn_obstacle_2 <= 2'b 00 ;
                spawn_obstacle_3 <= 2'b 00 ;
                spawn_obstacle_4 <= 2'b 00 ;
                spawn_obstacle_5 <= 2'b 00 ;
                spawn_obstacle_6 <= 2'b 00 ;
                spawn_obstacle_7 <= 2'b 00 ;
            end
        endcase
        end
    end
endmodule

module LFSR #(parameter NUM_BITS = 32)(
   input i_Clk,
   input i_Enable,

   // Optional Seed Value
   input i_Seed_DV,
   input [NUM_BITS-1:0] i_Seed_Data,

   output [NUM_BITS-1:0] o_LFSR_Data,
   output o_LFSR_Done
   );

  reg [NUM_BITS:1] r_LFSR = 0;
  reg              r_XNOR;

  always @(posedge i_Clk)
    begin
      if (i_Enable == 1'b1)
        begin
          if (i_Seed_DV == 1'b1)
            r_LFSR <= i_Seed_Data;
          else
            r_LFSR <= {r_LFSR[NUM_BITS-1:1], r_XNOR};
        end
    end

  always @(*)
    begin
      case (NUM_BITS)
        3: begin
          r_XNOR = r_LFSR[3] ^~ r_LFSR[2];
        end
        4: begin
          r_XNOR = r_LFSR[4] ^~ r_LFSR[3];
        end
        5: begin
          r_XNOR = r_LFSR[5] ^~ r_LFSR[3];
        end
        6: begin
          r_XNOR = r_LFSR[6] ^~ r_LFSR[5];
        end
        7: begin
          r_XNOR = r_LFSR[7] ^~ r_LFSR[6];
        end
        8: begin
          r_XNOR = r_LFSR[8] ^~ r_LFSR[6] ^~ r_LFSR[5] ^~ r_LFSR[4];
        end
        9: begin
          r_XNOR = r_LFSR[9] ^~ r_LFSR[5];
        end
        10: begin
          r_XNOR = r_LFSR[10] ^~ r_LFSR[7];
        end
        11: begin
          r_XNOR = r_LFSR[11] ^~ r_LFSR[9];
        end
        12: begin
          r_XNOR = r_LFSR[12] ^~ r_LFSR[6] ^~ r_LFSR[4] ^~ r_LFSR[1];
        end
        13: begin
          r_XNOR = r_LFSR[13] ^~ r_LFSR[4] ^~ r_LFSR[3] ^~ r_LFSR[1];
        end
        14: begin
          r_XNOR = r_LFSR[14] ^~ r_LFSR[5] ^~ r_LFSR[3] ^~ r_LFSR[1];
        end
        15: begin
          r_XNOR = r_LFSR[15] ^~ r_LFSR[14];
        end
        16: begin
          r_XNOR = r_LFSR[16] ^~ r_LFSR[15] ^~ r_LFSR[13] ^~ r_LFSR[4];
          end
        17: begin
          r_XNOR = r_LFSR[17] ^~ r_LFSR[14];
        end
        18: begin
          r_XNOR = r_LFSR[18] ^~ r_LFSR[11];
        end
        19: begin
          r_XNOR = r_LFSR[19] ^~ r_LFSR[6] ^~ r_LFSR[2] ^~ r_LFSR[1];
        end
        20: begin
          r_XNOR = r_LFSR[20] ^~ r_LFSR[17];
        end
        21: begin
          r_XNOR = r_LFSR[21] ^~ r_LFSR[19];
        end
        22: begin
          r_XNOR = r_LFSR[22] ^~ r_LFSR[21];
        end
        23: begin
          r_XNOR = r_LFSR[23] ^~ r_LFSR[18];
        end
        24: begin
          r_XNOR = r_LFSR[24] ^~ r_LFSR[23] ^~ r_LFSR[22] ^~ r_LFSR[17];
        end
        25: begin
          r_XNOR = r_LFSR[25] ^~ r_LFSR[22];
        end
        26: begin
          r_XNOR = r_LFSR[26] ^~ r_LFSR[6] ^~ r_LFSR[2] ^~ r_LFSR[1];
        end
        27: begin
          r_XNOR = r_LFSR[27] ^~ r_LFSR[5] ^~ r_LFSR[2] ^~ r_LFSR[1];
        end
        28: begin
          r_XNOR = r_LFSR[28] ^~ r_LFSR[25];
        end
        29: begin
          r_XNOR = r_LFSR[29] ^~ r_LFSR[27];
        end
        30: begin
          r_XNOR = r_LFSR[30] ^~ r_LFSR[6] ^~ r_LFSR[4] ^~ r_LFSR[1];
        end
        31: begin
          r_XNOR = r_LFSR[31] ^~ r_LFSR[28];
        end
        32: begin
          r_XNOR = r_LFSR[32] ^~ r_LFSR[22] ^~ r_LFSR[2] ^~ r_LFSR[1];
        end

      endcase // case (NUM_BITS)
    end // always @ (*)

  assign o_LFSR_Data = r_LFSR[NUM_BITS:1];
  assign o_LFSR_Done = (r_LFSR[NUM_BITS:1] == i_Seed_Data) ? 1'b1 : 1'b0;

endmodule // LFSR

module LD_state( up , down , map_ld_0 , map_ld_1 , map_ld_2  , map_ld_3  , map_ld_4  , map_ld_5  , map_ld_6  , map_ld_7 , eight_one_clk ) ; // output a state
    input up , down , eight_one_clk ;		//跳處理:1/8秒改變
    output reg [3:0] map_ld_0  ,  map_ld_1  ,  map_ld_2  ,  map_ld_3  ,  map_ld_4  ,  map_ld_5  , map_ld_6  ,  map_ld_7   ;
	 reg jump_or_not = 0 ;					//是不是在跳 , 是不是在蹲
	 reg [3:0] count = 4'd0 ;			//count : 跳狀態為何
	 wire alw_true = 1 ;
	 
	
	 always @ (posedge eight_one_clk)					//蹲
	 //-----------------------------------------------------給予判斷值
begin
if(up || down || alw_true == 1)
	 begin
		if(jump_or_not == 0)					//沒有在跳
		begin
			if(up)								//按下up => 跳吧!
			
			begin
				jump_or_not <= 1 ;
				count <= count + 4'd1 ;
				if(down)						//要跳 && 要蹲
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0000 ;
						map_ld_4 <= 4'b0000 ;
						map_ld_5 <= 4'b1111 ;
						map_ld_6 <= 4'b0101 ;
						map_ld_7 <= 4'b0000 ;
					end
				else							//要跳 && 不蹲
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0111 ;
						map_ld_4 <= 4'b0100 ;
						map_ld_5 <= 4'b0110 ;
						map_ld_6 <= 4'b1100 ;
						map_ld_7 <= 4'b0000 ;
					end
			end
			
			else 									//沒按up => 不跳!
			
			begin
				if(down)							//沒跳 && 蹲
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0000 ;
						map_ld_4 <= 4'b0000 ;
						map_ld_5 <= 4'b0000 ;
						map_ld_6 <= 4'b1111 ;
						map_ld_7 <= 4'b0101 ;
					end
				else
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0000 ;
						map_ld_4 <= 4'b0111 ;
						map_ld_5 <= 4'b0100 ;
						map_ld_6 <= 4'b0110 ;
						map_ld_7 <= 4'b1100 ;
					end
			end
			
		end
		else 									//正在跳
		begin
			count <= count + 4'd1 ;				//下一個狀態
			
			if(count == 4'd9)
				begin
					count <= 0 ;
					jump_or_not <= 0 ;
				end
			else
				begin
				end
			
		
			if(down)							//跳 && 蹲
			
			begin
				case (count)
				4'd1 , 4'd8 :
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0000 ;
						map_ld_4 <= 4'b0000 ;
						map_ld_5 <= 4'b1111 ;
						map_ld_6 <= 4'b0101 ;
						map_ld_7 <= 4'b0000 ;
					end
				4'd2 , 4'd7 :
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b0000 ;
						map_ld_4 <= 4'b1111 ;
						map_ld_5 <= 4'b0101 ;
						map_ld_6 <= 4'b0000 ;
						map_ld_7 <= 4'b0000 ;
					end
				4'd3 , 4'd6 :
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b0000 ;
						map_ld_3 <= 4'b1111 ;
						map_ld_4 <= 4'b0101 ;
						map_ld_5 <= 4'b0000 ;							
						map_ld_6 <= 4'b0000 ;
						map_ld_7 <= 4'b0000 ;
					end
				4'd4 , 4'd5 :
					begin
						map_ld_0 <= 4'b0000 ;
						map_ld_1 <= 4'b0000 ;
						map_ld_2 <= 4'b1111 ;
						map_ld_3 <= 4'b0101 ;
						map_ld_4 <= 4'b0000 ;
						map_ld_5 <= 4'b0000 ;
						map_ld_6 <= 4'b0000 ;
						map_ld_7 <= 4'b0000 ;
					end
				endcase
			end
			
			else								//跳 && 不蹲
			
				begin
				case (count)
					4'd1 , 4'd8 :
						begin
							map_ld_0 <= 4'b0000 ;
							map_ld_1 <= 4'b0000 ;
							map_ld_2 <= 4'b0000 ;
							map_ld_3 <= 4'b0111 ;
							map_ld_4 <= 4'b0100 ;
							map_ld_5 <= 4'b0110 ;
							map_ld_6 <= 4'b1100 ;
							map_ld_7 <= 4'b0000 ;
						end
					4'd2 , 4'd7 :
						begin
							map_ld_0 <= 4'b0000 ;
							map_ld_1 <= 4'b0000 ;
							map_ld_2 <= 4'b0111 ;
							map_ld_3 <= 4'b0100 ;
							map_ld_4 <= 4'b0110 ;
							map_ld_5 <= 4'b1100 ;
							map_ld_6 <= 4'b0000 ;
							map_ld_7 <= 4'b0000 ;
						end
					4'd3 , 4'd6 :
						begin
							map_ld_0 <= 4'b0000 ;
							map_ld_1 <= 4'b0111 ;
							map_ld_2 <= 4'b0100 ;
							map_ld_3 <= 4'b0110 ;
							map_ld_4 <= 4'b1100 ;
							map_ld_5 <= 4'b0000 ;
							map_ld_6 <= 4'b0000 ;
							map_ld_7 <= 4'b0000 ;
						end
					4'd4 , 4'd5 :
						begin
							map_ld_0 <= 4'b0111 ;
							map_ld_1 <= 4'b0100 ;
							map_ld_2 <= 4'b0110 ;
							map_ld_3 <= 4'b1100 ;
							map_ld_4 <= 4'b0000 ;
							map_ld_5 <= 4'b0000 ;
							map_ld_6 <= 4'b0000 ;
							map_ld_7 <= 4'b0000 ;
						end
				endcase
				end
			
		end			//129行的
	end				//67行的
	
else 
	begin
		
	end
	
end					//always的end
endmodule

`define padTime 10 
module obstacle(clock , keypadCol , keypadRow , reset , dot_row , dot_col1 , dot_col2 ) ;
    
    /*device*/
    input clock , reset ;
    output reg [7:0] dot_row , dot_col1 , dot_col2 ; // show the picture in the dot matrix
    wire unit_clk ; // unit_clk represents the time to refresh the dot matrix   
    wire clk ;
    wire eight_one_clk ;

    input [3:0] keypadCol ;
	output reg [3:0] keypadRow ;

    reg [3:0] keypadBuf ;
	reg [3:0] keypadDelay ;
    reg stop , start , restart , up , down ;
    
    /*map*/
    wire[7:0] col1[7:0] ,  col2[7:0]  ; // Combine the mv_map and map_ld together , and send it to dot_col 
    reg[7:0] mv_map[7:0][1:0] ; // the map only need to record the column  
    wire [3:0] map_ld[7:0] ; // the map of the little dinosaur
    reg [15:0] record_obstacle[7:0] ; // position of obstacle 
    wire [7:0] temp[7:0] ;
   
    /*obstacle*/ 
    wire[1:0] spawn_obstacle[7:0] ; // generate obstacles
    reg[1:0] obstacle[7:0] ; // spawn_obstacle give the generated one to obstacle
    reg[1:0] gap ; // used to control the obstacle not too close to other obstacles

    /*other*/
    wire hit ; // check if the little dinosaur was hit or not 
    wire score ;
    reg [2:0] row_count ;

    Unit_fd f2 (.clk_in(clock) , .reset(reset) , .clk_out(unit_clk)) ; // frequency divider 

    fd f3 (.clk_in(clock) , .reset(reset) , .clk_out(clk)) ; // frequency divider 

    fd2 f4 (.clk_in(clock) , .reset(reset) , .clk_out(eight_one_clk)) ; // frequency divider 

    LD_state m1 ( up , down , map_ld[0], map_ld[1], map_ld[2],  map_ld[3],  map_ld[4],  map_ld[5],  map_ld[6],  map_ld[7] , eight_one_clk) ;

    // create a new obstacle
    Obstacle m2 (clk , reset , gap , spawn_obstacle[7] , spawn_obstacle[6] , spawn_obstacle[5] , spawn_obstacle[4] , spawn_obstacle[3]
    ,spawn_obstacle[2] , spawn_obstacle[1] , spawn_obstacle[0] ) ;

    /* Merge the map */
    assign temp[0] = mv_map[0][0] ;
    assign col1[0] = {(temp[0][7:4] | map_ld[0]) , temp[0][3:0]}  ; 
    assign col2[0] = mv_map[0][1] ;

    assign temp[1] = mv_map[1][0] ;
    assign col1[1] = {(temp[1][7:4] | map_ld[1]) , temp[1][3:0]}  ; 
    assign col2[1] = mv_map[1][1] ;

    assign temp[2] = mv_map[2][0] ;
    assign col1[2] = {(temp[2][7:4] | map_ld[2]) , temp[2][3:0]}  ; 
    assign col2[2] = mv_map[2][1] ;

    assign temp[3] = mv_map[3][0] ;
    assign col1[3] = {(temp[3][7:4] | map_ld[3]) , temp[3][3:0]}  ; 
    assign col2[3] = mv_map[3][1] ;

    assign temp[4] = mv_map[4][0] ;
    assign col1[4] = {(temp[4][7:4] | map_ld[4]) , temp[4][3:0]}  ; 
    assign col2[4] = mv_map[4][1] ;

    assign temp[5] = mv_map[5][0] ;
    assign col1[5] = {(temp[5][7:4] | map_ld[5]) , temp[5][3:0]}  ; 
    assign col2[5] = mv_map[5][1] ;

    assign temp[6] = mv_map[6][0] ;
    assign col1[6] = {(temp[6][7:4] | map_ld[6]) , temp[6][3:0]}  ; 
    assign col2[6] = mv_map[6][1] ;

    assign temp[7] = mv_map[7][0] ;
    assign col1[7] = {(temp[7][7:4] | map_ld[7]) , temp[7][3:0]}  ; 
    assign col2[7] = mv_map[7][1] ;
    /* Merge the map */

    /* Refresh the map */
    always@(posedge unit_clk , negedge reset )
    begin
        if(!reset)
            begin

            end
        else
                begin
                    row_count <= row_count+1 ;
                    case(row_count)
                    3'd 0 :
                        dot_row <= 8'b 01111111 ;
                    3'd 1 :
                        dot_row <= 8'b 10111111 ;
                    3'd 2 :
                        dot_row <= 8'b 11011111 ;
                    3'd 3 :
                        dot_row <= 8'b 11101111 ;
                    3'd 4 :
                        dot_row <= 8'b 11110111 ;
                    3'd 5 :
                        dot_row <= 8'b 11111011 ;
                    3'd 6 :
                        dot_row <= 8'b 11111101 ;
                    3'd 7 :
                        dot_row <= 8'b 11111110 ;
                endcase

                case(row_count)
                    3'd 0 :
                    begin
                        dot_col1 <= col1[0] ;
                        dot_col2 <= col2[0] ;
                    end
                    3'd 1 :
                    begin
                        dot_col1 <= col1[1] ;
                        dot_col2 <= col2[1] ;
                    end
                    3'd 2 :
                    begin
                        dot_col1 <= col1[2] ;
                        dot_col2 <= col2[2] ;
                    end
                    3'd 3 :
                    begin
                        dot_col1 <= col1[3] ;
                        dot_col2 <= col2[3] ;
                    end
                    3'd 4 :
                    begin
                        dot_col1 <= col1[4] ;
                        dot_col2 <= col2[4] ;
                    end
                    3'd 5 :
                    begin
                        dot_col1 <= col1[5] ;
                        dot_col2 <= col2[5] ;
                    end
                    3'd 6 :
                    begin
                        dot_col1 <= col1[6] ;
                        dot_col2 <= col2[6] ;
                    end
                    3'd 7 :
                    begin
                        dot_col1 <= col1[7] ;
                        dot_col2 <= col2[7] ;
                    end
                    endcase
                end
        end
    /* Refresh the map */
   
   /* Moving the map */ 
    always@(posedge clk )
    begin
        if(gap == 2'd 3) // prodice the obstacle
            begin
                gap <= 2'd 0 ;
 
                obstacle[0] <= spawn_obstacle[0] ;
                record_obstacle[0][1:0] <= spawn_obstacle[0] ; // the obstacle map 

                obstacle[1] <= spawn_obstacle[1] ;
                record_obstacle[1][1:0] <= spawn_obstacle[1] ; // the obstacle map 

                obstacle[2] <= spawn_obstacle[2] ;
                record_obstacle[2][1:0] <= spawn_obstacle[2] ; // the obstacle map 

                obstacle[3] <= spawn_obstacle[3] ;
                record_obstacle[3][1:0] <= spawn_obstacle[3] ; // the obstacle map 

                obstacle[4] <= spawn_obstacle[4] ;
                record_obstacle[4][1:0] <= spawn_obstacle[4] ; // the obstacle map 

                obstacle[5] <= spawn_obstacle[5] ;
                record_obstacle[5][1:0] <= spawn_obstacle[5] ; // the obstacle map 

                obstacle[6] <= spawn_obstacle[6] ;
                record_obstacle[6][1:0] <= spawn_obstacle[6] ; // the obstacle map 
                
                obstacle[7] <= spawn_obstacle[7] ;
                record_obstacle[7][1:0] <= spawn_obstacle[7] ; // the obstacle map 

            end
        else
            begin
            
                record_obstacle[0] <= record_obstacle[0] << 1 ; // the obstacle map 
                record_obstacle[1] <= record_obstacle[1] << 1 ; // the obstacle map 
                record_obstacle[2] <= record_obstacle[2] << 1 ; // the obstacle map 
                record_obstacle[3] <= record_obstacle[3] << 1 ; // the obstacle map 
                record_obstacle[4] <= record_obstacle[4] << 1 ; // the obstacle map 
                record_obstacle[5] <= record_obstacle[5] << 1 ; // the obstacle map 
                record_obstacle[6] <= record_obstacle[6] << 1 ; // the obstacle map 
                record_obstacle[7] <= record_obstacle[7] << 1 ; // the obstacle map 

                gap <= gap+1 ;

                {mv_map[0][0],mv_map[0][1],obstacle[0]} <= {mv_map[0][0],mv_map[0][1],obstacle[0]} << 1 ;
                {mv_map[1][0],mv_map[1][1],obstacle[1]} <= {mv_map[1][0],mv_map[1][1],obstacle[1]} << 1 ;
                {mv_map[2][0],mv_map[2][1],obstacle[2]} <= {mv_map[2][0],mv_map[2][1],obstacle[2]} << 1 ;
                {mv_map[3][0],mv_map[3][1],obstacle[3]} <= {mv_map[3][0],mv_map[3][1],obstacle[3]} << 1 ;
                {mv_map[4][0],mv_map[4][1],obstacle[4]} <= {mv_map[4][0],mv_map[4][1],obstacle[4]} << 1 ;
                {mv_map[5][0],mv_map[5][1],obstacle[5]} <= {mv_map[5][0],mv_map[5][1],obstacle[5]} << 1 ;
                {mv_map[6][0],mv_map[6][1],obstacle[6]} <= {mv_map[6][0],mv_map[6][1],obstacle[6]} << 1 ;
                {mv_map[7][0],mv_map[7][1],obstacle[7]} <= {mv_map[7][0],mv_map[7][1],obstacle[7]} << 1 ;
            end

    end
    /* Moving the map */

     /* Detect the keypad  */
    always@(posedge unit_clk)
	begin
		if(!reset)
		begin
			keypadRow <= 4'b 1110 ;
			keypadBuf <= 4'b 0000 ;
			keypadDelay <= 4'd 0 ;
		end
		else
		begin
			if(keypadDelay == `padTime)
			begin
				keypadDelay <= 31'd 0 ;
				case({keypadRow, keypadCol})
					8'b1110_1011 : keypadBuf <= 4'h1; // down
					8'b1101_1011 : keypadBuf <= 4'h2; // up
					8'b0111_1101 : keypadBuf <= 4'hd; // start
					8'b0111_1011 : keypadBuf <= 4'he; // stop
					8'b0111_0111 : keypadBuf <= 4'hf; // restart
					default : keypadBuf <= keypadBuf;
				endcase

				case(keypadRow)
					4'b1110 : keypadRow <= 4'b1101;
					4'b1101 : keypadRow <= 4'b1011;
					4'b1011 : keypadRow <= 4'b0111;
					4'b0111 : keypadRow <= 4'b1110;
					default : keypadRow <= 4'b1110;
				endcase
			end
		else
			keypadDelay <= keypadDelay + 1'd 1 ;
		end
	end

    always@(keypadBuf)
    begin
        case(keypadBuf)
            4'h 1 :begin
                down = 1 ;
                up = 0 ;
                start = 0 ;
                stop = 0 ;
                restart = 0 ;
            end

            4'h 2 :begin
                down = 0 ;
                up = 1 ;
                start = 0 ;
                stop = 0 ;
                restart = 0 ;
            end

            4'h d :begin
                down = 0 ;
                up = 0 ;
                start = 1 ;
                stop = 0 ;
                restart = 0 ;
            end

            4'h e :begin
                down = 0 ;
                up = 0 ;
                start = 0 ;
                stop = 1 ;
                restart = 0 ;
            end

            4'h f :begin
                down = 0 ;
                up = 0 ;
                start = 0 ;
                stop = 0 ;
                restart = 1 ;
            end

            default :begin
                down = down ;
                up = up ;
                start = start ;
                restart = restart ;
            end

        endcase
    end
    /* Detect the keypad*/

endmodule

