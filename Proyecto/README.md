# Proyecto: Alimentador automático de mascotas
![platico](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/486ad5eb-55fa-4fd7-8b41-cd6a3bc60194)
[url=https://postimg.cc/JsHfxcNj][img]https://i.postimg.cc/JsHfxcNj/Screenshot-from-2023-12-01-08-47-24.png[/img][/url]

Video del funcionamiento:  https://youtu.be/ROADuwf9KhE?si=DINwa8m-Cm0rzXJX!

## Formulación del proyecto

## Lista de materiales

Para encontrar mayor documentación de la FPGA usada: https://lawrie.github.io/blackicemxbook/The_Hardware/The_Hardware.html

## Modo de funcionamiento del motor paso a paso

![WhatsApp Image 2023-11-13 at 00 37 37_3bd8fa9a](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/ec41e3cc-f7ec-4acf-bf76-b84391e21c73)

Para mayor profundización y explorar más modos de funcionariemto remitirse a : https://www.youtube.com/watch?v=2-nVV9S7leM 


## RTL del proyecto
Rtl del top
![Captura de pantalla de 2023-11-24 16-34-23](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/b8d65cd0-d815-4c5e-ae49-960ae5e1b13d)


## Simulaciones
A continuación se encuentra la simulaciones de las señales de entrada (sw1, sw2, sw3 y el sensor ) y de salida (motor y display siete segmentos) para determinados casos.
* **Conteo Normal**
  ![TestConteoNormal](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/74b7ff07-844c-4f8f-a545-a579fa70c558)

* **Fin del conteo y movimiento del motor**
![TestMovimientoDelMotorySensor](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/2eb90b18-df8c-4b3e-8f3d-9f6d39998e59)

* **Fin del movimiento del motor y comienzo del conteo**
![TestTerminarDemoverElmotor](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/2d21e106-714e-4980-8397-1ea7aab4182c)

## Diseño 3D
Para el montaje del alimentador se modeló un prototipo para su impresión en 3D. El software escogido para el modelado fue FreeCAD por ser un programa gratuito y open source. Dentro del repositorio se encuentran los archivos .stl para impresión.

![Screenshot 2023-11-29 232355](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/92fa573d-dd95-4670-a1cd-68aa36a34121)

El slicer sofware escogido fue Cura con los siguientes ajustes adicionales para poder imprimir en PLA en un una impresora de extrusión directa:

![ajustes cura](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/134a5c47-4f32-4540-9e9d-c44fffd422ef)

El gasto de material para impresión ronda los 415g teniendo en cuenta un relleno del 5%

