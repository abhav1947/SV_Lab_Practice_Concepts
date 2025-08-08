module tb;
  initial begin
	#1;
    $display("[st-1] Print at %0t",$time);
    fork
      begin
        #3;
        $display("[st-2] Print at %0t",$time);
        #5;
        $display("[st-3] Print at %0t",$time);
      end
      
      begin
        #2;
        $display("[st-4] Print at %0t",$time);
      end
      
      $display("[st-5] Print at %0t",$time);
      
    join_none
    $display("[st-6] Print at %0t",$time);
  end
endmodule
