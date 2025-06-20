`timescale 1ns / 1ps
module Column_3(Sum,C2,C1,C0,M1,M2,M3,M4,M5,M6);
input M1,M2,M3,M4,M5,M6;
output Sum;
output reg C2,C1,C0;

assign Sum = M1^M2^M3^M4^M5^M6;
reg [2:0]count = 0;
reg [1:0]carry;
always @(*)begin
    count =  M1+M2+M3+M4+M5+M6;
    carry = count / 2;
    case(carry)
        0 : begin 
            C0 = 0;
            C1 = 0;
            C2 = 0;
            end
        1 : begin 
            C0 = 1;
            C1 = 0;
            C2 = 0;
            end
        2 : begin 
            C0 = 1;
            C1 = 1;
            C2 = 0;
            end
        3 : begin 
            C0 = 1;
            C1 = 1;
            C2 = 1;
            end
    endcase
end
endmodule
