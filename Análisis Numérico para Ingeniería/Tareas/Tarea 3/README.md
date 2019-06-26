# Análisis Numérico. Tarea 3
Instituto Tecnológico de Costa Rica  
Ingeniería en Computadores.   
Tarea 1 del curso de análisis númerico para ingeniería.  
2018, semestre 1

### Prerequisites
Es necesario tener los siguientes paquetes:
1. librería de pruebas Boost
2. Compiador de g++


## Getting Started
En este documento se describe como ejecutar la tarea 3.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04.6.

Realizar los siguientes pasos en terminal
1. Ingresar a la carpeta tarea3/
2. Ejecutar los comando:

```
> mkdir build
> cd build
> cmake ../ -DCMAKE_BUILD_TYPE=Release | cmake ../ -DCMAKE_BUILD_TYPE=Debug
> make
> ./test/teaster

```

### Problemas conocidos

* El código no pasa ciertas pruebas unitarias del método Newton Raphson  
* No se logró la tarea de hacer la graficación de los métodos.


## Autores

* Arturo Chinchilla Sánchez  
2013009344  
mchinchilla11@gmail.com  

* Jeremy Rodriguez Solano  
201209131  
jrodriguezs0292@gmail.com

* Santiago Gamboa Ramírez  
santigr17@gmail.com  
2014092362  

### Version
1.0.0