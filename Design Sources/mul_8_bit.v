`timescale 1ns / 1ps
module mul_8_bit(Result,A,B,clk);
input clk;
input [7:0]A,B;
output reg [15:0]Result;

//Column 0
always @(posedge clk) Result[0] = A[0]&B[0];

//Column 1
wire S1,C1;
Column_1 col1 (S1,C1,A[1]&B[0],A[0]&B[1]);
always @(posedge clk) Result[1] = S1;

//Column 2
wire S2;
wire C2,C3;
Column_2 col2 (S2,C3,C2,A[2]&B[0],A[1]&B[1],A[0]&B[2],C1);
always @(posedge clk) Result[2] = S2;

//Column 3
wire S3;
wire C4,C5,C6;
Column_3 col3 (S3,C6,C5,C4,A[3]&B[0],A[2]&B[1],A[1]&B[2],A[0]&B[3],C2,C3);
always @(posedge clk) Result[3] = S3;

//Column 4
wire S4;
wire C7,C8,C9,C10;
Column_4 col4 (S4,C10,C9,C8,C7,A[4]&B[0],A[3]&B[1],
               A[2]&B[2],A[1]&B[3],A[0]&B[4],C4,C5,C6);
always @(posedge clk) Result[4] = S4;

//Column 5
wire S5;
wire C11,C12,C13,C14,C15;
Column_5 col5 (S5,C11,C12,C13,C14,C15,A[5]&B[0],A[4]&B[1],
               A[3]&B[2],A[2]&B[3],A[1]&B[4],A[0]&B[5],C7,C8,C9,C10);
always @(posedge clk) Result[5] = S5;

//Column 6
wire S6;
wire C16,C17,C18,C19,C20,C21;
Column_6 col6 (S6,C16,C17,C18,C19,C20,C21,A[6]&B[0],A[5]&B[1],
               A[4]&B[2],A[3]&B[3],A[2]&B[4],A[1]&B[5],A[0]&B[6],C11,C12,C13,C14,C15);
always @(posedge clk) Result[6] = S6;

//Column 7
wire S7;
wire C22,C23,C24,C25,C26,C27,C28;
Column_7 col7 (S7,C22,C23,C24,C25,C26,C27,C28,
               A[7]&B[0],A[6]&B[1],A[5]&B[2],A[4]&B[3],A[3]&B[4],A[2]&B[5],
               A[1]&B[6],A[0]&B[7],C16,C17,C18,C19,C20,C21);
always @(posedge clk) Result[7] = S7;

//Column 8
wire S8;
wire C29,C30,C31,C32,C33,C34,C35;
Column_8 col8 (S8,C29,C30,C31,C32,C33,C34,C35,
               A[7]&B[1],A[6]&B[2],A[5]&B[3],A[4]&B[4],
               A[3]&B[5],A[2]&B[6],A[1]&B[7],C22,C23,C24,C25,C26,C27,C28);
always @(posedge clk) Result[8] = S8;

//Column 9
wire S9;
wire C36,C37,C38,C39,C40,C41;
Column_9 col9 (S9,C36,C37,C38,C39,C40,C41,
               A[7]&B[2],A[6]&B[3],A[5]&B[4],A[4]&B[5],
               A[3]&B[6],A[2]&B[7],C29,C30,C31,C32,C33,C34,C35);
always @(posedge clk) Result[9] = S9;

//Column 10
wire S10;
wire C42,C43,C44,C45,C46;
Column_10 col10(S10,C42,C43,C44,C45,C46,
                A[7]&B[3],A[6]&B[4],A[5]&B[5],A[4]&B[6],
                A[3]&B[7],C36,C37,C38,C39,C40,C41);
always @(posedge clk) Result[10] = S10;

//Column 11
wire S11;
wire C47,C48,C49,C50;
Column_11 col11 (S11,C47,C48,C49,C50,
                A[7]&B[4],A[6]&B[5],A[5]&B[6],A[4]&B[7],C42,C43,C44,C45,C46);
always @(posedge clk) Result[11] = S11;

//Column 12
wire S12;
wire C51,C52,C53;
Column_12 col12 (S12,C51,C52,C53,A[7]&B[5],A[6]&B[6],A[5]&B[7],C47,C48,C49,C50);
always @(posedge clk) Result[12] = S12;

//Column 13
wire S13;
wire C54,C55;
Column_13 col13 (S13,C54,C55,A[7]&B[6],A[6]&B[7],C51,C52,C53);
always @(posedge clk) Result[13] = S13;

//Column 14
wire S14;
wire C56;
Column_14 col14 (S14,C56,A[7]&B[7],C54,C55);
always @(posedge clk) Result[14] = S14;

//Column 15
always @(posedge clk) Result[15] = C56;

endmodule
