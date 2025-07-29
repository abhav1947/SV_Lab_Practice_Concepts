/* Shallow Copy, It means copy only the object handle and not the contents of the object
which means if a copy is created, both the objects will have the same handle which will be pointing to only one memory location*/

class sh_cpy;
  logic [31:0] s1;
  int d;
  
  function new(int d_cp, logic [31:0] s1);
    this.s1 = s1;
    this.d = d_cp;
  endfunction
endclass


module tb;
  sh_cpy s1,s2;
  
  initial begin
    s1 = new(10, 15);
    s2 = s1;
    $display("Content of s1 d=%0d",s1.d);
    $display("Content of s1 s1=%0d",s1.s1);
    $display("Content of s2 d=%0d",s2.d);
    $display("Content of s2 s1=%0d",s2.s1);
    // Changing val of s2;
    s2.d = 17;
    $display("Content of s1 after change d=%0d",s1.d);
    $display("Content of s2 after change d=%0d",s2.d);    
  end
endmodule