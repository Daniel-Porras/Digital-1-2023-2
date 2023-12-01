# Proyecto: Alimentador automático de mascotas
![platico](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/486ad5eb-55fa-4fd7-8b41-cd6a3bc60194)


Video del funcionamiento:  https://youtu.be/ROADuwf9KhE?si=DINwa8m-Cm0rzXJX!

## Integrantes
David Enrique Barón Rubio (dbaronr@unal.edu.co)

Sami Jerome Castañeda Latorre (scastanedal@unal.edu.co)

Daniel Arturo Porras Acosta (dporrasa@unal.edu.co)

## Formulación del proyecto
Para el planteamiento siguiente proyecto de electrónica digital se partió de las siguiente pregunta: ¿Qué problema o situación real podríamos estar atacando para el proyecto? Partiendo de esa base se hizo una lluvia de ideas proponiendo varias circunstancias del día a día que pudiesen ser suficientemente relevantes,luego de deliberar se llegó a la conclusión de que sería ideal y razonable para los objetivos de la clase tratar algo relacionado a las mascotas. Aquí surgía otra pregunta: ¿Qué problemas hay relacionados a las mascotas que sean suficientemente comunes? A partir de allí las primeras ideas que surgieron relacionadas al tema fueron: alimentación, entretenimiento y seguridad del animal; de entre esas luego de deliberar se decidió tomar la primera opción, pues los posibles proyectos relacionados se alineaban con los objetivos de la clase.

La justificación de la importancia de este problema surge a partir del aumento constante de hogares con mascotas, donde cada vez las familias prefieren más animales en el hogar, sea en reemplazo de hijos o sea para compañía. Pero resulta que esta situación entra en conflicto con el hecho de que cada vez más las familias salen más de viaje, sea por trabajo o por vacaciones; y muchas veces no es posible llevar al animal. Ahí es donde surgió la idea de un alimentador automático y programable.

La idea en sí es sencilla, se tomó como base modelos de alimentadores automáticos que se encontraron en sitios especializados y a partir de ahí se diseñó nuestro proyecto, consiste en un plato dividido en varias secciones las cuales pueden ser llenadas con comida, agua, pastillas, etc. El plato tiene la capacidad de rotar cada cierto tiempo, de modo que deja a la vista una de sus secciones solamente, y al cumplirse el tiempo estipulado pasa a la siguiente, esto gracias al movimiento de un motor paso a paso. El tiempo es configurable de forma sencilla con tres botones y este se muestra en un display de 7 segmentos. Ese era el planteamiento original, pero a medida que se fue avanzando surgió la idea de también colocar un sensor de proximidad para evitar que se interfiera con el movimiento del plato o que alguien pueda atorarse con el movimiento de este, especialmente las mascotas. Con eso quedó listo el planteamiento del proyecto.

Para más información, aquí el primer informe con el planteamiento completo, incluyendo estadísticas y datos concretos: https://github.com/Daniel-Porras/Digital-1-2023-2/blob/fcaa1d524e90239f3e463f9bcb2e82d7b64a09cf/Proyecto/Formulaci%C3%B3n%20proyecto%20-%20Bar%C3%B3n-Casta%C3%B1eda-Porras.pdf

## Entradas

- 3 pulsadores con los que se configura el tiempo deseado.
- Señal del sensor de proximidad por sobre la entrada del plato.

## Salidas

- Display 7 segmentos que muestra la cuenta regresiva del tiempo para que gire el plato.
- Motor paso a paso que permite el giro del plato.


## Lista de materiales

- Piezas del plato y la base que lo sostiene, impresas en 3D
- Pulsadores (X3)
- Motor paso a paso
- Display 7 segmentos de 4 bits
- Sensor de proximidad
- Cables, imanes y utilidades
- Fuente de 5V o 3.3V
- FPGA BlackIce40

## Presupuesto

- El filamento para la impresión 3D tuvo un costo de $40.000 pesos.
- Dado que se compraron dos tipos de pulsadores durante las pruebas el precio de estos asciende a $7000 pesos.
- El Motor paso a paso tuvo un valor de $18.000 pesos.
- El Display 7 segmentos de 4 bits tuvo un valor de $11.000 pesos.
- El Sensor de proximidad valió $5.000 pesos.
- Entre los Cables, imanes y utilidades generales hubo un precio de $10.000 pesos.
- La Fuente tuvo un valor de $15.000 pesos.
- La FPGA se pidió de prestamos a los laboratorios en la universidad, por tanto no tuvo costo alguno.

Realizando la suma de estos valores da que el gasto total para la realización del proyecto fue de $106.000 pesos aproximadamente.
Para encontrar mayor documentación de la FPGA usada: https://lawrie.github.io/blackicemxbook/The_Hardware/The_Hardware.html

##Desarrollo temprano del proyecto 


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

