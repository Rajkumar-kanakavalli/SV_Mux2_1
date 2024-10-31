class generator;
  packet pkt;
  mailbox #(packet) gen_box;
  event e;
  
  int repeat_count;
  
  function new (mailbox #(packet) mbx,event e,int repeat_count); //EXPLICIT OBJECT ARGUMENT
  this.gen_box = mbx;
  this.e = e;
  this.repeat_count=repeat_count;
  endfunction
  
  extern task run();
  endclass
 //------------------------------------------------------------------------ 
  
  task generator::run();
  $display("\n---------------GENERATOR RUN STARTED-------------------");
  repeat (repeat_count)
  
  begin
  pkt = new();
  assert(pkt.randomize());
  $display("[GENERATOR] value of  A=%0d, value of B=%0d,value of SEL=%0b\n",pkt.a,pkt.b,pkt.sel);
  gen_box.put(pkt);
  #10;
  ->e;
  
  end
  $display("-----------------------GENERATOR RUN ENDED-----------------------\n");
  
  endtask