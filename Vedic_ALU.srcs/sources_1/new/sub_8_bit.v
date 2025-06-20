`timescale 1ns / 1ps
module sub_8_bit (
    input clk,
    input [7:0] A, B,
    output reg [7:0] Diff,
    output reg Bout
);
    wire [7:0] diff_wire;
    wire [7:0] borrow_wire;
    
    // First bit using Half Subtractor
    hs HS1 (
        .A(A[0]), .B(B[0]),
        .Diff(diff_wire[0]), .Borrow(borrow_wire[0])
    );

    // Remaining 7 bits using Full Subtractor
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : fs_gen
            fs FS1 (
                .A(A[i]), .B(B[i]), .Bin(borrow_wire[i-1]),
                .Diff(diff_wire[i]), .Bout(borrow_wire[i])
            );
        end
    endgenerate

    always @(posedge clk) begin
        Diff <= diff_wire;
        Bout <= borrow_wire[7]; // Final borrow output
    end
endmodule