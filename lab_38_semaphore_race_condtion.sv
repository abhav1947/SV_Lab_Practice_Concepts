module tb;
  semaphore key;
  /*Manipulate the number of keys to see various race conditons*/
  
  initial begin
    key = new(1);
    fork
      personA();
      personB();
      
    join
  end
  
  task getRoom(bit [1:0] id);
    $display("[%0t] Trying to get key for id[%0d]", $time,id);
    key.get(1);
    $display("[%0t] Key retrieved for id[%0d]", $time,id);
  endtask
  
  task putRoom(bit [1:0] id);
    $display("[%0t] Depositing Key for id[%0d]", $time,id);
    key.put(1);
    $display("[%0t] Key Deposited for id[%0d]", $time,id);
  endtask
  
  
  /*
  task personA();
    getRoom(1);
    putRoom(1);
  endtask
 
  task personB();
    getRoom(2);
    putRoom(2);
  endtask
  */
  
  task personA();
    $display("[%0t] Trying to get key for personA", $time);
    key.get(2);
    $display("[%0t] Key retrieved for personA", $time);
    #5;
    $display("[%0t] Depositing Key for personA", $time);
    key.put(2);
    $display("[%0t] Key Deposited for personA", $time);
  endtask
  
  task personB();
    $display("[%0t] Trying to get key for personB", $time);
    key.get(1);
    $display("[%0t] Key retrieved for personB", $time);
    #5;
    $display("[%0t] Depositing Key for personB", $time);
    key.put(1);
    $display("[%0t] Key Deposited for personB", $time);
  endtask
endmodule
