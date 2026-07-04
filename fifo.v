`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 18:38:32
// Design Name: 
// Module Name: fifo
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


module fifo #(

parameter datawidth=32,
parameter addr_width=3,
parameter depth=8
)
(
input clk,
input reset,
input write_enable,
input read_enable,
input  [datawidth-1:0]data_in,

output reg [datawidth-1:0] data_out,
output full,
output empty);

reg [datawidth-1:0] fifo_memory [0:depth-1];

reg [addr_width-1:0]write_ptr;
reg [addr_width-1:0]read_ptr;
reg [addr_width:0]count;

integer i;

always @(posedge clk)

begin
    if(reset)
        begin
            data_out<=0;
            count<=0;
            write_ptr<=0;
            read_ptr<=0;
            
            for(i=0;i<depth;i=i+1)
            
               fifo_memory[i]<=0;
            end
          
     else
     begin
            if(write_enable  && !full)
            begin
                fifo_memory[write_ptr]<=data_in;
                if(write_ptr==depth-1)
                    write_ptr<=0;
                    
                else
                    write_ptr<=write_ptr+1;
             
            end
           
                if(read_enable && !empty)
           begin
               data_out<= fifo_memory[read_ptr];
               if(read_ptr==depth-1)
                read_ptr<=0;
                
               else
                    read_ptr<=read_ptr+1;
             
           end
           
          
                       case ({write_enable && !full , read_enable && !empty}) //2-bit value by concatenating two 1-bit signals//
           
                           2'b10:
                               count <= count + 1;      
           
                           2'b01:
                               count <= count - 1;      
           
                           2'b11:
                               ;     //read and write together//
                                     //count unchanged//     
           
                           default:
                               count <= count;         
           
                       endcase
           
        end
 
  end
  
assign full = (count == depth);
assign empty = (count == 0);

endmodule
           
           
           
           
                    
                    
                    
     
            
            
            

