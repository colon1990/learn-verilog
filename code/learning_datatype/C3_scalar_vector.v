module m_s_v (input wire o_nor,        // single bit scalar net
              input wire [7:0] o_flop, // 8-bit vector net
              output reg parity,       // single bit scalar variable
              output reg [31:0] addr); // 32 bit vector variable to store address
    
endmodule
    
    
    // module m_bit_select ();
    //     reg  [7:0] addr;
    //     addr[0]     = 0; // assign 0 to bit 0 of addr
    //     addr[3]     = 1; // assign 1 to bit 3 of addr
    //     // addr [8] = 1; // illegal: do not exist
    // endmodule
    
    
    module m_part_selects;
        reg [31:0]  data;
        integer         i;
        // 	addr [23:16] = 8'h23;         // bits 23 to 16 will be replaced by the new value 'h23 -> constant part-select
        
        
        initial begin
            data = 32'hFACE_CAFE;
            for (i = 0; i < 4; i++) begin
                $display ("data[8*%0d +: 8] = 0x%0h", i, data[8*i +: 8]);
            end
            
            $display ("data[7:0]   = 0x%0h", data[7:0]);
            $display ("data[15:8]  = 0x%0h", data[15:8]);
            $display ("data[23:16] = 0x%0h", data[23:16]);
            $display ("data[31:24] = 0x%0h", data[31:24]);
        end
    endmodule
