// `timescale 1ns / 1ps

module OR_logicgate_3in(input A,
                        input B,
                        input C,
                        output Y);
    wire or_0_yc, or_0_yt;
    or or_0(Y,A,B,C);
endmodule
    
    
    module OR_logicgate_3in_tb();
        reg A;
        reg B;
        reg C;
        wire Y;
        
        OR_logicgate_3in uut(
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg3_or_3in.vcd");
            $dumpvars(0, OR_logicgate_3in_tb);
        end
        
        initial begin
            $display(" == TEST BENCH OR LOGIC GATE 3 INPUT == ");
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
