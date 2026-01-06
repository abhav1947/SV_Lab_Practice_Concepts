module tb;
  int array[5] = {1, 2, 3, 4, 5};
  
  initial begin
    foreach(array[i]) begin
      $display("array[%0d] = %0d",i, array[i]);
    end
    /*
    for(int i = 0; i < 5; i++) begin
      $display("array[%0d] = %0d",i, array[i]);
    end*/
  end
  
endmodule
