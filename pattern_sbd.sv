class pattern_sbd;
	pattern_tx tx;
	bit temp;
task run();
	$display("pattern_sbd RUN TASK called");
	forever begin
		pattern_common::mon2sbd.get(tx);
		if(tx.valid_i==1) begin
			temp = tx.pattern_o;
		end
		if(temp==1) begin
			pattern_common::count=pattern_common::count+1;
			$display("%t count=%0d",$time,pattern_common::count);
		end
	end
endtask
	endclass
