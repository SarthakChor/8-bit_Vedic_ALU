`timescale 1ns / 1ps 
module fa (
    input a, b, cin,
    output sum, carry
);
    wire sum1, carry1, carry2;
    
    ha HA1 (.a(a), .b(b), .sum(sum1), .carry(carry1));
    ha HA2 (.a(sum1), .b(cin), .sum(sum), .carry(carry2));
    
    assign carry = carry1 | carry2;
endmodule

