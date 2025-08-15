// `timescale 1ns / 1ps

module AND_logicgate_3in(input A,
                         input B,
                         input C,
                         output Y);
    
    and and_0(Y,A,B,C);
    
endmodule
    
    
    module AND_logicgate_3in_tb();
        reg A;
        reg B;
        reg C;
        wire Y;
        
        AND_logicgate_3in uut(
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg2_and_3in.vcd");
            $dumpvars(0, AND_logicgate_3in_tb);
        end
        
        initial begin
            $display(" == TEST BENCH AND LOGIC GATE == ");
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
