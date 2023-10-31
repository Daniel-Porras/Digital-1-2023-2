
module top (
    input  clk,
    input sw,
    output salida
  );
parameter SIZE=19;

wire [SIZE-1:0] cable1;
wire [SIZE-1:0] cableContador;

pulsador pulasdor1(cable1,clk,sw);

counter19bits contauwu (clk,cableContador);

assign salida = (cable1 > cableContador) ?1'b1:1'b0;

endmodule
