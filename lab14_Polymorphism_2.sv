class logger;
  virtual task log(string msg);
    $display("[123456] Logging message: %s",msg);
  endtask
endclass

class consolelogger extends logger;
  task log(string msg);
    super.log(msg);
    $display("Console log: %s",msg);
  endtask
endclass

class filelogger extends logger;
  task log(string msg);
    super.log(msg);
    $display("File log: %s",msg);
  endtask
endclass

class securefilelogger extends filelogger;
  
  function string encrypt(string msg);
    string reversed;
    int i;
    begin
      // Iterate over the string from the last character to the first
      for (i = msg.len() - 1; i >= 0; i--) begin
        // Append each character to the reversed string
        reversed = {reversed,msg[i]};
      end
      return reversed;
    end    
  endfunction
  
  task log(string msg);
    string msg_2;
    msg_2 = this.encrypt(msg); 
    super.log(msg_2);
    $display("SecureFile log: %s",msg_2);
  endtask
endclass

module tb;
  consolelogger cl;
  filelogger fl;
  securefilelogger sfl;
  
  initial begin
    cl = new();
    fl = new();
    sfl = new();
    cl.log("System check OK");
    fl.log("System check OK");
    sfl.log("System check OK");
  end
endmodule