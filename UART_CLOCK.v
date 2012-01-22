`timescale 1ns / 1ps

   //////////////////////////////////////////////////////////////////////////////////
//
// Wirtualny komponent syntezera DDFS dla portu szeregowego
//
// (C) 2009 Zbigniew Hajduk
// http://zh.prz-rzeszow.pl
// e-mail: zhajduk@prz-rzeszow.pl
//
// Ten kod �r�d�owy mo�e podlega� wolnej redystrybucji i/lub modyfikacjom 
// na og�lnych zasadach okre�lonych licencj� GNU General Public License.
//
// Autor wyra�a nadziej�, �e kod wirtualnego komponentu b�dzie u�yteczny
// jednak nie udziela �ADNEJ GWARANCJI dotycz�cej jego sprawno�ci
// oraz przydatno�ci dla partykularnych zastosowa�.
//
////////////////////////////////////////////////////////////////////////////////// 


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:10 01/14/2012 
// Design Name: 
// Module Name:    UART_CLOCK 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UART_CLOCK #(parameter K=1, N=1)
	(
	input RST,
   input CLK,
   output CLK_RX,
   output CLK_TX
   );


reg [N-1:0] acc = 0;
reg [3:0] cnt = 0;
reg clk_1_16 = 0;

/*
always @(posedge CLK)
	begin
	if(RST)
		begin
		acc = 0;
		cnt = 0;
		clk_1_16 = 0;
		end
	end
*/

always @(posedge CLK) acc<=acc+K; //(1)
assign CLK_RX=acc[N-1];

always @(posedge CLK_RX) //(2)
 if(cnt<4'd7) cnt<=cnt+1;
 else
 begin cnt<=0; clk_1_16<=~clk_1_16; end
 
assign CLK_TX=clk_1_16;

endmodule
