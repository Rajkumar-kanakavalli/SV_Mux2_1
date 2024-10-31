module DUT (mux_if dut_if);
     /*logic [3:0]a,b;
	 logic sel;
	 logic [3:0]f;*/

always_comb
	begin
		case(dut_if.sel)
		1'b0:dut_if.f= dut_if.a;
		1'b1:dut_if.f = dut_if.b;
		endcase
	end
endmodule