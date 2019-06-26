# Análisis Numérico. Proyecto 1
Instituto Tecnológico de Costa Rica  
Ingeniería en Computadores.   
Proyecto 1 del curso de análisis númerico para ingeniería.  
2018, semestre 1

### Prerequisites
Es necesario tener los siguientes paquetes:
1. Biblioteca Boost
2. Compiador g++
3. Valgrind
Para la instalación de Valgrind ejecutar:
```
sudo apt-get install valgrind kcachegrind graphviz
```

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente al proyecto 1.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04.6.

Se puede hacer uso de la bandera --help si se desea obtener ayuda con los comandos.

```
>$ ./main --help

```
Realizar los siguientes pasos en terminal
1. Ubicarse dentro de la carpeta Polinomios/
2. Para compilar ejecutar el comando:

```
>$ make

```
Para ejecutar cada método:

NOTA: Los coeficientes del polinomio se deben ingresar de forma descendente en los comandos.

>Muller:

```
>$ ./main --muller --polynomial "coef1" "cef2" ... "coefn" --position "pos1" "pos2" "pos3"

```
Donde "coefx" es el valor de cada coeficiente del polinomio, "posx" son los 3 valores de posiciones iniciales.

Otras banderas que se pueden usar:
1. --tolerance "value": Aplica la tolerancia.
2. --maxIterations "value": Aplica un máximo de iteraciones para el método.
3. --singlePrecision "boolValue": "boolValue" = 1 (para simple), o 0 (para double).

>Laguerre:

```
>$ ./main --laguerre --polynomial "coef1" "cef2" ... "coefn" --order "order_value"

```
Donde "order_value" es el valor constante del orden del polinomio usado.

Otras banderas que se pueden usar:
1. --polish "boolValue": "boolValue" = 1 (si se desea aplica pulido), o 0 (si no se desea).
2. --singlePrecision "boolValue": "boolValue" = 1 (para simple), o 0 (para double).

>Deflación:

```
>$ ./main --deflation --polynomial "coef1" "coef2" ... "coefn" --root "root_value"

```
Otras banderas que se pueden usar:
1. --singlePrecision "boolValue": "boolValue" = 1 (para simple), o 0 (para double).

>Deflación para complejos:

```
>$ ./main --deflation2 --polynomial "coef1" "coef2" ... "coefn" --complexRoot "realValue" "complexValue"

```
Donde "realValue" es el valor de la parte real de l raíz compleja,  "complexValue" es el valor coplejo de la misma.

Otras banderas que se pueden usar:
1. --singlePrecision "boolValue": "boolValue" = 1 (para simple), o 0 (para double).
  
Para ver el reporte de Valgrind se debe dar doble click sobre el archivo: callgrind.out.13870  

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