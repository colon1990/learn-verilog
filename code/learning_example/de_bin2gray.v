// Gray code is a binary code where each successive value differs from the previous value by only one bit.

// Implementation #1
module bin2grayv1 #(parameter N = 4)
                   (input [N-1:0] bin,
                    output [N-1:0] gray);
    genvar  i;
    generate
    for (i = 0 ;i<N -1 ; i = i+1) begin
        assign gray[i] = bin[i] ^ bin[i+1];
    end
    endgenerate
    
    assign gray[N-1] = bin[N-1];
endmodule
    
    
    
    module bin2grayv2 #(parameter N = 4) (
        input [N-1:0] bin,
        output [N-1:0] gray
        );
        
        assign gray = bin ^ (bin >> 1);
        
    endmodule
