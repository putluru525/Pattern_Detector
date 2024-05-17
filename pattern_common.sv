class pattern_common;
	static string testcase;
	static mailbox#(pattern_tx) gen2bfm=new();
	static mailbox#(pattern_tx) mon2cov=new();
	static mailbox#(pattern_tx) mon2sbd=new();
	static int count;
endclass
