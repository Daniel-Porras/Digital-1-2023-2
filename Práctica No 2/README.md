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
