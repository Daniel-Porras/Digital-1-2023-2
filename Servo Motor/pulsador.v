module pulsador (
    output reg [18:0] duty,
    input clk,
    input sw
  );
always@(posedge clk)
begin 
	if(sw==1'b1)
		
	begin
		duty <= 19'd62500;
	end
	else
	begin
		duty <= 19'd12500;
	end
end

endmodule
