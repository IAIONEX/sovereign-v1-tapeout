module sovereign_sub_8bit (
    input [7:0] a, b,
    output [7:0] diff
);
    assign diff = a - b;
endmodule
