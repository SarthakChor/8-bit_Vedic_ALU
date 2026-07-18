`timescale 1ns / 1ps 

module vedic_alu(
    input clk,         
    input [6:0] In1, In2,                   // 8-bit Inputs
    input [1:0] ALU_Sel,                // ALU Operation Selector
    output reg [15:0] ALU_Result          // 8-bit Output
    //output reg CarryOut                  // Carry Output
);
    
    wire [7:0] A,B;
    assign A = {1'b0,In1};
    assign B = {1'b0,In2};
    reg Carry;
    wire [7:0] Sum, Diff, quotient, remainder;
    wire [15:0] Result;
    wire carry, Bout;
    wire reset = 0;

    add_8_bit U1(.A(A), .B(B), .Sum(Sum), .Carry(carry),.clk(clk));
    sub_8_bit U2(.clk(clk),.A(A), .B(B), .Diff(Diff), .Bout(Bout));
    mul_8_bit U3(.A(A), .B(B), .Result(Result),.clk(clk));
    div U4(.dividend(A), .divisor(B), .quotient(quotient), .remainder(remainder),.clk(clk),.reset(reset));
    
    always @(posedge clk) begin
        case(ALU_Sel)
            2'b00: begin  // Addition
                ALU_Result <= Sum;
                Carry <= carry;
            end
            2'b01: begin  // Subtraction
                ALU_Result <= Diff;
                Carry <= Bout;
            end
            2'b10: begin  // Multiplication
                ALU_Result <= Result;
                Carry <= 0;
            end
            2'b11: begin  // Division
                ALU_Result <= quotient;
                Carry <= 0;  
            end
            default: begin  // Default case
                ALU_Result <= 8'b00000000;
                Carry <= 0;
            end
        endcase
    end

    // Update Outputs
    //always @(posedge clk) begin
       // ALU_Out <= ALU_Result;
        //CarryOut <= Carry;
    //end
    
endmodule  
