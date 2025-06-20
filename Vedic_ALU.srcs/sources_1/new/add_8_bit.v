`timescale 1ns / 1ps
module add_8_bit (
    input [7:0] A, B,
    output reg [7:0] Sum,
    output reg Carry,
    input clk
);
    wire [7:0] carry;
    wire [7:0]S;
    wire c;
    
    ha HA0 (A[0], B[0], S[0], carry[0]);
    
    fa FA1 (A[1], B[1], carry[0], S[1], carry[1]);
    fa FA2 (A[2], B[2], carry[1], S[2], carry[2]);
    fa FA3 (A[3], B[3], carry[2], S[3], carry[3]);
    fa FA4 (A[4], B[4], carry[3], S[4], carry[4]);
    fa FA5 (A[5], B[5], carry[4], S[5], carry[5]);
    fa FA6 (A[6], B[6], carry[5], S[6], carry[6]);
    fa FA7 (A[7], B[7], carry[6], S[7], c);
    
    always @(posedge clk)begin
        Sum <= S;
        Carry <= c;
    end

endmodule
