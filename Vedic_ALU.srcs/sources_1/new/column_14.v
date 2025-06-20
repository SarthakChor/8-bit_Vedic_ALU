`timescale 1ns / 1ps
module Column_14(Sum,C0,M1,M2,M3);
input M1,M2,M3;
output Sum;
output reg C0;

assign Sum = M1^M2^M3;
reg [1:0]count = 0;
reg carry;
always @(*)begin
    count =  M1+M2+M3;
    carry = count / 2;
    case(carry)
        0 : begin
            C0 = 0;
            end
        1 : begin
            C0 = 1;
            end
    endcase
end
endmodule
