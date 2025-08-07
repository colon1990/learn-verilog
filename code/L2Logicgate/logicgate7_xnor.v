`timescale 1ns / 1ps

module XNOR_logicgate(input A, input B, output Y);
    wire xnor_0_yc, xnor_0_yt;
    xnor xnor_0(Y,A,B);
endmodule


module XNOR_logicgate_tb();
    reg A;
    reg B;
    wire Y;

    XNOR_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
    );
    
    initial begin
        $display("TRUONG NGUYEN HOANG LONG XAO LON");
        $display("TEST BENCH XNOR LOGIC GATE");
        $display("Time\tA\tB\tY");
        $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end

endmodule