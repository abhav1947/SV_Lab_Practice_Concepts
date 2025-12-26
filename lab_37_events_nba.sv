// Event e1 has triggered and wait has occured after it
module tb;
  
  event e1;
  
  task process_A();
    $display("Process A has started at %0t", $time);
    #10;
    -> e1;
    $display("Process A has ended at %0t", $time);
  endtask
  
  task process_B();
    $display("Process B has started at %0t", $time);
    @(e1.triggered);
    $display("Process B has ended at %0t", $time);
  endtask    
  
  initial begin
    fork 
      process_A();
      process_B();
    join
  end
endmodule
