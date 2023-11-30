module selector (
input clk,
input [5:0] Segundos,
input [5:0] Minutos,
output reg [5:0] SalidaSelector,
output reg SenalDecontrol,
output reg Led1,
output reg Led2,
output reg Led3,
output reg Led4,
output reg punto
);

reg [2:0] count;

initial
begin
  punto=1;
  Led1=0;
  Led2=0;
  Led3=0;
  Led4=0;
  count=0;
end

always@ (posedge clk) begin
	case (count)
	0:
	begin
		SalidaSelector <= Segundos;
		SenalDecontrol<=1;
		punto<=1;
		Led4 <=0;
		Led1 <=1;
		count <=1;
	end
	1:
	begin
		SenalDecontrol<=0;
		Led1 <=0;
		Led2 <=1;
		count <=2;
	end
	
	2:
	begin
		SalidaSelector <= Minutos;
		SenalDecontrol<=0;
		Led2 <=0;
		Led3 <=1;
		count <=3;
	end
	3:
	begin
		SenalDecontrol<=1;
		punto<=0;
		Led3 <=0;
		Led4 <=1;
		count <=0;
	end
	endcase
end


endmodule
