// Index locator methods

module index_locator_methods;
  // Dynamic single dimensional array
  int array[];
  
  // Queue
  int res[$];
  initial begin
    array = new[20];
    foreach(array[i]) begin
      array[i] = $urandom;
      $display("array[%0d] = %0d",i,array[i]);
    end
    //***********Mandatory with clause***********//
    res=array.find_index(x) with (x>4);
    $display("find_index(x) = %0p", res);
    res=array.find_first_index with (item>=3 & item<6);
    $display("find_first_index = %0p", res);
    res=array.find_last_index with (item>3 & item<6);
    $display("find_last_index = %0p", res);
    
    //***********optional with clause***********//
    res = array.unique_index();
    $display("unique_index = %0p", res);
  end
endmodule
