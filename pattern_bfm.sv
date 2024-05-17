class pattern_bfm;
	pattern_tx tx;
	virtual pattern_intf vif;
	function new();
		vif=top.pif;
	endfunction
	task run();
		forever begin
			pattern_common::gen2bfm.get(tx);
			drive_tx(tx);
			tx.print("pattern_bfm");
		end
	endtask
	task drive_tx(pattern_tx tx);
	//	@(posedge vif.clk_i);
		@(vif.bfm_cb);
		vif.bfm_cb.valid_i<=1;
		vif.bfm_cb.data_i <= tx.data_i;
		tx.pattern_o = vif.bfm_cb.pattern_o;
	endtask
endclass
