`timescale 1ns / 1ps
module div(
    input clk,              // Clock signal
    input reset,            // Reset signal
    input [7:0] dividend,   // 8-bit Unsigned Dividend
    input [7:0] divisor,    // 8-bit Unsigned Divisor
    output reg [7:0] quotient,  // 8-bit Unsigned Quotient
    output reg [7:0] remainder  // 8-bit Unsigned Remainder
);

    // Internal variables
    reg [7:0] temp_dividend, temp_divisor; // Temporary registers
    reg [8:0] p1; // 9-bit register for intermediate calculations (MSB is for borrow)
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            quotient <= 0;      // Reset quotient
            remainder <= 0;     // Reset remainder
            temp_dividend <= 0; // Reset temp_dividend
            temp_divisor <= 0;  // Reset temp_divisor
            p1 <= 0;            // Reset p1
        end 
        else begin
            if (divisor == 0) begin  // Handle division by zero
                quotient <= 8'b0;   // Return 0 as quotient
                remainder <= dividend; // Remainder is the dividend if division is not possible
            end 
            else begin
                // Initialize variables
                temp_dividend = dividend; // Load dividend
                temp_divisor = divisor;   // Load divisor
                p1 = 0;                   // Initialize p1

                // Perform division operation
                for (i = 0; i < 8; i = i + 1) begin
                    p1 = {p1[7:0], temp_dividend[7]}; // Shift left
                    temp_dividend = temp_dividend << 1; // Shift dividend left
                    p1 = p1 - temp_divisor; // Subtract divisor from p1

                    if (p1[8] == 1) begin // If p1 is negative
                        temp_dividend[0] = 0; // Set LSB of temp_dividend to 0
                        p1 = p1 + temp_divisor; // Restore p1
                    end 
                    else begin
                        temp_dividend[0] = 1; // Set LSB of temp_dividend to 1
                    end
                end

                quotient <= temp_dividend;  // Store the final quotient
                remainder <= p1[7:0];       // Store the final remainder
            end
        end
    end

endmodule
