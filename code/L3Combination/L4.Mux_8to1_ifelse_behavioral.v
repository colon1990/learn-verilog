module mux8to1_ifelse_behavioral (input [7:0] data_in, // 8-bit input
                                  input [2:0] sel,     // 3-bit select line
                                  output reg out);     // output


always @ (*) begin
    if (sel == 3'b000) out      = data_in[0];
    else if (sel == 3'b001) out = data_in[1];
    else if (sel == 3'b010) out = data_in[2];
    else if (sel == 3'b011) out = data_in[3];
    else if (sel == 3'b100)out = data_in[4];
    else if (sel == 3'b101) out = data_in[5];
    else if (sel == 3'b110) out = data_in[6];
    else out     = data_in[7];
end

endmodule
