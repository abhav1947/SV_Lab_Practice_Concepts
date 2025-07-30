// How to check if randomization is successful 

class generator;
  randc bit [3:0] a;
  randc logic [4:0] b;
endclass

module tb;
  generator g1;
  
  initial begin
    g1 = new();
    for(int i=0; i < 10; i++) begin
      assert(g1.randomize()) else $display("Randomization has failed for i=%0d",i);
      $display("Data a=%0d",g1.a);
      $display("Data b=%0d",g1.b);
    end
  end
endmodule