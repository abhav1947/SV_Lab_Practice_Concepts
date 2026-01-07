// Elemeet locator methods

module element_locator_methods;
  // Static single dimensional array
  logic [2:0] array[];
  
  // Queue
  logic [2:0] res[$];
  initial begin
    array = new[20];
    foreach(array[i]) begin
      array[i] = $urandom;
      $display("array[%0d] = %0d",i,array[i]);
    end
    //***********Mandatory with clause***********//
    res=array.find(x) with (x>4);
    $display("find(x) = %0p", res);
    res=array.find_first with (item>=3 & item<6);
    $display("find_first = %0p", res);
    res=array.find_last with (item>3 & item<6);
    $display("find_last = %0p", res);
    
    //***********optional with clause***********//
    res = array.unique();
    $display("unique = %0p", res);
    res = array.max;
    $display("max = %0p", res);
    res = array.min;
    $display("min = %0p", res);
  end
endmodule
