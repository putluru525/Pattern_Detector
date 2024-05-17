typedef class pattern_tx;
typedef class pattern_common;
typedef class pattern_sbd;
typedef class pattern_mon;
typedef class pattern_cov;
typedef class pattern_bfm;
typedef class pattern_gen;
typedef class pattern_agent;
typedef class pattern_env;

`include "pattern_tx.sv";
`include "pattern_common.sv";
`include "pattern_intf.sv";
`include "pattern_sbd.sv";
`include "pattern_mon.sv";
`include "pattern_cov.sv";
`include "pattern_bfm.sv";
`include "pattern_gen.sv";
`include "pattern_agent.sv";
`include "pattern_env.sv";
`include "pattern_detect_moore.v";

module top;
//steps to write the top module
//1.declare clk,rst
//2.generate clk,rst
//3.instantiate the interface
//4.instantiate the dut
//5.logic to end the simulatiom
//6.logic to run the env of tb
bit clk,rst;
always #5 clk=~clk;
event e;
initial begin
	rst=1;
	repeat(2) @(posedge clk);
		rst=0;
		->e;
end
pattern_intf pif(clk,rst);
pattern_detect_moore dut(.clk_i(pif.clk_i),
		     .rst_i(pif.rst_i),
		     .data_i(pif.data_i),
		     .valid_i(pif.valid_i),
		     .pattern_o(pif.pattern_o));
pattern_env env;
initial begin
	#500;
	$finish();
	end
initial begin
	env = new();
	wait(e.triggered)
	$value$plusargs("testcase=%s",pattern_common::testcase);
	env.run();
	end
endmodule
