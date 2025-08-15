module half_adder (input wire a,       // First input bit
                   input wire b,       // Second input bit
                   output wire sum,    // Sum ouput (a XOR b)
                   output wire carry); // Carry output (a AND b)
    // Implementation using continuous assignments
    assign sum   = a ^ b;   // XOR operation for sum
    assign carry = a & b; // AND operation for carry
    
endmodule
    
    module half_adder_tb;
        reg a, b;
        wire sum, carry;
        
        // Instantiate the half_adder
        half_adder uut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
        );
        
        // Test stimulus
        initial begin
            $display("TEST BENCH Combination Half Adder");
            
            a = 0; b = 0; #10;
            a = 0; b = 1; #10;
            a = 1; b = 0; #10;
            a = 1; b = 1; #10;
            $finish;
        end
        
        initial begin
            $monitor("Time = %0t: a = %b, b = %b, sum = %b, carry = %b", $time, a, b, sum, carry);
            // $display("Time\ta\tb\tsum\tcarry");
            // $monitor("%g\t%b\t%b\t%b\t%b",$time, a, b, sum, carry);
        end
        
        initial begin
            $dumpfile("L1.Half_adder.vcd");
            $dumpvars(0, half_adder_tb);
        end
    endmodule
