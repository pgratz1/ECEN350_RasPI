`timescale 1ns / 1ps

`define SIZE 1024

module DataMemory(ReadData , Address , WriteData , MemoryRead , MemoryWrite , Clock);
   input [63:0]      WriteData;
   input [63:0]      Address;
   input             Clock, MemoryRead, MemoryWrite;
   output reg [63:0] ReadData;

   reg [7:0] 	     memBank [`SIZE-1:0];


   // This task is used to write arbitrary data to the Data Memory by
   // the intialization block.
   task initset;
      input [63:0] addr;
      input [63:0] data;
      begin
	 memBank[addr] =  data[63:56] ; // Big-endian for the win...
	 memBank[addr+1] =  data[55:48];
	 memBank[addr+2] =  data[47:40];
	 memBank[addr+3] =  data[39:32];
	 memBank[addr+4] =  data[31:24];
	 memBank[addr+5] =  data[23:16];
	 memBank[addr+6] =  data[15:8];
	 memBank[addr+7] =  data[7:0];
      end
   endtask


   initial
     begin
        // preseting some data in the data memory used by test #1

        // Address 0x0 gets 0x1
        initset( 64'h0,  64'h1);  //Counter variable
        initset( 64'h8,  64'ha);  //Part of mask
        initset( 64'h10, 64'h5);  //Other part of mask
        initset( 64'h18, 64'h0ffbea7deadbeeff); //big constant
        initset( 64'h20, 64'h0); //clearing space

        // Add any data you need for your tests here.

     end

   // This always block reads the data memory and places a double word
   // on the ReadData bus.
   always @(posedge Clock)
     begin
        if(MemoryRead)
          begin
             ReadData[63:56] <=  memBank[Address];
             ReadData[55:48] <=  memBank[Address+1];
             ReadData[47:40] <=  memBank[Address+2];
             ReadData[39:32] <=  memBank[Address+3];
             ReadData[31:24] <=  memBank[Address+4];
             ReadData[23:16] <=  memBank[Address+5];
             ReadData[15:8] <=  memBank[Address+6];
             ReadData[7:0] <=  memBank[Address+7];
          end
     end

   // This always block takes data from the WriteData bus and writes
   // it into the DataMemory.
   always @(posedge Clock)
     begin
        if(MemoryWrite)
          begin
             memBank[Address] <= #3 WriteData[63:56] ;
             memBank[Address+1] <= #3 WriteData[55:48];
             memBank[Address+2] <= #3 WriteData[47:40];
             memBank[Address+3] <= #3 WriteData[39:32];
             memBank[Address+4] <= #3 WriteData[31:24];
             memBank[Address+5] <= #3 WriteData[23:16];
             memBank[Address+6] <= #3 WriteData[15:8];
             memBank[Address+7] <= #3 WriteData[7:0];
             // Could be useful for debugging:
             // $display("Writing Address:%h Data:%h",Address, WriteData);
          end
     end
endmodule
