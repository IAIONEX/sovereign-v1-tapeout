module sovereign_regfile (
    input clk,
    input reg_write,
    input [4:0] rd, rs, rt,
    input [31:0] wd,
    output [31:0] rd1, rd2
);
    reg [31:0] registers [31:0];

    // Initialize R0 to always be 0
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            registers[i] = 32'b0;
    end

    // Synchronous write
    always @(posedge clk) begin
        if (reg_write && rd != 5'd0) begin
            registers[rd] <= wd;
        end
    end

    // Asynchronous read (Strictly combinational)
    assign rd1 = (rs == 5'd0) ? 32'b0 : registers[rs];
    assign rd2 = (rt == 5'd0) ? 32'b0 : registers[rt];

endmodule
