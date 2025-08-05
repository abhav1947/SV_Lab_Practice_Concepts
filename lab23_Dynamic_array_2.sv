/*
Create a class Student

Declare a random dynamic array scores[]

Randomize the size of the array using max_tests (random value: 3 to 6)

Constrain each scores[i] to be between 50 and 100

After randomization, compute the total score (sum of all scores)

Write a method display() to print:
*/

class student;
  randc int scores[];
  randc int max_tests;
  int total_score;
  
  constraint max_tests_val{
    max_tests inside {[3:6]};
    scores.size() == max_tests;
  }

  // Constraint: each score between 50 and 100
  constraint value_c {
    foreach (scores[i]) scores[i] inside {[50:100]};
  }
  
  function void compute();
    this.total_score=0;
    for(int i =0; i < scores.size(); i++) begin
      total_score = total_score + scores[i];
      $display("scores[%0d] = %0d",i,scores[i]);
      $display("total_score = %0d", total_score);
    end
  endfunction
endclass


module tb;
  student s1;
  
  initial begin
    s1 = new;
    s1.randomize();
    s1.compute();
  end
endmodule