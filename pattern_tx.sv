class pattern_tx;
	rand bit data_i;
	rand bit valid_i;
	bit pattern_o;
function void print(string name="pattern_tx");
	$display("printing from %s",name);
	$display("%t data_i=%b",$time,data_i);
	$display("%t valid_i=%b",$time,valid_i);
	$display("%t pattern_o=%b",$time,pattern_o);
endfunction
endclass
