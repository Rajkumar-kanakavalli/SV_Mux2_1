class scoreboard;
    packet ref_pkt;   //handle creation
	packet got_pkt;
	
	mailbox #(packet) ipm_sbd;  //mailbox creation
	mailbox #(packet) opm_sbd;
	
	function new (input mailbox #(packet) ipm_sbd,
	              input mailbox #(packet) opm_sbd);
				  
	this.ipm_sbd = ipm_sbd;
	this.opm_sbd = opm_sbd;
	endfunction
	
	task run();
	$display("--------------------SCOREBOARD STARTED------------------------");
	  
	     // while(1)   acts as forever loop
	  forever
	  begin
	  $display ("[scoreboard] inside while loop");
    ipm_sbd.get(ref_pkt);
    opm_sbd.get(got_pkt);
    
$display("[SCOREBOARD] [REFERENCE OUTPUT] f=%0d, [DUT OUTPUT] f=%0d \n",ref_pkt.f,got_pkt.f);
      if(ref_pkt.f == got_pkt.f)
          $display("************************TEST CASE PASS*********************************************\n");
   else
        $display ("***************************TEST CASE FAIL*********************************************\n"); 
		end
		$display("**************SCOREBOARD RUN ENDED******************");

endtask
endclass		
	
	