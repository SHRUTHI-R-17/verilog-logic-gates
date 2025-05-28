//DATAFLOW MODELLING

module xor_gate(
input A,
input B,
output out_xor);
assign out_xor = A ^ B;
endmodule

//BEHAVIORAL MODELLING

module xor_gate(
input A,
input B,
output reg out_xor);
always@(*)
  out_xor = A ^ B;
endmodule

//STRUCTURAL MODELLING

module xor_gate(
input A,
input B,
output out_xor);
  xor a1(out_xor,A,B);
endmodule

//XOR GATE TESTBENCH

module xor_tb;
reg A,B;
wire out_xor;
  xor_gate dut(.A(A),.B(B),.out_xor(out_xor));
initial begin
  $display("XOR GATE TRUTH TABLE");
  $monitor("A : %b B : %b     OUT : %b ",A,B,out_xor);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
  $dumpfile("xor_gate.vcd");
  $dumpvars(0,xor_tb);
end
endmodule
