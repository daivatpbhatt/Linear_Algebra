`timescale 1ns / 1ps
/*
	********LINEAR ALGEBRA*********

	NAME : DAIVAT BHATT
	ROLL NUMBER: 201501023
	TESTBENCH TO CALCULATE INVERSE
*/


module inverse_matrix_LA_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] address;

	// Outputs
	wire [31:0] identity11;
	wire [31:0] identity12;
	wire [31:0] identity13;
	wire [31:0] identity14;
	wire [31:0] identity15;
	wire [31:0] identity21;
	wire [31:0] identity22;
	wire [31:0] identity23;
	wire [31:0] identity24;
	wire [31:0] identity25;
	wire [31:0] identity31;
	wire [31:0] identity32;
	wire [31:0] identity33;
	wire [31:0] identity34;
	wire [31:0] identity35;
	wire [31:0] identity41;
	wire [31:0] identity42;
	wire [31:0] identity43;
	wire [31:0] identity44;
	wire [31:0] identity45;
	wire [31:0] identity51;
	wire [31:0] identity52;
	wire [31:0] identity53;
	wire [31:0] identity54;
	wire [31:0] identity55;
	
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	inverse_matrix_LA uut (
		.clk(clk), 
		.address(address),
		.data_out(data_out),
		.reset(reset),
		.identity11(identity11), 
		.identity12(identity12), 
		.identity13(identity13), 
		.identity14(identity14), 
		.identity15(identity15), 
		.identity21(identity21), 
		.identity22(identity22), 
		.identity23(identity23), 
		.identity24(identity24), 
		.identity25(identity25), 
		.identity31(identity31), 
		.identity32(identity32), 
		.identity33(identity33), 
		.identity34(identity34), 
		.identity35(identity35), 
		.identity41(identity41), 
		.identity42(identity42), 
		.identity43(identity43), 
		.identity44(identity44), 
		.identity45(identity45), 
		.identity51(identity51), 
		.identity52(identity52), 
		.identity53(identity53), 
		.identity54(identity54), 
		.identity55(identity55)
	);
	
	always #100 clk = ~clk;

	initial 
	begin
		clk = 0;
		reset=0;
		
		#50;
		address = 5'd0;
		
		#200;
		address = 5'd1;
		
		#200;
		address = 5'd2;
		
		#200;
		address = 5'd3;
		
		#200;
		address = 5'd4;
		
		#200;
		address = 5'd5;
		
		#200;
		address = 5'd6;
		
		#200;
		address = 5'd7;
		
		#200;
		address = 5'd8;
		#200;
		address = 5'd9;
		#200;
		address = 5'd10;
		#200;
		address = 5'd11;
		#200;
		address = 5'd12;
		
		#200;
		address = 5'd13;
		
		#200;
		address = 5'd14;
		
		#200;
		address = 5'd15;
		
		#200;
		address = 5'd16;
		
		#200;
		address = 5'd17;
	
		#200;
		address = 5'd18;
		
		#200;
		address = 5'd19;
		
		#200;
		address = 5'd20;
		
		#200;
		address = 5'd21;
		
		#200;
		address = 5'd22;
		
		#200;
		address = 5'd23;
		
		#200;
		address = 5'd24;
		
		#200;
		address = 5'd25;
		
		#200;
		reset=1'b1;
		#200;
		
		reset=1'b0;

	end
      
endmodule
