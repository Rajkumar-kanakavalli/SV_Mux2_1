/* `include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "scoreboard.sv" */

`include "package.sv"
import pkg::*;


class environment;
 //packet pkt;
 generator gen;
 driver drv;
 input_monitor mon_in;
 output_monitor mon_out;
 scoreboard scb;
 
 mailbox #(packet) gen_drv_mbx;             //3 mailbox creations 
 mailbox #(packet) ipm_scb_mbx;
 mailbox #(packet) opm_scb_mbx;
 
 virtual mux_if.tb vif_in;
 virtual mux_if.tb_mon_in vif_mon_in;       //3 interface creations
 virtual mux_if.tb_mon_out vif_mon_out;
 
  event e;
 int repeat_count;
 
 function new(input virtual mux_if.tb vif_in,
              input virtual mux_if.tb_mon_in vif_mon_in,
			  input virtual mux_if.tb_mon_out vif_mon_out);
			 // input mailbox #(packet)gen_drv_mbx,
			  //input mailbox #(packet) ipm_scb_mbx,
			  //input mailbox #(packet) opm_scb_mbx,
			  
			  
			  
  this.vif_in = vif_in;
  this.vif_mon_in = vif_mon_in;
  this.vif_mon_out = vif_mon_out;
  
  /* this.gen_drv_mbx = gen_drv_mbx;
  this.ipm_scb_mbx = ipm_scb_mbx;
  this.opm_scb_mbx = opm_scb_mbx; */
endfunction

   function void build();
       gen_drv_mbx = new();
       ipm_scb_mbx = new();
       opm_scb_mbx = new();
	   
	   
	   gen      = new(gen_drv_mbx,e,repeat_count);
	   drv      = new(gen_drv_mbx,vif_in,e);
	   mon_in   = new(ipm_scb_mbx,vif_mon_in,e);
	   mon_out  = new(opm_scb_mbx,vif_mon_out);
	   scb      = new(ipm_scb_mbx,opm_scb_mbx);
 endfunction
 
 
task run();
  $display("\n [ENVIRONNMENT] run started at time =%0t",$time);
  repeat_count=10;
  build();

  fork
      gen.run();
	  drv.run();
	  mon_in.run();
	  mon_out.run();
	  scb.run();
	  join_any
	  #10;
	 endtask
	 endclass
	  


                      
 

