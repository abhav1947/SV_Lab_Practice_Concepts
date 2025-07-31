//Functions and Tasks
class first;
  bit [4:0] data = 90;   // Fixed width to store 90
  bit [4:0] data2;
  
  function new(input int data, input int data2, output int data3);
    this.data = data;
    this.data2 = data2;
    data3 = data + data2;
    $display("From custom constructor data= %0d",data);
    $display("From custom constructor data2= %0d",data2);
  endfunction

  function int fun_1(input int a,b);
    this.data = a;
    this.data2 = b;
    return (a + b);
  endfunction
   
  task mul(input int a, input int b);
    int c;
    this.data = a*a;
    this.data2 = b*b;
    $display("Value of Data from data=%0d",this.data);
    $display("Value of Data from data2=%0d",this.data2);
    c = a*b;
    $display("Value of mul from c=%0d",c);
  endtask
endclass

module tb;
  first f;
  int data3_1;
  initial begin
    f = new(10,15,data3_1);
    $display("data = %0d", f.data);
    $display("add(5, 6) = %0d", f.fun_1(6,6));
    $display("data = %0d", f.data);
    f.mul(2,3);
    $display("Data from Constructor data3_1=%0d",data3_1);
  end
endmodule
