`timescale 1ns / 1ps

module NAND_logicgate(input A, input B, output Y);
    wire nand_0_yc, nand_0_yt;
    nand nand_0(Y,A,B);    
endmodule


module NAND_logicgate_tb();
    reg A;
    reg B;
    wire Y;

    NAND_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
    );
    
    initial begin
        $display("TEST BENCH NAND LOGIC GATE");
        $display("Time\tA\tB\tY");
        $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end

endmodule