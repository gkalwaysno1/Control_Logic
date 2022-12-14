module johnson_ctr  (input clk,input rstn,output reg [3:0] out,input wire c);  
  integer i;
  always @ (posedge clk) begin  
      if (!rstn)  
         out <= 1;  
      else begin  
        out[3] <= (c==1)?(~out[0]):(out[0]);  
        for ( i = 0; i < 3; i=i+1) begin  
          out[i] <= out[i+1];  
        end  
      end  
  end  
endmodule
