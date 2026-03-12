module sovereign_shifter_8bit (
    input [7:0] a,
    input [2:0] shamt,
    input type,
    output [7:0] out
);
    assign out = type ? (a >> shamt) : (a << shamt);
endmodule
