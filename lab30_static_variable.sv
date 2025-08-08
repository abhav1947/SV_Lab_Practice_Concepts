/*
Static variable Exists for the entire simulation. Every handle created for the class, the static variable will have the same memory 
*/
class static_var;
  int _1_cntr = 0;
  static int _2_cntr = 0;
  
  function void counter();
    _1_cntr++;
    _2_cntr++;
    $display("_1_cntr = %0d",_1_cntr);
    $display("_2_cntr = %0d",_2_cntr);
  endfunction
  
endclass

module tb;
  static_var s1, s2;
  
  initial begin
    s1 = new();
    s2 = new();
    s1.counter();
    s2.counter();
  end
  
endmodule
