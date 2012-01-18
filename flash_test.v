`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:42 01/12/2012 
// Design Name: 
// Module Name:    flash_test 
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
module flash_test(
	input CLK_50MHZ,
	output NF_CE, NF_BYTE, NF_OE, NF_RP, NF_WE, NF_WP,
	input NF_STS,
	inout NF_A[7:0],
	inout NF_D[7:0]
    );
	 
	//output czasomierz_start,
	//input czasomierz_done
	
	reg addr[7:0];
	reg data[7:0];
	reg direction_rw;
	reg do_rw;
	wire done;
	reg rst = 1'b0;
	wire flash_timer_start;
	wire flash_timer_done;
	flash_clock fl_c(CLK_50MHZ, flash_timer_start, flash_timer_done);
	//TODO czasomierz

	flash fl(CLK_50MHZ, NF_CE, NF_BYTE, NF_OE, NF_RP, NF_WE, NF_WP, NF_STS, NF_A[7:0], NF_D[7:0], addr[7:0], data[7:0], direction_rw, do_rw, done, rst, flash_timer_start, flash_timer_done)
;
	
	initial
	begin	
		#20;
		addr[7:0] = 8'b00110101;
		data[7:0] = 8'b11001001;
		direction_rw = 1'b0; //write
		do_rw = 1'b1;
	end
	
endmodule