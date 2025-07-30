/*Polymorhism is where i can define a functionality in base class object and I will be able to override this functionality in extended classes provided the function is defined as a virtual in base class*/

class Shape;
  int a=10;
  virtual function void draw();
    $display("Drawing a shape");
  endfunction
endclass

class Circle extends Shape;
  int a =20;
  function void draw();
    $display("Drawing a circle");
  endfunction
endclass

class Square extends Shape;
  function void draw();
    $display("Drawing a square");
  endfunction
endclass

module tb;
  Shape s;
  Circle c;

  initial begin
    c = new();
    s = new c;
    s.draw(); // Outputs: Drawing a circle
    $display("Value of a %0d",s.a);

    //= new Square;
    //s.draw(); // Outputs: Drawing a square
  end
endmodule