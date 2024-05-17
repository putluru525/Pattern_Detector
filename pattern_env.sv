class pattern_env;
	pattern_agent agent;
	pattern_cov cov;
	pattern_sbd sbd;
function new();
	agent=new();
	cov=new();
	sbd=new();
endfunction
task run();
	fork
	agent.run();
	cov.run();
	sbd.run();
join
endtask

endclass
