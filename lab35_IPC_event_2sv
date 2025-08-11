/*
-> Event is a static object handle ti synchronize between two or more concurrently active processes.
-> One process will trigger the event tand the other will wait for this event

Can be assigned null
	Eg: event over = null;

Can be assigned to different event, in this case both the variables will point to the same same event object
	Eg: even over = o2;
    
    
-> Named events can be triggered usinf -> or ->> operator
-> Process can wait for an event using @ operator or .triggered.
*/

module tb;
  event e1;
  event e2;
  
  // Synhronising threads inside for join
  initial begin
    fork
      begin
        wait(e2.triggered)
        $display("Thread 1 running at t = %0t", $time);
      end
      begin
        wait(e1.triggered)
        $display("Thread 2 running at t = %0t", $time);
        #5 -> e2;
      end
      begin
        $display("Thread 3 running at t = %0t", $time);
        #5 -> e1;
      end
    join
  end
endmodule
