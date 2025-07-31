class custom_datatypes;
  typedef int unsigned uint_32;
  typedef bit unsigned [1:0] ubit_2;
  typedef byte unsigned ubyte_8;
  typedef shortint unsigned ushort_int_16;
  
  typedef int int_32;
  typedef bit [1:0] bit_2;
  typedef byte byte_8;
  typedef shortint shortint_16;
  
endclass

class test extends custom_datatypes;
  
  randc uint_32 a;
  randc ubit_2 b; 
  
  extern constraint data_1;
endclass

constraint test::data_1{
  a inside {[1:10],12};
  if (a==2){
    b == 3;
  } else {
    b == a;
  }
};

module tb;
  test t1;
  
  
  initial begin
    t1 = new();
    t1.data_1.constraint_mode(1);
    repeat(10) begin
      t1.randomize();
      $display("Value of a=%0d",t1.a);
      $display("Value of b=%0d",t1.b);
    end
  end
endmodule