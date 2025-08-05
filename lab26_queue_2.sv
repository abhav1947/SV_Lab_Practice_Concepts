/*
Inbuilt function of queue
*/

module tb;
  int q1 [$] = {2,3,4,5,6,7,8,9,10};
  
  initial begin
    $display("Size of q1=%0d",q1.size());
    $display("q1=%p",q1);
    q1.pop_front();
    $display("q1=%p",q1);
    q1.pop_back();
    $display("q1=%p",q1);
    q1.push_front(23);
    $display("q1=%p",q1);
    q1.push_back(26);
    $display("q1=%p",q1);
    q1.insert(3,25);
    $display("q1=%p",q1);
    q1.delete(3);
    $display("q1=%p",q1);
    $display("q1=%p",q1[1:4]);
    $display("q1=%p",q1[5:$-1]);
  end
endmodule
