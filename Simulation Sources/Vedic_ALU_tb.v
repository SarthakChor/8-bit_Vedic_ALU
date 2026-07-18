`timescale 1ns / 1ps

module Vedic_ALU_tb;

    // Inputs
    reg clk;
    reg [6:0] In1;
    reg [6:0] In2;
    reg [1:0] ALU_Sel;

    // Outputs
    wire [15:0] ALU_Result;

    // Instantiate the ALU
    vedic_alu uut (
        .clk(clk),
        .In1(In1),
        .In2(In2),
        .ALU_Sel(ALU_Sel),
        .ALU_Result(ALU_Result)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        In1 = 0;
        In2 = 0;
        ALU_Sel = 2'b00;

        // Wait for global reset
        #10;

        // Test Case 1: Addition (In1 + In2)
        In1 = 7'd25; In2 = 7'd15; ALU_Sel = 2'b00; // 25 + 15 = 40
        #20;

        // Test Case 2: Subtraction (In1 - In2)
        In1 = 7'd55; In2 = 7'd20; ALU_Sel = 2'b01; // 55 - 20 = 35
        #20;

        // Test Case 3: Multiplication (In1 * In2)
        In1 = 7'd12; In2 = 7'd3; ALU_Sel = 2'b10; // 12 * 3 = 36
        #20;

        // Test Case 4: Division (In1 / In2)
        In1 = 7'd50; In2 = 7'd5; ALU_Sel = 2'b11; // 50 / 5 = 10
        #20;

        // Test Case 5: Division by zero
        In1 = 7'd50; In2 = 7'd0; ALU_Sel = 2'b11; // Expect 0 or undefined
        #20;

        $finish;
    end

endmodule
