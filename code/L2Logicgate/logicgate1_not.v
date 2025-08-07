`timescale 1ns / 1ps

module not_logicgate(A, Y);
  input A;
  output Y;

  wire buf_0_c;

  not buf_0(Y, A);
endmodule


module Not_LogicGate_tb;
    reg A; // input port
    wire Y; // output port

    not_logicgate uut(
        .A(A),
        .Y(Y)
    );
    initial begin
        $display("TEST BENCH NOT LOGIC GATE");
        $display("A = %b, Y = %b", A, Y);

        A = 0;
        #10;
        $display("A = %b, Y = %b", A, Y);

        A = 1;
        #10;
        $display("A = %b, Y = %b", A, Y);

        $finish;
    end
    
endmodule
