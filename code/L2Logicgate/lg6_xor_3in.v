// `timescale 1ns / 1ps

module XOR_logicgate_3in(input A,
                         input B,
                         input C,
                         output Y);
    // wire xor_0_yc, xor_0_yt;
    xor xor_0(Y,A,B,C);
endmodule
    
    
    module XOR_logicgate_3in_tb();
        reg A;
        reg B;
        reg C;
        wire Y;
        
        XOR_logicgate_3in uut(
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg6_xor_3in.vcd");
            $dumpvars(0, XOR_logicgate_3in_tb);
        end
        
        initial begin
            $display(" == TEST BENCH XOR LOGIC GATE 3 INPUT == ");
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
