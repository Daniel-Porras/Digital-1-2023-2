module Reloj200Hz
( 
input clk,
output reg salida
);

reg [SIZE-1:0] count;

parameter SIZE = 25;
parameter duty = 25'd62500;

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
