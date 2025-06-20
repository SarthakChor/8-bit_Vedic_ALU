`timescale 1ns / 1ps
module Column_2(Sum,C1,C0,M1,M2,M3,M4);
input M1,M2,M3,M4;
output Sum;
output reg C1,C0;

assign Sum = M1^M2^M3^M4;
reg [2:0]count = 0;
reg [1:0]carry;
always @(*)begin
    count =  M1+M2+M3+M4;
    carry = count / 2;
    case(carry)
        0 : begin 
            C1 = 0;
            C0 = 0;
            end
        1 : begin 
            C1 = 0;
            C0 = 1;
            end
        2 : begin 
            C1 = 1;
            C0 = 1;
            end
    endcase
end
endmodule
