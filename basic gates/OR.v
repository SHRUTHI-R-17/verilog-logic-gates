//DATAFLOW MODELLING

module or_gate(
input A,
input B,
output out_or);
assign out_or = A | B;
endmodule

//BEHAVIORAL MODELLING

module or_gate(
input A,
input B,
output reg out_or);
always@(*)
  out_or = A | B;
endmodule

//STRUCTURAL MODELLING

module or_gate(
input A,
input B,
output out_or);
or o1(out_or,A,B);
endmodule

//OR GATE TESTBENCH

module or_tb;
reg A,B;
wire out_or;
or_gate dut(.A(A),.B(B),.out_or(out_or));
initial begin
$display("OR GATE TRUTH TABLE");
$monitor("A : %b B : %b     OUT : %b ",A,B,out_or);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("or_gate.vcd");
  $dumpvars(0,or_tb);
end
endmodule
