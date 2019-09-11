`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Agnieszka Windak
// 
// Create Date: 12.08.2019 19:22:38
// Design Name: 
// Module Name: serializer_core
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


module mtm_Alu_serializer(
    input wire clk,
    input wire rst,
    input wire req,
    input wire [31:0]data_in,
    input wire [2:0]crc_in,
    input wire [3:0]alu_flags_in,
    input wire data_err_in,
    input wire crc_err_in,
    input wire op_err_in,
    output reg serial_out,
    output reg ack

    );
    
    //output signal nxt 
    reg serial_out_nxt;
    reg ack_nxt;
    
    // states
    reg [3:0] state;
    reg [3:0] state_nxt;
    
    // counters 
    reg [4:0] bit_counter;
    reg [4:0] bit_counter_nxt;
    reg [4:0] frame_counter;
    reg [4:0] frame_counter_nxt;
    
    // registers
    reg [31:0]internal_data;
    reg [2:0]internal_crc;
    reg [3:0]internal_alu_flags;
    reg [31:0]internal_data_nxt;
    reg [2:0]internal_crc_nxt;
    reg [3:0]internal_alu_flags_nxt;
    reg [5:0] internal_errors;
    reg [5:0] internal_errors_nxt;
    
    reg [3:0] pclk_ctr;
    reg prst;
    
    localparam 
        IDLE = 4'b0000,
        LATCH_DATA = 4'b0001,
        START_SENDING = 4'b0010,
        CTL_BIT_SENDING = 4'b0011,
        DATA_BIT_SENDING = 4'b0100,
        DATA_BITS_SENDING = 4'b0101,
        CTL_FIRST_BIT_SENDING = 4'b0110,
        FLAGS_SENDING = 4'b0111,
        CRC_SENDING = 4'b1000,
        ERR_FLAGS_SENDING = 4'b1001,
        PARITY_SENDING = 4'b1010,
        STOP_SENDING = 4'b1011,
        ERROR_STOP = 4'b1100;   
/*   
always @(posedge clk) begin
    if( rst == 0 ) begin 
        pclk <= 0;
        pclk_ctr <= 0;
    end 
    else begin
        pclk <= (pclk_ctr == 0)? !pclk : pclk;
        pclk_ctr <= pclk_ctr +1;
    end
end 
  */  

always @(posedge clk ) begin
    
    if( rst == 0) begin 
    
        //output signal nxt 
        serial_out             <= 1'b1;
        ack                    <= 1'b1;

        // states
        state                  <= IDLE;

        // counters 
        bit_counter            <= 5'b0;
        frame_counter          <= 5'b0;

        // registers
        internal_data          <= 32'b0;
        internal_crc           <= 3'b0;
        internal_alu_flags     <= 4'b0;
        internal_errors        <= 6'b0;
        
        pclk_ctr <= 4'b0;
    end 
    
    else begin
    
        //output signal nxt 
        serial_out             <= serial_out_nxt;
        ack                    <= ack_nxt;

        // states
        state                  <= state_nxt;

        // counters 
        bit_counter            <= bit_counter_nxt;
        frame_counter          <= frame_counter_nxt;

        // registers
        internal_data          <= internal_data_nxt;
        internal_crc           <= internal_crc_nxt;
        internal_alu_flags     <= internal_alu_flags_nxt;
        internal_errors        <= internal_errors_nxt;
        
        pclk_ctr <= pclk_ctr +1'b1;
    
    end
    
end

always @* begin


if( pclk_ctr == 0 ) begin
    case( state ) 
        
        IDLE: // ok
        begin
            // external signal nxt
            serial_out_nxt = 1'b1;
            ack_nxt = 1'b1;
            
            // counters 
            bit_counter_nxt = 5'b0;
            frame_counter_nxt = 5'b0;
            
            // internal signals 
            internal_data_nxt = internal_data;
            internal_crc_nxt = internal_crc;
            internal_alu_flags_nxt = internal_alu_flags;
            internal_errors_nxt = 6'b0;
            
            // NEXT_STATE
            if((req == 1)||(crc_err_in|op_err_in|data_err_in)) state_nxt = LATCH_DATA;
            else state_nxt = IDLE;            
         end
         
         LATCH_DATA:
         begin
             // external signal nxt
             serial_out_nxt = 1'b1;
             ack_nxt = 1'b1;
             
             // counters 
             bit_counter_nxt = 5'b0;
             frame_counter_nxt = 5'b0;
             
             // internal signals 
             internal_data_nxt = data_in;
             internal_crc_nxt = crc_in;
             internal_alu_flags_nxt = alu_flags_in;
             internal_errors_nxt = {crc_err_in,op_err_in,data_err_in, crc_err_in,op_err_in,data_err_in};
             
             // NEXT_STATE 
             state_nxt = START_SENDING;            
          end
         
          START_SENDING:
          begin
              // external signal nxt
              serial_out_nxt = 1'b0;
              ack_nxt = 1'b0;
              
              // counters 
              bit_counter_nxt =   5'b0;
              frame_counter_nxt = frame_counter;
              
              // internal signals 
              internal_data_nxt = internal_data;
              internal_crc_nxt = internal_crc;
              internal_alu_flags_nxt = internal_alu_flags;
              internal_errors_nxt = internal_errors;
              
              // NEXT_STATE             
              if((frame_counter < 4 )&&(internal_errors == 0) )state_nxt = DATA_BIT_SENDING;
              else state_nxt = CTL_BIT_SENDING;
                                     
           end
           
           DATA_BIT_SENDING:
           begin
               // external signal nxt
               serial_out_nxt = 1'b0;
               ack_nxt = 1'b0;
               
               // counters 
               bit_counter_nxt = 5'b0;
               frame_counter_nxt = frame_counter;
               
               // internal signals 
               internal_data_nxt = internal_data;
               internal_crc_nxt = internal_crc;
               internal_alu_flags_nxt = internal_alu_flags;
               internal_errors_nxt = internal_errors;
               
               // NEXT_STATE
               state_nxt = DATA_BITS_SENDING;            
            end
                     
           DATA_BITS_SENDING:
           begin
               // external signal nxt
               serial_out_nxt = internal_data[31];
               ack_nxt = 1'b0;
               
               // counters 
               bit_counter_nxt = bit_counter + 1'b1;
               frame_counter_nxt = frame_counter;
               
               // internal signals 
               internal_data_nxt = internal_data<<1;
               internal_crc_nxt = internal_crc;
               internal_alu_flags_nxt = internal_alu_flags;
                internal_errors_nxt = internal_errors;
               
               // NEXT_STATE
               if(bit_counter == 7) state_nxt = STOP_SENDING;
               else state_nxt = DATA_BITS_SENDING;            
            end
            
            STOP_SENDING:
            begin
                // external signal nxt
                serial_out_nxt = 1'b1;
                ack_nxt = 1'b0;
                
                // counters 
                bit_counter_nxt = 5'b0;
                frame_counter_nxt = frame_counter+1'b1;
                
                // internal signals
                internal_data_nxt = internal_data;
                internal_crc_nxt = internal_crc;
                internal_alu_flags_nxt = internal_alu_flags;
                 internal_errors_nxt = internal_errors;
                
                // NEXT_STATE
                if(frame_counter < 4) state_nxt = START_SENDING;  
                else state_nxt = IDLE;
                    
                           
             end    
             
             CTL_BIT_SENDING:
             begin
                 // external signal nxt
                 serial_out_nxt = 1'b1;
                 ack_nxt = 1'b0;
                 
                 // counters 
                 bit_counter_nxt = 5'b0;
                 frame_counter_nxt = frame_counter;
                 
                 // internal signals 
                 internal_data_nxt = internal_data;
                 internal_crc_nxt = internal_crc;
                 internal_alu_flags_nxt = internal_alu_flags;
                 internal_errors_nxt = internal_errors;
                 
                 // NEXT_STATE
                 state_nxt = CTL_FIRST_BIT_SENDING;            
              end 
              
              
              CTL_FIRST_BIT_SENDING:
              begin
                  // external signal nxt
                  serial_out_nxt = 1'b1;
                  ack_nxt = 1'b0;
                  
                  // counters 
                  bit_counter_nxt = 5'b0;
                  frame_counter_nxt = frame_counter;
                  
                  // internal signals 
                  internal_data_nxt = internal_data;
                  internal_crc_nxt = internal_crc;
                  internal_alu_flags_nxt = internal_alu_flags;
                  internal_errors_nxt = internal_errors;
                  
                  // NEXT_STATE
                  if(internal_errors!=0) state_nxt = ERR_FLAGS_SENDING;
                  else state_nxt = FLAGS_SENDING;            
               end 
              
              FLAGS_SENDING:
              begin
                // external signal nxt
                serial_out_nxt = internal_alu_flags[3];
                ack_nxt = 1'b0;
              
                // counters 
                bit_counter_nxt = bit_counter + 1'b1;
                frame_counter_nxt = frame_counter;
              
                // internal signals 
                internal_data_nxt = internal_data;
                internal_crc_nxt = internal_crc;
                internal_alu_flags_nxt = internal_alu_flags<<1;
                internal_errors_nxt = internal_errors;
              
                // NEXT_STATE
                if(bit_counter == 3) state_nxt = CRC_SENDING;
                else state_nxt = FLAGS_SENDING;            
              end 
              
              CRC_SENDING:
              begin
                // external signal nxt
                serial_out_nxt = internal_crc[2];
                ack_nxt = 1'b0;
              
                // counters 
                bit_counter_nxt = bit_counter + 1'b1;
                frame_counter_nxt = frame_counter;
              
                // internal signals 
                internal_data_nxt = internal_data;
                internal_crc_nxt = internal_crc<<1;
                internal_alu_flags_nxt = internal_alu_flags;
                internal_errors_nxt = internal_errors;
              
                // NEXT_STATE
                if(bit_counter == 6) state_nxt = STOP_SENDING;
                else state_nxt = CRC_SENDING;            
              end 
              
              ERR_FLAGS_SENDING:
              begin
                // external signal nxt
                serial_out_nxt = internal_errors[5];
                ack_nxt = 1'b0;
              
                // counters 
                bit_counter_nxt = bit_counter + 1'b1;
                frame_counter_nxt = frame_counter;
              
                // internal signals 
                internal_data_nxt = internal_data;
                internal_crc_nxt = internal_crc;
                internal_alu_flags_nxt = internal_alu_flags;
                internal_errors_nxt = internal_errors<<1;
              
                // NEXT_STATE
                if(bit_counter == 5) state_nxt = PARITY_SENDING;
                else state_nxt = ERR_FLAGS_SENDING;            
              end 
              
              PARITY_SENDING:
              begin
                  // external signal nxt
                  serial_out_nxt = (^internal_errors)^1'b1;
                  ack_nxt = 1'b0;
                  
                  // counters 
                  bit_counter_nxt = 5'b0;
                  frame_counter_nxt = frame_counter;
                  
                  // internal signals 
                  internal_data_nxt = internal_data;
                  internal_crc_nxt = internal_crc;
                  internal_alu_flags_nxt = internal_alu_flags;
                  internal_errors_nxt = internal_errors;
                  
               // NEXT_STATE
               state_nxt = ERROR_STOP;            
               end
               
               
               ERROR_STOP:
               begin
                   // external signal nxt
                   serial_out_nxt = 1'b1;
                   ack_nxt = 1'b0;
                   
                   // counters 
                   bit_counter_nxt = 5'b0;
                   frame_counter_nxt = frame_counter;
                   
                   // internal signals 
                   internal_data_nxt = internal_data;
                   internal_crc_nxt = internal_crc;
                   internal_alu_flags_nxt = internal_alu_flags;
                   internal_errors_nxt = internal_errors;
                   
                   // NEXT_STATE
                   state_nxt = ERROR_STOP;            
                end
                
                default: // ok
                begin
                    // external signal nxt
                    serial_out_nxt = 1'b1;
                    ack_nxt = 1'b1;
                    
                    // counters 
                    bit_counter_nxt = 5'b0;
                    frame_counter_nxt = 5'b0;
                    
                    // internal signals 
                    internal_data_nxt = internal_data;
                    internal_crc_nxt = internal_crc;
                    internal_alu_flags_nxt = internal_alu_flags;
                    internal_errors_nxt = 6'b0;
                    
                    // NEXT_STATE
                    state_nxt = IDLE;            
                 end
              
    
    endcase
    
 
end    
 
 else begin
 
     // external signal nxt
     serial_out_nxt = serial_out;
     ack_nxt = ack;
     
     // counters 
     bit_counter_nxt = bit_counter;
     frame_counter_nxt = frame_counter;
     
     // internal signals 
     internal_data_nxt = internal_data;
     internal_crc_nxt = internal_crc;
     internal_alu_flags_nxt = internal_alu_flags;
     internal_errors_nxt = internal_errors;
     
     // NEXT_STATE
     state_nxt = state;            

 
 end 
 
 
end

endmodule

