`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:10 03/02/2009
// Design Name:   HalfAdd
// Module Name:   E:/350/Lab6/HalfAdd/HalfAddTest.v
// Project Name:  HalfAdd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HalfAdd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 15
module HalfAddTest_v;

   task passTest;
      input [1:0] actualOut, expectedOut;
      input [`STRLEN*8:0] testType;
      inout [7:0]         passed;
      
      if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
      else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
   endtask
   
   task allPassed;
      input [7:0] passed;
      input [7:0] numTests;
      
      if(passed == numTests) $display ("All tests passed");
      else $display("Some tests failed");
   endtask

   // Inputs
   reg            A;
   reg            B;
   reg [7:0]      passed;

   // Outputs
   wire           Cout;
   wire           Sum;

   // Instantiate the Device Under Test (DUT)
   HalfAdd dut (
		.Cout(Cout), 
		.Sum(Sum), 
		.A(A), 
		.B(B)
	        );

   initial begin
      // Initialize Inputs
      A = 0;
      B = 0;
      passed = 0;

      // Add stimulus here
      #90; A=0;B=0; #10; passTest({Cout, Sum}, 0, "0+0", passed);
      #90; A=0;B=1; #10; passTest({Cout, Sum}, 1, "0+1", passed);
      #90; A=1;B=0; #10; passTest({Cout, Sum}, 1, "1+0", passed);
      #90; A=1;B=1; #10; passTest({Cout, Sum}, 2, "1+1", passed);
      #90;
      
      allPassed(passed, 4);

   end
   
endmodule

