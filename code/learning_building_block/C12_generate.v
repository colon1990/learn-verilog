// design for half-adder
module ha (input a,
           input b,
           output sum,
           output count);
    
    assign sum   = a + b;
    assign count = a & b;
    
endmodule
    
    // A top level design that contains N instances of half adder
    
    module my_desgn #(parameter N = 4)
        (
        input [N-1:0] a, b,
        output [N-1:0] sum, count
        );
        
        // Declare a temporary loop variable to be used during
        // generation and won't be available during simulation
        genvar i;
        
        // Generate for loop to instantiate N times
        generate
        for (i = 0; i < N; i = i +1) begin
            ha u0(a[i], b[i], sum[i],count[i]);
        end
        endgenerate
    endmodule
        
        
        module tb_;
            parameter N = 2;
            
            reg [N-1:0] a,b;
            wire [N-1:0] sum,count;
            
            // Instantiate top level design with N = 2 so that it will have 2
            // separate instances of half adders and both are given two separate
            // inputs
            my_desgn #(.N(N)) md (.a(a), .b(b), .sum(sum), .count(count));
            
            initial begin
                $dumpfile("generate_block.vcd");
                $dumpvars(0, tb_);
            end
            
            initial begin
                a <= 0;
                b <= 0;
                $monitor ("a = 0x%0h b = 0x%0h sum = 0x%0h count = 0x%0h", a, b, sum, count);
                #10
                a <= 'h2;
                b <= 'h3;
                #20
                b <= 'h4;
                #10
                a <= 'h5;w
            end
            
        endmodule
