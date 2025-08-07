module full_adder_v1 (
    input [3:0] a,       // First input bit
    input [3:0] b,       // Second input bit
    input c_in,
    output c_out,     // Sum ouput (a XOR b)
    output [3:0] sum   // Carry output (a AND b)
);
  
    // Implementation using continuous assignments    
    // v1
    assign {c_out, sum} = a + b + c_in; // ADDITION operation for carry
    
endmodule

module full_adder_v2 (
    input [3:0] a,       // First input bit
    input [3:0] b,       // Second input bit
    input c_in,
    output reg c_out,     // Sum ouput (a XOR b)
    output reg [3:0] sum   // Carry output (a AND b)
);
    // v2
    always @ (a or b or c_in) begin
        {c_out, sum} = a + b + c_in;
    end
endmodule

module full_adder_tb;
    // 1. Declare testbench variables
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    wire [3:0] sum;
    integer i;

	// 2. Instantiate the design and connect to testbench variables
    full_adder_v2 fa0(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .sum(sum)
    );

  // 3. Provide stimulus to test the design
    initial begin
        $display("TEST BENCH Combination Full Adder");       

        a <= 0; 
        b <= 0;
        c_in  <= 0;        
        $finish;
    end

   // initial begin        
    //    $monitor("Time=%0t: a=%b, b=%b, sum=%b, carry=%b", $time, a, b, sum, carry);
        // $display("Time\ta\tb\tsum\tcarry");
        // $monitor("%g\t%b\t%b\t%b\t%b",$time, a, b, sum, carry);
   // end
    initial begin   
        $monitor ("a=0x%0h b=0x%0h c_in=0x%0h c_out=0x%0h sum=0x%0h", a, b, c_in, c_out, sum);

		// Use a for loop to apply random values to the input
        for (i = 0; i < 5; i = i+1) begin
        #10 a <= $random;
            b <= $random;
            c_in <= $random;
        end
    end
    
endmodule