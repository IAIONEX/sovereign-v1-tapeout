module sovereign_decoder (
    input  [15:0] instr,
    output [3:0]  opcode,
    output [4:0]  reg_rd, reg_rs, reg_rt,
    output        reg_write
);
    assign opcode    = instr[15:12];
    assign reg_rd    = {1'b0, instr[11:8]};
    assign reg_rs    = {1'b0, instr[7:4]};
    assign reg_rt    = {1'b0, instr[3:0]};

    // reg_write är sann för alla operationer utom HALT(0) och BEQ(4)
    assign reg_write = (opcode != 4'h0 && opcode != 4'h4);
endmodule
