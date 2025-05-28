//Gate-level modeling
module and_gate_gatelevel(output Y, input A, B);
  and (Y, A, B);
endmodule

//Testbench
module tb_and_gate_gatelevel;

  // Declare testbench variables
  reg A, B;
  wire Y;

  // Instantiate the module under test
  and_gate_gatelevel uut (
    .Y(Y),
    .A(A),
    .B(B)
  );

  initial begin
    $display("A B | Y");
    $monitor("%b %b | %b", A, B, Y);

    // Apply test vectors
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;
  end

endmodule
