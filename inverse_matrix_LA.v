`timescale 1ns / 1ps

/*
	********LINEAR ALGEBRA*********

	NAME : DAIVAT BHATT
	ROLL NUMBER: 201501023
	MODULE TO CALCULATE INVERSE
*/


module inverse_matrix_LA(clk, reset, data_out, address, identity11,identity12,identity13,identity14,identity15,identity21,identity22,identity23,identity24,identity25,identity31,identity32,identity33,identity34,identity35,identity41,identity42,identity43,identity44,identity45,identity51,identity52,identity53,identity54,identity55);

output reg [31:0] identity11,identity12,identity13,identity14,identity15;
output reg [31:0] identity21,identity22,identity23,identity24,identity25;
output reg [31:0] identity31,identity32,identity33,identity34,identity35;
output reg [31:0] identity41,identity42,identity43,identity44,identity45;
output reg [31:0] identity51,identity52,identity53,identity54,identity55;

reg [31:0] matrix[0:25];
reg [31:0] inverse[0:24];

output [31:0] data_out;

input reset;
input [4:0] address;

reg [31:0] data_in11,data_in12,data_in13,data_in14,data_in15;
reg [31:0] data_in21,data_in22,data_in23,data_in24,data_in25;
reg [31:0] data_in31,data_in32,data_in33,data_in34,data_in35;
reg [31:0] data_in41,data_in42,data_in43,data_in44,data_in45;
reg [31:0] data_in51,data_in52,data_in53,data_in54,data_in55;
input clk;


reg [31:0] identity11t = 32'd1;
reg [31:0] identity12t = 32'd0;
reg [31:0] identity13t = 32'd0;
reg [31:0] identity14t = 32'd0;
reg [31:0] identity15t = 32'd0;

reg [31:0] identity21t = 32'd0;
reg [31:0] identity22t = 32'd1;
reg [31:0] identity23t = 32'd0;
reg [31:0] identity24t = 32'd0;
reg [31:0] identity25t = 32'd0;

reg [31:0] identity31t = 32'd0;
reg [31:0] identity32t = 32'd0;
reg [31:0] identity33t = 32'd1;
reg [31:0] identity34t = 32'd0;
reg [31:0] identity35t = 32'd0;

reg [31:0] identity41t = 32'd0;
reg [31:0] identity42t = 32'd0;
reg [31:0] identity43t = 32'd0;
reg [31:0] identity44t = 32'd1;
reg [31:0] identity45t = 32'd0;

reg [31:0] identity51t = 32'd0;
reg [31:0] identity52t = 32'd0;
reg [31:0] identity53t = 32'd0;
reg [31:0] identity54t = 32'd0;
reg [31:0] identity55t = 32'd1;

reg [31:0] answer_temp11,answer_temp12,answer_temp13,answer_temp14,answer_temp15,answer_temp21,answer_temp22,answer_temp23,answer_temp24,answer_temp25,answer_temp31,answer_temp32,answer_temp33,answer_temp34,answer_temp35,answer_temp41,answer_temp42,answer_temp43,answer_temp44,answer_temp45,answer_temp51,answer_temp52,answer_temp53,answer_temp54,answer_temp55;

reg [31:0] x;
reg [31:0] y;

matrix_ROM set_value (
  .clka(clk), // input clka
  .addra(address), // input [4 : 0] addra
  .douta(data_out) // output [31 : 0] douta
);


always@(posedge clk)
begin

	if(reset==1'b0)
	begin
		matrix[address] <= data_out;
	end

	else
		begin

		data_in11 = matrix[1];
		data_in12 = matrix[2];
		data_in13 = matrix[3];
		data_in14 = matrix[4];
		data_in15 = matrix[5];

		data_in21 = matrix[6];
		data_in22 = matrix[7];
		data_in23 = matrix[8];
		data_in24 = matrix[9];
		data_in25 = matrix[10];

		data_in31 = matrix[11];
		data_in32= matrix[12];
		data_in33= matrix[13];
		data_in34 = matrix[14];
		data_in35 = matrix[15];

		data_in41 = matrix[16];
		data_in42 =  matrix[17];
		data_in43 = matrix[18];
		data_in44 = matrix[19];
		data_in45 = matrix[20];

		data_in51 = matrix[21];
		data_in52 = matrix[22];
		data_in53 = matrix[23];
		data_in54 = matrix[24];
		data_in55 = matrix[25];

		answer_temp11 = (data_in11 > 0 ? data_in11 : (~data_in11+32'd1));
		answer_temp12 = (data_in12 > 0 ? data_in12 : (~data_in12+32'd1));
		answer_temp13 = (data_in13 > 0 ? data_in13 : (~data_in13+32'd1));
		answer_temp14 = (data_in14 > 0 ? data_in14 : (~data_in14+32'd1));
		answer_temp15 = (data_in15 > 0 ? data_in15 : (~data_in15+32'd1));

		answer_temp21 = (data_in21 > 0 ? data_in21 : (~data_in21 + 32'd1));
		answer_temp22 = (data_in22 > 0 ? data_in22 : (~data_in22 + 32'd1));
		answer_temp23 = (data_in23 > 0 ? data_in23 : (~data_in23 + 32'd1));
		answer_temp24 = (data_in24 > 0 ? data_in24 : (~data_in24 + 32'd1));
		answer_temp25 = (data_in25 > 0 ? data_in25 : (~data_in25 + 32'd1));

		answer_temp31 = (data_in31 > 0 ? data_in31 : (~data_in31 + 32'd1));
		answer_temp32 = (data_in32 > 0 ? data_in32 : (~data_in32 + 32'd1));
		answer_temp33 = (data_in33 > 0 ? data_in33 : (~data_in33 + 32'd1));
		answer_temp34 = (data_in34 > 0 ? data_in34 : (~data_in34 + 32'd1));
		answer_temp35 = (data_in35 > 0 ? data_in35 : (~data_in35 + 32'd1));

		answer_temp41 = (data_in41 > 0 ? data_in41 : (~data_in41+32'd1));
		answer_temp42 = (data_in42 > 0 ? data_in42 : (~data_in42+32'd1));
		answer_temp43 = (data_in43 > 0 ? data_in43 : (~data_in43+32'd1));
		answer_temp44 = (data_in44 > 0 ? data_in44 : (~data_in44+32'd1));
		answer_temp45 = (data_in45 > 0 ? data_in45 : (~data_in45+32'd1));

		answer_temp51 = (data_in51 > 0 ? data_in51 : (~data_in51+32'd1));
		answer_temp52 = (data_in52 > 0 ? data_in52 : (~data_in52+32'd1));
		answer_temp53 = (data_in53 > 0 ? data_in53 : (~data_in53+32'd1));
		answer_temp54 = (data_in54 > 0 ? data_in54 : (~data_in54+32'd1));
		answer_temp55 = (data_in55 > 0 ? data_in55 : (~data_in55+32'd1));



		x = answer_temp11;
		y = answer_temp21;

		answer_temp21 = x*answer_temp21 - y*answer_temp11;
		answer_temp22 = x*answer_temp22 - y*answer_temp12;
		answer_temp23 = x*answer_temp23 - y*answer_temp13;
		answer_temp24 = x*answer_temp24 - y*answer_temp14;
		answer_temp25 = x*answer_temp25 - y*answer_temp15;
		identity21t = x*identity21t - y*identity11t;
		identity22t = x*identity22t - y*identity12t;
		identity23t = x*identity23t - y*identity13t;
		identity24t = x*identity24t - y*identity14t;
		identity25t = x*identity25t - y*identity15t;

		x = answer_temp11;
		y = answer_temp31;

		answer_temp31 = x*answer_temp31 - y*answer_temp11;
		answer_temp32 = x*answer_temp32 - y*answer_temp12;
		answer_temp33 = x*answer_temp33 - y*answer_temp13;
		answer_temp34 = x*answer_temp34 - y*answer_temp14;
		answer_temp35 = x*answer_temp35 - y*answer_temp15;
		identity31t = x*identity31t - y*identity11t;
		identity32t = x*identity32t - y*identity12t;
		identity33t = x*identity33t - y*identity13t;
		identity34t = x*identity34t - y*identity14t;
		identity35t = x*identity35t - y*identity15t;

		x = answer_temp11;
		y = answer_temp41;

		answer_temp41 = x*answer_temp41 - y*answer_temp11;
		answer_temp42 = x*answer_temp42 - y*answer_temp12;
		answer_temp43 = x*answer_temp43 - y*answer_temp13;
		answer_temp44 = x*answer_temp44 - y*answer_temp14;
		answer_temp45 = x*answer_temp45 - y*answer_temp15;
		identity41t = x*identity41t - y*identity11t;
		identity42t = x*identity42t - y*identity12t;
		identity43t = x*identity43t - y*identity13t;
		identity44t = x*identity44t - y*identity14t;
		identity45t = x*identity45t - y*identity15t;

		x = answer_temp11;
		y = answer_temp51;

		answer_temp51 = x*answer_temp51 - y*answer_temp11;
		answer_temp52 = x*answer_temp52 - y*answer_temp12;
		answer_temp53 = x*answer_temp53 - y*answer_temp13;
		answer_temp54 = x*answer_temp54 - y*answer_temp14;
		answer_temp55 = x*answer_temp55 - y*answer_temp15;
		identity51t = x*identity51t - y*identity11t;
		identity52t = x*identity52t - y*identity12t;
		identity53t = x*identity53t - y*identity13t;
		identity54t = x*identity54t - y*identity14t;
		identity55t = x*identity55t - y*identity15t;


		/*         */


		x = answer_temp22;
		y = answer_temp12;

		answer_temp11 = x*answer_temp11 - y*answer_temp21;
		answer_temp12 = x*answer_temp12 - y*answer_temp22;
		answer_temp13 = x*answer_temp13 - y*answer_temp23;
		answer_temp14 = x*answer_temp14 - y*answer_temp24;
		answer_temp15 = x*answer_temp15 - y*answer_temp25;
		identity11t = x*identity11t - y*identity21t;
		identity12t = x*identity12t - y*identity22t;
		identity13t = x*identity13t - y*identity23t;
		identity14t = x*identity14t - y*identity24t;
		identity15t = x*identity15t - y*identity25t;

		x = answer_temp22;
		y = answer_temp32;

		answer_temp31 = x*answer_temp31 - y*answer_temp21;
		answer_temp32 = x*answer_temp32 - y*answer_temp22;
		answer_temp33 = x*answer_temp33 - y*answer_temp23;
		answer_temp34 = x*answer_temp34 - y*answer_temp24;
		answer_temp35 = x*answer_temp35 - y*answer_temp25;
		identity31t = x*identity31t - y*identity21t;
		identity32t = x*identity32t - y*identity22t;
		identity33t = x*identity33t - y*identity23t;
		identity34t = x*identity34t - y*identity24t;
		identity35t = x*identity35t - y*identity25t;

		x = answer_temp22;
		y = answer_temp42;

		answer_temp41 = x*answer_temp41 - y*answer_temp21;
		answer_temp42 = x*answer_temp42 - y*answer_temp22;
		answer_temp43 = x*answer_temp43 - y*answer_temp23;
		answer_temp44 = x*answer_temp44 - y*answer_temp24;
		answer_temp45 = x*answer_temp45 - y*answer_temp25;
		identity41t = x*identity41t - y*identity21t;
		identity42t = x*identity42t - y*identity22t;
		identity43t = x*identity43t - y*identity23t;
		identity44t = x*identity44t - y*identity24t;
		identity45t = x*identity45t - y*identity25t;

		x = answer_temp22;
		y = answer_temp52;

		answer_temp51 = x*answer_temp51 - y*answer_temp21;
		answer_temp52 = x*answer_temp52 - y*answer_temp22;
		answer_temp53 = x*answer_temp53 - y*answer_temp23;
		answer_temp54 = x*answer_temp54 - y*answer_temp24;
		answer_temp55 = x*answer_temp55 - y*answer_temp25;
		identity51t = x*identity51t - y*identity21t;
		identity52t = x*identity52t - y*identity22t;
		identity53t = x*identity53t - y*identity23t;
		identity54t = x*identity54t - y*identity24t;
		identity55t = x*identity55t - y*identity25t;


		/*         */


		x = answer_temp33;
		y = answer_temp13;

		answer_temp11 = x*answer_temp11 - y*answer_temp31;
		answer_temp12 = x*answer_temp12 - y*answer_temp32;
		answer_temp13 = x*answer_temp13 - y*answer_temp33;
		answer_temp14 = x*answer_temp14 - y*answer_temp34;
		answer_temp15 = x*answer_temp15 - y*answer_temp35;
		identity11t = x*identity11t - y*identity31t;
		identity12t = x*identity12t - y*identity32t;
		identity13t = x*identity13t - y*identity33t;
		identity14t = x*identity14t - y*identity34t;
		identity15t = x*identity15t - y*identity35t;

		x = answer_temp33;
		y = answer_temp23;

		answer_temp21 = x*answer_temp21 - y*answer_temp31;
		answer_temp22 = x*answer_temp22 - y*answer_temp32;
		answer_temp23 = x*answer_temp23 - y*answer_temp33;
		answer_temp24 = x*answer_temp24 - y*answer_temp34;
		answer_temp25 = x*answer_temp25 - y*answer_temp35;
		identity21t = x*identity21t - y*identity31t;
		identity22t = x*identity22t - y*identity32t;
		identity23t = x*identity23t - y*identity33t;
		identity24t = x*identity24t - y*identity34t;
		identity25t = x*identity25t - y*identity35t;

		x = answer_temp33;
		y = answer_temp43;

		answer_temp41 = x*answer_temp41 - y*answer_temp31;
		answer_temp42 = x*answer_temp42 - y*answer_temp32;
		answer_temp43 = x*answer_temp43 - y*answer_temp33;
		answer_temp44 = x*answer_temp44 - y*answer_temp34;
		answer_temp45 = x*answer_temp45 - y*answer_temp35;
		identity41t = x*identity41t - y*identity31t;
		identity42t = x*identity42t - y*identity32t;
		identity43t = x*identity43t - y*identity33t;
		identity44t = x*identity44t - y*identity34t;
		identity45t = x*identity45t - y*identity35t;

		x = answer_temp33;
		y = answer_temp53;

		answer_temp51 = x*answer_temp51 - y*answer_temp31;
		answer_temp52 = x*answer_temp52 - y*answer_temp32;
		answer_temp53 = x*answer_temp53 - y*answer_temp33;
		answer_temp54 = x*answer_temp54 - y*answer_temp34;
		answer_temp55 = x*answer_temp55 - y*answer_temp35;
		identity51t = x*identity51t - y*identity31t;
		identity52t = x*identity52t - y*identity32t;
		identity53t = x*identity53t - y*identity33t;
		identity54t = x*identity54t - y*identity34t;
		identity55t = x*identity55t - y*identity35t;


		/*         */


		x = answer_temp44;
		y = answer_temp14;

		answer_temp11 = x*answer_temp11 - y*answer_temp41;
		answer_temp12 = x*answer_temp12 - y*answer_temp42;
		answer_temp13 = x*answer_temp13 - y*answer_temp43;
		answer_temp14 = x*answer_temp14 - y*answer_temp44;
		answer_temp15 = x*answer_temp15 - y*answer_temp45;
		identity11t = x*identity11t - y*identity41t;
		identity12t = x*identity12t - y*identity42t;
		identity13t = x*identity13t - y*identity43t;
		identity14t = x*identity14t - y*identity44t;
		identity15t = x*identity15t - y*identity45t;

		x = answer_temp44;
		y = answer_temp24;

		answer_temp21 = x*answer_temp21 - y*answer_temp41;
		answer_temp22 = x*answer_temp22 - y*answer_temp42;
		answer_temp23 = x*answer_temp23 - y*answer_temp43;
		answer_temp24 = x*answer_temp24 - y*answer_temp44;
		answer_temp25 = x*answer_temp25 - y*answer_temp45;
		identity21t = x*identity21t - y*identity41t;
		identity22t = x*identity22t - y*identity42t;
		identity23t = x*identity23t - y*identity43t;
		identity24t = x*identity24t - y*identity44t;
		identity25t = x*identity25t - y*identity45t;

		x = answer_temp44;
		y = answer_temp34;

		answer_temp31 = x*answer_temp31 - y*answer_temp41;
		answer_temp32 = x*answer_temp32 - y*answer_temp42;
		answer_temp33 = x*answer_temp33 - y*answer_temp43;
		answer_temp34 = x*answer_temp34 - y*answer_temp44;
		answer_temp35 = x*answer_temp35 - y*answer_temp45;
		identity31t = x*identity31t - y*identity41t;
		identity32t = x*identity32t - y*identity42t;
		identity33t = x*identity33t - y*identity43t;
		identity34t = x*identity34t - y*identity44t;
		identity35t = x*identity35t - y*identity45t;

		x = answer_temp44;
		y = answer_temp54;

		answer_temp51 = x*answer_temp51 - y*answer_temp41;
		answer_temp52 = x*answer_temp52 - y*answer_temp42;
		answer_temp53 = x*answer_temp53 - y*answer_temp43;
		answer_temp54 = x*answer_temp54 - y*answer_temp44;
		answer_temp55 = x*answer_temp55 - y*answer_temp45;
		identity51t = x*identity51t - y*identity41t;
		identity52t = x*identity52t - y*identity42t;
		identity53t = x*identity53t - y*identity43t;
		identity54t = x*identity54t - y*identity44t;
		identity55t = x*identity55t - y*identity45t;


		/*         */


		x = answer_temp55;
		y = answer_temp15;

		answer_temp11 = x*answer_temp11 - y*answer_temp51;
		answer_temp12 = x*answer_temp12 - y*answer_temp52;
		answer_temp13 = x*answer_temp13 - y*answer_temp53;
		answer_temp14 = x*answer_temp14 - y*answer_temp54;
		answer_temp15 = x*answer_temp15 - y*answer_temp55;
		identity11t = x*identity11t - y*identity51t;
		identity12t = x*identity12t - y*identity52t;
		identity13t = x*identity13t - y*identity53t;
		identity14t = x*identity14t - y*identity54t;
		identity15t = x*identity15t - y*identity55t;

		x = answer_temp55;
		y = answer_temp25;

		answer_temp21 = x*answer_temp21 - y*answer_temp51;
		answer_temp22 = x*answer_temp22 - y*answer_temp52;
		answer_temp23 = x*answer_temp23 - y*answer_temp53;
		answer_temp24 = x*answer_temp24 - y*answer_temp54;
		answer_temp25 = x*answer_temp25 - y*answer_temp55;
		identity21t = x*identity21t - y*identity51t;
		identity22t = x*identity22t - y*identity52t;
		identity23t = x*identity23t - y*identity53t;
		identity24t = x*identity24t - y*identity54t;
		identity25t = x*identity25t - y*identity55t;

		x = answer_temp55;
		y = answer_temp35;

		answer_temp31 = x*answer_temp31 - y*answer_temp51;
		answer_temp32 = x*answer_temp32 - y*answer_temp52;
		answer_temp33 = x*answer_temp33 - y*answer_temp53;
		answer_temp34 = x*answer_temp34 - y*answer_temp54;
		answer_temp35 = x*answer_temp35 - y*answer_temp55;
		identity31t = x*identity31t - y*identity51t;
		identity32t = x*identity32t - y*identity52t;
		identity33t = x*identity33t - y*identity53t;
		identity34t = x*identity34t - y*identity54t;
		identity35t = x*identity35t - y*identity55t;

		x = answer_temp55;
		y = answer_temp45;

		answer_temp41 = x*answer_temp41 - y*answer_temp51;
		answer_temp42 = x*answer_temp42 - y*answer_temp52;
		answer_temp43 = x*answer_temp43 - y*answer_temp53;
		answer_temp44 = x*answer_temp44 - y*answer_temp54;
		answer_temp45 = x*answer_temp45 - y*answer_temp55;
		identity41t = x*identity41t - y*identity51t;
		identity42t = x*identity42t - y*identity52t;
		identity43t = x*identity43t - y*identity53t;
		identity44t = x*identity44t - y*identity54t;
		identity45t = x*identity45t - y*identity55t;



		/*         */




		/*				*/
		if(answer_temp11==32'd0 || answer_temp22 == 32'd0 || answer_temp33 == 32'd0 || answer_temp44==32'd0 || answer_temp55==32'd0)
		begin
			identity11=32'dx;
			identity22=32'dx;
			identity33=32'dx;
			identity44=32'dx;
			identity55=32'dx;
		end

		else
		begin
			identity11 = identity11t;
			identity12 = identity12t;
			identity13 = identity13t;
			identity14 = identity14t;
			identity15 = identity15t;

			identity21 = identity21t;
			identity22 = identity22t;
			identity23 = identity23t;
			identity24 = identity24t;
			identity25 = identity25t;

			identity31 = identity31t;
			identity32 = identity32t;
			identity33 = identity33t;
			identity34 = identity34t;
			identity35 = identity35t;

			identity41 = identity41t;
			identity42 = identity42t;
			identity43 = identity43t;
			identity44 = identity44t;
			identity45 = identity45t;

			identity51 = identity51t;
			identity52 = identity52t;
			identity53 = identity53t;
			identity54 = identity54t;
			identity55 = identity55t;
		end


		inverse[0] = identity11;
		inverse[1] = identity12;
		inverse[2] = identity13;
		inverse[3] = identity14;
		inverse[4] = identity15;

		inverse[5] = identity21;
		inverse[6] = identity22;
		inverse[7] = identity23;
		inverse[8] = identity24;
		inverse[9] = identity25;

		inverse[10] = identity31;
		inverse[11] = identity32;
		inverse[12] = identity33;
		inverse[13] = identity34;
		inverse[14] = identity35;

		inverse[15] = identity41;
		inverse[16] = identity42;
		inverse[17] = identity43;
		inverse[18] = identity44;
		inverse[19] = identity45;

		inverse[20] = identity51;
		inverse[21] = identity52;
		inverse[22] = identity53;
		inverse[23] = identity54;
		inverse[24] = identity55;

		end

end

endmodule