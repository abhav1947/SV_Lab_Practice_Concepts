module tb;
  semaphore credits = new(6);

  task automatic job(string name, int need, time work_ns);
    $display("[%0t] %s requesting %0d credits", $time, name, need);
    credits.get(need); // blocks until all `need` credits are available
    $display("[%0t] %s acquired %0d (remaining now unknown to us)", $time, name, need);

    // critical / limited section
    #work_ns;
    $display("[%0t] %s done, returning %0d", $time, name, need);
    credits.put(need);
  endtask

  initial begin
    fork
      job("A", 2, 30ns);  // uses 2 credits
      job("B", 3, 20ns);  // uses 3 credits
      job("C", 1, 10ns);  // uses 1 credit
      job("D", 2, 5ns);
    join

    $display("[%0t] All jobs complete", $time);
  end
endmodule
