`timescale 1ns / 1ps

module quiz_buzzer(

    input clk,
    input rst,

    input btnA,
    input btnB,
    input btnC,

    output reg ledA,
    output reg ledB,
    output reg ledC
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] state;
reg [25:0] count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin

        state <= S0;

        ledA <= 0;
        ledB <= 0;
        ledC <= 0;

        count <= 0;

    end

    else
    begin

        case(state)

        S0:
        begin

            ledA <= 0;
            ledB <= 0;
            ledC <= 0;

            count <= 0;

            if(btnA)
                state <= S1;

            else if(btnB)
                state <= S2;

            else if(btnC)
                state <= S3;

        end

        S1:
        begin

            ledA <= 1;
            ledB <= 0;
            ledC <= 0;

            if(count == 26'd49999999)
            begin
                count <= 0;
                state <= S0;
            end

            else
                count <= count + 1;

        end

        S2:
        begin

            ledA <= 0;
            ledB <= 1;
            ledC <= 0;

            if(count == 26'd49999999)
            begin
                count <= 0;
                state <= S0;
            end

            else
                count <= count + 1;

        end

        S3:
        begin

            ledA <= 0;
            ledB <= 0;
            ledC <= 1;

            if(count == 26'd49999999)
            begin
                count <= 0;
                state <= S0;
            end

            else
                count <= count + 1;

        end

        default:
            state <= S0;

        endcase

    end

end

endmodule