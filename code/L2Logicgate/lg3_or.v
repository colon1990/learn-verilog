// `timescale 1ns / 1ps

module OR_logicgate(input A,
                    input B,
                    output Y);
    wire or_0_yc, or_0_yt;
    or or_0(Y,A,B);
endmodule
    
    
    module OR_logicgate_tb();
        reg A;
        reg B;
        wire Y;
        
        OR_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg3_or.vcd");
            $dumpvars(0, OR_logicgate_tb);
        end
        
        initial begin
            $display("TEST BENCH OR LOGIC GATE");
            $display("Time\tA\tB\tY");
            $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);
            
            A = 0; B = 0; #10;
            A = 0; B = 1; #10;
            A = 1; B = 0; #10;
            A = 1; B = 1; #10;
            $finish;
        end
        
    endmodule
