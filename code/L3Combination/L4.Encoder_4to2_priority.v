// Handles multiple active inputs by prioritizing the highest-order 1.
// Useful in interrupt handling (highest-priority interrupt wins).

module encoder_4to2_priority (input [3:0] in,       // 4-bit input (one-hot) - include 3 input and enable
                              output reg [1:0] out, // 2 bit binary output
                              output reg valid);    // 1 if at least one input is active

// Behavioral
always @(*) begin
    if (in[3]) begin
        out   = 2'b11;  // Highest priority (in[3])
        valid = 1 ;
        end else if (in[2]) begin
        out   = 2'b10; // Highest priority (in[2])
        valid = 1 ;
        end else if (in[1]) begin
        out   = 2'b01;  // Highest priority (in[1])
        valid = 1 ;
        end else if (in[0]) begin
        out   = 2'b00;  // Highest priority (in[0])
        valid = 1 ;
        end else begin
        out   = 2'b00;   // No input active
        valid = 0 ;
    end
end

endmodule


module encoder_4to2_priority_tb;
    reg [3:0] in;
    wire [1:0] out;
    wire valid;
    
    // Instantiate the priority encoder
    encoder_4to2_priority uut (
    .in(in),
    .out(out),
    .valid(valid)
    );
    
    initial begin
        $display(" == = TESTING PRIORITY ENCODER (4-to-2) == = ");
        $monitor("Time = %0t: in = %b, out = %b, valid = %b", $time, in, out, valid);
        
        // Test single active inputs
        in = 4'b0001; #10; // out = 00, valid = 1
        in = 4'b0010; #10; // out = 01, valid = 1
        in = 4'b0100; #10; // out = 10, valid = 1
        in = 4'b1000; #10; // out = 11, valid = 1
        
        // Test priority cases (multiple 1's)
        in = 4'b0011; #10; // out = 01 (prioritizes in[1])
        in = 4'b0110; #10; // out = 10 (prioritizes in[2])
        in = 4'b1111; #10; // out = 11 (prioritizes in[3])
        
        // Test no active input
        in = 4'b0000; #10; // out = 00, valid = 0
        
        $finish;
    end
    
    // Optional: Dump waveforms for visualization
    initial begin
        $dumpfile("L4.Encoder_4to2_priority.vcd");
        $dumpvars(0, encoder_4to2_priority_tb);
    end
endmodule
