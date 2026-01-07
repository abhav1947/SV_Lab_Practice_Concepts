// Index locator methods

module array_ordering_methods;
  // Dynamic single dimensional array
  logic [3:0] array[];
  
  initial begin
    array = new[8];
    foreach(array[i]) begin
      array[i] = $urandom;
    end
    $display("Before Sorting");
    $display("array = %0p", array);
    $display("After Sorting");
    array.sort();
    $display("array = %0p", array);
    array.rsort();
    $display("array = %0p", array);
    array.reverse();
    $display("array = %0p", array);
    array.shuffle();
    $display("array = %0p", array);
  end
endmodule
