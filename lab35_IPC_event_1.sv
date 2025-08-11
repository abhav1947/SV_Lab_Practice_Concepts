/*
An event is a synchronize two or more different processes. 

-> Creating an event
	event e1;

-> triggering an event
	-> e1;

-> Wait for event tot happen
	wait (e1.triggered)
    @e1;
*/

module tb;
  // Creating an event
  event e1;
  
  initial begin
    fork
      trig_mon(e1);
      #5 -> e1;
    join_any
    $display("Event Trigger and wait completed");
  end
  
  task trig_mon(event e_int);
    $display("Waiting for Event to trigger at  %0t",$time);
    wait (e1.triggered);
    $display("Event triggerered at %0t",$time);
  endtask
  
endmodule
