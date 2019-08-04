`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2019 19:56:40
// Design Name: 
// Module Name: deserializer_core_32
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


module deserializer_core_32(
    input wire clk,
    input wire rst,
    input wire serial_in,
    input wire req,
    output reg [31:0] data_out,
    output reg ack,
    output reg frame_error
    );
    
        // external next
    reg[31:0] data_out_nxt;
    reg ack_nxt;
    
    // internal paralell register
    reg [31:0] parallel_data;
    reg [31:0] parallel_data_nxt; 
    
    // oversampling counter
    reg [3:0] oversample_counter;  
    reg [3:0] oversample_counter_nxt;
    
    // bit counter
    reg [5:0] bit_counter; 
    reg [5:0] bit_counter_nxt;
    
    // deserializer state
    reg [2:0]des_state;
    reg [2:0]des_state_nxt; 
    
    reg frame_error_nxt;
    
    localparam 
        // states 
        des_idle             = 3'b000,
        start_bit_sampling   = 3'b001,
        middle_bits_sampling = 3'b011,
        stop_bit_sampling    = 3'b010,
        stop_bit_error       = 3'b110,
        word_sampling_finish = 3'b111, 
        // deserializer parameters
        FRAME_SIZE = 33, 
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
            frame_error <= 0;  
            frame_error_nxt <= 0;   
            parallel_data_nxt <= 0;
            parallel_data <= 0;
        end
        else 
        begin 
            data_out <= data_out_nxt;
            ack <= ack_nxt;
            oversample_counter <= oversample_counter_nxt; 
            des_state <= des_state_nxt;   
            bit_counter <= bit_counter_nxt; 
            frame_error <=  frame_error_nxt;     
            parallel_data <= parallel_data_nxt;
        end      
     
    end    
    
    
    always @*    
    begin
    
    // state machine 
    
    case( des_state )
        
        // idle state, waiting for serial_in change
        
        des_idle: 
        begin 
            if(( serial_in == 1 ) && (req == 1 ) )
            begin                
                data_out_nxt = data_out;
                ack_nxt = 0;
                oversample_counter_nxt = 0;
                des_state_nxt = start_bit_sampling;
                oversample_counter_nxt = 0;
                bit_counter_nxt = 0; 
                frame_error_nxt = 0;
                parallel_data_nxt = 0;             
            end
            else 
            begin           
                data_out_nxt = data_out;
                ack_nxt = ack;
                oversample_counter_nxt = 0;
                des_state_nxt = des_idle;
                oversample_counter_nxt = 0;
                bit_counter_nxt = 0; 
                frame_error_nxt = 0;  
                parallel_data_nxt = 0;        
            end 
        end
        
        // start bit sampling
        
        start_bit_sampling:
        begin 
            if( oversample_counter == OVERSAMPLING_NUMBER/2 )
            begin
            
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
                frame_error_nxt = 0;
                parallel_data_nxt = parallel_data;
            end
            else 
            begin
        
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = start_bit_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = 0; 
                frame_error_nxt = 0;
                parallel_data_nxt = parallel_data;
            end 
            
        end
        
        //message bits sampling
        
        middle_bits_sampling:
        begin
            
            if(( bit_counter == FRAME_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
                parallel_data_nxt[bit_counter-1] = serial_in;
                ack_nxt = 0;
                des_state_nxt = stop_bit_sampling;               
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;  
                frame_error_nxt = 0;     
                data_out_nxt = data_out;         
            end            
            else if(oversample_counter_nxt == 4'b1111)
            begin       
                parallel_data_nxt[bit_counter-1] = serial_in;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;               
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
                frame_error_nxt = 0;     
                data_out_nxt = data_out;
            end
            else 
            begin  
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = middle_bits_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = bit_counter; 
                frame_error_nxt = 0;
                parallel_data_nxt = parallel_data;    
            end           
        
        end
        
        // stop bit sampling
        
        stop_bit_sampling:
        begin 
            if(oversample_counter == OVERSAMPLING_NUMBER)
            begin
                    
                data_out_nxt = data_out;
                ack_nxt = 0;
                
                if(serial_in == 0)begin
                    des_state_nxt = word_sampling_finish;                   
                end    
                else begin
                    des_state_nxt = stop_bit_error;
                end
                
                oversample_counter_nxt = 0;
                bit_counter_nxt = bit_counter+1;
                frame_error_nxt = 0;
                parallel_data_nxt = parallel_data; 
            end
            else 
            begin
                data_out_nxt = data_out;
                ack_nxt = 0;
                des_state_nxt = stop_bit_sampling;
                oversample_counter_nxt = oversample_counter + 1;
                bit_counter_nxt = bit_counter; 
                frame_error_nxt = 0;
                parallel_data_nxt = parallel_data;
            end                
        end
        
        // if stop bit is not 0
        
        stop_bit_error: 
        begin 
            data_out_nxt = data_out;
            ack_nxt = 0;
            des_state_nxt = stop_bit_error;
            oversample_counter_nxt = 0;
            bit_counter_nxt = 0; 
            frame_error_nxt = 1;
            parallel_data_nxt = parallel_data; 
        end
        
        word_sampling_finish: 
        begin                    
            data_out_nxt = parallel_data;
            ack_nxt =  1;           
            oversample_counter_nxt = 0;
            bit_counter_nxt = 0; 
            frame_error_nxt = 0;
            parallel_data_nxt = parallel_data;  
            if(req == 0) begin    
                des_state_nxt = des_idle;
            end    
            else begin
                des_state_nxt = word_sampling_finish; 
            end
        end 
        
      
    endcase
    
    end
    
    
endmodule
