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
    output reg [31:0] data_out_A,
    output reg [31:0] data_out_B,
    output reg ack,
    output reg frame_error,
    output reg crc_error, 
    output reg [2 :0] opcode,
    output reg [3 :0] crc
    
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
       FRAME_ERROR            = 4'b1001,
       CRC_CALC               = 4'b1010,
       
       // deserializer parameters
       FRAME_SIZE = 7, 
       
       A_DATA_LAST = 4,
       B_DATA_LAST = 8,
       CMD_FRAME = 8,
       
       FRAME_NUMBER = 9,
       OVERSAMPLING_NUMBER = 15,
       
       // OUT SIGNALS PARAMS   
       DATA_OUT_SIZE = 31,  
       OPCODE_OUT_SIZE = 2,
       CRC_OUT_SIZE = 3;   
       

    
    // OUTPUT SIGNALS NXT 6
    reg[31:0] data_out_A_nxt;
    reg[31:0] data_out_B_nxt;
    reg ack_nxt;
    reg frame_error_nxt;    
    reg [2:0] opcode_nxt;
    reg [3:0] crc_nxt; 
    reg crc_error_nxt;
    
    // INTERNAL PARALLEL SIGNALS 8
    reg [DATA_OUT_SIZE:0] parallel_data_A;
    reg [DATA_OUT_SIZE:0] parallel_data_A_nxt; 
    reg [DATA_OUT_SIZE:0] parallel_data_B;
    reg [DATA_OUT_SIZE:0] parallel_data_B_nxt; 
    
    reg [CRC_OUT_SIZE:0] parallel_crc;
    reg [CRC_OUT_SIZE:0] parallel_crc_nxt;
    
    reg [OPCODE_OUT_SIZE:0] parallel_opcode; 
    reg [OPCODE_OUT_SIZE:0] parallel_opcode_nxt;
    
    //COUNTERS 6
    reg [3:0] oversample_counter;  
    reg [3:0] oversample_counter_nxt;    
    reg [5:0] bit_counter; 
    reg [5:0] bit_counter_nxt;    
    reg [3:0] frame_counter;
    reg [3:0] frame_counter_nxt;
    
    // deserializer state 2
    reg [3:0]des_state;
    reg [3:0]des_state_nxt; 
    
    reg [3:0]crc_calc;
    reg [3:0]crc_calc_nxt; 
       
    always @( posedge clk)                                           // POSEDGE REGISTERS
    begin 
        if(rst == 1)                                                                 // RESET 
        begin
            // out signals 
            data_out_A <= 0;
            data_out_B <= 0;
            ack <= 0;       
            opcode <= 0;
            crc <= 0;
            frame_error <= 0;  
                
            parallel_crc <= 0;
            parallel_opcode <= 0;
            
            oversample_counter <= 0;           
            des_state <= DES_IDLE;            
            bit_counter <= 0;
            parallel_data_A <= 0;            
            parallel_data_B <= 0;
            frame_counter <= 0;          
            crc_calc <= 0;
            crc_error <= 0;
        end
        else                                                                                // DATA LATCHING
        begin 
        
            // OUTPUT SIGNALS
            data_out_A <= data_out_A_nxt;
            data_out_B <= data_out_B_nxt;
            frame_error <=  frame_error_nxt;
            ack <= ack_nxt;
            crc <= crc_nxt;
            opcode <= opcode_nxt;
            crc_error <= crc_error_nxt;
            
            // INTERNAL PARALLEL SIGNALS
            parallel_data_A <= parallel_data_A_nxt;
            parallel_data_B <= parallel_data_B_nxt;
            
            parallel_crc <= parallel_crc_nxt;
            parallel_opcode <= parallel_opcode_nxt;
            
            //COUNTERS
            oversample_counter <= oversample_counter_nxt; 
            frame_counter <= frame_counter_nxt;   
            bit_counter <= bit_counter_nxt; 
            
            crc_calc <= crc_calc_nxt;
            // STATE           
            des_state <= des_state_nxt;
            
        end          
    end    
    
    
    always @*                                                                                // COMB PART 
    begin
    
    // state machine 
    
    case( des_state )                                                                       // STATE MACHINE
        
        // idle state, waiting for serial_in change
        
        DES_IDLE:                                                                           // DES IDLE
        begin 
            
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;
        
            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                       
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
       
            //COUNTER NXT
            frame_counter_nxt = frame_counter;
            oversample_counter_nxt = 0;
            bit_counter_nxt = 0; 
            
            crc_calc_nxt = crc_calc;
            // NEXT STATE
            if(( serial_in == 0 ) ) des_state_nxt = START_BIT_SAMPLING;
            else  des_state_nxt = DES_IDLE;
        end
        
        // start bit sampling
        
        START_BIT_SAMPLING:                                                              //   START_BIT_SAMPLING:
        begin 
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0; 
            
            //INTERNAL PARALLEL SIGLAS NXT
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
            
             crc_calc_nxt = crc_calc;
                  
            if( oversample_counter == OVERSAMPLING_NUMBER/2 )
            begin                  
                //INTERNAL PARALLEL SIGLAS NXT
                if( frame_counter < A_DATA_LAST ) begin
                    parallel_data_A_nxt = parallel_data_A<<1;
                    parallel_data_B_nxt = parallel_data_B;
                end
                else if (frame_counter < B_DATA_LAST)
                begin
                    parallel_data_A_nxt = parallel_data_A;   
                    parallel_data_B_nxt = parallel_data_B<<1;
                end
                else 
                begin
                    parallel_data_A_nxt = parallel_data_A;   
                    parallel_data_B_nxt = parallel_data_B;
                end
                           
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
                           
               //NEXT STATE
                des_state_nxt = PACKET_TYPE_SAMPLING;            
            end
            else 
            begin
               
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
                
        // packet type sampling                                                      //         ********************
        PACKET_TYPE_SAMPLING:                                                        //        PACKET_TYPE_SAMPLING:
        begin    
        
             // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                                            
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
            
            crc_calc_nxt = crc_calc;
                                                                            //         ********************
            if( oversample_counter == OVERSAMPLING_NUMBER )
            begin

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
         
                //NEXT STATE
                if( ( serial_in == 1 ) && ( frame_counter == 8 ) ) 
                    des_state_nxt = CMD_FIRST_BIT_SAMPLING;
                else if( ( serial_in == 0 ) && ( frame_counter < 8 ) )
                    des_state_nxt = DATA_BITS_SAMPLING;     
                else 
                    des_state_nxt = FRAME_ERROR;            
            end
            else 
            begin       

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
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0; 
            crc_error_nxt = 0;
              
            //INTERNAL PARALLEL SIGLAS NXT                          
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;  
             crc_calc_nxt = crc_calc;                                            
                                                                                                     
            if(( bit_counter == FRAME_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
                                     
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

                //INTERNAL PARALLEL SIGLAS NXT 
                if( frame_counter < A_DATA_LAST ) begin
                    parallel_data_A_nxt = parallel_data_A<<1;
                    parallel_data_B_nxt = parallel_data_B;
                end
                else 
                begin
                    parallel_data_A_nxt = parallel_data_A;   
                    parallel_data_B_nxt = parallel_data_B<<1;
                end

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = bit_counter+1;
            
                //NEXT STATE
                des_state_nxt = DATA_BITS_SAMPLING;              
                
            end
            else 
            begin  
                       
                //INTERNAL PARALLEL SIGLAS NXT 
                if( frame_counter < A_DATA_LAST )
                begin
                    parallel_data_A_nxt = { parallel_data_A[31:1] , serial_in };
                    parallel_data_B_nxt = parallel_data_B;
                end
                else 
                begin
                    parallel_data_A_nxt = parallel_data_A;  
                    parallel_data_B_nxt = { parallel_data_B[31:1] , serial_in };                                             
                end

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = bit_counter;
        
                //NEXT STATE
                des_state_nxt = DATA_BITS_SAMPLING;                 
                  
            end           
        
        end
         
        // command first bit sampling        
        CMD_FIRST_BIT_SAMPLING:
        begin 
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                                            
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
             crc_calc_nxt = crc_calc;
        
            if( oversample_counter == OVERSAMPLING_NUMBER )
            begin           

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
         
                //NEXT STATE
                if( serial_in == 1 ) 
                    des_state_nxt = CMD_OPCODE_SAMPLING;
                else 
                    des_state_nxt = FRAME_ERROR;                
            end
            else 
            begin       

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = 0; 
     
                //NEXT STATE
                des_state_nxt = CMD_FIRST_BIT_SAMPLING;
            end            
        end
        
        
        //COMMAND OPCODE sampling        
        CMD_OPCODE_SAMPLING:
        begin
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;
        
            //INTERNAL PARALLEL SIGLAS NXT 
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                    
            parallel_crc_nxt = parallel_crc;
            
             crc_calc_nxt = crc_calc;
            
            if(( bit_counter == OPCODE_OUT_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
                        
                parallel_opcode_nxt = parallel_opcode;
            
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
                
                //NEXT STATE
                des_state_nxt = CMD_CRC_SAMPLING;
                                
            end            
            else if(oversample_counter_nxt == OVERSAMPLING_NUMBER)
            begin       
                
                parallel_opcode_nxt = parallel_opcode << 1;
            
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = bit_counter+1;
            
                //NEXT STATE
                des_state_nxt = CMD_OPCODE_SAMPLING;              
                
            end
            else 
            begin  

                parallel_opcode_nxt = {parallel_opcode[2:1], serial_in};

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = bit_counter;
        
                //NEXT STATE
                des_state_nxt = CMD_OPCODE_SAMPLING;                 
                  
            end           
        
        end
        
        //CRC OPCODE sampling        
        CMD_CRC_SAMPLING:
        begin
        
                            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;
        
            //INTERNAL PARALLEL SIGLAS NXT 
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
            parallel_opcode_nxt = parallel_opcode;
            
             crc_calc_nxt = crc_calc;
            
            if(( bit_counter == CRC_OUT_SIZE ) && ( oversample_counter == OVERSAMPLING_NUMBER ))
            begin
                            
                parallel_crc_nxt = parallel_crc;
                            
                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
                
                //NEXT STATE
                des_state_nxt = STOP_BIT_SAMPLING;
              
                     
            end            
            else if(oversample_counter_nxt == OVERSAMPLING_NUMBER)
            begin       
                        
                parallel_crc_nxt = parallel_crc << 1;

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = bit_counter+1;
            
                //NEXT STATE
                des_state_nxt = CMD_CRC_SAMPLING;              
                
            end
            else 
            begin  
                              
                parallel_crc_nxt = {parallel_crc[3:1], serial_in};

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = bit_counter;
        
                //NEXT STATE
                des_state_nxt = CMD_CRC_SAMPLING;                 
                  
            end           
        
        end
        
        // stop bit sampling
        
        STOP_BIT_SAMPLING:
        begin 
                                         
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                             
            crc_nxt = crc;
            opcode_nxt = opcode;
            ack_nxt = 0; 
            frame_error_nxt = 0;
            crc_error_nxt = 0;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;

            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
            
             crc_calc_nxt = crc_calc;
                        
            if(oversample_counter == OVERSAMPLING_NUMBER)
            begin

                //COUNTER NXT
                frame_counter_nxt       = frame_counter+1;
                oversample_counter_nxt  = 0;
                bit_counter_nxt         = 0; 
 
                //NEXT STATE
                if( serial_in != 1 )
                    des_state_nxt = FRAME_ERROR;
                if(frame_counter == CMD_FRAME)
                    des_state_nxt = CRC_CALC;
                else
                    des_state_nxt = DES_IDLE;    
                
            end
            else 
            begin

                //COUNTER NXT
                frame_counter_nxt       = frame_counter;
                oversample_counter_nxt  = oversample_counter+1;
                bit_counter_nxt         = 0; 
     
                //NEXT STATE               
                des_state_nxt = STOP_BIT_SAMPLING;
            end                
        end
        
        CRC_CALC: 
        begin     
        
            // OUTPUT SIGNALS NXT           
           data_out_A_nxt = data_out_A;
           data_out_B_nxt = data_out_B;                             
           crc_nxt = crc;
           opcode_nxt = opcode;
           ack_nxt = 0; 
           frame_error_nxt = 0;
           crc_error_nxt = 0;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                       
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
            
             crc_calc_nxt = nextCRC4_D68({parallel_data_A, parallel_data_B, 1'b1, parallel_opcode}, 4'b0000);
            
            //COUNTER NXT
            frame_counter_nxt       = 0;
            oversample_counter_nxt  = 0;
            bit_counter_nxt         = 0; 

            //NEXT STATE
            des_state_nxt = LATCH_DATA;
  
        end      
        
        LATCH_DATA: 
        begin     
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = parallel_data_A;
            data_out_B_nxt = parallel_data_B;                             
            crc_nxt =  parallel_crc;
            opcode_nxt = parallel_opcode;
            ack_nxt = 1; 
            frame_error_nxt = 0;
            crc_error_nxt = !(crc_calc == parallel_crc);

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                       
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;
            
             crc_calc_nxt = crc_calc;
            
            //COUNTER NXT
            frame_counter_nxt       = 0;
            oversample_counter_nxt  = 0;
            bit_counter_nxt         = 0; 

            //NEXT STATE
            des_state_nxt = DES_IDLE;
  
        end        
        
        FRAME_ERROR: 
        begin     
        
            // OUTPUT SIGNALS NXT           
            data_out_A_nxt = data_out_A;
            data_out_B_nxt = data_out_B;                            
            crc_nxt =  parallel_crc;
            opcode_nxt = parallel_opcode;
            ack_nxt = 0; 
            frame_error_nxt = 1;

            //INTERNAL PARALLEL SIGLAS NXT
            parallel_data_A_nxt = parallel_data_A;
            parallel_data_B_nxt = parallel_data_B;
                       
            parallel_crc_nxt = parallel_crc;
            parallel_opcode_nxt = parallel_opcode;

            //COUNTER NXT
            frame_counter_nxt       = 0;
            oversample_counter_nxt  = 0;
            bit_counter_nxt         = 0; 

            //NEXT STATE
            des_state_nxt = FRAME_ERROR;
  
        end   
        
    endcase
    
    end
    
    
    function [3:0] nextCRC4_D68;
    // polynomial: x^4 + x^1 + 1
    // data width: 68
    // convention: the first serial bit is D[67]
    
      input [67:0] Data;
      input [3:0] crc;
      reg [67:0] d;
      reg [3:0] c;
      reg [3:0] newcrc;
    begin
      d = Data;
      c = crc;
    
      newcrc[0] = d[66] ^ d[64] ^ d[63] ^ d[60] ^ d[56] ^ d[55] ^ d[54] ^ d[53] ^ d[51] ^ d[49] ^ d[48] ^ d[45] ^ d[41] ^ d[40] ^ d[39] ^ d[38] ^ d[36] ^ d[34] ^ d[33] ^ d[30] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[18] ^ d[15] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[0] ^ c[2];
      newcrc[1] = d[67] ^ d[66] ^ d[65] ^ d[63] ^ d[61] ^ d[60] ^ d[57] ^ d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[48] ^ d[46] ^ d[45] ^ d[42] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[33] ^ d[31] ^ d[30] ^ d[27] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^ d[12] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[1] ^ d[0] ^ c[1] ^ c[2] ^ c[3];
      newcrc[2] = d[67] ^ d[66] ^ d[64] ^ d[62] ^ d[61] ^ d[58] ^ d[54] ^ d[53] ^ d[52] ^ d[51] ^ d[49] ^ d[47] ^ d[46] ^ d[43] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[34] ^ d[32] ^ d[31] ^ d[28] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[16] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[2] ^ d[1] ^ c[0] ^ c[2] ^ c[3];
      newcrc[3] = d[67] ^ d[65] ^ d[63] ^ d[62] ^ d[59] ^ d[55] ^ d[54] ^ d[53] ^ d[52] ^ d[50] ^ d[48] ^ d[47] ^ d[44] ^ d[40] ^ d[39] ^ d[38] ^ d[37] ^ d[35] ^ d[33] ^ d[32] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[17] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ c[1] ^ c[3];
      nextCRC4_D68 = newcrc;
    end
    endfunction
      
endmodule
