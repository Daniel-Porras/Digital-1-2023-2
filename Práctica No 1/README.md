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
