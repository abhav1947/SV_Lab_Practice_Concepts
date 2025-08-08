/*
Parametrezed class
*/

class base#(
  parameter addr_width = 32);
  
  randc bit [addr_width-1:0] a;
  
  function void display_cust();
    $display("Value of a=%0d",a);
  endfunction
    
endclass


class indi#(
  type addr_width = int,
  type data_width = int,
  parameter ad = 22);
  
  randc int a1;
  randc int d1;
  randc logic [ad-1:0] abh;
  
  function void disp_cust();
    $display("Value of a1 = %0d",a1);
    $display("Value of a1 = %0d",d1);
  endfunction

  constraint addr_con{
    a1 inside {[0:40], 44};
    a1 % 4 == 0;
  }  
endclass

module tb;
  base #(16) b1;
  indi #(bit [3:0], bit [3:0]) i1;
  
  initial begin
    b1 = new();
    i1  = new();
    
    b1.randomize();
	i1.randomize();
    
    i1.disp_cust();
    b1.display_cust();
  end
endmodule


