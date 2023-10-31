module comparador (
    input clk,
    input  [SIZE-1:0] salidaContador,
    input  [SIZE-1:0] entradaPulsador,
    output salidaCompa
  );
parameter SIZE = 19;

assign salidaCompa = (salidaContador > entradaPulsador) ?1'b1:1'b0;

  
endmodule
