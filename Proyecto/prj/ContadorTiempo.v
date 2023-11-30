module ContadorTiempo
//#(parameter INIT=0)
( 
input clk,
input setTime,
input [SIZE-1:0] setSeg,
input [SIZE-1:0] setMin, 
output reg [SIZE-1:0] countSeg,
output reg [SIZE-1:0] countMin,
input clk2,
output [3:0] SalidaMotor,
input sensor
);

parameter SIZE = 6;
reg control ;
reg [2:0] estados;
reg [9:0] count;

Prototipo_UWU protounu(control,clk2,SalidaMotor[0],SalidaMotor[1],SalidaMotor[2],SalidaMotor[3]);
initial
begin
  control=0;
  count=412;
  countSeg = 0;
  countMin = 0;
  estados = 1;
end

always@ (posedge clk) begin
	case(estados)
	0: 
	begin	
			count<=count+1;
			if(setTime==1'b1)begin
				estados<=2;
				count<=0;
			end
			else begin
			if(countSeg==0 && countMin==0)begin
				count<=0;
				estados<=1;
			end 
			else begin
				if(countSeg==0 & count==50)begin
					count<=0;
					countSeg<=6'd59;
					countMin<=countMin-1;
				end
				else begin
					if(count==50)begin
					countSeg<=countSeg-1;
					count<=0;
					end
				end
		end 
		end
	end
	1: begin	
			if(sensor==1)begin
			control<=0;
			count<=count;
			end
			else begin 
			count<=count+1;
			control<=1;
			if (count==512)begin
				control<=0;
				count<=0;
				countSeg<=setSeg;
				countMin<=setMin;
				estados<=0;
			end
			end
		end
	2:begin
			if(setTime==1'b0)begin
				estados<=0;
			end
			countSeg<=setSeg;
			countMin<=setMin;
	  end
	
	endcase
	
	
end

endmodule
