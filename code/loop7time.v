module print_message;

initial begin
    // integer i;
    for (integer i = 0; i < 7; i = i + 1) begin
        $display("Hello, World! (Iteration %0d)", i + 1);
    end
    $finish;
end

endmodule