module decoder_3to8_gate (input [2:0] in,
                          input enable,
                          output [7:0] out);

// Internal wires for inverted inputs
wire not_in0, not_in1, not_in2;

// Inverters for input bits
not inv0 (not_in0, in[0]);
not inv1 (not_in1, in[1]);
not inv2 (not_in2, in[2]);

// AND gates for each output
and and0 (out[0], enable, not_in2, not_in1, not_in0);
and and1 (out[1], enable, not_in2, not_in1, in[0]);
and and2 (out[2], enable, not_in2, in[1], not_in0);
and and3 (out[3], enable, not_in2, in[1], in[0]);
and and4 (out[4], enable, in[2], not_in1, not_in0);
and and5 (out[5], enable, in[2], not_in1, in[0]);
and and6 (out[6], enable, in[2], in[1], not_in0);
and and7 (out[7], enable, in[2], in[1], in[0]);
endmodule


module decoder_3to8_gate_tb;
    reg [2:0] in;
    reg enable;
    wire [7:0] out;
    
    decoder_3to8_gate uut (
    .in(in),
    .enable(enable),
    .out(out)
    );
    
    initial begin
        $monitor("Time = %0t: enable = %b, in = %b, out = %b", $time, enable, in, out);
        
        enable = 0;
        in     = 3'b000;#10;
        
        enable = 1;
        in     = 3'b000;#10;
        in     = 3'b001;#10;
        in     = 3'b010;#10;
        in     = 3'b011;#10;
        in     = 3'b100;#10;
        in     = 3'b101;#10;
        in     = 3'b110;#10;
        in     = 3'b111;#10;
        
        $finish;
    end
    
    initial begin
        $dumpfile("L3.Decoder_3to8_gate.vcd");
        $dumpvars(0, decoder_3to8_gate_tb);
    end
endmodule
