module pulsadores (
    input clk,
    input sw1,
    input sw2,
    input sw3,
    input setTime,
    output reg [5:0] setSeg,
    output reg [5:0] setMin,
    output reg op
  );
  
initial
begin
  setSeg=6'd30;
  setMin=0;
  op=0;
end

always@(posedge clk)	
begin
	if (sw3==1'b1)begin
		op<=~op;
	end
	if (setTime==1)begin
		if(op==0)begin
			if(sw1==1'b1)begin
				if(setSeg==6'd59)begin
					setSeg<=0;
				end
				else begin
					setSeg<=setSeg+1;
				end
			end 
			else begin
			if(sw2==1'b1)begin
				if(setSeg==6'd0)begin
					setSeg<=6'd59;
				end
				else begin
					setSeg<=setSeg-1;
				end
				end
			end
		end begin
		if(op==1)begin
			if(sw1==1'b1)begin
				if(setMin==6'd59)begin
					setMin<=0;
				end
				else begin
					setMin<=setMin+1;
				end
			end 
			else begin
			if(sw2==1'b1)begin
				if(setMin==6'd0)begin
					setMin<=6'd59;
				end
				else begin
					setMin<=setMin-1;
				end
				end
			end
			end
		end
	end
	end
endmodule
