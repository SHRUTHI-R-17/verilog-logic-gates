// NOT gate - Gate Level Modeling
module not_gate_gate_level (
    input a,
    output y
);
    not G1 (y, a);
endmodule

// NOT gate - Dataflow Modeling
module not_gate_dataflow (
    input a,
    output y
);
    assign y = ~a;
endmodule

// NOT gate - Behavioral Modeling
module not_gate_behavioral (
    input a,
    output reg y
);
    always @(*) begin
        if (a == 0)
            y = 1;
        else
            y = 0;
    end
endmodule


// Testbench for all NOT gate models
module tb_not_gate;

    reg a;
    wire y_gate, y_dataflow, y_behavioral;

    // Instantiate the gate-level NOT gate
    not_gate_gate_level U1 (.a(a), .y(y_gate));

    // Instantiate the dataflow NOT gate
    not_gate_dataflow U2 (.a(a), .y(y_dataflow));

    // Instantiate the behavioral NOT gate
    not_gate_behavioral U3 (.a(a), .y(y_behavioral));

    initial begin
        $monitor("Time=%0t | a=%b | Gate-Level=%b Dataflow=%b Behavioral=%b",
                 $time, a, y_gate, y_dataflow, y_behavioral);

        // Test both input values
        a = 0; #10;
        a = 1; #10;

        $finish;
    end

endmodule
