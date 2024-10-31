 interface mux_if;
	//mux_if intf;
     logic [3:0]a,b;
	 logic sel;
	 logic [3:0]f;
	 
	 modport tb (output a,output b,output sel,input f);
	 
	 modport tb_mon_in (input a,input b,input sel,output f);  //BFM LOGIC 
	 
	 modport tb_mon_out (input f);
	 
	 endinterface