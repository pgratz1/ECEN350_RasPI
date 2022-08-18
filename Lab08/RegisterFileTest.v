`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:13:28 03/03/2009
// Design Name:   RegisterFile
// Module Name:   E:/350/Lab7/RegisterFile/RegisterFileTest.v
// Project Name:  RegisterFile
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module RegisterFileTest_v;


   task passTest;
      input [63:0] actualOut, expectedOut;
      input [`STRLEN*8:0] testType;
      inout [7:0] 	  passed;
      
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
   reg [63:0] 	  BusW;
   reg [4:0] 	  RA;
   reg [4:0] 	  RB;
   reg [4:0] 	  RW;
   reg 		  RegWr;
   reg 		  Clk;
   reg [7:0] 	  passed;

   // Outputs
   wire [63:0] 	  BusA;
   wire [63:0] 	  BusB;

   // Instantiate the Unit Under Test (UUT)
   RegisterFile uut (
		     .BusA(BusA), 
		     .BusB(BusB), 
		     .BusW(BusW), 
		     .RA(RA), 
		     .RB(RB), 
		     .RW(RW), 
		     .RegWr(RegWr), 
		     .Clk(Clk)
		     );

   initial begin
      // Initialize Inputs
      BusW = 0;
      RA = 0;
      RB = 0;
      RW = 0;
      RegWr = 0;
      Clk = 1;
      passed = 0;
      
      #10;

      // Add stimulus here
      {RA, RB, RW, BusW, RegWr} = {5'd31, 5'd31, 5'd31, 64'h0, 1'b0};
      #10
	passTest(BusA, 64'd0, "Initial $0 Check 1", passed);
      passTest(BusB, 64'd0, "Initial $0 Check 2", passed);
      #10; Clk = 0; #10; Clk = 1;
      
      {RA, RB, RW, BusW, RegWr} = {5'd31, 5'd31, 5'd31, 64'h12345678, 1'b1};
      passTest(BusA, 64'd0, "Initial $0 Check 3", passed);
      passTest(BusB, 64'd0, "Initial $0 Check 4", passed);
      #10; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd0, "$0 Stays 0 Check 1", passed);
      passTest(BusB, 64'd0, "$0 Stays 0 Check 2", passed);

      // This segment clears all registers
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 64'h0, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd1, 64'h1, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd2, 64'h2, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd3, 64'h3, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd4, 64'h4, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd5, 64'h5, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd6, 64'h6, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd7, 64'h7, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd8, 64'h8, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd9, 64'h9, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd10, 64'd10, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd11, 64'd11, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd12, 64'd12, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd13, 64'd13, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd14, 64'd14, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd15, 64'd15, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd16, 64'd16, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd17, 64'd17, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd18, 64'd18, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd19, 64'd19, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd20, 64'd20, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd21, 64'd21, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd22, 64'd22, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd23, 64'd23, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd24, 64'd24, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd25, 64'd25, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd26, 64'd26, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd27, 64'd27, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd28, 64'd28, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd29, 64'd29, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd30, 64'd30, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd31, 64'd31, 1'b1};#10; Clk = 0; #10; Clk = 1;

      {RA, RB, RW, BusW, RegWr} = {5'd1, 5'd2, 5'd1, 64'h12345678, 1'b1};
      #4;
      passTest(BusA, 64'd1, "Initial Value Check 1", passed);
      passTest(BusB, 64'd2, "Initial Value Check 2", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'h12345678, "Value Updated 1", passed);
      passTest(BusB, 64'd2, "Value Stayed Same 1", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd3, 5'd4, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd3, "Initial Value Check 3", passed);
      passTest(BusB, 64'd4, "Initial Value Check 4", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd3, "Value Not Updated 2", passed);
      passTest(BusB, 64'd4, "Value Stayed Same 2", passed);
      
      {RA, RB, RW, BusW, RegWr} = {5'd5, 5'd6, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd5, "Initial Value Check 5", passed);
      passTest(BusB, 64'd6, "Initial Value Check 6", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd5, "Value Not Updated 3", passed);
      passTest(BusB, 64'd6, "Value Stayed Same 3", passed);
      
      {RA, RB, RW, BusW, RegWr} = {5'd7, 5'd8, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd7, "Initial Value Check 7", passed);
      passTest(BusB, 64'd8, "Initial Value Check 8", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd7, "Value Not Updated 4", passed);
      passTest(BusB, 64'd8, "Value Stayed Same 4", passed);
      
      {RA, RB, RW, BusW, RegWr} = {5'd9, 5'd10, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd9, "Initial Value Check 9", passed);
      passTest(BusB, 64'd10, "Initial Value Check 10", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd9, "Value Not Updated 5", passed);
      passTest(BusB, 64'd10, "Value Stayed Same 5", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd11, 5'd12, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd11, "Initial Value Check 11", passed);
      passTest(BusB, 64'd12, "Initial Value Check 12", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd11, "Value Not Updated 6", passed);
      passTest(BusB, 64'd12, "Value Stayed Same 6", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd13, 5'd14, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd13, "Initial Value Check 13", passed);
      passTest(BusB, 64'd14, "Initial Value Check 14", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd13, "Value Not Updated 7", passed);
      passTest(BusB, 64'd14, "Value Stayed Same 7", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd15, 5'd16, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd15, "Initial Value Check 15", passed);
      passTest(BusB, 64'd16, "Initial Value Check 16", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd15, "Value Not Updated 8", passed);
      passTest(BusB, 64'd16, "Value Stayed Same 8", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd17, 5'd18, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd17, "Initial Value Check 17", passed);
      passTest(BusB, 64'd18, "Initial Value Check 18", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd17, "Value Not Updated 9", passed);
      passTest(BusB, 64'd18, "Value Stayed Same 9", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd19, 5'd20, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd19, "Initial Value Check 19", passed);
      passTest(BusB, 64'd20, "Initial Value Check 20", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd19, "Value Not Updated 10", passed);
      passTest(BusB, 64'd20, "Value Stayed Same 10", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd21, 5'd22, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd21, "Initial Value Check 21", passed);
      passTest(BusB, 64'd22, "Initial Value Check 22", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd21, "Value Not Updated 11", passed);
      passTest(BusB, 64'd22, "Value Stayed Same 11", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd23, 5'd24, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd23, "Initial Value Check 23", passed);
      passTest(BusB, 64'd24, "Initial Value Check 24", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd23, "Value Not Updated 12", passed);
      passTest(BusB, 64'd24, "Value Stayed Same 12", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd25, 5'd26, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd25, "Initial Value Check 25", passed);
      passTest(BusB, 64'd26, "Initial Value Check 26", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd25, "Value Not Updated 13", passed);
      passTest(BusB, 64'd26, "Value Stayed Same 13", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd27, 5'd28, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd27, "Initial Value Check 27", passed);
      passTest(BusB, 64'd28, "Initial Value Check 28", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd27, "Value Not Updated 14", passed);
      passTest(BusB, 64'd28, "Value Stayed Same 14", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd29, 5'd30, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd29, "Initial Value Check 29", passed);
      passTest(BusB, 64'd30, "Initial Value Check 30", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd29, "Value Not Updated 15", passed);
      passTest(BusB, 64'd30, "Value Stayed Same 15", passed);

      {RA, RB, RW, BusW, RegWr} = {5'd31, 5'd31, 5'd3, 64'h12345678, 1'b0};
      #4;
      passTest(BusA, 64'd0, "Initial Value Check 31", passed);
      #6; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd0, "Value Not Updated 16", passed);

      allPassed(passed, 68);
   end
   
endmodule

