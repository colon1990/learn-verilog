module full_adder_4bit_v1 (input [3:0] a,     // First input bit
                           input [3:0] b,     // Second input bit
                           input c_in,
                           output c_out,      // Sum ouput (a XOR b)
                           output [3:0] sum); // Carry output (a AND b)

// Implementation using continuous assignments
// v1
assign {c_out, sum} = a + b + c_in; // ADDITION operation for carry

endmodule

module full_adder_4bit_v2 (
    input [3:0] a,       // First input bit
    input [3:0] b,       // Second input bit
    input c_in,              // Carry input
    output reg c_out,     // Carry output
    output reg [3:0] sum    // 4-bit sum output
    );
    // v2 Using behavioral addition
    // always @ (a or b or c_in) begin
    always @(*) begin
        {c_out, sum} = a + b + c_in;
    end
endmodule
    
    module full_adder_4bit_tb;
        // 1. Declare testbench variables
        reg [3:0] a;
        reg [3:0] b;
        reg c_in;
        wire c_out;
        wire [3:0] sum;
        integer i;
        
        // 2. Instantiate the design and connect to testbench variables
        full_adder_4bit_v2 uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .sum(sum)
        );
        
        /*   // 3. Provide stimulus to test the design
         initial begin
         $display("TEST BENCH Combination 4-bit Full Adder");
         
         a    <= 0;
         b    <= 0;
         c_in <= 0;
         $finish;
         end
         
         initial begin
         $monitor ("a = 0x%0h b = 0x%0h c_in = 0x%0h c_out = 0x%0h sum = 0x%0h", a, b, c_in, c_out, sum);
         
         // Use a for loop to apply random values to the input
         for (i = 0; i < 5; i = i+1) begin
         #10 a <= $random;
         b     <= $random;
         c_in  <= $random;
         end
         end */
        
        
        // 3. Provide stimulus and monitor
        initial begin
            $display("TEST BENCH: 4-bit Full Adder");
            $monitor("Time = %0t: a = %h, b = %h, c_in = %b, c_out = %b, sum = %h",
            $time, a, b, c_in, c_out, sum);
            
            // Initialize inputs
            a    = 0;
            b    = 0;
            c_in = 0;
            
            // Test all zeros
            #10;
            
            // Test random values
            for (i = 0; i < 10; i = i+1) begin
                #10 a = $random;
                b     = $random;
                c_in  = $random;
            end
            
            // Test edge cases
            #10 a = 4'hF; b = 4'h1; c_in = 1;  // Test overflow
            #10 a = 4'hF; b = 4'hF; c_in = 0;  // Max addition without carry-in
            #10 a = 4'hF; b = 4'hF; c_in = 1;  // Max addition with carry-in
            #10 a = 4'h0; b = 4'h0; c_in = 1;   // Minimal addition with carry-in
            
            #10 $finish;
        end
        
        // Waveform dumping
        initial begin
            $dumpfile("L2.Full_adder_4bit.vcd");
            $dumpvars(0, full_adder_4bit_tb);
        end
    endmodule
