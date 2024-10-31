class driver;
  packet got_pkt;
  mailbox #(packet)drv_mbx;
  event e;
  virtual mux_if vif_in;  //To convert from pkt-level to pin-Level;
   
  
  function new (input mailbox #(packet) mbx,input virtual mux_if vif_in,event e);
  this.drv_mbx = mbx;
  this.vif_in = vif_in;
  this.e = e;
  endfunction
  extern task run();
  endclass
//--------------------------------------------------------------------  
  task  driver::run();  //  :: Scope Resulution Operator
  $display("----------------DRIVER RUN STARTED--------------------------");
        forever
	           //repeat(1)
     begin
	 wait(e);
	  drv_mbx.get(got_pkt);
	  $display("[DRIVER] value of A=%0d, value of B=%0d, value of SEL=%0d",got_pkt.a,got_pkt.b,got_pkt.sel);
  vif_in.a = got_pkt.a;        
  vif_in.b = got_pkt.b;       //pkt-level to pin-Level conversion
  vif_in.sel = got_pkt.sel;
  
  //vif_in.f = got_pkt.f;
  $display("[DRIVER - INTERFACE] value of A=%0d, value of B=%0d, value of SEL=%0d\n",vif_in.a,vif_in.b,vif_in.sel);
  
  end
  $display("-------------------------DRIVER RUN ENDED-----------------------\n");
  endtask
  