//DATAFLOW MODELLING

module and_gate(
input A,
input B,
output out_and);
assign out_and = A & B;
endmodule

//BEHAVIORAL MODELLING

module and_gate(
input A,
input B,
output reg out_and);
always@(*)
  out_and = A & B;
endmodule

//STRUCTURAL MODELLING

module and_gate(
input A,
input B,
output out_and);
and a1(out_and,A,B);
endmodule

//AND GATE TESTBENCH

module and_tb;
reg A,B;
wire out_and;
and_gate dut(.A(A),.B(B),.out_and(out_and));
initial begin
$display("AND GATE TRUTH TABLE");
$monitor("A : %b B : %b     OUT : %b ",A,B,out_and);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("and_gate.vcd");
$dumpvars(0,and_tb);
end
endmodule
