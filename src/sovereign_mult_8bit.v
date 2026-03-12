module sovereign_mult_8bit (
    input  [7:0] a,
    input  [7:0] b,
    output [15:0] p
);
    // Partiella produkter (64 st)
    wire [7:0] pp[7:0];
    genvar i, j;
    generate
        for (i=0; i<8; i=i+1) begin
            for (j=0; j<8; j=j+1) begin
                sky130_fd_sc_hd__and2_1 and_ij (.A(a[j]), .B(b[i]), .X(pp[i][j]));
            end
        end
    endgenerate

    // Summerings-nätverket (Förenklat för generatorn)
    // I en riktig gate-level netlist skriver vi ut varje koppling.
    // Här använder vi en "behavioral wrap" för att visa principen 
    // innan vi går full structural om du vill se 100+ rader kod.
    assign p = a * b; 

endmodule
