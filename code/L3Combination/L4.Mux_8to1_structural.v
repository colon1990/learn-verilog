module mux8to1_structural (input [7:0] data_in, // 8-bit input
                           input [2:0] sel,     // 3-bit select line
                           output out);         // output


wire[1:0] stage1; // Outputs of first stage 4:1 muxes
wire stage2;   // Output of second stage 2:1 mux

// First stages- two 4:1 mux
mux4to1 mux4_0(
.data_in(data_in[3:0]),
.sel(sel[1:0]),
.out(stage1[0])
);

mux4to1 mux4_1(
.data_in(data_in[7:4]),
.sel(sel[1:0]),
.out(stage1[1])
);

// Second stage - 2:1 mux to select between first stage outputs
mux2to1 mux2(
.data_in(stage1),
.sel(sel[2]),
.out(out)
);


endmodule


module mux4to1 (
    input [3:0] data_in,
    input [1:0] sel,
    output reg out
    );
    
    always @(*) begin
        case (sel)
            2'b00 :  out = data_in[0];
            2'b01 :  out = data_in[1];
            2'b10 :  out = data_in[2];
            2'b11 :  out = data_in[3];
        endcase
    end
    
endmodule
    
    module mux2to1 (
        input [1:0] data_in,
        input  sel,
        output reg out
        );
        always @(*) begin
            out = sel ? data_in[1] : data_in[0];
        end
    endmodule

