class pattern_gen;
	pattern_tx tx;
task run();
	case(pattern_common::testcase)
		"test_one_tx":begin
			tx=new();
			assert(tx.randomize());
			pattern_common::gen2bfm.put(tx);
			tx.print("pattern_gen");
		end
		"test_valid_tx":begin
			repeat(32) begin
				tx=new();
				assert(tx.randomize() with {tx.valid_i==1;});
				pattern_common::gen2bfm.put(tx);
				tx.print("pattern_valid_gen");
			end
		end
	endcase
endtask
endclass
