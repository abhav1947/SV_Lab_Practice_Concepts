/*
A SystemVerilog queue is a First In First Out scheme which can have a variable size to store elements of the same data type.

It is similar to a one-dimensional unpacked array that grows and shrinks automatically. They can also be manipulated by indexing, concatenation and slicing operators. Queues can be passed to tasks/functions as ref or non-ref arguments.

Types of Queue:
	-> A bounded queue has a specific size and can hold a limited number of elements.
    Eg:
    int bounded_queue [$:10]; //Depth 10
    -> An Unbounded queue can have unlimited number of enteries.
    Eg: 
    int unbounded_queue [$];
*/
module tb;

string name_list[$];
bit [3:0] data[$];

logic [7:0] element [$:127];

int q1[$] = {1, 2, 3, 4, 5};
int q2[$];
int tmp;

  initial begin
  $display("q2 = %p",q2);
  $display("q1 = %p",q1);
    tmp = q1[0]; // Get the first item of q1;
  $display("tmp = %p",tmp);
tmp = q1[$]; // Get the last item of q1;
  $display("tmp = %p",tmp);
q2 = q1; // Copy all elements of q2 to q1;
  $display("q2 = %p",q2);
  $display("q1 = %p",q1);
q1 = {}; // Empty q1;

q2[2] = 15;
  $display("q2 = %p",q2);
q2.insert(2,15); // Insert 15 at key 2;
  $display("q2 = %p",q2);
q2 = {q2,22}; //Append 22 at last;
  $display("q2 = %p",q2);
q2 = {99,q2}; // Append 22 atr first;
  $display("q2 = %p",q2);
q2 = q2[1:$]; // Delete the first elemet in the queue;
  $display("q2 = %p",q2);
q2 = q2[0:$-1]; // Delete last element in the queue;
  $display("q2 = %p",q2);
q2 = q2[1:$-1]; // Delete firts and last element in the queue;
  $display("q2 = %p",q2);
    
  end

endmodule
