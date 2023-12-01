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

![pinout](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/d9004c5c81d2f7cb60c9bb37002e9cc580ff8f5a/Proyecto/Capturas/pinout.png)

En la imagen anterior se ve la distribución de pines de la FPGA para complementar las explicaciones a continuación.

## Desarrollo temprano del proyecto 

Para los primeros diseños del proyecto de había planteado hacer con un servomotor que girara 360º, la idea era configurarlo de modo que girara una cantidad específica de grados cada vez que se quisiera hacer girar el plato; de hecho aprovechando las práctica de servomotor del laboratorio se hizo el sistema de control del servo y se implementó en la FPGA. Pero tras varios intentos por configurar el ángulo específico de giro y por consejo del profesor de laboratorio se decidió pasar a un motor paso a paso, dado que el control que requeríamos era mucho más sencillo de obtener con un paso a paso.

También en un inicio se había barajado la posibilidad de hacer el alimentador similar a una máquina expendedora o una máquina de chicles, de modo que al cumplirse el tiempo estipulado dejara caer la comida por una abertura para llenar el plato. Pero la idea fue descartada en favor de la simplicidad y efectividad del diseño final.

Un último cambio en el proceso que es digno de mencionarse es que en un momento se propuso la idea de poder controlar la máquina a distnacia, con bluetooth o wifi, pero dada la complejidad del desarrollo además de la falta de tiempo ese planteamiento solo se quedó como una idea al aire, y tal vez como una adición a futuro en caso de que se decida seguir desarrollando el proyecto o llegar a venderlo.

# Proyecto Definitivo

## RTL del proyecto
Rtl del top
![Captura de pantalla de 2023-11-24 16-34-23](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/b8d65cd0-d815-4c5e-ae49-960ae5e1b13d)

En la imagen anterior se la construcción mas general del circuito del proyecto final, es notable que de entradas están los distintos relojes que permiten el funcionamiento del circuito, los cuales se explicarán más adelante, y las entradas tanto del sensor como de los pulsadores. Por parte de las salidas se encuentran los leds de cada bit de lo 7 segmentos y de cada uno de los segmentos, además de la salida de control del motor.

El proceso inicia con los pulsadores que pueden configurar el tiempo apoyandose en los modulos 'pulsadores' y 'selector' los cuales tienen el control sobre el estado de los pulsadores y el si la máquina se encuentra en modo conteo o modo configurar tiempo. El tiempo establecido es posible de medir gracias al modulo de ContadorTiempo, el cual permite contar los segundos e ir restando al valor del contador hasta que este sea cero, en paralelo con eso trabaja el módulo blink, que es el encargado de el display correcto en el siete segmentos. Finalmente llegan las señales al motor y los leds faltantes para completar el funcionamiento. En caso de que se reciba señal del sensor el movimiento del motor se ve interrumpido.

Ahora se procederá a detallar más en varias secciones de interés respecto a los modulos y cómo se construyeron.

## Relojes y contadores

El diseño de los relojes que permiten el conteo del tiempo y controlan las señales de la mayor parte del proyecto se explica de forma sencilla pero conllevó un buen rato en términos de implementación. De forma básica se utiliza el oscilador de 25MHz de la FPGA como base para diseñar un contador que cuente un segundo, a partir de este se puede hacer que cuente varios segundos y luego varios minutos. Para el proyecto se utilizaron varios contadores que oscilan diferente cada segundo, esto según la conveniencia de la aplicación. Por ejemplo el contador principal cuenta con 50Hz, el contador del display es de a 20Hz, etc. 

Durante el diseño del contador hubo 2 problemas principales. El primero fue a la hora de que contara e hiciera el display en el 7 segmenetos de forma correcta, pues se hicieron varias pruebas donde en un momento funcionaba y de repente se descuadraba. Hubo ocasiones que contaba mucho más ràpido o lento de lo debido, y hubo ocasiones en que el display no mostraba correctamente los números, sea por un orden incorrecto o porque no blinkeaba a una velocidad adecuada para que se viera limpio. El problema se resolvió en general con prueba y error hasta obtener un resultado satisfactorio.

El segundo problema vino a la hora de acoplar el contador con el motor, pues dado que el motor requería también un reloj para su correcto movimiento como se explica más adelante este hacía interferencias con los otros contadores. Hubo alguna ocasiñon que la FPGA no soportaba tener tantos modulos de reloj al mismo tiempo y hubo que reestructurar el código para reducir la cantidad de contadores y obtener la misma funcionalidad original limpia y cuidada.


## Funcionamiento de los displays

