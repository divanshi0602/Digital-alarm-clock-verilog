module alarm_clock_tb;

  reg clk;
  reg rst;
  reg alarm_enable;
  reg alarm_stop;
  reg set_alarm;
  reg inc_hours;
  reg inc_mins;

  wire alarm;
  wire [4:0] hours;
  wire [5:0] minutes;
  wire [5:0] seconds;

  alarm_clock dut (
    .clk(clk),
    .rst(rst),
    .alarm_enable(alarm_enable),
    .alarm_stop(alarm_stop),
    .set_alarm(set_alarm),
    .inc_hours(inc_hours),
    .inc_mins(inc_mins),
    .alarm(alarm),
    .hours(hours),
    .minutes(minutes),
    .seconds(seconds)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("alarm_clock.vcd");
    $dumpvars(0, alarm_clock_tb);
  end

  initial begin
   
    clk = 0;
    rst = 1;
    alarm_enable = 0;
    alarm_stop = 0;
    set_alarm = 0;
    inc_hours = 0;
    inc_mins = 0;

    #20 rst = 0;

    #10 set_alarm = 1;

        inc_mins = 1;   
    #10 inc_mins = 0;

        inc_mins = 1;   
    #10 inc_mins = 0;

    #10 set_alarm = 0;

    #20 alarm_enable = 1;
    
    #20000 alarm_stop=1;
   
    #40000;
    
   
    #10 alarm_stop = 0;

    #50 $finish;
  end

endmodule
