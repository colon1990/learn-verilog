module decoder_3to8 (input [2:0] in,       // 3-bit input
                     input enable,         // Enable signal (active high)
                     output reg[7:0] out); //8-bit output (one-hot)
    // Behavioral Style
    always @(*) begin
        if (enable)begin
            case (in)
                3'b000: out  = 8'b00000001;
                3'b001: out  = 8'b00000010;
                3'b010: out  = 8'b00000100;
                3'b011: out  = 8'b00001000;
                3'b100: out  = 8'b00010000;
                3'b101: out  = 8'b00100000;
                3'b110: out  = 8'b01000000;
                3'b111: out  = 8'b10000000;
                default: out = 8'b00000000; // Optional (good practice)
                
            endcase
            end  else begin
            out = 8'b00000000; // disabled
        end
    end
    
endmodule
    
    
    module decoder_3to8_tb;
        reg [2:0] in;
        reg enable;
        wire [7:0] out;
        
        decoder_3to8 uut(
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
            $dumpfile("L3.Decoder_3to8.vcd");
            $dumpvars(0, decoder_3to8_tb);
        end
        
    endmodule
