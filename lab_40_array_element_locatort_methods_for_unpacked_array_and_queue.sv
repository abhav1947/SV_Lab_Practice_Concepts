// Elemeet locator methods

module element_locator_methods;
  // Static single dimensional array
  int array[8] = '{2,1,7,3,1,8,9,6};
  // Queue
  int res[$];
  initial begin
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
