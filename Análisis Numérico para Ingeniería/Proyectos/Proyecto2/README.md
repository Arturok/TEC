# Análisis Numérico. Proyecto 2
Instituto Tecnológico de Costa Rica  
Ingeniería en Computadores.   
Proyecto 2 del curso de análisis númerico para ingeniería.  
2018, semestre 1

### Prerequisites
Es necesario tener los siguientes paquetes:
1. Biblioteca Boost
2. Compiador g++
3. Biblioteca OpenCV

Para la instalación de OpenCV, ejecutar:
```
>$ sudo apt-get update
>$ sudo apt-get upgrade

```
```
$ sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

$ sudo apt-get install python3.5-dev python3-numpy libtbb2 libtbb-dev

$ sudo apt-get install libjpeg-dev libpng-dev libtiff5-dev libjasper-dev libdc1394-22-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev
```
```
$ sudo -s

$ cd /opt

/opt$ git clone https://github.com/Itseez/opencv.git

/opt$ git clone https://github.com/Itseez/opencv_contrib.git
```
```
/opt$ cd opencv

/opt/opencv$ mkdir release

/opt/opencv$ cd release

/opt/opencv/release$ cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_OPENGL=OFF -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules /opt/opencv/

/opt/opencv/release$ make -j4

/opt/opencv/release$ make install

/opt/opencv/release$ ldconfig

/opt/opencv/release$ exit

/opt/opencv/release$ cd ~
```

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente al Proyecto 2.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04
Desde la terminal:
1. Ubicarse dentro de la carpeta Proyecto2/

```
 ~ $ cd "Proyecto 2"/
```
2. Crear una carpeta llamada build

```
 ~ $ mkdir build
```
3. Entrar en la carpeta y ejecutar el comando para crear el "debug build version"

```
 ~ $ cd build
 ~ $ cmake ../ -DCMAKE_BUILD_TYPE=Debug
```
4. Compile con el comando 

```
 ~ $ make
```
## Ejecición de los tests
Desde la carpeta build ejecute el comando 

```
 ~ $ test/tester
```
## Ejecución del benchmark
Desde la carpeta build ejecute el comando

```
 ~ $ benchmarks/benchmark
```
## Probar la carga de imagen en Matriz
Desde la carpeta build ejecute el comando

```
 ~ $ src/tarea03 
```
NOTA: Éste paso carga en una matriz una imagen ubicada en la carpeta del 
proyecto, si desea cargar otra imagen diríjase al main ubicado en: 
/Proyecto2/src/main.cpp y cambie la variable path por la ruta de la nueva imagen.

### Problemas conocidos
No se pudo terminar el problema de aplicación, más específicamente el que calcula 
las corrientes en la malla resistiva y el que calcula la ruta del robot.


## Autores

* Jeremy Rodriguez Solano  
201209131  
jrodriguezs0292@gmail.com

* Arturo Chinchilla Sánchez  
2013009344  
mchinchilla11@gmail.com  

* Santiago Gamboa Ramírez  
santigr17@gmail.com  
2014092362  

### Version
1.0.0


