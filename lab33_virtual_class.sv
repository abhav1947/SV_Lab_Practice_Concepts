/*
Pure and virtual class
Virtual Class:
-> Declaring a virtual class makes it abstract
-> Abstract class handler can not be created directly, if done will throw an error
-> The only way to use it, is to extend it with a non virtual sub class
Eg:
virtual class base_seq_item extends uvm_sequence_item;
  pure virtual function void pack();
  pure virtual function void unpack();
endclass
*/

virtual class base;
  function void abh_1();
    $display("This is base class print");
  endfunction
endclass

class child extends base;
  
  /*
  function void abh_1();
    $display("This is child class-1");
  endfunction
  */
  
  function void abh_2();
    $display("This is child class-2");
  endfunction
  
endclass

module tb;
  // 1) You can uncommnet this and try base b1;
  child c1;
  
  initial begin
    // 1) You can uncommnet this and try b1 = new();
    c1 = new();
    c1.abh_1();
    c1.abh_2();
  end
endmodule
