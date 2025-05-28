// XOR gate - Gate Level Modeling
module xor_gate_gate_level (
    input a, b,
    output y
);
    xor G1 (y, a, b);
endmodule

// XOR gate - Dataflow Modeling
module xor_gate_dataflow (
    input a, b,
    output y
);
    assign y = a ^ b;
endmodule

// XOR gate - Behavioral Modeling
module xor_gate_behavioral (
    input a, b,
    output reg y
);
    always @(*) begin
        if (a != b)
            y = 1;
        else
            y = 0;
    end
endmodule


// Testbench for all XOR gate models
module tb_xor_gate;

    reg a, b;
    wire y_gate, y_dataflow, y_behavioral;

    // Instantiate the gate-level XOR gate
    xor_gate_gate_level U1 (.a(a), .b(b), .y(y_gate));

    // Instantiate the dataflow XOR gate
    xor_gate_dataflow U2 (.a(a), .b(b), .y(y_dataflow));

    // Instantiate the behavioral XOR gate
    xor_gate_behavioral U3 (.a(a), .b(b), .y(y_behavioral));

    initial begin
        $monitor("Time=%0t | a=%b b=%b | Gate-Level=%b Dataflow=%b Behavioral=%b",
                 $time, a, b, y_gate, y_dataflow, y_behavioral);

        // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
