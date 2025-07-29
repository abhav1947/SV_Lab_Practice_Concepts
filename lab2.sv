    class first;
      /* to keep the scope of the class local to a class we use the "local" keyword*/
      int data=2;
      local int data2=3;
    endclass

    class second;
      first f1;

      function new();
        f1 = new();
        $display("Print from second class f1.data=%0d", f1.data);
        //$display("Print from second class f1.data2=%0d", f1.data2);
        // Uncomenting above line will lead to local variable
      endfunction
    endclass

    module tb;
      second s1;

      initial begin
        s1=new();
        $display("Print from module s1.f1.data=%0d",s1.f1.data);
      end
    endmodule