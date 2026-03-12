module sovereign_logic_unit (
    input [7:0] a, b,
    input [1:0] sel,
    output reg [7:0] out
);
    always @(*) begin
        case(sel)
            2'b00: out = a & b;
            2'b01: out = a | b;
            2'b10: out = a ^ b;
            default: out = ~a;
        endcase
    end
endmodule
