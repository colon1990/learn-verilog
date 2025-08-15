module mux8to1_case_behavioral (input [7:0] data_in, // 8-bit input
                                input [2:0] sel,     // 3-bit select line
                                output reg out);     // output

always @ (*) begin
    case (sel)
        3'b000 : out = data_in[0];
        3'b001 : out = data_in[1];
        3'b010 : out = data_in[2];
        3'b011 : out = data_in[3];
        3'b100 : out = data_in[4];
        3'b101 : out = data_in[5];
        3'b110 : out = data_in[6];
        3'b111 : out = data_in[7];
        default: out = 1'b0; // Default case (good practice)
        
    endcase
end

endmodule



module tb_mux8to1;
    reg [7:0] data_in;
    reg [2:0] sel;
    wire out;
    
    // Instantiate the mux
    mux8to1_case_behavioral uut (
    .data_in(data_in),
    .sel(sel),
    .out(out)
    );
    
    initial begin
        // Initialize inputs
        data_in = 8'b10101010;
        sel     = 0;
        
        // Test all select lines
        for (sel = 0; sel < 8; sel = sel + 1) begin
            #10;
            $display("sel = %b, out = %b", sel, out);
        end
        
        // Change input pattern and test again
        data_in = 8'b11001100;
        for (sel = 0; sel < 8; sel = sel + 1) begin
            #10;
            $display("sel = %b, out = %b", sel, out);
        end
        
        #10 $finish;
    end
endmodule
