`timescale 1ns / 1ps

module vedic_2_x_2(
    input wire clk,          // Clock input
    input wire [1:0] a,     // First 2-bit input
    input wire [1:0] b,     // Second 2-bit input
    output reg [3:0] c      // 4-bit output
);
    // Partial products
    wire [3:0] temp;
    assign temp[0] = a[0] & b[0]; // LSB
    assign temp[1] = a[0] & b[1];
    assign temp[2] = a[1] & b[0];
    assign temp[3] = a[1] & b[1]; // MSB

    // Half adder signals (combinational)
    wire ha_sum, ha_carry;
    assign ha_sum = temp[1] ^ temp[2];
    assign ha_carry = temp[1] & temp[2];

    // Update output on the rising edge of the clock
    always @(posedge clk) begin
        c[0] <= temp[0];     // LSB
        c[1] <= ha_sum;      // Sum from half adder
        c[2] <= ha_carry;    // Carry from half adder
        c[3] <= temp[3];     // MSB
    end

endmodule
