class enum_class;
   typedef enum {A, B, C, D, E} _var;
   randc _var a1;
endclass

module tb;
  enum_class e1;
  
  initial begin
    e1 = new();
    repeat(10) begin
      e1.randomize();
      $display("a1 = %s",e1.a1);
    end
  end
endmodule
