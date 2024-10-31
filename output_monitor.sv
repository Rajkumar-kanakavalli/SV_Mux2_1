
 class output_monitor;
    packet pkt;
	
   virtual mux_if.tb_mon_out vif;
   mailbox #(packet)mbx;
   function new (input mailbox #(packet)mbx_in,
                 input virtual mux_if.tb_mon_out vif);
				 
   this.mbx = mbx_in;
   this.vif = vif;
	endfunction

  task run();
 $display("\n------------OUTPUT MONITOR RUN STARTED---------------");

$display("[OUTPUT MONITOR] run started at Time=%0t\n",$time);
   forever
   begin
      pkt=new();
      @(vif.f);
     pkt.f = vif.f;     //pin level to packet level
      mbx.put(pkt);
 
 //pkt.a = vif.a;
 //pkt.b = vif.b;
 //pkt.sel=vif.sel;
 $display("[OUTPUT monitor] pkt.f=%0d,at Time=%0t",pkt.f,$time);
 $display("OUTPUT MONITOR PROCESSED \n");
 
 
 end
 endtask
 endclass

   
   
 