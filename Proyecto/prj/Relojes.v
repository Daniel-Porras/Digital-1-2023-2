module Relojes( 
input clk,
input reset,
output salida1Hz,
output salida5Hz,
output salida50Hz,
output salida200Hz
);

Reloj200Hz clk200z(clk,reset,salida200Hz);
Reloj1Hz clk1z(clk,reset,salida1Hz);
Reloj5Hz clk5z(clk,reset,salida1Hz); 
Reloj50Hz clk50z(clk,reset,salida50Hz);


endmodule
