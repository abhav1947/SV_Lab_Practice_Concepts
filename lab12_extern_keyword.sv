/* extern keyword */

class generator;
  randc reg [3:0] a;
  randc reg [3:0] b;
  
  extern constraint data;
  extern function void display_ex();
endclass

constraint generator::data{
  (a inside {[0:5]});
  (b inside {[2:15]});
};

    function void generator::display_ex();
      $display("Value of a=%0d | b=%0d", a,b);
    endfunction

module tb;
  generator g1;
  
  initial begin
    g1=new();
    for(int i=0; i<5; i++) begin
      assert(g1.randomize()) else $display("Randomizaion Failed");
      $display("Value of a=%0d",g1.a);
      $display("Value of b=%0d",g1.b);
    end
    g1.display_ex();
  end
endmodule
