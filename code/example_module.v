// Example module with parameters and ports
module example_module #(
    // Parameter declarations
    parameter WIDTH = 8,               // Data width (default 8 bits)
    parameter DEPTH = 16,              // Memory depth (default 16)
    parameter ENABLE_FEATURE = 1'b1,   // Feature enable (default on)
    parameter CLK_DIV = 2              // Clock divider (default 2)
) (
    // Port declarations
    input wire clk,                    // Clock input
    input wire rst_n,                  // Active-low reset
    input wire [WIDTH-1:0] data_in,    // Input data bus
    input wire wr_en,                  // Write enable
    input wire rd_en,                  // Read enable
    output reg [WIDTH-1:0] data_out,   // Output data bus
    output wire full,                  // Full status flag
    output wire empty                  // Empty status flag
);
    // Module implementation here
    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [3:0] wr_ptr, rd_ptr;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset logic
            data_out <= 0;
            wr_ptr <= 0;
            rd_ptr <= 0;
        end
        else begin
            // Normal operation
            if (wr_en && !full) begin
                memory[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
            end
            
            if (rd_en && !empty) begin
                data_out <= memory[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end
    
    assign full = (wr_ptr + 1 == rd_ptr);
    assign empty = (wr_ptr == rd_ptr);
    
endmodule