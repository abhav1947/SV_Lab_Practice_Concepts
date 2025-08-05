/* Types of Arrays
1) Statics Array: An array whose size is known before cojmpilation time
	Eg: logic [7:0] a;
    i) Packed Array
    	Eg: logic [1:0][1:0][7:0] a;
	ii) Unpacked Array
    	Eg: logic a [3][2][4];
2) Dynamic Array: An array whose size can be set or changed at runtime. The default size of a dynamic array is zero until it is set by the new() constructor.
	Eg: logic [3:0] a[];
    	reg [12:0] b[];
        int a[];
3) Associative Array
4) Queue*/


      
module tb;

  initial begin
    repeat(1) begin
      pkup1.randomize();
      pkup1.display_d();
    end    
  end
endmodule
