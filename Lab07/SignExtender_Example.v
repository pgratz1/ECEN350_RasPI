module SignExtender_Example(BusImm, Imm16, Ctrl); 
   output [31:0] BusImm; 
   input [15:0]  Imm16; 
   input 	 Ctrl; 
   
   wire 	 extBit; 
   assign extBit = (Ctrl ? 1'b0 : Imm16[15]); 
   assign BusImm = {{16{extBit}}, Imm16}; 
   
endmodule
