`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH UST
// Engineer:  Karol Ujda
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
    output reg [7:0] data_out_A,
    output reg [7:0] data_out_B,
    output reg ack,
    output reg frame_error,
    
    output reg [2 :0] opcode,
    output reg [3 :0] crc,
    
    output reg [7:0] parallel_data_A,
    output reg [3:0] oversample_counter,
    output reg [3:0]des_state,
    output reg [5:0] bit_counter
    );
    
      
  localparam 
          // states 
       DES_IDLE               = 4'b0000,        
       START_BIT_SAMPLING     = 4'b0001,      
       PACKET_TYPE_SAMPLING   = 4'b0010,     
       DATA_BITS_SAMPLING     = 4'b0011,
       CMD_FIRST_BIT_SAMPLING = 4'b0100,
       CMD_OPCODE_SAMPLING    = 4'b0101,
       CMD_CRC_SAMPLING       = 4'b0110,
       STOP_BIT_SAMPLING      = 4'b0111,        
       LATCH_DATA             = 4'b1000, 
       // deserializer parameters
       FRAME_SIZE = 7, 
       FRAME_NUMBER = 9,
       OVERSAMPLING_NUMBER = 15,
       
       // OUT SIGNALS PARAMS   
       DATA_OUT_SIZE = 7,  
       OPCODE_OUT_SIZE = 2,
       CRC_OUT_SIZE = 3;   
       

    
    // OUTPUT SIGNALS NXT
    reg[7:0] data_out_A_nxt;
    reg[7:0] data_out_B_nxt;
    reg ack_nxt;
    reg frame_error_nxt;    
    reg [2:0] opcode_nxt;
    reg [3:0] crc_nxt; 
    
    // INTERNAL PARALLEL SIGNALS
 //   reg [DATA_OUT_SIZE:0] parallel_data_A;
    reg [DATA_OUT_SIZE:0] parallel_data_A_nxt; 
    reg [DATA_OUT_SIZE:0] parallel_data_B;
    reg [DATA_OUT_SIZE:0] parallel_data_B_nxt; 
    
    //COUNTERS 
//    reg [3:0] oversample_counter;  
    reg [3:0] oversample_counter_nxt;    
  //  reg [5:0] bit_counter; 
    reg [5:0] bit_counter_nxt;    
    reg [3:0] frame_counter;
    reg [3:0] frame_counter_nxt;
    
    // deserializer state
 //   reg [2:0]des_state;
    reg [3:0]des_state_nxt; 
       
    always @( posedge clk or posedge rst )
    begin 
        if(rst == 1) 
        begin
            // out signals 
            data_out_A <= 0;
            data_out_A_nxt <= 0;
            data_out_B <= 0;
            data_out_B_nxt <= 0;
            ack <= 0;       
            ack_nxt <= 0;
            opcode <= 0;
            opcode_nxt <= 0;
            crc <= 0;
            crc_nxt <= 0; 
            frame_error <= 0;  
            frame_error_nxt <= 0; 
            
            
            oversample_counter <= 0;
            oversample_counter_nxt <= 0;
            
            des_state <= DES_IDLE; 
            des_state_nxt <= DES_IDLE;
            
            bit_counter <= 0;
            bit_counter_nxt <= 0; 
  
            parallel_data_A_nxt <= 0;
            parallel_data_A <= 0;
            
            parallel_data_B_nxt <= 0;
            parallel_data_B <= 0;
           
            frame_counter <= 0;
            frame_counter_nxt <= 0;
        end
        else 
        begin 
        
            // OUTPUT SIGNALS
            data_out_A <= data_out_A_nxt;
            data_out_B <= data_out_B_nxt;
            frame_error <=  frame_error_nxt;
            ack <= ack_nxt;
            crc <= crc_nxt;
            opcode <= opcode_nxt;
            
            // INTERNAL PARALLEL SIGNALS
            parallel_data_A <= parallel_data_A_nxt;
            parallel_data_B <= parallel_data_B_nxt;
            
            //COUNTERS
            oversample_counter <= oversample_counter_nxt; 
            frame_counter <= frame_counter_nxt;   
            bit_counter <= bit_counter_nxt; 
            
            // STATE           
            des_state <= des_state_nxt;
            
        end          
    end    
    
    
    always @*    
    begin
    
    // state machine 
    
    case( des_state )
        
        // idle state, waiting for serial_in change
        
        DES_IDLE: 
        begin 
            if(( serial_in == 0 ) )
            begin                
                
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
                
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
                
                //COUNTER NXT
                frame_counter_nxt = frame_counter;
                oversample_counter_nxt = 0;
                bit_counter_nxt = 0; 
                    
                //NEXT STATE
                des_state_nxt = START_BIT_SAMPLING;
                         
            end
            else 
            begin      
            
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
                
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
                
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
                 
                //NEXT STATE
                des_state_nxt = DES_IDLE;
                       
            end 
        end
        
        // start bit sampling
        
        START_BIT_SAMPLING:
        begin 
            if( oversample_counter == OVERSAMPLING_NUMBER/2 )
            begin
                      
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A<<1;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
            
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
            
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
             
                //NEXT STATE
                des_state_nxt = PACKET_TYPE_SAMPLING;
                           
            end
            else 
            begin
        
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
        
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
        
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = 0; 
         
                //NEXT STATE
                des_state_nxt = START_BIT_SAMPLING;
            end 
            
        end
                
        // packet type sampling
        
        PACKET_TYPE_SAMPLING:
        begin 
            if( oversample_counter == OVERSAMPLING_NUMBER )
            begin
            
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
        
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
        
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
         
                //NEXT STATE
       /*         if( serial_in == 1 ) 
                    des_state_nxt = CMD_FIRST_BIT_SAMPLING;
                else */
                    des_state_nxt = DATA_BITS_SAMPLING;
                
            end
            else 
            begin
        
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
    
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
    
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = 0; 
     
                //NEXT STATE
                des_state_nxt = PACKET_TYPE_SAMPLING;
            end 
            
        end
                              
        //data bits sampling
        
        DATA_BITS_SAMPLING:
        begin
            
            if(( bit_counter == FRAME_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
            
            
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
                
                //INTERNAL PARALLEL SIGLAS NXT 
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
                
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
                
                //NEXT STATE
                des_state_nxt = STOP_BIT_SAMPLING;
              
                     
            end            
            else if(oversample_counter_nxt == OVERSAMPLING_NUMBER)
            begin       
                
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
            
                //INTERNAL PARALLEL SIGLAS NXT 
                parallel_data_A_nxt = parallel_data_A<<1;
                parallel_data_B_nxt = parallel_data_B;
            
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = bit_counter+1;
            
                //NEXT STATE
                des_state_nxt = DATA_BITS_SAMPLING;              
                
            end
            else 
            begin  
            
            
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
        
                //INTERNAL PARALLEL SIGLAS NXT 
                parallel_data_A_nxt = { parallel_data_A[7:1] , serial_in };
                parallel_data_B_nxt = parallel_data_B;
        
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = bit_counter;
        
                //NEXT STATE
                des_state_nxt = DATA_BITS_SAMPLING;                 
                  
            end           
        
        end
        
        // stop bit sampling
        
        STOP_BIT_SAMPLING:
        begin 
            if(oversample_counter == OVERSAMPLING_NUMBER)
            begin
                    
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;

                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
 
                //NEXT STATE
                des_state_nxt = LATCH_DATA;
            end
            else 
            begin
                // OUTPUT SIGNALS NXT           
                data_out_A_nxt = data_out_A;
                data_out_B_nxt = data_out_B;                             
                crc_nxt = crc;
                opcode_nxt = opcode;
                ack_nxt = 0; 
                frame_error_nxt = 0;
    
                //INTERNAL PARALLEL SIGLAS NXT
                parallel_data_A_nxt = parallel_data_A;
                parallel_data_B_nxt = parallel_data_B;
    
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = 0; 
     
                //NEXT STATE
                des_state_nxt = STOP_BIT_SAMPLING;
            end                
        end
        
        // if stop bit is not 0
     /*   
        stop_bit_error_A: 
        begin 
            data_out_A_nxt = data_out_A;
            ack_nxt = 0;
            des_state_nxt = stop_bit_error_A;
            oversample_counter_nxt = 0;
            bit_counter_nxt = 0; 
            frame_error_nxt = 1;
            parallel_data_A_nxt = parallel_data_A; 
        end
        */
        LATCH_DATA: 
        begin     
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = parallel_data_A;
            data_out_B_nxt = parallel_data_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 1; 
            frame_error_nxt = 0;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;

            //COUNTER NXT
            frame_counter_nxt       = frame_counter;
            oversample_counter_nxt  = 0;
            bit_counter_nxt         = 0; 

            //NEXT STATE
            des_state_nxt = DES_IDLE;
  
        end 
        
      
    endcase
    
    end
    
    
endmodule
