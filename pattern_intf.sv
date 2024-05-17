interface pattern_intf(input logic clk_i,rst_i);
	logic data_i;
	logic valid_i;
	logic pattern_o;
	clocking bfm_cb@(posedge clk_i);
		default input #0 output #0;
		input pattern_o;
		output data_i;
		output valid_i;
	endclocking
	clocking mon_cb@(posedge clk_i);
		default input #0 output #0;
		input data_i;
		input valid_i;
		input pattern_o;
	endclocking
endinterface
