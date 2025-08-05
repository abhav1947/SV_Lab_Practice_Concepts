/*
Pass by value: A copy of the argument is passed to the function or task.
Modifying this value by function or task does not affect the main value.

Pass by Reference: A handle to actual argument is passed.
Modification affect the original in the caller.
*/

class pass_val;
  task automatic p_val(int a);
    a = 20;
    $display("a=%0d",a);
  endtask
endclass

class pass_ref;
  task automatic p_ref(ref int a);
    a = 20;
    $display("a=%0d",a);
  endtask
endclass


module tb;
  int a=10;
  pass_val pv1;
  pass_ref pr1;
  
  initial begin
    pv1 = new();
    pr1 = new();
    $display("Before Pass by value to task a=%0d",a);
    pv1.p_val(a);
    $display("After Pass by value to task a=%0d",a);
    $display("***********************************");
    $display("Before Pass by value to task a=%0d",a);
    pr1.p_ref(a);
    $display("After Pass by value to task a=%0d",a);
  end
  
endmodule
