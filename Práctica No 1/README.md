# Instalación de herramientas en Linux Mint Cinnamon
A continuación, se mostrará el proceso de instalación de varias aplicaciones las cuales se utilizarán a lo largo del curso de Digital I.
## Miniconda
En primer lugar se instaló el gestor de paquetes y administrador de entornos Miniconda. Para esto se realizó lo siguiente en la terminal:
```console
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ bash Miniconda3-latest-Linux-x86_64.sh # Seguir las instrucciones y reiniciar la terminal
```
Una vez instalado en el terminal aparecerá ```(base)```, lo cual indicará que ya se encuentra en el entorno de conda.

```
(base) $ conda update conda 
(base) $ conda create -n digital python=3.10 
(base) $ conda activate digital  
(digital) $ python --version 
```
Una vez realizado este procedimiento se obtuvo lo siguiente:
![pantallazoConda](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/73449036/13a16e5b-81c6-4fa3-816c-eb8fd802b72a)

> Para activar o desactivar el entorno **digital** se hacen uso de los siguiente comandos respectivamente: ```$ conda activate digital``` y ```$ conda deactivate ```

### Descargar herramientas por medio de Miniconda
```
(digital) $ conda install -c conda-forge gtkwave 
(digital) $ conda install -c conda-forge graphviz
(digital) $ conda install -c symbiflow netlistsvg
(digital) $ conda install -c "litex-hub" yosys
(digital) $ conda install -c "litex-hub" iverilog
```

## Herramienta de simulación Digital
### Máquina Virtual de Java
Es necesario contar con una máquina virtual de Java para poder correr el programa de simulación. Antes de intentar instalar un [JDK](https://adoptium.net/), se debe revisar si el OS ya incorpora Java. Para confirmar esto es puede intentar alguno de los siguientes comandos: `java --version`o en su defecto `whereis java`.

En caso de no contar con Java puede instalarse el JDK con algún gestor de paquetes, ejemplo: 
```
sudo apt install openjdk-11-jdk # > Si es una distribución basada en debian
```
### Instalación de Digital
1. Descargar [Digital.zip](https://github.com/hneemann/Digital/releases/latest/download/Digital.zip) y descomprimirlo.

![Screenshot from 2023-08-22 16-35-32](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/01333450-7e50-471f-ba18-07f296bd16f5)

2. Se ejecuta el programa mediante la terminal abierta en la capeta descomprimida: el comando es `java -jar Digital.jar`

![Screenshot from 2023-08-22 16-35-53](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/4dcc4c10-0406-42a0-b014-252029cbcf47)

3. Para isnstalar Digital y encontrar la aplicación en el menú se ejecuta `./install.sh` en el directorio donde se encuentra Digital.jar. (el directorio descomprimido en pasos anteriores)

![Screenshot from 2023-08-28 21-43-36](https://github.com/Daniel-Porras/Digital-1-2023-2/assets/142681600/6fefbf60-c0cb-47d2-bff0-95fbf6269fb7)

