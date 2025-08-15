module not_logicgate(A,
                     Y);
    input A;
    output Y;
    
    wire buf_0_c;
    
    not buf_0(Y, A);
endmodule
    
    //~ `New testbench
    `timescale  1ns / 1ps
    
    module tb_not_logicgate;
        
        // not_logicgate Parameters
        parameter PERIOD = 10;
        
        
        // not_logicgate Inputs
        reg   A = 0 ;
        
        // not_logicgate Outputs
        wire  Y                                    ;
        
        
        initial
        begin
            forever #(PERIOD/2)  clk = ~clk;
        end
        
        initial
        begin
            #(PERIOD*2) rst_n = 1;
        end
        
        not_logicgate  u_not_logicgate (
        .A                       (A),
        
        .Y                       (Y)
        );
        
        initial
        begin
            
            $finish;
        end
        
    endmodule
