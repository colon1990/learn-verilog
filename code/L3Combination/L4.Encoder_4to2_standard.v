// Fails if multiple inputs are active (undefined behavior).
// Assumes one-hot input (only one 1 at a time).

module encoder_4to2_standard (input [3:0] in,        // 4-bit input (one-hot) - include 3 input and enable
                              output reg [1:0] out); // 2 bit binary output

// Behavioral
always @(*) begin
    case (in)
        4'b0001: out = 2'b00; // in[0] active
        4'b0010: out = 2'b01; // in[1] active
        4'b0100: out = 2'b10; // in[2] active
        4'b1000: out = 2'b11; // in[3] active
        default: out = 2'bxx; // Undefined if multiple inputs high
    endcase
end

endmodule

module encoder_4to2_standard_tb;
    reg [3:0] in;
    wire [1:0] out;
    
    encoder_4to2_standard uut(
    .in(in),
    .out(out)
    );
    
    initial begin
        $display(" == = TESTING STANDARD ENCODER (4-to-2) == = ");
        $monitor("Time = %0t: in = %b, out = %b", $time, in, out);

        // Test one-host cases
        in = 4'b0001; #10; // out = 00
        in = 4'b0010; #10; // out = 01
        in = 4'b0100; #10; // out = 10
        in = 4'b1000; #10; // out = 11
        
        // Test invalid cases (multiple 1's)
        in = 4'b0011; #10; // Undefine (xx)
        in = 4'b1100; #10; // Undefine (xx)

        $finish;
    end
    
    
    // Optional: Dump waveforms for visualization
    initial begin
        $dumpfile("L4.Encoder_4to2_standard.vcd");
        $dumpvars(0, encoder_4to2_standard_tb);        
    end

endmodule
