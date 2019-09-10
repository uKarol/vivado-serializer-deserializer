`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2019 11:16:05
// Design Name: 
// Module Name: deserializer_core
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


module deserializer_core(
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg [7:0] data_out,
    output reg [1:0] des_state,  // signal temporarily taken as output for debuging
    output reg [3:0] oversample_counter, // signal temporarily taken as output for debuging
    output reg [3:0] bit_counter, // signal temporarily taken as output for debuging
    output reg ack
    );
    // external next
    reg[7:0] data_out_nxt;
    reg ack_nxt;
    
    // oversampling counter
    //reg [3:0] oversample_counter;  
    reg [3:0] oversample_counter_nxt;
    
    // bit counter
  //  reg [3:0] bit_counter; 
    reg [3:0] bit_counter_nxt;
    
    // deserializer state
   // reg [1:0]des_state;
    reg [1:0]des_state_nxt; 
    
    localparam 
        // states 
        des_idle = 2'b00,
        start_bit_sampling = 2'b01,
        middle_bits_sampling = 2'b11,
        stop_bit_sampling = 2'b10,
        // deserializer parameters
        FRAME_SIZE = 9, 
        OVERSAMPLING_NUMBER = 15;   
    
    
    always @( posedge clk or posedge rst )
    begin 
        if(rst == 1) 
        begin
            data_out <= 8'b0;
            ack <= 0;
            data_out_nxt <= 8'b0;
            ack_nxt <= 0;
            oversample_counter <= 0;
            oversample_counter_nxt <= 0;
            des_state <= des_idle; 
            bit_counter <= 0;
            bit_counter_nxt <= 0;          
        end
        else 
        begin 
            data_out <= data_out_nxt;
            ack <= ack_nxt;
            oversample_counter <= oversample_counter_nxt; 
            des_state <= des_state_nxt;   
            bit_counter <= bit_counter_nxt;         
        end      
     
    end    
    
    
    always @*    
    begin 
    
    // state machine 
    
    case( des_state )
        
        // idle state, waiting for serial_in change
        
        des_idle: 
        begin 
            if( serial_in == 1) 
            begin
                
                data_out_nxt = data_out;
                ack_nxt = 0;
                oversample_counter_nxt = 0;
                des_state_nxt = start_bit_sampling;
                oversample_counter_nxt = 0;
                bit_counter_nxt = 0; 
             
            end
            else 
            begin
            
                data_out_nxt = data_out;
                ack_nxt = 0;
                oversample_counter_nxt = 0;
                des_state_nxt = des_idle;
                oversample_counter_nxt = 0;
                bit_counter_nxt = 0;           
            end 
        end
        
        // start bit sampling
        
        start_bit_sampling:
        begin 
            if( oversample_counter == OVERSAMPLING_NUMBER/2)
            begin
            
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
         
            end
            else 
            begin
        
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = start_bit_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = 0; 
        
            end 
            
        end
        
        //message bits sampling
        
        middle_bits_sampling:
        begin
            
            if(( bit_counter == FRAME_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
                data_out_nxt[bit_counter-1] = serial_in;
                ack_nxt = 0;
                des_state_nxt = stop_bit_sampling;               
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;                
            end            
            else if(oversample_counter_nxt == 4'b1111)
            begin
        
                data_out_nxt[bit_counter-1] = serial_in;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;               
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
     
            end
            else 
            begin
    
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = bit_counter; 
    
            end           
        
        end
        
        // stop bit sampling
        
        stop_bit_sampling:
        begin 
            if(oversample_counter == OVERSAMPLING_NUMBER)
            begin
    
                data_out_nxt = data_out;
                ack_nxt = 1;
                des_state_nxt = des_idle;               
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
            end
            else 
            begin
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = stop_bit_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = bit_counter; 
            end        
                
        end
      
    endcase
    
    end
    
    
endmodule
