/* Types of Arrays
1) Dynamic Array: 
Dynamic array is an unpacked array whose size can be set or changed at run time, and hence is quite different from scratch
3) Associative Array
4) Queue*/

class dynamic_array;
  randc int a[];
  
  function new(input int size);
    a = new[size];
  endfunction
  
  function void display_d();
    for(int i=0; i <= $size(a); i ++) begin
      $display("a[%0d]=%0d", i, a[i]);
	end
  endfunction
  
endclass


module tb;
  dynamic_array da;
  
  initial begin
    da = new(5);
    da.randomize();
    da.display_d();
  end
endmodule