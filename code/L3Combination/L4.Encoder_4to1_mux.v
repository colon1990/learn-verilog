module encoder_mux_4to1 (input [7:0] a,
                         input [7:0] b,
                         input [7:0] c,
                         input [7:0] d,
                         input [1:0] sel,
                         output reg [7:0] out);
always @(*) begin
    case (sel)
        2'b00: out = a;
        2'b01: out = b;
        2'b10: out = c;
        2'b11: out = d;
    endcase
end

endmodule


module mux_4to1_tb;
    reg [7:0] a, b, c, d;
    reg [1:0] sel;
    wire [7:0] out;
    
    encoder_mux_4to1 uut (.*);  // Connect all ports
    
    initial begin
        a             = 8'hAA;
        b             = 8'hBB;
        c             = 8'hCC;
        d             = 8'hDD;
        $monitor("sel = %b, out = %h", sel, out);
        
        sel = 2'b00; #10;  // out = a (AA)
        sel = 2'b01; #10;  // out = b (BB)
        sel = 2'b10; #10;  // out = c (CC)
        sel = 2'b11; #10;  // out = d (DD)
        $finish;
    end
endmodule
