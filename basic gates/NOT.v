//DATAFLOW MODELLING

module not_gate(
input A,
output out_not);
assign out_not = ~A;
endmodule

//BEHAVIORAL MODELLING

module not_gate(
input A,
output reg out_not);
always@(*)
  out_not = ~A;
endmodule

//STRUCTURAL MODELLING

module not_gate(
input A,
output out_not);
not a1(out_not,A,B);
endmodule

//NOT GATE TESTBENCH

module not_tb;
reg A;
wire out_not;
not_gate dut(.A(A),.out_not(out_not));
initial begin
$display("NOT GATE TRUTH TABLE");
$monitor("A : %b     OUT : %b ",A,out_not);
A = 0 ; #10 ;
A = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("not_gate.vcd");
$dumpvars(0,not_tb);
end
endmodule
