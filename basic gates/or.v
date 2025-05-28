// OR gate - Gate Level Modeling
module or_gate_gate_level (
    input a, b,
    output y
);
    or G1 (y, a, b);
endmodule

// OR gate - Dataflow Modeling
module or_gate_dataflow (
    input a, b,
    output y
);
    assign y = a | b;
endmodule

// OR gate - Behavioral Modeling
module or_gate_behavioral (
    input a, b,
    output reg y
);
    always @(*) begin
        if (a == 1 || b == 1)
            y = 1;
        else
            y = 0;
    end
endmodule


// Testbench for all OR gate models
module tb_or_gate;

    reg a, b;
    wire y_gate, y_dataflow, y_behavioral;

    // Instantiate the gate-level OR gate
    or_gate_gate_level U1 (.a(a), .b(b), .y(y_gate));

    // Instantiate the dataflow OR gate
    or_gate_dataflow U2 (.a(a), .b(b), .y(y_dataflow));

    // Instantiate the behavioral OR gate
    or_gate_behavioral U3 (.a(a), .b(b), .y(y_behavioral));

    initial begin
        $monitor("Time=%0t | a=%b b=%b | gate=%b dataflow=%b behavioral=%b",
                 $time, a, b, y_gate, y_dataflow, y_behavioral);

        // Apply all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule

