`include "interface.sv"
`include "DUT.sv"
`include "program.sv"

 module top;
 //initial begin
  mux_if intf();  //Interface  instantiation
  
  DUT dut(intf);  //DUT Instantiation
  
  program_test testbench(intf);  //program block instantiation
 //end 
  endmodule
  