/*
A Hread or a process is is a piece of code that executes in parallel with other threads. always and intial blocks are spawnned as seperate threads that run parallely.

fork-join allows us to run multiple threads in parallel within it.
There are mainly three kinds of fork-join statemnets.
1) fork-join
2) fork-join-any
3) fork-join-none
*/

module tb;
  
initial begin
  fork 
    begin
      $display("First initial block Completed");  
    end
    
    begin
      $display("Second initial block Completed");
    end

    begin
      $display("Third initial block Completed");
    end
  join
  $display("Fork join completed");
end
  
endmodule
