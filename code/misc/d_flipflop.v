module dff(input d,
           input rstn,
           input clk,     // Inputs to the design should start with "input"
           output reg q); // Outputs of the design should start with "output"
    
    always @(posedge clk) begin
        if (!rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule
    
    
    module dff_tb;
        // 1. Declare input/output variables to drive to the design
        reg tb_clk;
        reg tb_d;
        reg tb_rstn;
        wire tb_q;
        
        // 2. Create an instance of the design
        // This is called design instantiation
        dff  dff0 (
        .clk    (tb_clk),       // Connect clock input with TB signal
        .d      (tb_d),         // Connect data input with TB signal
        .rstn   (tb_rstn),      // Connect reset input with TB signal
        .q      (tb_q));        // Connect output q with TB signal
        
        // 3. The following is an example of a stimulus
        // Here we drive the signals tb_* with certain values
        // Since these tb_* signals are connected to the design inputs,
        // the design will be driven with the values in tb_*
        initial begin
            tb_rstn <= 1'b0;
            tb_clk  <= 1'b0;
            tb_d    <= 1'b0;
        end
    endmodule
