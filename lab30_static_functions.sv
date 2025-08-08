/*
A static function is a dunction inside a class which doesnot require a handle to call it. It can be called without constructing a class
*** Static functions can not be virtual
*** scope resolution operator ::
*** Non static members can not be passed to static functions, will get a compillation error

Even if an object is created for the class and the static function is called, the data will be stored from the previous call
*/

class static_func;
  int a=0;
  static int b=0;
  
  static function void abh();
    b++;
    //a++;
    $display("Print from static function");
    //$display("Val of a = %0d",a);
    $display("Val of b = %0d",b);
  endfunction
endclass

module tb;
  static_func s1;
  initial begin
    s1 = new();
    s1.abh();
    s1.abh();
    static_func::abh();
    static_func::abh();
    s1.abh();
    static_func::abh();
    static_func::abh();
    static_func::abh();
    static_func::abh();
    static_func::abh();
  end
  
  
endmodule

  
