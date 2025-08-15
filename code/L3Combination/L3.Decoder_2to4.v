module decoder_2to4 (input [1:0] in,        // 2-bit input
                     input enable,          // Enable signal (active high)
                     output reg [3:0] out); //4-bit output (one-hot)
// Behavioral Style
always @(*) begin
    if (enable) begin
        case (in)
            2'b00: out   = 4'b0001;
            2'b01: out   = 4'b0010;
            2'b10: out   = 4'b0100;
            2'b11: out   = 4'b1000;
            default: out = 4'b0000; // Optional(good practice)
        endcase
        end else begin
        out = 4'b0000; // Disabled
    end
end

endmodule

module decoder_2to4_tb;
    reg [1:0] in;
    reg enable;
    wire [3:0] out;
    
    decoder_2to4 uut(
    .in(in),
    .enable(enable),
    .out(out)
    );
    
    initial begin
        $monitor("Time = %0t: enable = %b, in = %b, out = %b", $time, enable, in, out);
        
        enable = 0;
        in     = 2'b00; #10;
        
        enable = 1;
        in     = 2'b00; #10;
        in     = 2'b01; #10;
        in     = 2'b10; #10;
        in     = 2'b11; #10;
        
        $finish;
        
    end
    
    initial begin
        $dumpfile("L3.Decoder_2to4.vcd");
        $dumpvars(0, decoder_2to4_tb);
    end
endmodule
