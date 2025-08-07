class enum_type;
  randc enum {ABH, VEN, VE, AP} _state_req;
  
  function void display_s();
    $display("_state_req1=%s",_state_req.name());
  endfunction
endclass

module tb;
  enum_type e1;
  
  initial begin
    e1 = new();
    repeat(10) begin
      e1.randomize();
      e1.display_s();
    end
  end

endmodule
