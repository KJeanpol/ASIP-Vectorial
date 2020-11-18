//`timescale 1ns / 1ps
module TestBenchHazardUnit();

    logic [3:0] RA1E;
    logic [3:0] RA2E;
    logic [3:0] WA3M;
    logic [3:0] WA3W;
    logic RegWriteM;
    logic RegWriteW;
    logic [1:0] ForwardAE;
    logic [1:0] ForwardBE;
    logic [3:0] RA1D;
    logic [3:0] RA2D;
    logic [3:0] WA3E;
    logic MemtoRegE;
    logic StallF;
    logic StallD;
    logic FlushE;
	 logic FlushD;
	 


	HazardUnit  hazardunit(RA1E,RA2E,WA3M,WA3W,RegWriteM,RegWriteW, ForwardAE,ForwardBE,RA1D,RA2D,WA3E,MemtoRegE,StallF,StallD,FlushE,FlushD);
	 
	initial begin 

    //SrcA
	 
    //Caso 1 
    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    RegWriteW = 0;
    #5; 

    if(ForwardAE == 2'b10) begin
           $display("Caso 1 Exitoso");
            
    end 
    else begin 
           $display("Caso 2 Falló");
            
    end

    //Case 2
    RA1E = 4'b01;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 0;
    RegWriteW = 1;
    #5; 

    if(ForwardAE == 2'b01) begin
            $display("Caso 2 exitoso");
            
    end 
    else begin 
            $display("Caso 2 falló con éxito xD");
            
    end

    //Case 3 
    RA1E = 4'b1;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    RegWriteW = 0;
    #5; 

    if(ForwardAE == 2'b00) begin
            $display("Caso 3 Exitoso");
           
    end 
    else begin 
            $display("Test Failed");
            
    end

    //Forwarding SrcB

    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    RegWriteW = 0;
    #5; 

     if(ForwardBE == 2'b10) begin
            $display("Fordward succeeded");
            
    end 
    else begin 
            $display("Fordward failed");
            
    end

    RA1E = 4'b0;
    RA2E = 4'b1;
    WA3M = 4'b1;
    WA3W = 4'b0;
    RegWriteM = 1;
    #5; 

    if(ForwardBE == 2'b01) begin
            $display("Fordward succeeded");
           
    end 
    else begin 
            $display("Fordward failed");
            
    end

    RA1E = 4'b0;
    RA2E = 4'b1;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
	 RegWriteW = 0;
    #5; 

    if(ForwardBE == 2'b00) begin
            $display("Fordward succeeded");
    end 
    else begin 
            $display("Test Failed");
    end

    
    end 

endmodule 