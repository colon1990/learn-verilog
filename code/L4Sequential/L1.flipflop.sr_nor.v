
module ff_sr(input wire clk,    // Clock input
             input wire reset,  // Active high reset
             input wire s,      // Set input
             input wire r,      // Reset input
             output reg q,      // Output Q
             output reg q_bar); // Complementary output Q'
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q     <= 1'b0;
            q_bar <= 1'b1;
        end
        
        else  begin
        case ({s,r})
            2'b00: begin // No change
                q     <= q;
                q_bar <= q_bar;
            end
            
            2'b01: begin // reset
                q     <= 1'b0;
                q_bar <= 1'b1;
            end
            
            2'b10: begin // Set
                q     <= 1'b1;
                q_bar <= 1'b0;
            end
            
            2'b11: begin // Invalid state (both set and reset)
                q     <= 1'bx;
                q_bar <= 1'bx;
            end
            
        endcase
    end
    end
    
endmodule
    
    `timescale 1ns/1ps
    
    module ff_sr_tb;
        // Inputs
        reg clk;
        reg reset;
        reg s;
        reg r;
        
        // Outputs
        wire q;
        wire q_bar;
        
        ff_sr uut(
        .clk(clk),
        .reset(reset),
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
        );
        
        initial begin
            $dumpfile("L1.flipflop.sr_nor.vcd");
            $dumpvars(0, ff_sr_tb);
        end
        
        // Clock generation
        initial begin
            clk = 0;
            forever begin
                #5 clk = ~clk; // 10ns clock period
            end
        end
        
        initial begin
            // Initialize Inputs
            reset = 1;
            s     = 0;
            r     = 0;
            
            // Wait for global reset
            #20;
            reset = 0;
            
            // Test case
            // Case 1: Set the flip flop
            s = 1;r = 0;
            #10;
            
            // Case 2: No change
            s = 0; r = 0;
            #10;
            
            // Case 3: reset the flip flop
            s = 0 ; r = 1;
            #10;
            
            // Case 4: no change
            s = 0; r = 0;
            #10;
            
            // Case 5: invalid state (both set and reset)
            s = 1; r = 1;
            #10;
            
            // Case 6: reset again
            s = 0; r = 1 ;
            #10;
            
            // Case 7: apply reset signal
            reset = 1;
            #10;
            reset = 0;
            
            #20;
            $finish;
        end
        
        // Monitor the outputs
        initial begin
            $monitor("Time = %0t, clk = %b, reset = %b, s = %b, r = %b, q = %b, q_bar = %b",$time, clk, reset, s, r, q, q_bar);
        end
    endmodule
