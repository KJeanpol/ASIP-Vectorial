module HazardUnit(
    //Forwarding input/output
    input logic [3:0] RA1E,
    input logic [3:0] RA2E,
    input logic [3:0] WA3M,
    input logic [3:0] WA3W,
    input logic RegWriteM,
    input logic RegWriteW,
    output logic [1:0] ForwardAE,
    output logic [1:0] ForwardBE,
    //Stall input/output LDR
    input logic [3:0] RA1D,
    input logic [3:0] RA2D,
    input logic [3:0] WA3E,
    input logic MemtoRegE,
    output logic StallF,
    output logic StallD,
    output logic FlushE//,
    //output logic FlushD
);

//Initial Values
logic LDRstall = 0;
//Forwarding SrcA
always_comb
  if((RA1E == WA3M) && RegWriteM) 
    ForwardAE = 2'b10; // SrcAE = ALUOutM
    
  else if ((RA1E == WA3W) && RegWriteW) 
    ForwardAE = 2'b01; // SrcAE = ResultW
    
  else
    ForwardAE = 2'b00; // SrcAE from regfile

//Forwarding SrcB
always_comb
  if((RA2E == WA3M) && RegWriteM) 
    ForwardBE = 2'b10; // SrcBE = ALUOutM
    
  else if ((RA2E == WA3W) && RegWriteW) 
    ForwardBE = 2'b01; // SrcBE = ResultW
    
  else
    ForwardBE = 2'b00; // SrcBE from regfile
    
//Stalling
always_comb begin
  LDRstall = ((((RA1D == WA3E) && RA1D!=4'b0) || ((RA2D == WA3E) && RA2D!=4'b0)) && MemtoRegE);
  StallF = LDRstall;
  StallD = LDRstall;
  FlushE = LDRstall;
  //FlushD = LDRstall;
  end
  
endmodule