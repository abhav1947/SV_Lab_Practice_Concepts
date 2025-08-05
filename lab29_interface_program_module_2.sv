/*
Program block
-> Can not contain non blocking statements
-> Program block can only be instatiated in design scope
-> Program block can not contain always blocks

Program blocks in SystemVerilog are used to isolate the testbench from the design and avoid race conditions. They execute in the reactive region, after all module updates are done, providing a safer, deterministic simulation flow for verification.

We use program block instead of module for testbench to avoid race around condition

We will still face the port connection issue as module instantation is not allowed in program

We will need to create interface

*/

interface df_intf;
  logic d;
  logic q;
endinterface

program tb_program(input clk, df_intf pif);
  
  initial begin
    repeat(10) begin
      @(posedge clk)
      pif.d = $random();
      #1 $display("d = %0b (from program TB) at time %0t", pif.d, $time());
      @(posedge clk)
      #1 $display("q = %0b (from program TB) at time %0t", pif.q, $time()); // Read stable Q
    end    
    #5 $finish;
  end

endprogram

module top_tb;
  df_intf dfif();
  
  logic clk_tb=0;
  
  always #5 clk_tb = ~clk_tb;
  // module instance
  dff dut(.clk(clk_tb),
          .dif(dfif));
  
  // Program interface
  tb_program tb_inst(.clk(clk_tb),
                     .pif(dfif));
endmodule

/******** RTL CODE For D-FF *********/
module dff(input logic clk, df_intf dif);
  always_ff @(posedge clk)
    dif.q <= dif.d;
endmodule

/*


                                          ________________                             ________________
                                          |              |                             |              |
                                          |              |  Interface(.dfif(pif))      |              | 
                                          |    Program   |------------------------+--->|  tb top level|
                                          |      blk     |                        |    |     blk      |  
                                          |              |   .clk(clk_tb)         |    |              |
                                          |              |<-----------------------|-+--|    clk gen   |
                                          |______________|                        | |  |______________|
                                                                                  | |
                                          ________________                        | |                                                          
                                          |              |  Interface(.dif(dfif)) | |   
                                          |    Module    |<=======================| |
                                          |      blk     |                          |
                                          |              |      .clk(clk_tb)        |
                                          |              |<=========================|
                                          |______________| 

*/














