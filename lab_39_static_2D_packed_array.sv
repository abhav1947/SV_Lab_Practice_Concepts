module tb;
  bit [5:0] array[6][2] = '{'{1, 100}, '{2, 200}, '{3, 300}, {4, 400}, '{5, 500},  '{6, 600}};
  
  initial begin 
    foreach(array[i,j]) begin
      array[i][j] = $urandom;
    end
    foreach(array[i,j]) begin
      $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
    end
  end
  
endmodule
