// `timescale 1ns / 1ps

module not_logicgate(input A,
                     output Y);
    // input A;
    // output Y;
    not buf_0(Y, A);
endmodule
    
    
    module Not_LogicGate_tb;
        reg A; // input port
        wire Y; // output port
        
        not_logicgate uut(
        .A(A),
        .Y(Y)
        );
        
        initial begin
            $dumpfile("lg1_not.vcd");
            $dumpvars(0, Not_LogicGate_tb);
        end

        initial begin
            $display("TEST BENCH NOT LOGIC GATE");
            $display("A = %b, Y = %b", A, Y);
            
            A           = 0;        #10;
            $display("A = %b, Y = %b", A, Y);
            
            A           = 1;        #10;
            $display("A = %b, Y = %b", A, Y);
            
            $finish;
        end
        
    endmodule
