`timescale 1ns/1ps

module sovereign_adder_tb;
    reg [7:0] a, b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instansiera din adderare
    sovereign_adder_8bit uut (
        .a(a), .b(b), .cin(cin), 
        .sum(sum), .cout(cout)
    );

    initial begin
        $monitor("T=%2t | A=%d + B=%d + Cin=%b | Sum=%d Cout=%b", $time, a, b, cin, sum, cout);
        
        // Testfall 1: Enkel addition
        a = 8'd10; b = 8'd20; cin = 0; #10;
        
        // Testfall 2: Maxvärde (Overflow check)
        a = 8'd255; b = 8'd1; cin = 0; #10;
        
        // Testfall 3: Carry-in check
        a = 8'd50; b = 8'd50; cin = 1; #10;
        
        $finish;
    end
endmodule
