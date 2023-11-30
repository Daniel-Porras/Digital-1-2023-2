module top 
//#(parameter INIT=0)
( 
    input  clk, 
    input sw1,
    input sw2,
    input sw3,
    input sensor,
    output [6:0] salidaSieteSeg,
    output [4:0] Leds,
    output [3:0] SalidaMotor
  );
parameter SIZE=6;

wire [3:0] Led;
wire [SIZE-1:0] salidaSeg;
wire [SIZE-1:0] salidaMin;
wire [SIZE-1:0] setSeg;
wire [SIZE-1:0] setMin;
wire [SIZE-1:0] salidaSelec;
wire [SIZE-1:0] salidaSegBlink;
wire [SIZE-1:0] salidaMinBlink;

wire op;
wire control;
wire setTime;
wire NewReloj200;
wire NewReloj50; 
wire NewReloj5; 
wire [3:0] Decenas;
wire [3:0] Unidades;
wire [3:0] SalidaMux;
 
Reloj200Hz clk200z(clk,NewReloj200);
Reloj5Hz clk5z(clk,NewReloj5); 
Reloj50Hz clk50z(clk,NewReloj50);

pulsadores pulsa(NewReloj5,~sw1,~sw2,~sw3,setTime,setSeg,setMin,op);
pulsador set(NewReloj5,~sw3,setTime);

ContadorTiempo /*#(.INIT(INIT))*/ contauwu(NewReloj50,setTime,setSeg,setMin,salidaSeg,salidaMin,NewReloj50,SalidaMotor,sensor);

blink unu(NewReloj200,setTime,salidaSeg,salidaMin,setSeg,setMin,salidaMinBlink,salidaSegBlink);

selector Selectouwu(NewReloj200,salidaSegBlink,salidaMinBlink,salidaSelec,control,Led[0],Led[1],Led[2],Led[3],Leds[4]);

BinarioBCD binaBCD (salidaSelec[5],salidaSelec[4],salidaSelec[3],salidaSelec[2],salidaSelec[1],salidaSelec[0],Decenas[3],Decenas[2],Decenas[1],Decenas[0],Unidades[3],Unidades[2],Unidades[1],Unidades[0]);

mux8a4 mux (Decenas[0],Decenas[1],Decenas[2],Decenas[3],Unidades[0],Unidades[1],Unidades[2],Unidades[3],control,SalidaMux[3],SalidaMux[2],SalidaMux[1],SalidaMux[0]);

bcd7seg SieteSeg(SalidaMux[3],SalidaMux[2],SalidaMux[1],SalidaMux[0],salidaSieteSeg[6],salidaSieteSeg[5],salidaSieteSeg[4],salidaSieteSeg[3],salidaSieteSeg[2],salidaSieteSeg[1],salidaSieteSeg[0]);

assign Leds[0] = Led[0]&~(setTime&~op)||Led[0]&NewReloj5&(setTime&~op);
assign Leds[1] = Led[1]&~(setTime&~op)||Led[1]&NewReloj5&(setTime&~op);
assign Leds[2] = Led[2]&~(setTime&op)||Led[2]&NewReloj5&(setTime&op);
assign Leds[3] = Led[3]&~(setTime&op)||Led[3]&NewReloj5&(setTime&op);

endmodule
