class pattern_cov;
	pattern_tx tx;
	//reg [5:0]state;
	parameter S_RESET=6'b000001;
	parameter S_B=6'b000010;
	parameter S_BC=6'b000100;
	parameter S_BCB=6'b001000;
	parameter S_BCBB=6'b010000;
	parameter S_BCBBC=6'b100000;
covergroup pattern_cg;
	DATA_CP:coverpoint tx.data_i{
		bins DATA_1_BIN={1};
		bins DATA_2_BIN={0};
		}
	TCP_CP:coverpoint $root.top.dut.state{
		bins res2b	={S_RESET->S_B};
		bins b2bc	={S_B->S_BC};
		bins bc2bcb	={S_BC->S_BCB};
		bins bcb2bcbb	={S_BCB->S_BCBB};
		bins bcbb2bcbbc	={S_BCBB->S_BCBBC};
		bins bcbbc2res 	={S_BCBBC->S_RESET};
		bins bcbbc2b   	={S_BCBBC->S_B};
		}
endgroup
function new();
	pattern_cg=new();
endfunction
	task run();
		$display("pattern_cov RUN TASK called");
		forever begin
			pattern_common::mon2cov.get(tx);
			pattern_cg.sample();
		end
	endtask
endclass
