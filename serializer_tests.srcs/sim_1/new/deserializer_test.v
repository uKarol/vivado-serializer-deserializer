`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  AGH UST
// Engineer: Karol Ujda
// 
// Create Date: 01.08.2019 11:18:21
// Design Name: 
// Module Name: deserializer_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Test case 1: valid frame
// Test case 2: frame with invalid stop bit
// Test case 3: valid frame
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module deserializer_test(

    );
    
    reg clock, serial_data, reset; 
    wire [31:0] data_out_A;
    wire [31:0] data_out_B;
    wire ack_test;
    wire frame_error; 
    
    wire [31:0] temp_data;
    wire [5:0] temp_state;
    wire [5:0] bit_ctr;
    wire [3:0] ovs_ctr;
    
    wire [2:0] opcode_test;
    wire [3:0] crc_test;
    
    deserializer_core_32 DUT(    
        .clk(clock),
        .rst(reset),
        .serial_in(serial_data), 
        .data_out_A( data_out_A ),
        .data_out_B(data_out_B),
        .ack(ack_test),
        .frame_error(frame_error),
        
        .opcode(opcode_test),
        .crc(crc_test),
        
        .parallel_data_A(temp_data),
        .oversample_counter(ovs_ctr),
        .des_state(temp_state),
        .bit_counter(bit_ctr)

    );
    
    localparam 
        CLOCK_PERIOD = 10,
        OVERSAMPLING_SAMPLES = 16,
        BIT_SAMPLING_CYCLES = CLOCK_PERIOD*OVERSAMPLING_SAMPLES,        
        FRAME_SIZE = 10,
        FRAME_NUMBER = 8;
    
    
    
    integer i; // loop counter
    integer j;
   // serial frame format: [ 0, packet type, packet pits, stop ] 
    reg [FRAME_SIZE:0]serial_template_1 [FRAME_NUMBER:0];
    reg [FRAME_SIZE:0]serial_template_2 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE:0]serial_template_3 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE:0]serial_template_4 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE:0]serial_template_5 [FRAME_NUMBER:0];
    reg [FRAME_SIZE:0]serial_template_6 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE:0]serial_template_7 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE+1:0]serial_template_8 [FRAME_NUMBER:0]; 
    reg [FRAME_SIZE:0]serial_template_9 [FRAME_NUMBER:0]; 

    // DATA FRAMES 
    
    initial
    begin
        
        // TEST 1 ARRAYS INIT
    
        serial_template_1[0] = 11'b0_0_1010_1010_1; // valid frame
        serial_template_1[1] = 11'b0_0_1111_0000_1; // valid frame
        serial_template_1[2] = 11'b0_0_1100_1100_1; // valid frame 
        serial_template_1[3] = 11'b0_0_0011_0101_1; // valid frame 
        serial_template_1[4] = 11'b0_0_1001_0101_1; // valid frame 
        serial_template_1[5] = 11'b0_0_0000_0101_1; // valid frame 
        serial_template_1[6] = 11'b0_0_0001_0100_1; // valid frame 
        serial_template_1[7] = 11'b0_0_0010_1111_1; // valid frame 
        serial_template_1[8] = 11'b0_1_1_000_1010_1; // valid frame
        
        //TEST 2 ARRAYS INIT
        
        serial_template_2[0]  = 11'b0_0_1010_1010_1; // valid frame
        serial_template_2[1]  = 11'b0_0_1111_0010_1; // valid frame
        serial_template_2[2]  = 11'b0_0_1101_1100_1; // valid frame 
        serial_template_2[3]  = 11'b0_0_1011_0101_1; // valid frame 
        serial_template_2[4]  = 11'b0_0_1001_0101_1; // valid frame 
        serial_template_2[5]  = 11'b0_0_1000_0101_1; // valid frame 
        serial_template_2[6]  = 11'b0_0_0101_0100_1; // valid frame 
        serial_template_2[7]  = 11'b0_0_1010_1011_1; // valid frame 
        serial_template_2[8]  = 11'b0_1_1_101_1011_1; // valid frame
               
        //TEST 3 ARRAYS INIT
        
        serial_template_3[0]  = 11'b0_0_0001_1101_1; // valid frame
        serial_template_3[1]  = 11'b0_0_0100_1010_1; // valid frame
        serial_template_3[2]  = 11'b0_0_1001_0100_1; // valid frame 
        serial_template_3[3]  = 11'b0_0_0001_0010_1; // valid frame 
        serial_template_3[4]  = 11'b0_0_0011_1001_1; // valid frame 
        serial_template_3[5]  = 11'b0_0_1011_1100_1; // valid frame 
        serial_template_3[6]  = 11'b0_0_1110_1001_1; // valid frame 
        serial_template_3[7]  = 11'b0_0_0100_0000_1; // valid frame 
        serial_template_3[8]  = 11'b0_1_1_001_0110_1; // valid frame
                
        //TEST 4 ARRAYS INIT
        
        serial_template_4[0]  = 11'b0_0_0001_1101_1; // valid frame
        serial_template_4[1]  = 11'b0_0_0100_1010_1; // valid frame
        serial_template_4[2]  = 11'b0_0_1001_0100_1; // valid frame 
        serial_template_4[3]  = 11'b0_0_0001_0010_1; // valid frame 
        serial_template_4[4]  = 11'b0_0_0011_1001_1; // valid frame 
        serial_template_4[5]  = 11'b0_0_1011_1100_1; // valid frame 
        serial_template_4[6]  = 11'b0_0_1110_1001_1; // valid frame 
        serial_template_4[7]  = 11'b0_0_0100_0000_1; // valid frame 
        serial_template_4[8]  = 11'b0_0_1_001_0110_1; // invalid command frame
        
        // TEST 5 ARRAYS INIT - too few frames
    
        serial_template_5[0] = 11'b0_0_1010_1010_1; // valid frame
        serial_template_5[1] = 11'b0_0_1111_0000_1; // valid frame
        serial_template_5[2] = 11'b0_0_1100_1100_1; // valid frame 
        serial_template_5[3] = 11'b0_0_0011_0101_1; // valid frame 
        serial_template_5[4] = 11'b0_0_1001_0101_1; // valid frame 
        serial_template_5[5] = 11'b0_0_0000_0101_1; // valid frame 
        serial_template_5[6] = 11'b0_0_0001_0100_1; // valid frame  
        serial_template_5[7] = 11'b0_1_1_000_1010_1; // valid frame
        
        //TEST 6 ARRAYS INIT 
        
        serial_template_6[0]  = 11'b0_0_1010_1010_0; // invalid stop bit
        serial_template_6[1]  = 11'b0_0_1111_0010_1; // valid frame
        serial_template_6[2]  = 11'b0_0_1101_1100_1; // valid frame 
        serial_template_6[3]  = 11'b0_0_1011_0101_1; // valid frame 
        serial_template_6[4]  = 11'b0_0_1001_0101_1; // valid frame 
        serial_template_6[5]  = 11'b0_0_1000_0101_1; // valid frame 
        serial_template_6[6]  = 11'b0_0_0101_0100_1; // valid frame 
        serial_template_6[7]  = 11'b0_0_1010_1011_1; // valid frame 
        serial_template_6[8]  = 11'b0_1_0_101_1011_1; // invalid command frame
               
        //TEST 7 ARRAYS INIT
        
        serial_template_7[0]  = 11'b0_0_0001_1101_1; // valid frame
        serial_template_7[1]  = 11'b0_0_0100_1010_1; // valid frame
        serial_template_7[2]  = 11'b0_0_1001_0100_1; // valid frame 
        serial_template_7[3]  = 11'b0_0_0001_0010_1; // valid frame 
        serial_template_7[4]  = 11'b0_1_0011_1001_1; // invalid data frame 
        serial_template_7[5]  = 11'b0_0_1011_1100_1; // valid frame 
        serial_template_7[6]  = 11'b0_0_1110_1001_1; // valid frame 
        serial_template_7[7]  = 11'b0_0_0100_0000_1; // valid frame 
        serial_template_7[8]  = 11'b0_1_1_001_0110_1; // valid frame
                
        //TEST 8 ARRAYS INIT - too many frames
        
        serial_template_8[0]  = 11'b0_0_0001_1101_1; // valid frame
        serial_template_8[1]  = 11'b0_0_0100_1010_1; // valid frame
        serial_template_8[2]  = 11'b0_0_1001_0100_1; // valid frame 
        serial_template_8[3]  = 11'b0_0_0001_0010_1; // valid frame 
        serial_template_8[4]  = 11'b0_0_0011_1001_1; // valid frame 
        serial_template_8[5]  = 11'b0_0_1011_1100_1; // valid frame 
        serial_template_8[6]  = 11'b0_0_1110_1001_1; // valid frame 
        serial_template_8[7]  = 11'b0_0_0100_0000_1; // valid frame 
        serial_template_8[8]  = 11'b0_0_0100_0000_1; // additional valid frame
        serial_template_8[9]  = 11'b0_1_1_001_0110_1; // valid command frame
        
       //TEST 9 ARRAYS INIT
        
        serial_template_9[0]  = 11'b0_0_0001_1101_1; // valid frame
        serial_template_9[1]  = 11'b0_0_0100_1010_1; // valid frame
        serial_template_9[2]  = 11'b0_0_1001_0100_1; // valid frame 
        serial_template_9[3]  = 11'b0_0_0001_0010_1; // valid frame 
        serial_template_9[4]  = 11'b0_0_0011_1001_1; // valid frame 
        serial_template_9[5]  = 11'b0_0_1011_1100_1; // valid frame 
        serial_template_9[6]  = 11'b0_0_1110_1001_1; // valid frame 
        serial_template_9[7]  = 11'b0_0_0100_0000_1; // valid frame 
        serial_template_9[8]  = 11'b0_1_1_001_0110_1; // valid frame
        
        
        
    
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
   
    initial begin 
   
        serial_data = 1;
        
        // test case 1
        // valid frame
      
        //TEST 1      
        
        for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
            #CLOCK_PERIOD $display("TEST 1, serial data in: %b", serial_template_1[j][8:1]);
            for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                serial_data = serial_template_1[j][i];
                #BIT_SAMPLING_CYCLES;                       
            end           
        end          
        $display("TESTS RESULTS : ");
        $display("DATA A : %b", data_out_A); 
        $display("DATA B : %b", data_out_B);       
        $display("opcode %b, crc %b", opcode_test, crc_test);   
        
        if( data_out_A == {serial_template_1[0][8:1], serial_template_1[1][8:1], serial_template_1[2][8:1], serial_template_1[3][8:1] } )    $display("DATA A PASSED");  
        else $display("TEST 1 DATA A FAILED"); 
        
        if( data_out_B == {serial_template_1[4][8:1], serial_template_1[5][8:1], serial_template_1[6][8:1], serial_template_1[7][8:1] } )    $display("DATA B PASSED");
        else $display("TEST 1 DATA A FAILED"); 
        
        if(( opcode_test == serial_template_1[8][7:5] ) && ( crc_test == serial_template_1[8][4:1])) $display("CMD TEST 1 PASSED");
        else $display("CMD TEST 1 FAILED");
        
       // TEST 2        
        
        for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
            #CLOCK_PERIOD $display("TEST 2, serial data in: %b", serial_template_2[j][8:1]);
            for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                serial_data = serial_template_2[j][i];
                #BIT_SAMPLING_CYCLES;                       
            end           
        end                

        $display("TESTS RESULTS : ");
        $display("opcode %b, crc %b", opcode_test, crc_test);  
        $display("DATA A : %b", data_out_A); 
        $display("DATA B : %b", data_out_B);           
         
        if( data_out_A == {serial_template_2[0][8:1], serial_template_2[1][8:1], serial_template_2[2][8:1], serial_template_2[3][8:1] } )     $display("DATA A PASSED");  
        else $display("TEST 2 DATA A FAILED"); 
        
        if( data_out_B == {serial_template_2[4][8:1], serial_template_2[5][8:1], serial_template_2[6][8:1], serial_template_2[7][8:1] } )     $display("DATA B PASSED");
        else $display("TEST 2 DATA B FAILED"); 
        
        if(( opcode_test == serial_template_2[8][7:5] ) && ( crc_test == serial_template_2[8][4:1])) $display("CMD TEST 2 PASSED");
        else $display("CMD TEST 2 FAILED");
              
        // TEST 3        
                
        for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
            #CLOCK_PERIOD $display("TEST 3, serial data in: %b", serial_template_3[j][8:1]);
            for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                serial_data = serial_template_3[j][i];
                #BIT_SAMPLING_CYCLES;                       
            end           
        end                
        
        $display("TESTS RESULTS : ");
        $display("opcode %b, crc %b", opcode_test, crc_test);  
        $display("DATA A : %b", data_out_A); 
        $display("DATA B : %b", data_out_B);           
                 
        if( data_out_A == {serial_template_3[0][8:1], serial_template_3[1][8:1], serial_template_3[2][8:1], serial_template_3[3][8:1] } )     $display("DATA A PASSED");  
        else $display("TEST 3 DATA A FAILED"); 
                
        if( data_out_B == {serial_template_3[4][8:1], serial_template_3[5][8:1], serial_template_3[6][8:1], serial_template_3[7][8:1] } )     $display("DATA B PASSED");
        else $display("TEST 3 DATA B FAILED"); 
                
        if(( opcode_test == serial_template_3[8][7:5] ) && ( crc_test == serial_template_3[8][4:1])) $display("CMD TEST 3 PASSED");
        else $display("CMD TEST 3 FAILED");
        
        
        
        // TEST 4        
                
        for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
            #CLOCK_PERIOD $display("TEST 4, serial data in: %b", serial_template_4[j][8:1]);
            for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                serial_data = serial_template_4[j][i];
                #BIT_SAMPLING_CYCLES;         
                            
            end           
        end                
        
        if( frame_error == 1) begin
            reset = 1;   
            #CLOCK_PERIOD reset = 0;        
            $display("TEST 4 PASSED - ERROR EXPECTED");
        end 
        else 
            $display("TEST 4 FAILED - ERROR EXPECTED");
            
            
        // TEST 5        
                    
            for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
                #CLOCK_PERIOD $display("TEST 5, serial data in: %b", serial_template_5[j][8:1]);
                for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                    serial_data = serial_template_5[j][i];
                    #BIT_SAMPLING_CYCLES;         
                            
                end           
            end                
            
            if( frame_error == 1) begin
                reset = 1;   
                #CLOCK_PERIOD reset = 0;        
                $display("TEST 5 PASSED - ERROR EXPECTED");
            end 
            else 
                $display("TEST 5 FAILED - ERROR EXPECTED");  
                
                          
        // TEST 6        
                        
                for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
                    #CLOCK_PERIOD $display("TEST 6, serial data in: %b", serial_template_6[j][8:1]);
                    for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                        serial_data = serial_template_6[j][i];
                        #BIT_SAMPLING_CYCLES;         
                          
                    end           
                end                
                
                if( frame_error == 1) begin
                    reset = 1;   
                    #CLOCK_PERIOD reset = 0;        
                    $display("TEST 6 PASSED - ERROR EXPECTED");
                end 
                else 
                    $display("TEST 6 FAILED - ERROR EXPECTED");            
     
        // TEST 7        
                            
                    for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
                        #CLOCK_PERIOD $display("TEST 7, serial data in: %b", serial_template_7[j][8:1]);
                        for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                            serial_data = serial_template_7[j][i];
                            #BIT_SAMPLING_CYCLES;         
                                     
                        end           
                    end                
                    
                    if( frame_error == 1) begin
                        reset = 1;   
                        #CLOCK_PERIOD reset = 0;        
                        $display("TEST 7 PASSED - ERROR EXPECTED");
                    end 
                    else 
                        $display("TEST 7 FAILED - ERROR EXPECTED");     
     

        // TEST 8        
                
        for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
            #CLOCK_PERIOD $display("TEST 8, serial data in: %b", serial_template_8[j][8:1]);
            for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                serial_data = serial_template_8[j][i];
                #BIT_SAMPLING_CYCLES;         
            end           
        end                
        
        if( frame_error == 1) begin
            reset = 1;   
            #CLOCK_PERIOD reset = 0;        
            $display("TEST 8 PASSED - ERROR EXPECTED");
        end 
        else 
            $display("TEST 8 FAILED - ERROR EXPECTED");
            
            
           // TEST 9        
                    
            for( j = 0 ; j <= FRAME_NUMBER; j = j+1) begin
                #CLOCK_PERIOD $display("TEST 9, serial data in: %b", serial_template_9[j][8:1]);
                for( i = FRAME_SIZE ; i>=0  ; i=i-1 ) begin
                    serial_data = serial_template_9[j][i];
                    #BIT_SAMPLING_CYCLES;                       
                end           
            end                
            
            $display("TESTS RESULTS : ");
            $display("opcode %b, crc %b", opcode_test, crc_test);  
            $display("DATA A : %b", data_out_A); 
            $display("DATA B : %b", data_out_B);           
                     
            if( data_out_A == {serial_template_9[0][8:1], serial_template_9[1][8:1], serial_template_9[2][8:1], serial_template_9[3][8:1] } )     $display("DATA A PASSED");  
            else $display("TEST 9 DATA A FAILED"); 
                    
            if( data_out_B == {serial_template_9[4][8:1], serial_template_9[5][8:1], serial_template_9[6][8:1], serial_template_9[7][8:1] } )     $display("DATA B PASSED");
            else $display("TEST 9 DATA B FAILED"); 
                    
            if(( opcode_test == serial_template_9[8][7:5] ) && ( crc_test == serial_template_9[8][4:1])) $display("CMD TEST 9 PASSED");
            else $display("CMD TEST 9 FAILED");    
            
                                          
        $finish;
    end
    
    
    
endmodule
