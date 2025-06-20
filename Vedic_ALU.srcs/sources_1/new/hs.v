`timescale 1ns / 1ps
module hs(input A, B,
    output Diff, Borrow );
    assign Diff = A ^ B;
    assign Borrow = ~A & B;
endmodule
