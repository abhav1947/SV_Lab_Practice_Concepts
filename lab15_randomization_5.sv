class temp;
  rand bit [1:0] wr;
  
  /*
  constraint wr_data{
    (wr dist{0:/50 , 1:/50, 2:/50, 3:/50}); 
  }
  */
  
  
  constraint wr_data{
    (wr dist{0:=50 , [1:3]:=50}); 
  }
  
  function void print();
    $display("The value of wr=%0d",this.wr);
  endfunction
  
endclass

module tb;
  temp t1;
  int _0_cnt=0, _1_cnt=0, _2_cnt=0, _3_cnt=0;
  
  initial begin
    t1 = new();
    repeat(100) begin
      assert(t1.randomize()) $display("Assertion Passed");
      else $display("Assertion Failed");
      t1.print();
      // Lets see whats the percenatge coverage
      if(t1.wr == 0) begin
        _0_cnt = _0_cnt + 1;
      end 
      else if(t1.wr == 1) begin
        _1_cnt = _1_cnt + 1;
      end
      else if(t1.wr == 2) begin
        _2_cnt = _2_cnt + 1;
      end
      else begin
        _3_cnt = _3_cnt + 1;
      end
    end
    $display("_0_cnt=%0d",_0_cnt);
    $display("_1_cnt=%0d",_1_cnt);
    $display("_2_cnt=%0d",_2_cnt);
    $display("_3_cnt=%0d",_3_cnt);
    $display("Percenatge occurance of wr=0 -> %0f%",((_0_cnt)*1));
    $display("Percenatge occurance of wr=1 -> %0f%",((_1_cnt)*1));
    $display("Percenatge occurance of wr=2 -> %0f%",((_2_cnt)*1));
    $display("Percenatge occurance of wr=3 -> %0f%",((_3_cnt)*1));
  end
endmodule