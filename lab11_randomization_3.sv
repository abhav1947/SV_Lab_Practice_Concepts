/* Constraints in randomization*/

class generator;
  randc reg [3:0] a;
  randc reg [3:0] b;
  
  //constraint data_a {a>3; a<7;}
  //constraint data_b {b==3;}
  
  //constraint data {a>3; a<7; b==3;}  

  /*constraint data_constr {
    (a inside {0,3,[1:4]});
  }*/
  
  // skip from 1 to 3 and 10
  constraint data_constr_2 {
    !(a inside {[1:3], 10});
  }
endclass

module tb;
  generator g1;
  
  initial begin
    g1=new();
    for(int i=0; i<5; i++) begin
      assert(g1.randomize()) else $display("Randomizaion Failed");
      $display("Value of a=%0d",g1.a);
      $display("Value of b=%0d",g1.b);
    end
  end
endmodule
