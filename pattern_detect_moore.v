//moore state machine (BCBBC)01001//10110
module pattern_detect_moore(clk_i,rst_i,data_i,valid_i,pattern_o);
parameter S_RESET=6'b000001;
parameter S_B=6'b000010;
parameter S_BC=6'b000100;
parameter S_BCB=6'b001000;
parameter S_BCBB=6'b010000;
parameter S_BCBBC=6'b100000;
parameter B=1'b0;
parameter C=1'b1;

input clk_i,rst_i,data_i,valid_i;
output reg pattern_o;
reg [5:0]state,next_state;

always@(posedge clk_i)begin
	if(rst_i==1)begin
		pattern_o=0;
		state=S_RESET;
		next_state=S_RESET;
	end
	else begin
		if (valid_i==1)begin
			pattern_o=0;
			case(state)
				S_RESET:begin
					if(data_i==B)begin
						next_state=S_B;
					end
					else begin
						next_state=S_RESET;
					end
				end
				S_B:begin
					if(data_i==B)
						next_state=S_B;
					else
						next_state=S_BC;
				end
				S_BC:begin
					if(data_i==B)begin
						next_state=S_BCB;
					end
					else begin
						next_state=S_RESET;
					end
				end
				S_BCB:begin
					if(data_i==B)begin
						next_state=S_BCBB;
					end
					else begin
						next_state=S_BC;
					end
				end
				S_BCBB:begin
					if(data_i==B)begin
						next_state=S_B;
					end
					else begin
						next_state=S_BCBBC;
					end
				end
				S_BCBBC:begin
					pattern_o=1;
					if(data_i==B)begin
						next_state=S_B;
					end
					else begin
						next_state=S_RESET;
					end
				end
			endcase
		end
	end
end
always@(next_state)state=next_state;
endmodule
