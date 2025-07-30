/*Inheritance, using inheritance we can overcome the issue of deep and shallow copy*/

class parent;
  int d=-10;
  int a=20;
  int c = 30;
endclass

class child extends parent;
  int d1=10;
endclass

module tb;
  child c1, c2;
  initial begin
    c1=new();
    c2 = new c1;
    $display("**********c1 values**********");
    $display("Value of c1.d=%0d",c1.d);
    $display("Value of c1.a=%0d",c1.a);
    $display("Value of c1.c=%0d",c1.c);
    $display("Value of c1.d1=%0d",c1.d1);
    $display("**********c2 values**********");
    $display("Value of c2.d=%0d",c2.d);
    $display("Value of c2.a=%0d",c2.a);
    $display("Value of c2.c=%0d",c2.c);
    $display("Value of c2.d1=%0d",c2.d1);
    c1.d = 100;
    c1.d1 = 12;
    $display("**********c1 values update**********");
    $display("Value of c1.d=%0d",c1.d);
    $display("Value of c1.a=%0d",c1.a);
    $display("Value of c1.c=%0d",c1.c);
    $display("Value of c1.d1=%0d",c1.d1);
    $display("**********c2 values update**********");
    $display("Value of c2.d=%0d",c2.d);
    $display("Value of c2.a=%0d",c2.a);
    $display("Value of c2.c=%0d",c2.c);
    $display("Value of c2.d1=%0d",c2.d1);
  end
endmodule