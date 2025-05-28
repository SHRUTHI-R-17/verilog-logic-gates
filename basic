//DATAFLOW MODELLING

module xnor_gate(
input A,
input B,
output out_xnor);
assign out_xnor = ~(A ^ B);
endmodule

//BEHAVIORAL MODELLING

module xnor_gate(
input A,
input B,
output reg out_xnor);
always@(*)
out_xnor = ~(A ^ B);
endmodule

//STRUCTURAL MODELLING

module xnor_gate(
input A,
input B,
output out_xnor);
xnor a1(out_xnor,A,B);
endmodule

//XNOR GATE TESTBENCH

module xnor_tb;
reg A,B;
wire out_xnor;
xnor_gate dut(.A(A),.B(B),.out_xnor(out_xnor));
initial begin
$display("XNOR GATE TRUTH TABLE");
$monitor("A : %b B : %b     OUT : %b ",A,B,out_xnor);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("xnor_gate.vcd");
  $dumpvars(0,xnor_tb);
end
endmodule
