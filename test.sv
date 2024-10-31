`include "environment.sv"

class base_test;
    //bit [15:0] no_of_pkts;
	environment env;
	 
	virtual mux_if.tb vif_in;
	virtual mux_if.tb_mon_in  vif_mon_in;     //3 interfaces
	virtual mux_if.tb_mon_out vif_mon_out;
	
 
 function new (input virtual mux_if.tb vif_in,
               input virtual mux_if.tb_mon_in vif_mon_in,
			   input virtual mux_if.tb_mon_out vif_mon_out);
			
	this.vif_in = vif_in;
	this.vif_mon_in = vif_mon_in;
	this.vif_mon_out = vif_mon_out;
 endfunction
 
 function void build();
    // no_of_pkts=5;
    env = new (vif_in,vif_mon_in,vif_mon_out);
 endfunction
 
 task run();
   $display("\n [TEST CASE] run started  at time =%0t",$time);
	build ();
	env.run();
   $display("[TEST CASE] run ended  at time =%0t",$time);
 endtask
 endclass
 
 