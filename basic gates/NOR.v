//DATAFLOW MODELLING

module nor_gate(
input A,
input B,
output out_nor);
assign out_nor = ~(A | B);
endmodule

//BEHAVIORAL MODELLING

module nor_gate(
input A,
input B,
output reg out_nor);
always@(*)
  out_nor = ~(A | B);
endmodule

//STRUCTURAL MODELLING

module nor_gate(
input A,
input B,
output out_nor);
nor o1(out_nor,A,B);
endmodule

//NOR GATE TESTBENCH

module nor_tb;
reg A,B;
wire out_nor;
nor_gate dut(.A(A),.B(B),.out_nor(out_nor));
initial begin
$display("NOR GATE TRUTH TABLE");
$monitor("A : %b B : %b     OUT : %b ",A,B,out_nor);
A = 0 ; B = 0 ; #10 ;
A = 0 ; B = 1 ; #10 ;
A = 1 ; B = 0 ; #10 ;
A = 1 ; B = 1 ; #10 ;
$finish;
end
//TO VIEW WAVEFORMS
initial begin
$dumpfile("nor_gate.vcd");
  $dumpvars(0,nor_tb);
end
endmodule
