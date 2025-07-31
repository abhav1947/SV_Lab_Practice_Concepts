class generator;
  
  int max;
  int min;
  randc int a,b;
  
  function void pre_domize(int min, int max);
    this.min = min;
    this.max = max;
  endfunction
  
  constraint data {
    a inside {[min:max]};
    b inside {[min:max]};
  }
  
  function void post_domize();
    $display("Val of a=%0d",a);
    $display("Val of b=%0d",b);
  endfunction
  
endclass


module tb;
  generator g1;
  
  initial begin
    g1 = new();
    g1.pre_domize(0,5);
    repeat(10) begin
      assert(g1.randomize()) $display("Assertion Successful");
      else $display("Assertion Failed");
      g1.post_domize();
    end 
  end
endmodule
