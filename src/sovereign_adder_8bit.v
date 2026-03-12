// IAIONEX SOVEREIGN HARDWARE SERIES
// Module: 8-bit Ripple Carry Adder
// Technology: Skywater 130nm HD

module sovereign_adder_8bit (
    input  [7:0] a,
    input  [7:0] b,
    input        cin,
    output [7:0] sum,
    output       cout
);

    wire [6:0] carry;

    // Instansiering av Full Adders (Bit 0 till 7)
    sky130_fd_sc_hd__fa_1 bit0 (.A(a[0]), .B(b[0]), .CIN(cin),      .SUM(sum[0]), .COUT(carry[0]));
    sky130_fd_sc_hd__fa_1 bit1 (.A(a[1]), .B(b[1]), .CIN(carry[0]), .SUM(sum[1]), .COUT(carry[1]));
    sky130_fd_sc_hd__fa_1 bit2 (.A(a[2]), .B(b[2]), .CIN(carry[1]), .SUM(sum[2]), .COUT(carry[2]));
    sky130_fd_sc_hd__fa_1 bit3 (.A(a[3]), .B(b[3]), .CIN(carry[2]), .SUM(sum[3]), .COUT(carry[3]));
    sky130_fd_sc_hd__fa_1 bit4 (.A(a[4]), .B(b[4]), .CIN(carry[3]), .SUM(sum[4]), .COUT(carry[4]));
    sky130_fd_sc_hd__fa_1 bit5 (.A(a[5]), .B(b[5]), .CIN(carry[4]), .SUM(sum[5]), .COUT(carry[5]));
    sky130_fd_sc_hd__fa_1 bit6 (.A(a[6]), .B(b[6]), .CIN(carry[5]), .SUM(sum[6]), .COUT(carry[6]));
    sky130_fd_sc_hd__fa_1 bit7 (.A(a[7]), .B(b[7]), .CIN(carry[6]), .SUM(sum[7]), .COUT(cout));

endmodule
