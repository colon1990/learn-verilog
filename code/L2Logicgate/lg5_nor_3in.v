// `timescale 1ns / 1ps

module NOR_logicgate_3in(input A,
                         input B,
                         input C,
                         output Y);
    wire nor_0_yc, nor_0_yt;
    nor nor_0(Y,A,B,C);
endmodule
    
    
    module NOR_logicgate_3in_tb();
        reg A;
        reg B;
        reg C;
        wire Y;
        
        NOR_logicgate_3in uut(
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg5_nor_3in.vcd");
            $dumpvars(0, NOR_logicgate_3in_tb);
        end
        
        initial begin
            $display(" == TEST BENCH NOR LOGIC GATE 3 INPUT == ");
            $display("T\tA\tB\tC\tY");
            $monitor("%g\t%b\t%b\t%b\t%b",$time, A, B, C, Y);
            
            A = 0; B = 0; C = 0; #10;
            A = 0; B = 0; C = 1; #10;
            A = 0; B = 1; C = 0; #10;
            A = 0; B = 1; C = 1; #10;
            A = 1; B = 0; C = 0; #10;
            A = 1; B = 0; C = 1; #10;
            A = 1; B = 1; C = 0; #10;
            A = 1; B = 1; C = 1; #10;
            $finish;
        end
        
    endmodule
