// USe of destructor
class cls_;
  randc int a;
  
  function void _display(string g);
    $display("%s",g);
    $display("a=%0d",a);
  endfunction
  
  extern constraint _a_cntrs;
  
endclass

constraint cls_::_a_cntrs{
  a inside {[10:12]};
};

module tb;
  cls_ c1;
  
  initial begin
    c1 = new;
    c1.randomize();
    c1._display("Atfter creating handle");
    c1 = null;
    // Uncomment below lines to see the destructor effect 
    //$display("After Destroying the handle")
    //c1._display();
  end
endmodule
