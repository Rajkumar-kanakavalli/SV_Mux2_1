`include "test.sv"
program program_test (mux_if vif);


   base_test test;
   
   initial begin
   
   
   test = new(vif.tb,vif.tb_mon_in,vif.tb_mon_out);
   test.run();
   $display("[PROGRAM BLOCK] simulation finished at Time =%0t",$time);
   
     end 
   
endprogram
