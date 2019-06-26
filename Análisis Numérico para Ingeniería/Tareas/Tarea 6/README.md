# Análisis Numérico para Ingeniería. Tarea 6
Instituto Tecnológico de Costa Rica  
Área Académica de Ingeniería en Computadores.   
Tarea #6 del curso de Análisis Númerico para Ingeniería.  
Semestre 1, 2018

### Prerequisites
Es necesario tener los siguientes paquetes:
1. Compiador g++.
2. Biblioteca Boost.
3. Biblioteca Lapack

```
sudo apt-get install liblapack-dev

```
4. Biblioteca Lapacke

```
sudo apt-get install liblapacke-dev

```
5. Biblioteca Openblas

```
sudo apt-get install libopenblas-dev

```

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente a la Tarea 6.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04.6.

Desde la terminal:
1. Ubicarse dentro de la carpeta Tarea6/

```
 ~ $ cd Tarea6
```
2. Crear una carpeta llamada buils

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
### Problemas conocidos

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
