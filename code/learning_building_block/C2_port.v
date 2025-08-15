module m_port (input wire clk,
               input en,
               input rw,
               input [15:0] data,
               output outdata);
    
endmodule
    
    // Implicit nets are by default unsigned.
    module m_unsigned_port (
        input a,
        b,
        output c
        );
        // ports a, b, and c are by default unsigned
    endmodule
        
        
        // If either the net/reg declaration has a signed attribute, then the other shall also be considered signed.
        module m_signed_port (
            input signed a,
            input signed b,
            output c
            );
            
            wire a, b;          // a, b are signed from port declaration
            reg signed c;       // c is signed from reg declaration
        endmodule