Para diseñar el control de los displays fue necesario hacer varios cálculos con el oscilador de la FPGA, para así poder diseñar relojes con las medidas correctas para poder mostrar correcta y satisfactoriamente los contadores. Pero también se apoyó en la herramienta libre 'Digital' para diseñar circuitos de control a partir de las tablas de verdad, a continuación algunos de estos:

![BinarioaBCD](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/57c47155a6b28f42ec67410ed64c6c8b3cb30096/Proyecto/Capturas/BinarioaBCD.png)
En la imagen anterior se ve el circuito en DIgital resultante de una tabla de verdad que recibe un número binario y lo transforma a código BCD, está configurado para los números del 0 al 59 para poder hacer el conteo de minutos y segundos sin problema. A partir de ese circuito se exportó el código a verilog con el propio Digital y se colocó en el código como un módulo, el código se encuentra en los archivos del repositorio.

![BCDa7Segmentos](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/57c47155a6b28f42ec67410ed64c6c8b3cb30096/Proyecto/Capturas/BCDa7seg.png)
Por otro lado en la imagen arriba se ve el circuito diseñado para recibir el código BCD de dos números y mostrarlos en dos pantallas de 7 segmentos, se hace la transformación del código BCD a cada una de las salidas de los 7 leds de la pantalla. Dado que en el proyecto final tenemos 4 displays se utiliza dos veces este código para mostrar el conteo de segundos (decenas y unidades) y minutos (decenas y unidades). Un dato que cabe aclarar es que en el proyecto solo cuenta minutos y segundos dada la limitación del tiempo y que para el correcto desarrollo no era necesario llegar más lejos. Pero caso se quisiera comercializar se le agregaría el conteo de horas con otros dos displays (decenas y unidades).

Es necesario mencionar, en el RTL se ven unas compuertas lógicas hacia la salida, estas son las encargadas de que cuando se pasa de modo conteo a modo configurar tiempo los numeros hagan un blink, estas puertas lógicas pudieron ser puestas en otro módulo pero se dejaron por fuera ya que se hicieron no con ayuda de digital si no diseñandolo a mano calculando uno a uno. Para posibles futuras versiones, esa zona sería un módulo más en el top.

## Modo de funcionamiento del motor paso a paso


![WhatsApp Image 2023-11-13 at 00 37 37_3bd8fa9a](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/ec41e3cc-f7ec-4acf-bf76-b84391e21c73)

Para mayor profundización y explorar más modos de funcionariemto remitirse a : https://www.youtube.com/watch?v=2-nVV9S7leM 

Este fue el plantemiento base del que surgió la idea del control de las salidas del motor, se requieren cuatro salidas para que este funcione correctamente dado que como está diseñado su giro se da al hacer rotar un iman permanente con ayuda de electroimanes que pueden encenderse y apagarse fácilmente; en este caso y como se ve en la imágen se decidió usar un motor unipolar, dado que no compensaba en términos de consumo y potencia usar uno bipolar, con el unipolar era suficiente y más sencillo de contruir al solo necesitarse 4 señales de 1 bit en vez de 4 señales de a 2 bits.

Vale la pena mencionar que como se lee en la imagen, el motor paso a paso cuenta con varias secciones, los 4 electroimanes son solo la primera y más pequeña fase de estas. Para un giro completo efectivo se necesitan 2048 pasos de estos electroimanes, para hacerlos a una velocidad y cantidad concreta requerimos el reloj que se mencionó en una sección anterior. Este hecho fue el que causó en algún momento incompatibilidad con los otros contadores, pero se resolvió recontruyendo el diseño de los displays para funcionar correctamente con el contador del paso a paso.

El diseño de la señal de control y diagramas de estado del motor paso a paso se realizó en parte con ayuda de las clases magistrales donde se dieron como ejemplo varias máquinas de estado finito. En la siguiente imágen un ejemplo de esto mismo:

![Paso a Paso](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/d9004c5c81d2f7cb60c9bb37002e9cc580ff8f5a/Proyecto/Capturas/Paso%20a%20paso.jpeg)

Como se puede ver allí se diseñó las tablas y se obtubo las ecuaciones que describen los circuitos de control necesarios para las señales del motor. Teniendo ya la lógica de las señales que debían llegarle al motor y la lógica del movimiento a partir del reloj se unieron ambas cosas con tablas en digital para obtener el circuito de control y el código verilog. A continuación imagenes del proceso:

En la siguiente imagen se ve la tabla que se diseñó para obtener el circuito de control correspondiente del motor. Si se compara se puede ver que tiene tanto la lógica de las 4 salidas para los electroimanes como la lógica de maquina de estado vista en imñagenes previas.
![MotorTablas](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/57c47155a6b28f42ec67410ed64c6c8b3cb30096/Proyecto/Capturas/MotorTablas.png)

