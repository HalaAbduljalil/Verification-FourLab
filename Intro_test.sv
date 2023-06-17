`timescale 1ns/1ns

module testbench;
logic ClkStim=0, ClrStim=0, ModeStim=0, InStim; 
wire OutStim;
logic  Astim, Bstim, Cstim, Dstim;
wire Xwatch, Ywatch, Zwatch;
Intro_Top Top1 ( .X(Xwatch), .Y(Ywatch), .Z(Zwatch), .ScanOut(OutStim), .A(Astim),  .B(Bstim),  .C(Cstim), .D(Dstim), .ScanMode(ModeStim), .ScanIn(InStim), .ScanClr(ClrStim), .ScanClk(ClkStim)
  );
  
reg i; 
initial
begin
for(i=0;i<1000;i=i+1)
#25 ClkStim <= ~ClkStim;		
end	

initial
begin
ModeStim = 0;
$monitor($time, "     A=%b, B=%b, C=%b, D=%b, X=%b, Y=%b, Z=%b", Astim, Bstim, Cstim, Dstim, Xwatch, Ywatch, Zwatch);
  

#1  Astim = 1'b0;  
#1  Bstim = 1'b0;
#1  Cstim = 1'b0;
#1  Dstim = 1'b0;
#50 Astim = 1'b1;
#50 Bstim = 1'b1;
#50 Cstim = 1'b1;
#50 Dstim = 1'b1;
#50 Bstim = 1'b0;
#50 Dstim = 1'b0;
#50 Dstim = 1'b1;
#50 Astim = 1'b0;
#50 Cstim = 1'b0;
#50 Dstim = 1'b0;
#50 $finish;       
    
end 
initial
begin
       
       
ModeStim = 1'b1;
@(posedge ClkStim)
       
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;       
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
       
ClrStim = 1'b1;
@(posedge ClkStim);
$display("              --> Clearing Flip Flips");
       
ClrStim = 1'b0;
@(posedge ClkStim);
       
       
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b1;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); InStim = 1'b0;    
       
       
              
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
       
                     
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
       
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim); 
@(posedge ClkStim) $display($time, "    InStim=%b, ScanOut=%b", InStim ,OutStim);                                    
       
$finish;
end
   
   
   
endmodule      
