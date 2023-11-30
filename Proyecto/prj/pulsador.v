module pulsador (
    input clk,
    input sw,
    output reg salida
  );

reg[2:0] count;
initial
begin
  count=0;
  salida=0;
end

always@(posedge clk)
begin 
		if(sw==1'b1)begin
			count<=count+1;
		end
		else begin
			count<=0;
		end
		if(count==3'd5)begin
			salida<=~salida;
			count<=0;
		end
end

endmodule