La siguiente imagen demuestra el circuito en funcionamiento cuando está apagado el motor, es decir cuando la señal de control que lo activa es cero. No ocurre nada, cada electrimán está apagado y el motor no se mueve bajo ninguna circunstancia.
![MotorApagado](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/57c47155a6b28f42ec67410ed64c6c8b3cb30096/Proyecto/Capturas/MotorApagado.png)

La siguiente demuestra el circuito encendido, cuando la señal de control es uno. En este caso se nota como uno de los electroimanes está encendido, en cada señal de reloj pasa de uno a otro electroiman en sucesioón constante para generar el movimiento requerido.
![MotorEncendido](https://github.com/Daniel-Porras/Digital-1-2023-2/blob/57c47155a6b28f42ec67410ed64c6c8b3cb30096/Proyecto/Capturas/MotorEncendido.png)

A partir de este diseño se exportó el código a verilog y luego se hizo la labor ya descrita de configurar todo de modo que pudiera funcionar junto con los displays y contadores ya hechos.

## Sensor de proximidad

Colocar el sensor de proximidad y que funcionara con el resto del circuito fue una labor realmente sencilla, fue cosa de declarar la señal dada por el sensor y mediante if's en verilog configurar de modo que si esa señal estaba activa apagara la señal del motor, pero guardara el valor en que se encontraba de modo que la rotación no se viera afectada y aún si lo dejaban quiero varios minutos apenas tuviese camino libre volviera a moverse como si nunca se hubiese detenido. Unas cuantas pruebas fueron suficientes para acoplar esta parte al proyecto.

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

Vale la pena mencionar que hubo que hacer varias pruebas e intentos de la impresión 3D hasta obtener las piezas finales, dado que el equipo no tenía experiencia en manejo de impresoras 3D al inicio algunas piezas salían con imperfecciones o deformidades, de modo que hubo que reconfigurar parámetros e intentar nuevamente hasta obtener piezas funcionales.

## Montaje final 

Una vez se tuvieron todas las piezas impresas a 3D como se querían se buscó montar todo el circuito. Al inicio las pruebas lógicas y de funcionamiento se hicieron únicamente con la FPGD, jumpers y protoboards; en ese montaje todo funcionaba correctamente y sin problema. Pero a la hora de montarlo a las piezas surgieron algunos problemas inesperados, uno de ellos fue que los pulsadores (que estaba planeado colocarlos en la base acoplados directamente) tuvieron que cambiarse y colocarse en una pieza aparte por problemas a la hora de conectarlos y hacerlos funcionas si se acoplaban.

Uno de los mayores problemas fue que las piezas no estaban diseñadas con tamaño correcto del todo, por ejemplo, los botones se tuvieron que descartar porque no cabían en la sección destinada para estos y por esto se colocaron aparte. Otro caso similar fue con la tapa, el equipo había conseguido pequeños imanes para colocar y abrir la tapa del plato que solo deja ver uno de los compartimentos, pero ocurrió que el plato resultó más alto de lo esperado y los imanes más fuertes de lo calculado, entonces con la tapa cerrada le costaba realizar correctamente el movimiento. Pero son detalles que se dejaron pasar dado que era un prototipo y el funcionamiento general era ideal.

Un problema más que se solucionó a la hora del montaje final fue la alimentación del circuito, para ello se consiguió una pequeña fuente portable que puede entregar 5V o 3.3V según se le configure, valores suficientes para el funcionamiento correcto del proyecto tal y como es visible en el video de la presentación. Hubo detalles que corregir hasta los últimos minutos pero el montaje final fue exitoso.

# Conclusiones y pensamientos finales

A lo largo del desarrollo de todo el proyecto surgieron distintos problemas o contratiempos derivados de situaciones que no se tuvieron en cuenta, errores de càlculos o cambios de planes. Pero aún con todo, el equipo supo sobreponerse a las distintas situaciones y resolverlas para hacer un funcionamiento óptimo del proyecto. Cada parte del proyecto se vió relacionada con la temática vista en la clase, desde la programación en verilog, la lógica combinacional en los circuitos, la lógica secuencial y el uso de Flip-Flops para las señales de control, el diseño de máquinas de estado finito que eran la base de control del motor.

Además se obtubieron conocimientos con diferentes programas de software libre, tanto por sugerencia del profesor de laboratorio como por iniciativa propia, útiles para la programación, el diseño del circuito, las piezas para imprimir en 3D y las simulaciones o la conexión con la FPGA. 
