/*
Create a class Packet

Randomize:

header in range 0x00 to 0xFF

Payload size between 4 and 10

Each payload[i] in range 0x10 to 0xF0

Compute parity using XOR of all payload bytes in post_randomize()

Add a display() function to print all fields
*/

class Packet;
  randc int header;
  randc int payload[];
  randc int j;
  int parity=0;
  
  constraint header_const{
    header inside {[16'h00:16'hff]};
  }
  
  constraint payload_const{
    j inside {[4:10]};
    payload.size() == j;
  }
  
  constraint payload_val{
    foreach(payload[i]) {
      payload[i] inside {[16'h10:16'hf0]};
    }
  }
  
  function void cal_parity();
    foreach(payload[i]) begin
      parity = parity ^ payload[i];
      $display("payload[%0d] = %0d", i, payload[i]);
    end
    $display("parity = %0d",parity);
  endfunction
endclass
    
 
module tb;
  Packet p1;
  
  initial begin
    p1 = new();
    p1.randomize();
    p1.cal_parity;
  end
endmodule