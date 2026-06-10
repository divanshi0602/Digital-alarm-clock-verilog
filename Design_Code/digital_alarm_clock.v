// Code your design here

module clock_divider (
    input clk,
    input rst,
    output reg ticks
);
    reg [25:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count   <= 0;
            ticks <= 0;
        end else if (count == 5) begin
            count   <= 0;
            ticks <= 1;
        end else begin
            count   <= count + 1;
            ticks <= 0;
        end
    end
endmodule

module time_counter (
    input clk,
    input rst,
    input ticks,
    output reg [4:0] hours,
    output reg [5:0] minutes,
    output reg [5:0] seconds
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hours   <= 0;
            minutes <= 0;
            seconds <= 0;
        end else if (ticks) begin
            if (seconds == 59) begin
                seconds <= 0;
                if (minutes == 59) begin
                    minutes <= 0;
                    if (hours == 23)
                        hours <= 0;
                    else
                        hours <= hours + 1;
                end else begin
                    minutes <= minutes + 1;
                end
            end else begin
                seconds <= seconds + 1;
            end
        end
    end
endmodule

module alarm_time_set (
    input clk,
    input rst,
    input set_alarm,
    input inc_hours,
    input inc_mins,
    output reg [4:0] alarm_hours,
    output reg [5:0] alarm_mins
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            alarm_hours <= 0;
            alarm_mins  <= 0;
        end else if (set_alarm) begin
            if (inc_hours) begin
                if (alarm_hours == 23)
                    alarm_hours <= 0;
                else
                    alarm_hours <= alarm_hours + 1;
            end
            if (inc_mins) begin
                if (alarm_mins == 59)
                    alarm_mins <= 0;
                else
                    alarm_mins <= alarm_mins + 1;
            end
        end
    end
endmodule


module alarm_compare (
    input clk,
    input rst,
    input alarm_enable,
    input alarm_stop,
    input [4:0] hours,
    input [5:0] minutes,
    input [4:0] alarm_hours,
    input [5:0] alarm_mins,
    output reg alarm
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            alarm <= 0;
        else if (alarm_stop)
            alarm <= 0;
        else if (alarm_enable &&
                 hours == alarm_hours &&
                 minutes == alarm_mins)
            alarm <= 1;
    end
endmodule


module alarm_clock (
    input clk,
    input rst,
    input alarm_enable,
    input alarm_stop,
    input set_alarm,
    input inc_hours,
    input inc_mins,
    output alarm,
    output [4:0] hours,
    output [5:0] minutes,
    output [5:0] seconds
);
    wire tick_1s;
    wire [4:0] alarm_hours;
    wire [5:0] alarm_mins;

    clock_divider cd (  
        .clk(clk),
        .rst(rst),
      .ticks(ticks)
    );

    time_counter tc (
        .clk(clk),
        .rst(rst),
        .ticks(ticks),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds)
    );

    alarm_time_set ats (
        .clk(clk),
        .rst(rst),
        .set_alarm(set_alarm),
        .inc_hours(inc_hours),
        .inc_mins(inc_mins),
        .alarm_hours(alarm_hours),
        .alarm_mins(alarm_mins)
    );

    alarm_compare ac (
        .clk(clk),
        .rst(rst),
        .alarm_enable(alarm_enable),
        .alarm_stop(alarm_stop),
        .hours(hours),
        .minutes(minutes),
        .alarm_hours(alarm_hours),
        .alarm_mins(alarm_mins),
        .alarm(alarm)
    );
endmodule
