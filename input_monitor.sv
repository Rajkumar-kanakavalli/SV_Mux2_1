class input_monitor;
    packet pkt;
	virtual mux_if.tb_mon_in vif;
    mailbox #(packet)mbx;
    event e;
   
   function new (mailbox #(packet)mbx_in,
                  virtual mux_if.tb_mon_in vif,
				  event e);
				  
   this.mbx = mbx_in;
   this.vif = vif;
   this.e = e;
   endfunction

  task run();
    $display("-----------------INPUT MONITOR RUN STARTED----------------------");
    $display("[INPUT MONITOR] run started at time =%0t",$time);
     forever
          begin
	                                  //repeat(1)
             wait(e); 
       pkt= new(); 
                              //wait(e);
                                 //@(vif.a)
 pkt.a = vif.a;     
 pkt.b = vif.b;      // converting from Pin Level to Packet level
 pkt.sel=vif.sel;
 $display("[INPUT MONITOR] at Time=%0t,pkt.A=%0d,pkt.B=%0d,pkt.SEL= %0d",$time,pkt.a,pkt.b,pkt.sel);
 
 //REFERENCE LOGIC BFM       BUS FUNCTIONAL MODEL
            if(vif.sel == 0)
               pkt.f = vif.a;
             else
              pkt.f = vif.b;
              mbx.put(pkt);
 $display("[INPUT monitor] at Time=%0t,value of f=%0d",$time,pkt.f);
 $display("INPUT MONITOR PROCESSED \n");
 end
 endtask
 endclass 

   
   
 