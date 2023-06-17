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

module Intro_Top (output X, Y, Z, ScanOut,
                  input A, B, C, D, ScanMode, ScanIn, ScanClr, ScanClk);
wire ab, bc, q, qn;               
wire toInputCombo_A,toInputCombo_B,toInputCombo_C,toInputCombo_D;
wire toOutputCombo_X,toOutputCombo_Y,toOutputCombo_Z; 

wire ffInA, ffInB, ffInC, ffInD, ffOutA, ffOutB, ffOutC, ffOutD, ffInX, ffInY, ffInZ, ffOutX, ffOutY, ffOutZ; 
// input A
  assign #1 ffInA = (ScanMode) ? ScanIn : A;
  DFFC Ain_FF(.Q(toInputCombo_A), .D(ffInA),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutA = (ScanMode) ? toInputCombo_A : ffInA;
  
  
  // input B
  assign #1 ffInB = (ScanMode) ? toInputCombo_A : B;
  DFFC Bin_FF(.Q(toInputCombo_B), .D(ffInB),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutB = (ScanMode) ? toInputCombo_B : ffInB;
  
  
  // input C
  assign #1 ffInC = (ScanMode) ? toInputCombo_B : C;
  DFFC Cin_FF(.Q(toInputCombo_C), .D(ffInC),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutC = (ScanMode) ? toInputCombo_C : ffInC;
  
  
  // input D
  assign #1 ffInD = (ScanMode) ? toInputCombo_C : D;
  DFFC Din_FF(.Q(toInputCombo_D), .D(ffInD),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutD = (ScanMode) ? toInputCombo_D : ffInD;
   wire dffXout, dffYout, dffZout; 
  
  // output X
  assign #1 ffInX = (ScanMode) ? toInputCombo_D: toOutputCombo_X;
  DFFC Xout_FF(.Q(dffXout),.D(ffInX),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutX = (ScanMode) ? dffXout : ffInX;
  assign X = ffOutX;
  
  
  // output Y
  assign #1 ffInY = (ScanMode) ? dffXout: toOutputCombo_Y;
  DFFC Yout_FF(.Q(dffYout),.D(ffInY),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutY = (ScanMode) ? dffYout : ffInY;
  assign Y = ffOutY;
  
  // output Z
  assign #1 ffInZ = (ScanMode) ? dffYout: toOutputCombo_Z;
  DFFC Zout_FF(.Q(dffZout),.D(ffInZ),.clk(ScanClk),.clr(ScanClr));
  assign #1 ffOutZ = (ScanMode) ? dffZout : ffInZ;
  assign Z = ffOutZ;
  
  assign ScanOut = dffZout;
  

  AndOr InputCombo  (.X(ab), .Y(bc), .A(ffOutA), .B(ffOutB), .C(ffOutC));
  SR SRLatch     (.Q(q), .Qn(qn), .S(bc), .R(ffOutD));
  XorNor OutputCombo (.X(toOutputCombo_X), .Y(toOutputCombo_Y), .A(ab), .B(q), .C(qn));
    


endmodule                