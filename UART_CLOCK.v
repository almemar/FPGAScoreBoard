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

uart_clk_fsm #(.K(K),.N(N))
	clk(.RST(RST), .CLK(CLK),.CLK_RX(CLK_RX),.CLK_TX(CLK_TX));

endmodule
