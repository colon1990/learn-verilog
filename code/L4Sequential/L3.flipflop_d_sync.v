// Design #1: With sync active-low reset

module dff_sync(input d,
                input rstn,
                input clk,
                output reg q);
    
    always @(posedge clk) begin
        if (!rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule
    
    module dff_sync_tb ;
        reg clk;
        reg d;
        reg rstn;
        reg[2:0] delay;
        integer  i;
        
        dff_sync dff0(
        .d(d),
        .rstn(rstn),
        .clk(clk),
        .q(q)
        );
        
        // generate clock
        always #10 clk = ~clk;
        
        // Test case
        initial begin
            clk  <= 0 ;
            d    <= 0;
            rstn <= 0;
            
            #15 d    <= 1;
            #10 rstn <= 1;
            
            for (i = 0; i < 5; i = i + 1) begin
                delay = $random;
                #(delay) d <= i;                
            end
        end
    endmodule
