module Reloj5Hz( 
input clk,
output salida
);

reg [SIZE-1:0] count;

parameter SIZE = 25;
parameter duty  = 25'd2500000;


initial
begin
  count = 0;
end

always@ (posedge clk) begin
	if(count == duty) begin
		count <= 0;
		salida <= ~salida;
	end
	else begin
		count <= count + 1;
	end
end


endmodule
