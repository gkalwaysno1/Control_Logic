module tb;
  reg clk;  
  reg rstn;  
  wire [3:0] out;
  reg t_c;
  johnson_ctr   u0 (.clk (clk),.rstn (rstn),.out (out),.c(t_c));
  initial begin $dumpfile("dump.vcd");
$dumpvars(0,tb);
end
  always #10 clk = ~clk;
initial begin
    {clk, rstn} <= 0;
$monitor ("T=%0t out=%b Select_line=%b",$time,out,t_c);
t_c=1'b0;
repeat (2) @(posedge clk);  
rstn <= 1;  
repeat (15) @(posedge clk);
#100
t_c=1'b1;  
repeat (2) @(posedge clk);  
rstn <= 1;  
repeat (15) @(posedge clk);

$finish;  
end  
endmodule