module sovereign_cpu_top (
    input clk,
    input reset,
    output [7:0] alu_out_debug
);
    reg  [7:0]  pc;
    wire [15:0] instr;
    wire [3:0]  opcode = instr[15:12];
    wire [4:0]  rs_addr = instr[11:8];
    wire [4:0]  rt_addr = instr[7:4];
    wire [31:0] reg_data1, reg_data2;
    wire [7:0]  add_res, sub_res;
    reg  [31:0] write_data;

    assign alu_out_debug = write_data[7:0];

    // Vi mappar RS och RT manuellt här för att snabba upp jämförelsen
    // En BEQ R0, R0, 3 kommer nu garanterat att trigga hoppet
    wire jump_now = (opcode == 4'h4) && (reg_data1 == reg_data2);

    always @(posedge clk or posedge reset) begin
        if (reset) 
            pc <= 8'd0;
        else if (jump_now)
            pc <= instr[7:0];
        else
            pc <= pc + 8'd1;
    end

    sovereign_rom rom (.addr(pc), .instr(instr));
    
    // Vi behåller dekodern för reg_write och rd_addr
    wire [4:0] rd_addr;
    wire reg_write;
    sovereign_decoder decoder (.instr(instr), .opcode(), .reg_rd(rd_addr), .reg_rs(), .reg_rt(), .reg_write(reg_write));

    sovereign_adder_8bit adder0 (.a(reg_data1[7:0]), .b(reg_data2[7:0]), .cin(1'b0), .sum(add_res));
    sovereign_sub_8bit   sub0   (.a(reg_data1[7:0]), .b(reg_data2[7:0]), .diff(sub_res));

    always @(*) begin
        case(opcode)
            4'h1: write_data = {24'b0, add_res};
            4'h2: write_data = {24'b0, instr[7:0]};
            4'h3: write_data = {24'b0, sub_res};
            default: write_data = 32'd0;
        endcase
    end

    sovereign_regfile rf (.clk(clk), .reg_write(reg_write), .rd(rd_addr), .rs(rs_addr), .rt(rt_addr), .wd(write_data), .rd1(reg_data1), .rd2(reg_data2));
endmodule
