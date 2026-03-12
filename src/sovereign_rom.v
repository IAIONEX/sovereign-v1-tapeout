module sovereign_rom (
    input [7:0] addr,
    output [15:0] instr
);
    reg [15:0] mem [0:255];
    initial $readmemh("program_clean.hex", mem);
    assign instr = mem[addr];
endmodule
