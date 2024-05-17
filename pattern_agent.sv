class pattern_agent;
	pattern_gen gen;
	pattern_bfm bfm;
	pattern_mon mon;
	function new();
		gen=new();
		bfm=new();
		mon=new();
	endfunction
	task run();
		fork
		gen.run();
		bfm.run();
		mon.run();
	join
	endtask
endclass
