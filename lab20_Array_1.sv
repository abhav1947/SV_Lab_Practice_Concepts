/* Types of Arrays
1) Statics Array: An array whose size is known before cojmpilation time
	Eg: logic [7:0] a;
    i) Packed Array
    	Eg: logic [1:0][1:0][7:0] a;
	ii) Unpacked Array
    	Eg:
2) Dynamic Array
3) Associative Array
4) Queue*/

// This is also a single dimensional packed array
class static_array;
  logic [7:0] arr;
  function void display_d();
    this.arr = 12;
    $display("1D Packed Array");
    for(int i = 0; i < $size(arr); i++) begin
      $display("arr[%0d]=%0d",i,arr[i]);
    end
  endfunction
endclass

class packed_2D_array;
  // 4-bytes data
  rand logic [3:0][7:0] arr2;
  
  function void display_d();
    $display("2D Packed Array");
    for(int i=0; i < $size(arr2); i++) begin
      for (int j=0; j < $size(arr2[0]); j++) begin
        $display("arr2[%0d][%0d]=%0d",i,j,arr2[i][j]);
      end
    end
    $display("arr2=%p",arr2);
  endfunction
  
  /*
  arr2[0][7:0]
  arr2[1][7:0]
  arr2[2][7:0]
  arr2[3][7:0]
  */
  
endclass


class packed_3D_array;
  randc logic [1:0][1:0][7:0] arr3;
  
  function void display_d();
    $display("3D Packed Array");
    for(int i=0; i < $size(arr3); i++) begin
      for(int j=0; j < $size(arr3[0]); j++) begin
        for(int k=0; k < $size(arr3[0][0]); k++) begin
          $display("arr2[%0d][%0d][%0d]=%0d",i,j,k,arr3[i][j][k]);
        end
      end
    end
    $display("arr3=%p",arr3);
  endfunction
  
  /*
  arr2[0][0][7:0] 
  arr2[0][1][7:0]
  arr2[1][0][7:0]
  arr2[1][1][7:0]
  */
endclass

class unpacked_1D_array;
  randc byte arr4[7:0];
  // Even this is fine "byte arr4[8]"
  function void display_d();
    $display("Unpacked 1D Array");
    foreach(arr4[i]) begin
      $display("arr4[%0d]=%0d",i,arr4[i]);
    end
    $display("arr4=%p",arr4);
  endfunction
  
  /*
  arr4[0]
  arr4[1]
  arr4[2]
  arr4[3]
  arr4[4]
  arr4[5]
  arr4[6]
  arr4[7]
  */
endclass


class unpacked_2D_array;
  // byte arr5[2:0][1:0]
  randc byte unsigned arr5[3][2];
  function void display_d();
    $display("Unpacked 2D Array");
    foreach(arr5[i]) begin
      foreach(arr5[i][j]) begin
        $display("arr5[%0d][%0d]=%0d",i,j,arr5[i][j]);
      end
    end
    $display("arr5=%p",arr5);
  endfunction
  /*
  arr5[0][0]	arr5[0][1]
  arr5[1][0]	arr5[1][1]
  arr5[2][0]	arr5[2][1]
  */
endclass

class packed_unpacked_array;
  randc logic [3][2][4] arr6 [3][2][2];
  function void display_d();
    $display("Packed Unpacked Array");
    foreach(arr6[i]) begin
      foreach(arr6[i][j]) begin
        foreach(arr6[i][j][k]) begin
          $display("arr6[%0d][%0d][%0d]=%0d",i,j,k,arr6[i][j][k]);
        end
      end
    end
      $display("arr6=%p",arr6);
  endfunction  
  
  /*
  A 3D Matrix will be created whose each location is capable of holding 3X2X4 = 24bits -> This 24 bits can be considered to be a 3D memory
	Look at display print for better understanding
  */
endclass
      
module tb;
  static_array sr1;
  packed_2D_array pk1;
  packed_3D_array pk2;
  unpacked_1D_array up1;
  unpacked_2D_array up2;
  packed_unpacked_array pkup1;
  initial begin
    sr1 = new();
    pk1 = new();
    pk2 = new();
    up1 = new();
    up2 = new();
    pkup1 = new();
    repeat(1) begin
      pkup1.randomize();
      pkup1.display_d();
    end    
    repeat(1) begin
      up2.randomize();
      up2.display_d();
    end
    repeat(1) begin
      up1.randomize();
      up1.display_d();
    end
    repeat(1) begin
      pk2.randomize();
      pk2.display_d();
    end
    repeat(1) begin
      pk1.randomize();
      pk1.display_d();
    end
    sr1.display_d();
  end
endmodule