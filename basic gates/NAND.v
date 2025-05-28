//DATAFLOW MODELLING

module nand_gate(
input A,
input B,
output out_nand);
  assign out_nand = ~(A & B);
endmodule

//BEHAVIORAL MODELLING

module nand_gate(
input A,
input B,
output reg out_nand);
always@(*)
  out_nand = ~(A & B);
endmodule

//STRUCTURAL MODELLING

module nand_gate(
input A,
input B,
output out_nand);
nand a1(out_nand,A,B);
endmodule

//NAND GATE TESTBENCH

module nand_tb;
reg A,B;
wire out_nand;
  nand_gate dut(.A(A),.B(B),.out_nand(out_nand));
initial begin
$display("NAND GATE TRUTH TABLE");
$monitor("A : %b B : %b     OUT : %b ",A,B,out_nand);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("nand_gate.vcd");
$dumpvars(0,nand_tb);
end
endmodule
