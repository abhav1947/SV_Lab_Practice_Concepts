class first;
  int data=15;
endclass

class custom_copy;
  int data1 = 20;
  int data2 = 30;
  int data3 = 40;
  
  function custom_copy copy();
    custom_copy c1;
    c1 = new();
  	c1.data1 = this.data1;
    c1.data2 = this.data2;
    c1.data3 = this.data3;
    return c1;
  endfunction
  
endclass

module tb;
  first f1;
  first f2;
  custom_copy c11;
  custom_copy c12;
  
  initial begin
    c11 = new();
    c12 = c11.copy();
    $display("This is a custom copy of data1:%0d", c12.data1);
    $display("This is a custom copy of data2:%0d", c12.data2);
    $display("This is a custom copy of data3:%0d", c12.data3);
  end
  
  initial begin
    f1 = new();
    f2 = new f1;
    $display("Data getting copied from f2.data=%0d", f2.data);
  end
endmodule