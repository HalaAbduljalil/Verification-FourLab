`timescale 1ns/1ns
module DFFC (output logic Q,input clk,clr,D);
  always@(posedge clk, posedge clr)
    begin
      if(clr==1)
        Q <= 1'b0;
      else
        Q <= D;
    end
endmodule

module Intro_Topp1 (output X, Y, Z,
                  input A, B, C, D, ScanMode, ScanIn, ScanClr, ScanClk);
wire ab, bc, q, qn;               
wire toInputCombo_A,toInputCombo_B,toInputCombo_C,toInputCombo_D;
wire toOutputCombo_X,toOutputCombo_Y,toOutputCombo_Z; 

assign #1 toOutputCombo_Z = ~qn; 
 
DFFC Ain_FF(.Q(toInputCombo_A), .D(A),.clk(ScanClk),.clr(ScanClr));
DFFC Bin_FF(.Q(toInputCombo_B), .D(B),.clk(ScanClk),.clr(ScanClr));
DFFC Cin_FF(.Q(toInputCombo_C), .D(C),.clk(ScanClk),.clr(ScanClr));
DFFC Din_FF(.Q(toInputCombo_D), .D(D),.clk(ScanClk),.clr(ScanClr));



AndOr InputCombo  (.X(ab), .Y(bc), .A(toInputCombo_A), .B(toInputCombo_B), .C(toInputCombo_C));
SR SRLatch     (.Q(q), .Qn(qn), .S(bc), .R(toInputCombo_D));
XorNor OutputCombo (.X(toOutputCombo_X), .Y(toOutputCombo_Y), .A(ab), .B(q), .C(qn));


DFFC Xout_FF(.Q(X),.D(toOutputCombo_X),.clk(ScanClk),.clr(ScanClr));
DFFC Yout_FF(.Q(Y),.D(toOutputCombo_Y),.clk(ScanClk),.clr(ScanClr));
DFFC Zout_FF(.Q(Z),.D(toOutputCombo_Z),.clk(ScanClk),.clr(ScanClr));   
endmodule                