// `timescale 1ns / 1ps

module NOR_logicgate(input A,
                     input B,
                     output Y);
    wire nor_0_yc, nor_0_yt;
    nor nor_0(Y,A,B);
endmodule
    
    
    module NOR_logicgate_tb();
        reg A;
        reg B;
        wire Y;
        
        NOR_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg5_nor.vcd");
            $dumpvars(0, NOR_logicgate_tb);
        end
        
        initial begin
            $display("TEST BENCH NOR LOGIC GATE");
            $display("Time\tA\tB\tY");
            $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);
            
            A = 0; B = 0; #10;
            A = 0; B = 1; #10;
            A = 1; B = 0; #10;
            A = 1; B = 1; #10;
            $finish;
        end
        
    endmodule
