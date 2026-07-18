`timescale 1ns / 1ps
module Column_1(Sum,C0,A,B);
input A,B;
output Sum,C0;

assign Sum = A ^ B;
assign C0 = A & B;
endmodule
