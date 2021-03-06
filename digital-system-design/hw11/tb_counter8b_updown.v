`include "counter8b_updown.v"
module tb_counter8b_updown();
	// define signals
	reg clk=1'b0;
	wire [7:0] count;
	reg dir, reset;	
	// create clock
	always #1 clk = ~clk;
	//initial module
	initial begin
		dir = 1;
		reset = 0;
		#3 reset = 1;
		#1 reset = 0;
		#20 dir = 0;
		#20 $stop;
	end	 
	//example of counter8b_updown
	counter8b_updown example(count, clk, reset, dir);
	// monitor the process
	initial $monitor("it's at time %d, count=%b, reset=%b, dir=%b",
		$time, count, reset, dir);	
endmodule 

