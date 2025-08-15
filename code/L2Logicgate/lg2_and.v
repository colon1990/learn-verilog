// `timescale 1ns / 1ps

module AND_logicgate(input A,
                     input B,
                     output Y);
    
    and and_0(Y,A,B);
    
endmodule
    
    
    module AND_logicgate_tb();
        reg A;
        reg B;
        wire Y;
        
        AND_logicgate uut(
        .A(A),
        .B(B),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg2_and.vcd");
            $dumpvars(0, AND_logicgate_tb);
        end
        
        initial begin
            $display(" == TEST BENCH AND LOGIC GATE == ");
            $display("Time\tA\tB\tY");
            $monitor("%g\t%b\t%b\t%b",$time, A, B, Y);
            
            A = 0; B = 0; #10;
            A = 0; B = 1; #10;
            A = 1; B = 0; #10;
            A = 1; B = 1; #10;
            $finish;
        end
        
    endmodule
