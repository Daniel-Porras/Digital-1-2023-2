# Sumador-Restador de 4 bits
A continuación se vera el procedimiento para crear un sumador-restador de cuatro bits utlizando Verilog
![Sumador-Restador](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/a99eeb3c-f7d8-483d-bbb0-72c154af0948)
## Creación del módulo
Se crea el módulo del sumador-restador, teniendo como entradas dos números de 4 bits y un carrier de entrada que ayudará a seleccionar si se quire realizar una suma o resta. Por otra parte las salidas de este módulo es un resultado de la operación la cual es un número de 4 bits y también se tiene un carrier de salida:

```systemverilog
module adder_four_bits (
  // Entradas y salidas;
  input [3:0] int_b, 
  input [3:0] int_a,
  input in_ci,
  output out_co, 
  output [3:0] out_s
);
```
Se realizó la conexión en cascada de 4 fulladers

```systemverilog
// Declaración de cables
wire co1;
wire co2;
wire co3;

// Declaración de submodules
// fulladder(b,a,coi,co,s)

fulladder fulladder1(in_ci^int_b[0],int_a[0],in_ci,co1,out_s[0]);	
fulladder fulladder2(in_ci^int_b[1],int_a[1],co1,co2,out_s[1]);
fulladder fulladder3(in_ci^int_b[2],int_a[2],co2,co3,out_s[2]);
fulladder fulladder4(in_ci^int_b[3],int_a[3],co3,out_co,out_s[3]);

endmodule
```
Si se quiere realizar una **suma** (A+B) el carrier de entrada ```in_ci```, tiene que ser igual y cero. Y para el caso de la **resta** (A-B) el carrier de entrada tiene que ser uno.
Debido a que si se quiere realizar una resta se debe sacar el complemento a dos de la entrada b, lo cual consiste en negar el número y sumarle 1. Para esto se utilzo una compuerta XOR ya que si el carrie de entrada es cero no modifica el valor de b y cuando este tiene un calor de uno niega el valor.
<div align="center">

| b[n]     | in_ci    | b[n] ^ in_ci |
|:----------:|:----------:|:----------:|
|  0         | 0          |   0      |
|  1         | 0          |   1      |
|  0         | 1          |   1      |
|  1         | 1          |   0      |

</div>

## Modificación del test bench
```systemverilog
module testbech;
// Entradas 
reg [3:0] inputA;
reg [3:0] inputB;
reg cint;
// Variables para la iteración
integer i;
integer e;
integer q;

initial
 begin
  for (q=0; q<2; q=q+1)
  begin
   cint=q;
   for (i=0; i<16; i=i+1)
   begin
    inputA = i;
    for (e=0; e<16; e=e+1)
    begin
     inputB = e;
     #1;
    end
   end	
  end	
 end

// Salidas
wire [3:0] outs;
wire out_co;
// DEVICE/DESIGN UNDER TEST
adder_four_bits dut (
    .int_b(inputB), .int_a(inputA), .in_ci(cint),
    .out_co(out_co), .out_s(outs[3:0])
  );
initial
begin
    $dumpfile("top.vcd");
    $dumpvars(0, testbech);
end
endmodule
```
## Simulación
Se escribió el siguiente comando para revisar que no hubiera ningún error en el código y crear el archivo *top.vvp*
![Captura de pantalla de 2023-10-02 18-01-45](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/38d4ce95-b83f-440b-9d0d-81d6b2eef6b2)
Se inició la simulación y se generaron los resultados
![Captura de pantalla de 2023-10-02 18-07-21](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/cda7737b-5a4b-49e0-baea-d5a867eb8015)
Con el comando ```gtkwave top.vcd``` se visualizaron las formas de onda en gtkwave
![sumador_restador_4bits](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/2af56c52-1564-494a-af5c-11335cf0134c)

