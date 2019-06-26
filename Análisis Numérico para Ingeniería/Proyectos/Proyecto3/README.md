# Análisis Numérico. Proyecto 3
Instituto Tecnológico de Costa Rica  
Ingeniería en Computadores.   
Proyecto 3 del curso de análisis númerico para ingeniería.  
2018, semestre 1

### Prerequisites
Es necesario tener los siguientes paquetes/bibliotecas:
1- OpenMP
2- Python 2.7 o más reciente
3- Boost
4- g++

## Getting Started
En este documento se describe como compilar y ejecutar el programa correspondiente al Proyecto 2.  
La tarea se desarrollo en el sistema operativo Linux, Ubuntu16.04
Desde la terminal:

## Compilación de del programa
Desde la carpeta Proyecto 3 ejecute el comando 

```
 ~ $ cd Proyecto3-master/Proyecto3
 ~ $ mkdir build
 ~ $ cd build 
 ~ $ cmake ../ -DCMAKE_BUILD_TYPE=Debug
 ~ $ make
```

## Ejecución de del programa
Desde la consola se ejecutar el programa:

```
 ~ $ ./src/proyecto3
```

y agregando las opciones:


--help Imprime esta lista de opciones

--t〈val〉Indica temperatura en borde superior

--b〈val〉Indica temperatura en borde inferior

--l〈val〉Indica temperatura en borde izquierdo

--d〈val〉Indica temperatura en borde derecho

--i [tblr] Aisle los bordes indicados (t=arriba,  b=abajo,  l=izquierda,  r=derecha).  El usuario debe indicar uno o m ́as bordes junto a la opcion -i

--p 〈 archivo 〉 Indica la ruta y el nombre del archivo con perfil termico.  El detalle del contenido del archivo de perfil termico se brinda más abajo.

--h 〈 val 〉 Numero de pixeles horizontales en la solucion

--v 〈 val 〉 Numero de pixees verticales en la solucion

--q Desactive toda forma de visualizacion.  Si esta opcion no esta presente, el programa si debe mostrar los resultados.

--f Active el calculo de flujo de calor.

--g 〈 val 〉 Tamaño de rejilla de visualización para flujo de calor.  Este valor especifica cuantos pixeles cubre cada celda de la rejilla final


NOTA: Las temperaturas y la opción --i pueden recibir valores separados por espacios

NOTA: Para cargar el archivo de perfil térmico se necesita toda la ruta del archivo junto con su nombre

## Configuración del archivo de temperaturas
En un archivo *.txt se pueden especificar las temperaturas de la siguente forma:

top = 100

top = 10

top = 500

left = 50

right = 0

bottom = 0


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


