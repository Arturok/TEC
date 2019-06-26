# Análisis Numérico. Tarea 5
Instituto Tecnológico de Costa Rica  
Ingeniería en Computadores.   
Tarea 5 del curso de análisis númerico para ingeniería.  
2018, semestre 1

### Prerequisites
Es necesario tener los siguientes paquetes:
1. Octave


Para la instalación de Octave, ejecutar:

```
>$ sudo apt-get update
>$ sudo apt-get install octave

```

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente a la Tarea 5.  

La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04

Desde la terminal:
1. Ubicarse dentro de la carpeta Tarea5/

```
 ~ $ cd "Tarea5"/
```

## Punto 1
Desde la carpeta "Tarea5/" ejecute el comando 

```
 ~ $ octave problema1.m
```
Se le mostrarán las gráficas correspondientes del problema, se imprimen en pantalla una sobre otra, mueva la de encima para observar ambas.

Pulse Enter en el terminal para salir.

## Punto 2
Desde la carpeta "Tarea5/" ejecute el comando 

```
 ~ $ octave problema2.m
```

Se le mostrará el gráfico correspondiente.

Se mostrarán además en la terminal los datos sobre el tiempo y los puntos que utiliza cada método.

Pulse Enter en el terminal para salir.

## Comparación
Compare qúe tan apropiado es cada ḿetodo para esta ODE concreta.

 RK4 es bastante apropiado, ya que usa 1001 puntos y por tanto su precisión es la mayor, sin embargo en el tiempo de cálculo (0.14069), se encuentra por encima de ode45(0.029735) y ode23 (0.019506).
 Para ode45, la presión es la misma que de 23 pero con un tiempo de ejecución mayor, siendo esto poco apropiado.
 Para ode23, la presicion es la misma que ode45, pero el tiempo de ejecucion es mucho menor que los otros dos lo que lo hace  apropiado en tiempo de calculos, sin embargo solo usa 11 puntos.
 
 En conclusión, si se necesita alta precisión el método adecuado es RK4, mientras que se lo necesario es un bajo tiempo de ejecución el método adecuado es ode23.



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
