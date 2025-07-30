/* rand and randc we use for randomization\
rand	Random	Produces random values, possibly repeating
randc	Random cyclic	Produces all possible values once before repeating (cyclic)
*/
class generator;
  //randc bit [1:0] a,b;
  rand bit [1:0] a,b;
  bit [1:0] y;
endclass

module tb;
  generator g;
  
  initial begin
    g =new();
    for(int i =0; i <4 ; i++)
      begin
        g.randomize();
        $display("Value of a=%0d",g.a);
        $display("Value of b=%0d",g.b);
        #10;
      end
  end
endmodule