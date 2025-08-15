module decoder_2to4_gate (input [1:0] in,    // 2-bit input
                          input enable,      // Enable signal (active high)
                          output [3:0] out); // 4-bit one-hot output
// Internal wires for inverted inputs
wire not_in0, not_in1;

// Inverters for input bits
not inv0 (not_in0, in[0]);
not inv1 (not_in1, in[1]);

// AND gates for each output
and and0 (out[0], enable, not_in1, not_in0);  // out[0] = enable & ~in[1] & ~in[0]
and and1 (out[1], enable, not_in1, in[0]);    // out[1] = enable & ~in[1] & in[0]
and and2 (out[2], enable, in[1], not_in0);    // out[2] = enable & in[1] & ~in[0]
and and3 (out[3], enable, in[1], in[0]);      // out[3] = enable & in[1] & in[0]
endmodule

module decoder_2to4_gate_tb;
    reg [1:0] in;
    reg enable;
    wire [3:0] out;
    
    decoder_2to4_gate uut (
    .in(in),
    .enable(enable),
    .out(out)
    );
    
    initial begin
        $monitor("Time = %0t: enable = %b, in = %b, out = %b", $time, enable, in, out);
        
        // Test cases
        enable = 0; in = 2'b00; #10; // Decoder disabled
        
        enable = 1;
        in     = 2'b00; #10; // out     = 0001
        in     = 2'b01; #10; // out     = 0010
        in     = 2'b10; #10; // out     = 0100
        in     = 2'b11; #10; // out     = 1000
        
        $finish;
    end
    
    initial begin
        $dumpfile("L3.Decoder_2to4_gate.vcd");
        $dumpvars(0, decoder_2to4_gate_tb);
    end
endmodule
