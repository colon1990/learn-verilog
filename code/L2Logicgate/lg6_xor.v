// `timescale 1ns / 1ps

module XOR_logicgate(input A,
                     input B,
                     output Y);
    // wire xor_0_yc, xor_0_yt;
    xor xor_0(Y,A,B);
endmodule
    
    
    module XOR_logicgate_tb();
        reg A;
        reg B;
        wire Y;
        
        XOR_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg6_xor.vcd");
            $dumpvars(0, XOR_logicgate_tb);
        end
        
        initial begin
            $display("TEST BENCH XOR LOGIC GATE");
            $display("T\tA\tB\tY");
            $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);
            
            A = 0; B = 0; #10;
            A = 0; B = 1; #10;
            A = 1; B = 0; #10;
            A = 1; B = 1; #10;
            $finish;
        end
        
    endmodule
