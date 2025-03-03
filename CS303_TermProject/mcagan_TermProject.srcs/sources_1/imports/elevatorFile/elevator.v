`timescale 1ns / 1ps

module elevator(

input clk_50hz, rst,

floor_0_p,
floor_1_p,
floor_2_p,
floor_3_p,
floor_4_p,

direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
floor_4_d,

output reg led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

reg [7:0] a,b,c,d,e,f,g,p

);
    
//***********Your code goes here**************//
parameter IDLE = 3'b001 , UP = 3'b010 , DOWN = 3'b011;
parameter floor_0 = 3'b001 , floor_1 = 3'b010 , floor_2 = 3'b011, floor_3 = 3'b100, floor_4 = 3'b101;

reg [2:0] status = IDLE; 
reg [2:0] floor = floor_0 ;//elevator floor
reg moving = 0;
reg elevCntOut = 0;
reg [32:0]counter = 0 ;






always @ ( posedge clk_50hz, negedge rst) begin
    if(rst==0)begin
        elevCntOut <= 0;
        counter <= 0 ;
        
    end

    
    else begin
    if ( status != IDLE) begin 
            counter <= counter+1;
            
        end
        else begin
            elevCntOut <= 0;
            counter <= 0 ;
        end
        if ( counter ==250) 
         begin 
         elevCntOut <= ~elevCntOut;
         counter <= 0;
         end   
         
         else begin end
     end
end


always @ ( posedge clk_50hz, negedge rst ) begin
    if (rst == 0) begin
        status = IDLE;
        led_outside_0 = 0;
        led_outside_1 = 0;
        led_outside_2 = 0;
        led_outside_3 = 0;
        led_outside_4 = 0;
        led_inside_0 = 0;
        led_inside_1 = 0;
        led_inside_2 = 0;
        led_inside_3 = 0;
        led_inside_4 = 0;
        a[7:0]=8'b11110110;
        b[7:0]=8'b11001110;
        c[7:0]=8'b11001110;
        d[7:0]=8'b11101010; 
        e[7:0]=8'b11100010; 
        f[7:0]=8'b11110010;
        g[7:0]=8'b11100111; 
        p[7:0]=8'b11111111;
        end
    else begin
        if (status == IDLE) begin
            if (floor_0_p == 1 )begin
                if (floor_0 < floor) begin
                    led_outside_0 = 1;
                    status = DOWN;
                end
                else begin
                led_outside_0 = 0;
                 end

            end
            else if(floor_1_p == 1)begin
                if (floor_1 < floor) begin  
                    status = DOWN;
                    led_outside_1 = 1;
                end
                else if (floor_1 > floor) begin 
                    status = UP;
                    led_outside_1 = 1;
                end
                else begin 
                led_outside_1 = 0;
                end

            end
            else if(floor_2_p == 1)begin
                    if (floor_2 < floor) begin 
             
                    status = DOWN;
                    led_outside_2 = 1; 
                end
                else if (floor_2 > floor) begin
              
                    status = UP;
                    led_outside_2 = 1;
                end
                else begin
                 led_outside_2 = 0;
                 end

                end
            else if(floor_3_p == 1)begin
                if (floor_3 < floor) begin 
           
                    status = DOWN;
                    led_outside_3 = 1;
                end
                else if (floor_3 > floor) begin
    
                    status = UP;
                    led_outside_3 = 1;
                end
                else begin
                led_outside_3 = 0;
                 end

            end
            else if(floor_4_p == 1)begin
                if (floor_4 > floor) begin
       
                     status = UP; 
                     led_outside_4 = 1;                 
                end
                else begin 
                led_outside_4 = 0;
                end
            end
            else begin end
            
            
            
            
            
       if (floor_0_d == 1)begin
               if (floor_0 < floor) begin
                   status = DOWN;
                   led_inside_0 = 1;
               end
               else begin
               led_inside_0 = 0;
                end

           end
           else if(floor_1_d == 1)begin
               if (floor_1 < floor) begin  
                   status = DOWN;
                   led_inside_1 = 1;
               end
               else if (floor_1 > floor) begin 
                   status = UP;
                   led_inside_1 = 1;
               end
               else begin 
               led_inside_1 = 0;
               end

           end
           else if(floor_2_d == 1)begin
                   if (floor_2 < floor) begin 
            
                   status = DOWN;
                   led_inside_2 = 1; 
               end
               else if (floor_2 > floor) begin
             
                   status = UP;
                   led_inside_2 = 1;
               end
               else begin
                led_inside_2 = 0;
                end

               end
           else if(floor_3_d == 1)begin
               if (floor_3 < floor) begin 
          
                   status = DOWN;
                   led_inside_3 = 1;
               end
               else if (floor_3 > floor) begin
   
                   status = UP;
                   led_inside_3 = 1;
               end
               else begin
               led_inside_3 = 0;
                end

           end
           else if(floor_4_d == 1)begin
               if (floor_4 > floor) begin
      
                    status = UP; 
                    led_inside_4 = 1;                 
               end
               else begin 
               led_inside_4 = 0;
               end
           end
           else begin end

        end
        
        
        
        
        
        
        else begin end
        
        
        
        
        if (status == UP) begin
            if (floor_0_p == 1)begin
            end
            
            else if(floor_1_p == 1)begin
                if ((led_outside_2 || led_outside_3 || led_outside_4  || led_inside_2 || led_inside_3 || led_inside_4) && floor_1 > floor && direction_1 == 1) begin 
                   led_outside_1 = 1;
                end

                else begin end
    
            end
            else if(floor_2_p == 1)begin
                    if ( ( led_outside_3 || led_outside_4 || led_inside_3 || led_inside_4 ) && floor_2 > floor && direction_2 == 1) begin 
                    led_outside_2 = 1;
                end

                else begin end
    
                end
            else if(floor_3_p == 1)begin
                if (  (led_outside_4|| led_inside_4) && (floor_3 > floor) && (direction_3 == 1)) begin 
                    led_outside_3 = 1;
                end

                else begin end
    
            end
            else if(floor_4_p == 1)begin
    
            end
            else begin end
            
            
            
            if (floor_0_d == 1)begin
                end
                
            else if(floor_1_d == 1)begin
                if ((led_outside_2 || led_outside_3 || led_outside_4  ||led_inside_2 || led_inside_3 || led_inside_4 ) && floor_1 > floor ) begin 
                   led_inside_1 = 1;
                end

                else begin end
    
            end
            else if(floor_2_d == 1)begin
                    if ( (led_outside_3 || led_outside_4  || led_inside_3 || led_inside_4 ) && floor_2 > floor) begin 
                    led_inside_2 = 1;
                end

                else begin end
    
                end
            else if(floor_3_d == 1)begin
                if (  (led_outside_4  ||led_inside_4) && (floor_3 > floor) ) begin 
                    led_inside_3 = 1;
                end

                else begin end
    
            end
            else if(floor_4_d == 1)begin
    
            end
            else begin end
        end
        else begin end
        
        
        
        
        
        
        
        
        
        if (status == DOWN) begin
            if (floor_0_p == 1)begin
            end
            
            else if(floor_1_p == 1)begin
                if ((led_outside_0 ||led_inside_0 ) && floor_1 < floor && direction_1 == 0) begin 
                   led_outside_1 = 1;
                end

                else begin end
    
            end
            else if(floor_2_p == 1)begin
                if ((led_outside_0 || led_outside_1 ||led_inside_0 || led_inside_1 ) && floor_2 < floor && direction_2 == 0) begin 
                    led_outside_2 = 1;
                end

                else begin end
    
            end
            else if(floor_3_p == 1)begin
                if ((led_outside_0 || led_outside_1 || led_outside_2 || led_inside_0 || led_inside_1 || led_inside_2 ) && floor_3 < floor && direction_3 == 0) begin 
                    led_outside_3 = 1;
                end

                else begin end
    
            end
            else if(floor_4_p == 1)begin
                if ( floor_4 < floor) begin
                 
                end
                else begin end
    
            end
            else begin end
        
               if (floor_0_d == 1)begin
                    end
                    
                    else if(floor_1_d == 1)begin
                        if (( led_outside_0 ||led_inside_0  ) && floor_1 < floor ) begin 
                           led_inside_1 = 1;
                        end
        
                        else begin end
            
                    end
                    else if(floor_2_d == 1)begin
                        if ((led_outside_0 || led_outside_1 ||led_inside_0 || led_inside_1  ) && floor_2 < floor ) begin 
                            led_inside_2 = 1;
                        end
        
                        else begin end
            
                        end
                    else if(floor_3_d == 1)begin
                        if ((led_outside_0 || led_outside_1 || led_outside_2 || led_inside_0 || led_inside_1 || led_inside_2 ) && floor_3 < floor) begin 
                            led_inside_3 = 1;
                        end
        
                        else begin end
            
                    end
                    else if(floor_4_d == 1)begin
                        if (floor_4 > floor) begin
                         
                        end
                        else begin end
            
                    end
                else begin end                
            end
            
        
        
        
        else begin end
        if (moving == 0) begin
                
                    if (    ( (led_outside_0 == 1)) ||  
                        ( (led_outside_1 == 1)) ||
                         ( (led_outside_2 == 1)) ||
                          ((led_outside_3 == 1)) ||
                           ( (led_outside_4 == 1)) ||
                           
                            ( (led_inside_0 == 1)) ||  
                                      ( (led_inside_1 == 1)) ||
                                       ( (led_inside_2 == 1)) ||
                                        ((led_inside_3 == 1)) ||
                                         ( (led_inside_4 == 1))   )begin
                                         
                    end
                    else begin
                      status = IDLE;
                      if (floor == floor_0) begin 
                      a[7:0]=8'b11110110;
                      b[7:0]=8'b11001110;
                      c[7:0]=8'b11001110;
                      d[7:0]=8'b11101010;
                      e[7:0]=8'b11100010;
                      f[7:0]=8'b11110010;
                      g[7:0]=8'b11100111;
                      p[7:0]=8'b11111111;
                      
                      end
                      else if(floor == floor_1) begin
                      a[7:0]=8'b11110111;
                      b[7:0]=8'b11001110;
                      c[7:0]=8'b11001110;
                      d[7:0]=8'b11101011;
                      e[7:0]=8'b11100011;
                      f[7:0]=8'b11110011;
                      g[7:0]=8'b11100111;
                      p[7:0]=8'b11111111;
                      end
                      else if(floor == floor_2) begin
                      a[7:0]=8'b11110110;
                      b[7:0]=8'b11001110;
                      c[7:0]=8'b11001111;
                      d[7:0]=8'b11101010;
                      e[7:0]=8'b11100010;
                      f[7:0]=8'b11110011;
                      g[7:0]=8'b11100110;
                      p[7:0]=8'b11111111;
        
                      end
                      else if(floor == floor_3) begin
                      a[7:0]=8'b11110110;
                      b[7:0]=8'b11001110;
                      c[7:0]=8'b11001110;
                      d[7:0]=8'b11101010;
                      e[7:0]=8'b11100011;
                      f[7:0]=8'b11110011;
                      g[7:0]=8'b11100110;
                      p[7:0]=8'b11111111;
                      end
                      else if(floor == floor_4) begin
                      a[7:0]=8'b11110111;
                      b[7:0]=8'b11001110;
                      c[7:0]=8'b11001110;
                      d[7:0]=8'b11101011;
                      e[7:0]=8'b11100011;
                      f[7:0]=8'b11110010;
                      g[7:0]=8'b11100110;
                      p[7:0]=8'b11111111;
                      end
                      else begin end
                                    
                      
                      
                     end
            
                end 
                else  begin //&& (led_outside_0 == 1)
                    if((floor == floor_0))
                    begin 
                        
                        led_outside_0 =  0;
                        if (status == UP)
                        begin
                        a[7:0]=8'b11100110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11011110;
                        d[7:0]=8'b11011010;
                        e[7:0]=8'b11000010;
                        f[7:0]=8'b11000010;
                        g[7:0]=8'b11100111;
                        p[7:0]=8'b11111111;
        
                        end
                        else if(status == DOWN)
                        begin
                            
                        a[7:0]=8'b11000110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11001110;
                        d[7:0]=8'b11001010;
                        e[7:0]=8'b11000010;
                        f[7:0]=8'b11000010;
                        g[7:0]=8'b11110111;
                        p[7:0]=8'b11111111;
        
                        end
                        else begin end
                end
                else if((floor == floor_1))
                begin 
                    
                    led_outside_1 =  0;
                    if (status == UP)
                    begin
                    a[7:0]=8'b11100111;
                    b[7:0]=8'b11001110;
                    c[7:0]=8'b11011110;
                    d[7:0]=8'b11011011;
                    e[7:0]=8'b11000011;
                    f[7:0]=8'b11000011;
                    g[7:0]=8'b11100111;
                    p[7:0]=8'b11111111;
        
                    end
                    else if (status == DOWN) begin
                    a[7:0]=8'b11000111;
                    b[7:0]=8'b11001110;
                    c[7:0]=8'b11001110;
                    d[7:0]=8'b11001011;
                    e[7:0]=8'b11000011;
                    f[7:0]=8'b11000011;
                    g[7:0]=8'b11110111;
                    p[7:0]=8'b11111111;
                    
                     end
                    else 
                    begin end
                end
                
                else if((floor == floor_2))
                    begin 
                        
                        led_outside_2 =  0;
                        if (status == UP)
                        begin
                        a[7:0]=8'b11100110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11011111;
                        d[7:0]=8'b11011010;
                        e[7:0]=8'b11000010;
                        f[7:0]=8'b11000011;
                        g[7:0]=8'b11100110;
                        p[7:0]=8'b11111111;
        
                        end
                        else if (status == DOWN)
                        begin 
                        a[7:0]=8'b11000110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11001111;
                        d[7:0]=8'b11001010;
                        e[7:0]=8'b11000010;
                        f[7:0]=8'b11000011;
                        g[7:0]=8'b11110110;
                        p[7:0]=8'b11111111;
        
        
                        end
                        else begin end
                    end
                else if((floor == floor_3))
                    begin 
                       
                        led_outside_3 =  0;
                        if (status == UP)
                        begin
                        a[7:0]=8'b11100110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11011110;
                        d[7:0]=8'b11011010;
                        e[7:0]=8'b11000011;
                        f[7:0]=8'b11000011;
                        g[7:0]=8'b11100110;
                        p[7:0]=8'b11111111;
        
                         end
                        else if (status == DOWN)
                        begin 
                        a[7:0]=8'b11000110;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11001110;
                        d[7:0]=8'b11001010;
                        e[7:0]=8'b11000011;
                        f[7:0]=8'b11000011;
                        g[7:0]=8'b11110110;
                        p[7:0]=8'b11111111;
        
                        end
                        else begin end
                    end
                else if((floor == floor_4))
                    begin 
                       
                        led_outside_4 =  0;
                        if (status == UP)
                        begin 
                        a[7:0]=8'b11100111;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11011110;
                        d[7:0]=8'b11011011;
                        e[7:0]=8'b11000011;
                        f[7:0]=8'b11000010;
                        g[7:0]=8'b11100110;
                        p[7:0]=8'b11111111;
                        end
                        else if (status == DOWN)
                        begin 
                        a[7:0]=8'b11000111;
                        b[7:0]=8'b11001110;
                        c[7:0]=8'b11001110;
                        d[7:0]=8'b11001011;
                        e[7:0]=8'b11000011;
                        f[7:0]=8'b11000010;
                        g[7:0]=8'b11110110;
                        p[7:0]=8'b11111111;
                        end
                        else begin end
                    end
                else begin end 
                
                
                // inside 
                    if((floor == floor_0)) //&& (led_inside_0 == 1)
                    begin 
                        led_inside_0 = 0;
                        if (status == UP)
                            begin
                            a[7:0]=8'b11100110;
                            b[7:0]=8'b11001110;
                            c[7:0]=8'b11011110;
                            d[7:0]=8'b11011010;
                            e[7:0]=8'b11000010;
                            f[7:0]=8'b11000010;
                            g[7:0]=8'b11100111;
                            p[7:0]=8'b11111111;
        
            
                            end
                            else if(status == DOWN)
                            begin
                                
                            a[7:0]=8'b11000110;
                            b[7:0]=8'b11001110;
                            c[7:0]=8'b11001110;
                            d[7:0]=8'b11001010;
                            e[7:0]=8'b11000010;
                            f[7:0]=8'b11000010;
                            g[7:0]=8'b11110111;
                            p[7:0]=8'b11111111;
                            end
                            else begin end
                    end
                    else if((floor == floor_1))
                    begin 
                        
                        led_inside_1 =  0;
                        if (status == UP)
                            begin
                            a[7:0]=8'b11100111;
                            b[7:0]=8'b11001110;
                            c[7:0]=8'b11011110;
                            d[7:0]=8'b11011011;
                            e[7:0]=8'b11000011;
                            f[7:0]=8'b11000011;
                            g[7:0]=8'b11100111;
                            p[7:0]=8'b11111111;
                
                            end
                            else if (status == DOWN) begin
                            a[7:0]=8'b11000111;
                            b[7:0]=8'b11001110;
                            c[7:0]=8'b11001110;
                            d[7:0]=8'b11001011;
                            e[7:0]=8'b11000011;
                            f[7:0]=8'b11000011;
                            g[7:0]=8'b11110111;
                            p[7:0]=8'b11111111;
                            
                             end
                            else 
                            begin end
                    end
                    else if((floor == floor_2))
                        begin 
                           
                            led_inside_2 =  0;
                            if (status == UP)
                                begin
                                a[7:0]=8'b11100110;
                                b[7:0]=8'b11001110;
                                c[7:0]=8'b11011111;
                                d[7:0]=8'b11011010;
                                e[7:0]=8'b11000010;
                                f[7:0]=8'b11000011;
                                g[7:0]=8'b11100110;
                                p[7:0]=8'b11111111;
                
                                end
                                else if (status == DOWN)
                                begin 
                                a[7:0]=8'b11000110;
                                b[7:0]=8'b11001110;
                                c[7:0]=8'b11001111;
                                d[7:0]=8'b11001010;
                                e[7:0]=8'b11000010;
                                f[7:0]=8'b11000011;
                                g[7:0]=8'b11110110;
                                p[7:0]=8'b11111111;
                
                
                                end
                                else begin end
                        end
                    else if((floor == floor_3))
                        begin 
                           
                            led_inside_3 =  0;
                            if (status == UP)
                                    begin
                                    a[7:0]=8'b11100110;
                                    b[7:0]=8'b11001110;
                                    c[7:0]=8'b11011110;
                                    d[7:0]=8'b11011010;
                                    e[7:0]=8'b11000011;
                                    f[7:0]=8'b11000011;
                                    g[7:0]=8'b11100110;
                                    p[7:0]=8'b11111111;
                    
                                     end
                                    else if (status == DOWN)
                                    begin 
                                    a[7:0]=8'b11000110;
                                    b[7:0]=8'b11001110;
                                    c[7:0]=8'b11001110;
                                    d[7:0]=8'b11001010;
                                    e[7:0]=8'b11000011;
                                    f[7:0]=8'b11000011;
                                    g[7:0]=8'b11110110;
                                    p[7:0]=8'b11111111;
                    
                                    end
                                    else begin end
            
                        end
                    else if((floor == floor_4))
                        begin 
                           
                            led_inside_4 =  0;
                            if (status == UP)
                                begin 
                                a[7:0]=8'b11100111;
                                b[7:0]=8'b11001110;
                                c[7:0]=8'b11011110;
                                d[7:0]=8'b11011011;
                                e[7:0]=8'b11000011;
                                f[7:0]=8'b11000010;
                                g[7:0]=8'b11100110;
                                p[7:0]=8'b11111111;
                                end
                                else if (status == DOWN)
                                begin 
                                a[7:0]=8'b11000111;
                                b[7:0]=8'b11001110;
                                c[7:0]=8'b11001110;
                                d[7:0]=8'b11001011;
                                e[7:0]=8'b11000011;
                                f[7:0]=8'b11000010;
                                g[7:0]=8'b11110110;
                                p[7:0]=8'b11111111;
                                end
                                else begin end
                                            
                        end
                    else begin end 
                
            end 
            
    end
        

end

always @ (posedge elevCntOut, negedge rst  ) begin
    if (rst == 0)begin
        led_busy = 0;
        floor = 0;
        moving = 0;
     end
    else begin
    if (moving == 0 && status != IDLE)begin
        //led_busy = 1;
    // 5 saniye beklicek baþkaným
    end
    else if( moving == 1 && led_busy)
    begin 
     led_busy = 0;
    end
    else if (status == UP)begin
        floor = floor+ 1;
 
    end
    else if (status == DOWN)begin
        floor = floor- 1;
    end
    else begin end
        

    if (     ((floor == floor_0)&& (led_outside_0 == 1)) ||  
         ((floor == floor_1)&& (led_outside_1 == 1)) ||
          ((floor == floor_2)&& (led_outside_2 == 1)) ||
           ((floor == floor_3)&& (led_outside_3 == 1)) ||
            ((floor == floor_4)&& (led_outside_4 == 1)) ||
            
             ((floor == floor_0)&& (led_inside_0 == 1)) ||  
                ((floor == floor_1)&& (led_inside_1 == 1)) ||
                 ((floor == floor_2)&& (led_inside_2 == 1)) ||
                  ((floor == floor_3)&& (led_inside_3 == 1)) ||
                  ((floor == floor_4)&& (led_inside_4 == 1)) ) begin
                 
                  led_busy = 1; 
                
                 
                          end
    else if (    ( (led_outside_0 == 1)) ||  
              ( (led_outside_1 == 1)) ||
               ( (led_outside_2 == 1)) ||
                ((led_outside_3 == 1)) ||
                 ( (led_outside_4 == 1)) ||
                 
                  ( (led_inside_0 == 1)) ||  
                    ( (led_inside_1 == 1)) ||
                     ( (led_inside_2 == 1)) ||
                      ((led_inside_3 == 1)) ||
                       ( (led_inside_4 == 1))   )begin
                                               
                 moving = 1;
          end
    else begin 
              moving = 0;
              led_busy = 0;
     end


   


    end
end


initial begin
     a[7:0]=8'b11110110;
     b[7:0]=8'b11001110;
     c[7:0]=8'b11001110;
     d[7:0]=8'b11101010; 
     e[7:0]=8'b11100010; 
     f[7:0]=8'b11110010;
     g[7:0]=8'b11100111; 
     p[7:0]=8'b11111111;

     

end



//***********Your code goes here**************//
endmodule
