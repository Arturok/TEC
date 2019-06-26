# Análisis Numérico para Ingeniería. Tarea 4
Instituto Tecnológico de Costa Rica  
Área Académica de Ingeniería en Computadores.   
Tarea #4 del curso de Análisis Númerico para Ingeniería.  
Semestre 1, 2018

### Prerequisites
Es necesario tener los siguientes paquetes:
1. Compiador g++.
2. Biblioteca Boost.
3. Biblioteca matplotlib

```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
sudo pip install matplotlib

```
4. Biblioteca Tkinter

```
sudo apt-get install python-tk
```

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente a la Tarea 4.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04.6.

Desde la terminal:
1. Ubicarse dentro de la carpeta Descomposicion/

```
 ~ $ cd Descomposicion
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
El progrma se realizó y su implementación permitió crear las pruebas de los siguientes métodos:  
Loolittle, Crout, Inversion.  
Se logró implementar QR pero no pasa las pruebas del bechmarck porque la diferencia es mayor al epsilon.  
La prueba para Solve LU no se implementó pero si se implementó el método ya que Inversión lo utiliza.  
No se implementó Solve QR
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
