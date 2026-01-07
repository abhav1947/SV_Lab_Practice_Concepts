module string_operator;
  string str1 = "a";
  string str2 = "v";
  string str3 = "abhav";
  initial begin
    $display("Equality Operator");
    if(str1 == str2) begin
      $display("PASS");
    end
    else begin
      $display("FAIL");
    end
    $display("----------------------------------------");
    $display("Inequality Operator");
    if(str1 != str2) begin
      $display("PASS");
    end
    else begin
      $display("FAIL");
    end
    $display("----------------------------------------");
    $display("Comparision Operator");
    if(str1 > str2) begin
      $display("PASS");
    end
    else begin
      $display("FAIL");
    end
    $display("----------------------------------------");
    $display("Comparision Operator");
    if(str1 < str2) begin
      $display("PASS");
    end
    else begin
      $display("FAIL");
    end
    $display("----------------------------------------");
    $display("Replication Operator");
    $display("Replication of str1 : %0s",{4{str1}});
    $display("Replication of str2 : %0s",{6{str2}});
    $display("----------------------------------------");
    $display("Concatenation Operator");
    $display("Concatenated String : %0s",{str1,"dem",str2,"","*#$$$"});
    $display("----------------------------------------");  
    $display("----------------------------------------");
    $display("String Indexing");
    foreach(str3[i]) begin
      $display("str3[%0d] = %0s",i, str3[i]);
    end
    
  end
  
endmodule
