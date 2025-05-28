// NAND gate - Gate Level Modeling
module nand_gate_gate_level (
    input a, b,
    output y
);
    nand G1 (y, a, b);
endmodule

// NAND gate - Dataflow Modeling
module nand_gate_dataflow (
    input a, b,
    output y
);
    assign y = ~(a & b);
endmodule

// NAND gate - Behavioral Modeling
module nand_gate_behavioral (
    input a, b,
    output reg y
);
    always @(*) begin
        if (a == 1 && b == 1)
            y = 0;
        else
            y = 1;
    end
endmodule


// Testbench for all NAND gate models
module tb_nand_gate;

    reg a, b;
    wire y_gate, y_dataflow, y_behavioral;

    // Instantiate the gate-level NAND gate
    nand_gate_gate_level U1 (.a(a), .b(b), .y(y_gate));

    // Instantiate the dataflow NAND gate
    nand_gate_dataflow U2 (.a(a), .b(b), .y(y_dataflow));

    // Instantiate the behavioral NAND gate
    nand_gate_behavioral U3 (.a(a), .b(b), .y(y_behavioral));

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
