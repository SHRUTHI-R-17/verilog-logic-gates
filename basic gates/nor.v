// NOR gate - Gate Level Modeling
module nor_gate_gate_level (
    input a, b,
    output y
);
    nor G1 (y, a, b);
endmodule

// NOR gate - Dataflow Modeling
module nor_gate_dataflow (
    input a, b,
    output y
);
    assign y = ~(a | b);
endmodule

// NOR gate - Behavioral Modeling
module nor_gate_behavioral (
    input a, b,
    output reg y
);
    always @(*) begin
        if (a == 0 && b == 0)
            y = 1;
        else
            y = 0;
    end
endmodule


// Testbench for all NOR gate models
module tb_nor_gate;

    reg a, b;
    wire y_gate, y_dataflow, y_behavioral;

    // Instantiate the gate-level NOR gate
    nor_gate_gate_level U1 (.a(a), .b(b), .y(y_gate));

    // Instantiate the dataflow NOR gate
    nor_gate_dataflow U2 (.a(a), .b(b), .y(y_dataflow));

    // Instantiate the behavioral NOR gate
    nor_gate_behavioral U3 (.a(a), .b(b), .y(y_behavioral));

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
