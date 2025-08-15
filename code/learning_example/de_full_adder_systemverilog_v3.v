module full_add_v3 (input logic a,
                    input logic b,
                    input logic cin,
                    output logic sum,
                    output logic cout);
    
    assign sum  = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
    
endmodule
    
    module full_adder_tb_v3;
        // Inputs
        logic a;
        logic b;
        logic cin;
        
        // Outputs
        logic sum;
        logic cout;
        
        // Instantiate the Unit Under Test (UUT)
        full_add_v3 uut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
        );
        
        initial begin
            // Initialize inputs
            a = 0;b = 0;cin = 0;
            
            // apply stimulus
            #10 a = 0; b = 0; cin = 0;
            #10 a = 0; b = 0; cin = 1;
            #10 a = 0; b = 1; cin = 0;
            #10 a = 0; b = 1; cin = 1;
            #10 a = 1; b = 0; cin = 0;
            #10 a = 1; b = 0; cin = 1;
            #10 a = 1; b = 1; cin = 0;
            #10 a = 1; b = 1; cin = 1;
            #10 $finish;
        end
        
        initial begin
            $dumpfile("full_adder_v3.vcd");
            $dumpvars(0, full_adder_tb_v3);
        end
    endmodule
