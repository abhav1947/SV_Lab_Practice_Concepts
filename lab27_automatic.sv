/*
The automatic keyword tells SystemVerilog to allocate variables dynamically on the call stack, not statically in memory.

In simple terms:
Each call to a task or function gets its own unique set of variables, like in C/C++.

By default:

Functions are automatic by default

Tasks are static by default
Synopsys vcs,
Cadence xcelium by defalut treat task as Automatic
*/
task print_numbers_without_automatic(int limit);
  int i;
  for (i = 0; i < limit; i++)
    $display("NO AUT: i = %0d", i);
endtask

task automatic print_numbers_with_automatic(int limit);
  for(int i = 0; i < limit; i++)
    $display("AUT: i = %0d",i);
endtask

module tb;
  initial begin
    fork
      //print_numbers_without_automatic(3);
      //print_numbers_without_automatic(5);
      print_numbers_with_automatic(3);
      print_numbers_with_automatic(5);

    join
  end
endmodule
