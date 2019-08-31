`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2019 18:42:51
// Design Name: 
// Module Name: serializer_test
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


module serializer_test(
    );
    
    localparam 
        CLOCK_PERIOD = 10,
        OVERSAMPLING_SAMPLES = 16,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES,        
        FRAME_SIZE = 31,
        FRAME_NUMBER = 4;
    
    reg clock;
    reg reset;
    reg req;
    reg [31:0]data_in;
    reg [2:0]crc_in;
    reg [3:0]alu_flags_in;
    reg crc_error;
    reg data_error;
    reg op_error;
    wire serial_out;
    wire ack_out;
    wire [3:0]state_test;
    wire [4:0]bit_ctr_test;
    wire [4:0]frame_ctr_test;
    
    integer i; // loop counter
    integer j;
    integer k;
    
    integer ok_bits;
    integer failed_bits;
    
   // serial frame format: [ 0, packet type, packet pits, stop ] 
    reg [FRAME_SIZE:0]data_template_1 [FRAME_NUMBER:0];
    reg [3:0]flags_template_1 [FRAME_NUMBER:0];
    reg [2:0]crc_template_1 [FRAME_NUMBER:0];
    
    reg [2:0]error_template [2:0];  
    reg [5:0]error_frame;
    
    serializer_core DUT(
        .clk(clock),
        .rst(reset),
        .req(req),
        .data_in(data_in),
        .crc_in(crc_in),
        .alu_flags_in(alu_flags_in),
        .serial_out(serial_out),
        .ack(ack_out),
        .bit_counter(bit_ctr_test),
        .frame_counter(frame_ctr_test),
        .state(state_test),
        .data_err_in(data_error),
        .crc_err_in(crc_error),
        .op_err_in(op_error)
        );
        
        
        initial 
        begin
            // TEST 1 ARRAYS INIT
            ok_bits = 0;
            failed_bits = 0;
            
            error_template[0] = 3'b001;
            error_template[1] = 3'b010;
            error_template[2] = 3'b100;
            
            data_template_1[0] = 32'b1010_1010_1010_1010_1010_1010_1010_1010; // valid frame
            flags_template_1[0] = 4'b0101;
            crc_template_1[0] = 3'b010;
            
            data_template_1[1] = 32'b1111_0010_1011_0101_1010_1010_0001_1101; // valid frame
            flags_template_1[1] = 4'b0110;
            crc_template_1[1] = 3'b100;
            
            data_template_1[2] = 32'b1010_1010_1000_1011_0001_0010_1110_1010; // valid frame
            flags_template_1[2] = 4'b0011;
            crc_template_1[2] = 3'b011;
            
            data_template_1[3] = 32'b1110_1011_1010_1011_0001_0001_0010_1010; // valid frame
            flags_template_1[3] = 4'b0011;
            crc_template_1[3] = 3'b011;
            //TEST 2 ARRAYS INIT
        
     /*       serial_template_2[0]  = 11'b0_0_1010_1010_1; // valid frame
            serial_template_2[1]  = 11'b0_0_1111_0010_1; // valid frame
            serial_template_2[2]  = 11'b0_0_1101_1100_1; // valid frame 
            serial_template_2[3]  = 11'b0_0_1011_0101_1; // valid frame 
            serial_template_2[4]  = 11'b0_1_1_101_1011_1; // valid frame*/
               
            //TEST 3 ARRAYS INIT
        
         /*   serial_template_3[0]  = 11'b0_0_0001_1101_1; // valid frame
            serial_template_3[1]  = 11'b0_0_0100_1010_1; // valid frame
            serial_template_3[2]  = 11'b0_0_1001_0100_1; // valid frame 
            serial_template_3[3]  = 11'b0_0_0001_0010_1; // valid frame 
            serial_template_3[4]  = 11'b0_1_1_001_0110_1; // valid frame*/
        
        end 
        
        
    
        initial 
        begin 
             clock = 1; 
             reset = 1;
             #1 reset = 0;
        end 
           
           // clock generation  
        always 
            #(CLOCK_PERIOD/2)  clock =  ! clock; 
            
            
        initial 
        begin
        
        
        #CLOCK_PERIOD;
        
        $display("SERIALIZER TEST START");
  // NO ERROR TESTS          
for(k = 0; k< 4; k=k+1) begin   
           
        data_in = data_template_1[k];
        alu_flags_in = flags_template_1[k];
        crc_in = crc_template_1[k];
        
        crc_error = 0;
        data_error = 0;
        op_error = 0;
        
        req = 1;
        
                
            #(CLOCK_PERIOD) req = 0;
        
            #(CLOCK_PERIOD); 
            if(serial_out == 1)begin
                $display("LATCH OK"); // wait 1 clk period to latch data
                ok_bits = ok_bits + 1;
            end
            else begin
                $display("LATCH NO_OK");
                failed_bits = failed_bits + 1;
            end
        
        for( j = FRAME_NUMBER - 1 ; j >= 0; j = j-1) begin

        
            #(CLOCK_PERIOD); 
            if(serial_out == 0) begin
                $display("START OK"); // start bit
                ok_bits = ok_bits + 1;
            end
            else begin
                $display("START NO_OK");
                failed_bits = failed_bits + 1;
             end
            
            #(CLOCK_PERIOD) if(serial_out == 0) begin
                $display("DATA TYPE OK"); // data type bit
                ok_bits = ok_bits + 1;
            end
            else begin
                $display("DATA TYPE NO_OK");
                failed_bits = failed_bits + 1;
            end
                                        
            for( i = 7 +j*8; i>=j*8  ; i=i-1 ) begin
            #(CLOCK_PERIOD); 
                if(serial_out == data_template_1[k][i]) begin
                    $display("DATA OK"); // data bit
                    ok_bits = ok_bits + 1;
                end
                else begin
                    $display("DATA NO_OK");
                    failed_bits = failed_bits + 1;
                end 
            end 
            
            #(CLOCK_PERIOD); 
            if(serial_out == 1) begin
                $display("STOP OK"); // start bit
                ok_bits = ok_bits + 1;
            end
            else begin
                $display("STOP NO_OK");
                failed_bits = failed_bits + 1;
             end                              
                             
       end   
         
       #(CLOCK_PERIOD)      
       if(serial_out == 0) begin
           $display("START OK"); // start bit
           ok_bits = ok_bits + 1;
       end
       else begin
           $display("START NO_OK");
           failed_bits = failed_bits + 1;
        end
              
        #(CLOCK_PERIOD)      
        if(serial_out == 1) begin
            $display("CTL TYPE OK"); // ctl type bit
            ok_bits = ok_bits + 1;
        end
        else begin
            $display("CTL TYPE NO_OK");
            failed_bits = failed_bits + 1;
         end
         
         #(CLOCK_PERIOD)      
         if(serial_out == 1) begin
             $display("CTL FIRST OK"); // ctl first bit
             ok_bits = ok_bits + 1;
         end
         else begin
             $display("CTL FIRST NO_OK");
             failed_bits = failed_bits + 1;
          end
        
                                   
       for( i = 3; i>=0  ; i=i-1 ) begin
       #(CLOCK_PERIOD); 
            if(serial_out == flags_template_1[k][i])begin
                $display("FLAGS OK"); // flags
                ok_bits = ok_bits + 1;
            end
            else begin
                 $display("FLAGS NO_OK");
                 failed_bits = failed_bits + 1;
             end                  
        end                                

       for( i = 2; i>=0  ; i=i-1 ) begin
       #(CLOCK_PERIOD); 
            if(serial_out == crc_template_1[k][i])begin
                $display("CRC OK"); // crc bit
                ok_bits = ok_bits + 1;
            end
            else begin
                $display("CRC NO_OK");
                failed_bits = failed_bits + 1;
            end            
        end                                
        
        #(CLOCK_PERIOD); 
        if(serial_out == 1) begin
            $display("STOP OK"); // stop bit
            ok_bits = ok_bits + 1;
        end
        else begin
            $display("STOP NO_OK");
            failed_bits = failed_bits + 1;
         end    
        
         $display("TEST1 SUMMARY: ");
         $display("OK BITS: %d", ok_bits);
         $display("FAILED BITS: %d", failed_bits);
         #(CLOCK_PERIOD);
end        

// ERRORS TESTS

for(k = 0; k< 3; k=k+1) begin   


        error_frame = {error_template[k], error_template[k]};
           
        data_in = data_template_1[k];
        alu_flags_in = flags_template_1[k];
        crc_in = crc_template_1[k];        
        crc_error = error_template[k][2];
        op_error = error_template[k][1];
        data_error = error_template[k][0];       
        req = 1;
        
                
      #(CLOCK_PERIOD) req = 0;          

  #(CLOCK_PERIOD); 
  if(serial_out == 1)begin
      $display("LATCH OK"); // wait 1 clk period to latch data
      ok_bits = ok_bits + 1;
  end
  else begin
      $display("LATCH NO_OK");
      failed_bits = failed_bits + 1;
  end    
            
    #(CLOCK_PERIOD)      
    if(serial_out == 0) begin
        $display("START OK"); // start bit
        ok_bits = ok_bits + 1;
    end
    else begin
        $display("START NO_OK");
        failed_bits = failed_bits + 1;
    end
       
    #(CLOCK_PERIOD)      
    if(serial_out == 1) begin
         $display("CTL TYPE OK"); // ctl type bit
        ok_bits = ok_bits + 1;
    end
    else begin
         $display("CTL TYPE NO_OK");
        failed_bits = failed_bits + 1;
    end
  
    #(CLOCK_PERIOD)      
    if(serial_out == 1) begin
          $display("CTL FIRST OK"); // ctl first bit
        ok_bits = ok_bits + 1;
    end
    else begin
          $display("CTL FIRST NO_OK");
        failed_bits = failed_bits + 1;
    end
 
                            
    for( i = 5; i>=0  ; i=i-1 ) begin
    #(CLOCK_PERIOD); 
         if(serial_out == error_frame[i])begin
             $display("ERR FLAGS OK"); // flags
            ok_bits = ok_bits + 1;
        end
        else begin
              $display("ERR FLAGS NO_OK");
            failed_bits = failed_bits + 1;
        end                  
    end         
    
    #(CLOCK_PERIOD)      
    if(serial_out == (^error_frame)^1) begin
          $display("CTL PARITY OK"); // ctl first bit
        ok_bits = ok_bits + 1;
    end
    else begin
          $display("CTL PARITY NO_OK");
        failed_bits = failed_bits + 1;
    end                       
                                
 
    #(CLOCK_PERIOD); 
    if(serial_out == 1) begin
         $display("STOP OK"); // stop bit
        ok_bits = ok_bits + 1;
    end
    else begin
         $display("STOP NO_OK");
        failed_bits = failed_bits + 1;
    end    
 
    $display("TEST1 SUMMARY: ");
    $display("OK BITS: %d", ok_bits);
    $display("FAILED BITS: %d", failed_bits);
    #(CLOCK_PERIOD);  
    
    reset = 1;
    #(CLOCK_PERIOD) reset = 0;
    
end            
            
        $display("SERIALIZER TEST FINISH");
        
        
            $finish;
        end     
endmodule
