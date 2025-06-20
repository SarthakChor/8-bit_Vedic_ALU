`timescale 1ns / 1ps  
module mul_4(
    input signed [3:0] In_1, 
    input signed [3:0] In_2, 
    output reg signed [7:0] mul, 
    input clk
);
    
    wire sum1, carry1, sum2, carry2, sum3, carry3, sum4, carry4, sum5, carry5, sum6, carry6, sum7, carry7;
    wire temp1, temp2;

    // Partial Product Additions
    ha A1(In_1[1] & In_2[0], In_1[0] & In_2[1], sum1, carry1);
    fa A2(In_1[2] & In_2[0], In_1[1] & In_2[1], In_1[0] & In_2[2], sum2, carry2);
    fa A3(In_1[3] & In_2[0], In_1[2] & In_2[1], In_1[1] & In_2[2], sum3, carry3);
    fa A4(In_1[0] & In_2[3], sum3, carry2, sum4, carry4);
    fa A5(In_1[3] & In_2[1], In_1[2] & In_2[2], In_1[1] & In_2[3], sum5, carry5);
    fa A6(sum5, carry4, carry3, sum6, carry6);
    fa A7(In_1[3] & In_2[2], In_1[2] & In_2[3], carry5, sum7, carry7);
    fa A8(carry6, sum7, carry7, temp1, temp2);
    ha A9 (temp2, In_1[3] & In_2[3], temp3, temp4);
    // Correcting the output register update
    always @(posedge clk) begin
        mul[0] = In_1[0] & In_2[0];
        mul[1] = sum1;
        mul[2] = sum2;
        mul[3] = sum4;
        mul[4] = sum6;
        mul[5] = temp1;
        mul[6] = temp3;
        mul[7] = temp2;  // Corrected sign handling
    end

endmodule