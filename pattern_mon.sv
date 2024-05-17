class pattern_mon;
	pattern_tx tx;
	virtual pattern_intf vif;
	function new();
		vif=top.pif;
		tx=new();
	endfunction
task run();
	forever begin
	$display("pattern_mon RUN TASK called");
	//@(posedge vif.clk_i);
	@(vif.mon_cb)
	tx.valid_i=vif.mon_cb.valid_i;
	tx.data_i = vif.mon_cb.data_i;
	tx.pattern_o=vif.mon_cb.pattern_o;
	pattern_common::mon2cov.put(tx);
	pattern_common::mon2sbd.put(tx);
	tx.print("pattern_mon");
end
endtask
endclass
