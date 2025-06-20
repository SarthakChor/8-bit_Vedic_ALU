`timescale 1ns / 1ps
module Mul_2(In_1,In_2,Mul,clk);
input [1:0]In_1,In_2;
output reg [3:0]Mul;
input clk;

wire sum1,sum2,carry1,carry2;

ha A1(In_1[1]&In_2[0],In_1[0]&In_2[1],sum1,carry1);
ha A2(In_1[1]&In_2[1],carry1,sum2,carry2);

always @(posedge clk)begin
    Mul[0]=In_1[0] & In_2[0];
    Mul[1]=sum1;
    Mul[2]=sum2;
    Mul[3]=carry2;    
end
endmodule
