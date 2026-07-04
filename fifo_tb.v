`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 19:16:01
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module fifo_tb;

parameter datawidth = 32;
parameter addr_width = 3;
parameter depth = 8;

reg clk;
reg reset;
reg write_enable;
reg read_enable;
reg [datawidth-1:0] data_in;

wire [datawidth-1:0] data_out;
wire full;
wire empty;


fifo uut(

    .clk(clk),
    .reset(reset),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)

);

always #5 
    clk = ~clk;

initial
begin

$monitor("Time=%0t | WE=%b RE=%b | DATAIN=%0d DATAOUT=%0d | WP=%0d RP=%0d COUNT=%0d | FULL=%b EMPTY=%b",

$time,
write_enable,
read_enable,
data_in,
data_out,
uut.write_ptr,
uut.read_ptr,
uut.count,
full,
empty);

end

initial
begin

    clk = 0;
    reset = 1;
    write_enable = 0;
    read_enable = 0;
    data_in = 0;

    // Reset FIFO
   
    #10;
    reset = 0;

    // Write 5
  
    write_enable = 1;
    data_in = 5;
    #10;
    // Write 10

    data_in =10;
    #10;

    // Write 30
    data_in = 30;
    #10;

    write_enable = 0;

    // Read First Data
  

    read_enable = 1;
    #10;

    // Read Second Data
 
    #10;

    read_enable = 0;

    // Simultaneous Read & Write
 

    write_enable = 1;
    read_enable = 1;
    data_in = 40;
    #10;

    write_enable = 0;
    read_enable = 0;

   
    // Fill FIFO
  

    write_enable = 1;

    data_in = 50;
    #10;

    data_in = 60;
    #10;

    data_in = 70;
    #10;

    data_in = 80;
    #10;

    data_in = 90;
    #10;

    data_in = 100;
    #10;
    
    data_in = 110;
    #10;

    write_enable = 0;

    // Empty FIFO
   

    read_enable = 1;

    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;
    #10;

    read_enable = 0;
    #10;

    $finish;

end

endmodule
