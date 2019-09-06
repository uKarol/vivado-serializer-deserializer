`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2019 12:33:48
// Design Name: 
// Module Name: alu_core_test
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


module alu_core_test(
    
    
    );
    
    reg [31:0] data_a;
    reg [31:0] data_b;
    reg [2:0] command;
    wire [31:0] result;
    wire [3:0]  flags;
    wire op_err;
    wire [32:0] raw;
    wire [2:0]crc_out;
    wire ack;
    reg clock;
    reg reset;
    reg req;
    
    alu_core DUT(
        .a(data_a),
        .b(data_b),
        .ALUControl(command),
        .Result(result),
        .OP_Err(op_err),
        .ALUFlags(flags),
        .sum(raw),
             
        .clk(clock),
        .rst(reset),
        .req(req),
        .ack_in(1),
        .ack(ack), 
        .crc_out(crc_out)
            );
      
  
      
      localparam
        CLOCK_PERIOD = 5,
        FRAME_NUMBER = 6;
      
          integer i;
          integer passed_tests = 0;
          integer failed_tests = 0;
          
          reg [31:0]data_template_A [FRAME_NUMBER:0];
          reg [31:0]data_template_B [FRAME_NUMBER:0];
          reg [31:0]expected_result_add [FRAME_NUMBER:0];
          reg [3:0]expected_flag_add [FRAME_NUMBER:0];
          reg [31:0]expected_result_sub [FRAME_NUMBER:0];
          reg [3:0]expected_flag_sub [FRAME_NUMBER:0];
          reg [31:0]expected_result_and [FRAME_NUMBER:0];
          reg [3:0]expected_flag_and [FRAME_NUMBER:0];
          reg [31:0]expected_result_or [FRAME_NUMBER:0];
          reg [3:0]expected_flag_or [FRAME_NUMBER:0];
          
         //value assignment 
         
         initial 
         begin 
              clock = 1; 
              reset = 1;
              req = 0;
              #CLOCK_PERIOD reset = 0;
         end 
            
            // clock generation  
         always 
             #(CLOCK_PERIOD/2)  clock =  ! clock; 
      
      initial
      begin 
        // TEST FLAG
        // SCENARIUSZ 1 
        // OBIE LICZBY SA ZERAMI, ZOSTANIE WYSTAWIONA FLAGA 0
        data_template_A[0] =     32'b0; // przykladowa 32 bitowa wartosc A
        data_template_B[0] =     32'b0; // przykladowa 32 bitowa wartosc B
        expected_result_add[0] = 32'b0; // oczekiwany rezultat dla dodawania (32 bit)
        expected_flag_add[0] =    4'b0100; // oczewikane flagi po wykonaniu dodawania {neg, ZERO, carry, overflow}
        expected_result_sub[0] = 32'b0; // oczekiwany rezultat dla odejmowania (32 bit)
        expected_flag_sub[0]=     4'b0100; // oczewikane flagi po wykonaniu odejmowania {neg, ZERO, carry, overflow}
        expected_result_and[0] = 32'b0; // oczekiwany rezultat dla AND (32 bit)
        expected_flag_and[0]=     4'b0100; //  oczewikane flagi po wykonaniu AND {neg, ZERO, carry, overflow}
        expected_result_or[0]=   32'b0; // oczekiwany rezultat dla OR (32 bit)
        expected_flag_or[0]=      4'b0100; // oczewikane flagi po wykonaniu OR{neg, ZERO, carry, overflow}
        
        //SCENARIUSZ 2 (ujemna i dodatnia)
        //PIERWSZA LICZBA TO NAJMNIEJSZA UJEMNA DLA 32 BITOW 
        //DRUGA LICZBA TO 0XF
        // OCZEKIWANE FLAGI:
        // DODAWANE: NEGATIVE
        // ODEJMOWANIE: NEGATIVE
        // AND : NEGAIVE 
        // OR : NEGATIVE
        data_template_A[1] =     32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B[1] =     32'b1111;  // {neg, zero, carry, overflow};
        expected_result_add[1] = 32'b1110;
        expected_flag_add[1] =    4'b0010;
        expected_result_sub[1] = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        expected_flag_sub[1]=     4'b1000;
        expected_result_and[1] = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        expected_flag_and[1]=     4'b1000;
        expected_result_or[1]=   32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or[1]=      4'b1000;        

        //SCENARIUSZ 3 (ujemna + ujemna)
        //PIERWSZA LICZBA TO MAX DLA 32 BITOW (SIGNED)
        //DRUGA LICZBA TO max dla 32 bitow
        // OCZEKIWANE FLAGI:
        // DODAWANE: CARRY
        // ODEJMOWANIE: ZERO
        // AND : NEGAIVE 
        // OR : NEGATIVE
        data_template_A[2] =     32'b1000_0000_0000_0000_0000_0000_0000_0000;
        data_template_B[2] =     32'b1000_0000_0000_0000_0000_0000_0000_0000;  // {neg, zero, carry, overflow};
        expected_result_add[2] = 32'b0;
        expected_flag_add[2] =    4'b0110;
        expected_result_sub[2] = 32'b0;
        expected_flag_sub[2]=     4'b0100;
        expected_result_and[2] = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
        expected_flag_and[2]=     4'b1000;
        expected_result_or[2]=   32'b1000_0000_0000_0000_0000_0000_0000_0000;
        expected_flag_or[2]=      4'b1000;     
        
        //SCENARIUSZ 4 
        //PIERWSZA LICZBA TO NAJWIÊKSZA LICZBA DODATNIA DLA 32 BITOW 
        //DRUGA LICZBA TO NAJWIÊKSZA LICZBA DODATNIA DLA 32 BITOW
        // OCZEKIWANE FLAGI:
        // DODAWANE: OVERFLOW + NEGATIVE
        // ODEJMOWANIE: ZERO
        // AND : -
        // OR : -
        
        data_template_A[3] =     32'b0111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B[3] =     32'b0111_1111_1111_1111_1111_1111_1111_1111;  // {neg, zero, carry, overflow};
        expected_result_add[3] = 32'b1111_1111_1111_1111_1111_1111_1111_1110;
        expected_flag_add[3] =    4'b1001;
        expected_result_sub[3] = 32'b0;
        expected_flag_sub[3]=     4'b0100;
        expected_result_and[3] = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_and[3]=     4'b0000;
        expected_result_or[3]=   32'b0111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or[3]=      4'b0000;    
        
        //SCENARIUSZ 5 
        //PIERWSZA LICZBA TO NAJWIÊKSZA LICZBA DLA 32 BITOW 
        //DRUGA LICZBA TO NAJWIÊKSZA LICZBA DODATNIA DLA 32 BITOW
        // OCZEKIWANE FLAGI: 
        // DODAWANE: NEGATIVE
        // ODEJMOWANIE: CARRY + NEGATIVE 
        // AND : -
        // OR : -
        
        data_template_A [4] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B [4] = 32'b0111_1111_1111_1111_1111_1111_1111_1111;  // {neg, zero, carry, overflow};
        expected_result_add [4] = 32'b0111_1111_1111_1111_1111_1111_1111_1110;
        expected_flag_add [4] = 4'b0010;
        expected_result_sub [4] = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
        expected_flag_sub [4]= 4'b1000;
        expected_result_and [4] = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_and [4]= 4'b0000;
        expected_result_or [4]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [4]= 4'b1000;        

        data_template_A [5] = 32'b1111;
        data_template_B [5] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;  // {neg, zero, carry, overflow};
        expected_result_add [5] = 32'b1110;
        expected_flag_add [5] = 4'b0010;
        expected_result_sub [5] = 32'b10000;
        expected_flag_sub [5]= 4'b0010;
        expected_result_and [5] = 32'b1111;
        expected_flag_and [5]= 4'b0000;
        expected_result_or [5]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [5]= 4'b1000;   
        
        data_template_A [6] = 32'b0;
        data_template_B [6] = 32'b0;
        expected_result_add [6] = 32'b0;
        expected_flag_add [6] = 4'b0100;
        expected_result_sub [6] = 32'b0;
        expected_flag_sub [6]= 4'b0100;
        expected_result_and [6] = 32'b0;
        expected_flag_and [6]= 4'b0100;
        expected_result_or [6]= 32'b0;
        expected_flag_or [6]= 4'b0100;
        
        data_template_A [7] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B [7] = 32'b1111;  // {neg, zero, carry, overflow};
        expected_result_add [7] = 32'b1110;
        expected_flag_add [7] = 4'b0010;
        expected_result_sub [7] = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        expected_flag_sub [7]= 4'b1000;
        expected_result_and [7] = 32'b1111;
        expected_flag_and [7]= 4'b1000;
        expected_result_or [7]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [7]= 4'b1000;        

        data_template_A [8] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B [8] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;  // {neg, zero, carry, overflow};
        expected_result_add [8] = 32'b1111_1111_1111_1111_1111_1111_1111_1110;
        expected_flag_add [8] = 4'b1010;
        expected_result_sub [8] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_sub [8]= 4'b1000;
        expected_result_and [8] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_and [8]= 4'b1000;
        expected_result_or [8]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [8]= 4'b1000;   
        
        data_template_A [9] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B [9] = 32'b1111;  // {neg, zero, carry, overflow};
        expected_result_add [9] = 32'b1110;
        expected_flag_add [9] = 4'b0010;
        expected_result_sub [9] = 32'b1111_1111_1111_1111_1111_1111_1111_0000;
        expected_flag_sub [9]= 4'b1000;
        expected_result_and [9] = 32'b1111;
        expected_flag_and [9]= 4'b1000;
        expected_result_or [9]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [9]= 4'b1000;        

        data_template_A [10] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        data_template_B [10] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;  // {neg, zero, carry, overflow};
        expected_result_add [10] = 32'b1111_1111_1111_1111_1111_1111_1111_1110;
        expected_flag_add [10] = 4'b0010;
        expected_result_sub [10] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_sub [10]= 4'b1000;
        expected_result_and [10] = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_and [10]= 4'b1000;
        expected_result_or [10]= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        expected_flag_or [10]= 4'b1000;   
        
      
      end
          
          
          
      initial 
      begin
        
        $display("ADDITION TEST");
        command = 3'b100;
        for( i = 0; i< FRAME_NUMBER; i= i+1)
        begin
             #CLOCK_PERIOD;
             data_a = data_template_A[i];
             data_b = data_template_B[i];
             req = 1;
             #CLOCK_PERIOD;
             req = 0;
             #(2*CLOCK_PERIOD);
     /*        $display("Test step %d", i);
             $display("Data_in A: %d" ,  data_template_A[i]  );
             $display("Data_in A: %d" ,  data_template_B[i]  );
             
             $display("RESULT: %d" ,  result );
             $display("FLAGS: %d", flags );*/
        if((result == expected_result_add[i])&&(flags == expected_flag_add[i])&&(op_err==0) )begin
                passed_tests = passed_tests+1;
                $display("TEST_PASSED");
             end 
             else begin
                failed_tests = failed_tests+1;
                $display("TEST_FAILED");
             end   
             #CLOCK_PERIOD;         
        end
        
        $display("SUBTRACTION TEST");
        command = 3'b101;
        for( i = 0; i< FRAME_NUMBER; i= i+1)
        begin
            data_a = data_template_A[i];
            data_b = data_template_B[i];
            req = 1;
            #CLOCK_PERIOD;
            req = 0;
            #(2*CLOCK_PERIOD);
       /*     $display("Test step %d", i);
            $display("Data_in A: %d" ,  data_template_A[i]  );
            $display("Data_in A: %d" ,  data_template_B[i]  );
            
            $display("RESULT: %d" ,  result );
            $display("FLAGS: %d", flags );
            $display("EXPECTED RESULT ", expected_result_sub[i] );
            $display("EXPECTED FLAGS: %d", expected_flag_sub[i]);*/
             if((result == expected_result_sub[i])&&(flags == expected_flag_sub[i])&&(op_err==0) )begin
                passed_tests = passed_tests+1;
                $display("TEST_PASSED");
             end 
             else begin
                failed_tests = failed_tests+1;
                $display("TEST_FAILED");
             end
              #CLOCK_PERIOD;            
        end
        
        $display("AND TEST");
        command = 3'b000;
        for( i = 0; i< FRAME_NUMBER; i= i+1)
        begin
             data_a = data_template_A[i];
             data_b = data_template_B[i];
             req = 1;
             #CLOCK_PERIOD;
             req = 0;
             #(2*CLOCK_PERIOD);
             if((result == expected_result_and[i])&&(flags == expected_flag_and[i])&&(op_err==0) )begin
                passed_tests = passed_tests+1;
                $display("TEST_PASSED");
             end 
             else begin
                failed_tests = failed_tests+1;
                $display("TEST_FAILED");
             end  
             #CLOCK_PERIOD;          
        end
        
        $display("OR TEST");
        command = 3'b001;
        for( i = 0; i< FRAME_NUMBER; i= i+1)
        begin
           data_a = data_template_A[i];
           data_b = data_template_B[i];
            req = 1;
            #CLOCK_PERIOD;
            req = 0;
            #(2*CLOCK_PERIOD);
   
             
             if((result == expected_result_or[i])&&(flags == expected_flag_or[i])&&(op_err==0) )begin
                passed_tests = passed_tests+1;
                $display("TEST_PASSED");
             end 
             else begin
                failed_tests = failed_tests+1;
                $display("TEST_FAILED");
             end     
             #CLOCK_PERIOD;       
        end
        
      end
      
      

    
    
endmodule
