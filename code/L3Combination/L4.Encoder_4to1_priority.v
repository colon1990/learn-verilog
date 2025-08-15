module encoder_4to1_priority (input [7:0] a,
                              input [7:0] b,
                              input [7:0] c,
                              input [7:0] d,
                            //   input [1:0] sel,
                              output reg [7:0] out);


always @(*) begin
    if (a != 0)
        out = a;  // Highest priority
    else if (b != 0)
        out = b;
    else if (c != 0)
        out = c;
    else
        out = d;  // Default
end
endmodule


module priority_encoder_tb;
    reg [7:0] a, b, c, d;
    wire [7:0] out;
    
    encoder_4to1_priority uut (.*);  // Connect all ports
    
    initial begin
        $monitor("a = %h, b = %h, c = %h, d = %h, out = %h", a, b, c, d, out);
        
        a = 8'h00; b = 8'h00; c = 8'h00; d = 8'hDD; #10;  // out = DD
        a = 8'h00; b = 8'h00; c = 8'hCC; d = 8'hDD; #10;  // out = CC
        a = 8'h00; b = 8'hBB; c = 8'hCC; d = 8'hDD; #10;  // out = BB
        a = 8'hAA; b = 8'hBB; c = 8'hCC; d = 8'hDD; #10;  // out = AA
        $finish;
    end
endmodule
