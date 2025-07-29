/* Deep Copy is very similar to custom copy method, we will need to create a custom copy method for
every class that is used within the current class*/

class first;
  int data=0;
  function first copy();
    first f1_s;
    f1_s = new();
    f1_s.data = this.data;
    return f1_s;
  endfunction
endclass

class sh_cpy;
  logic [31:0] s1;
  int d;
  first f1;
  
  function new(int d_cp, logic [31:0] s1);
    f1 = new();
    this.s1 = s1;
    this.d = d_cp;
  endfunction
  
  function sh_cpy copy();
    sh_cpy s1_s;
    s1_s = new(this.d,this.s1);
    s1_s.s1 = this.s1;
    s1_s.d = this.d;
    s1_s.f1 = f1.copy();
    return s1_s;
  endfunction
endclass


module tb;
  sh_cpy s1,s2;
  
  initial begin
    s1 = new(10, 15);
    s2 = s1.copy();
    $display("Content of s1 d=%0d",s1.d);
    $display("Content of s1 s1=%0d",s1.s1);
    $display("Content of s2 d=%0d",s2.d);
    $display("Content of s2 s1=%0d",s2.s1);
    // Changing val of s2;
    s2.d = 17;
    $display("Content of s1 after change d=%0d",s1.d);
    $display("Content of s2 after change d=%0d",s2.d);  
    // Changing val of f1.data
    s2.f1.data=20;
    $display("Content of s1.f1 after change d=%0d",s1.f1.data);
    $display("Content of s2.f1 after change d=%0d",s2.f1.data);    
  end
endmodule