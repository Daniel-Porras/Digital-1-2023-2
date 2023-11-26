module blink (
	input clk,
	input setTime,
        input [5:0] Segundos,
	input [5:0] Minutos,
	input [5:0] SegundosPulsa,
	input [5:0] MinutosPulsa,
	output reg [5:0] SalidaSelectorMin,
	output reg [5:0] SalidaSelectorSeg
  );

always@(posedge clk)
begin 
		if(setTime==1'b1)begin
			SalidaSelectorMin<=MinutosPulsa;
			SalidaSelectorSeg<=SegundosPulsa;
		end
		else begin
			SalidaSelectorMin<=Minutos;
			SalidaSelectorSeg<=Segundos;
		end

end

endmodule
