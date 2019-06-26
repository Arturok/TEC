## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 1

## NOMBRE: Manuel Arturo CHinchilla Sánchez
## CARNE:  2013009344

2;

## Cargar los datos
X=load("-ascii","regresion.dat");

####################################################
## Problema 1.1                                   ##
## Grafique los puntos bidimensionales            ##
####################################################
figure(1);
set(1, "visible", "on");
hold on;
title("Optimización de curva");
scatter(X(1,:), X(2,:),[], "b", "s", "filled");



####################################################
## Problema 1.2                                   ##
## Implemente la función de error                 ##
####################################################
function val=f(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna

  ## Ponga su código aquí:
  i = 1;  #Iterador
  m = size(X,2); #Condicion de parada
  error = 0;
  while (i <= m)
    error = error + (X(2,i)-(abc(1) * X(1,i)^2 + abc(2)*X(1,i) + abc(3)))^2;
    i++;
  endwhile;
  
  val = error;  
  
endfunction


####################################################
## Problema 1.3                                   ##
## Implemente el gradiente de la función de error ##
####################################################
function val=gf(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna
  
  val=[0,0,0]'; # Borre esta línea
  
  
  ## Use diferenciación NUMERICA para calcular el gradiente de f:
  
  gradA = gradB = gradC = 0;  #Inicializa los gradientes
  
  paso = 0.00000000000001;  #Tamaño del paso
  #Calcula todos los gradientes
  gradA = (f([abc(1) + paso, abc(2), abc(3)], X) - f([abc(1) - paso, abc(2), abc(3)], X))/(2 * paso);
  gradB = (f([abc(1), abc(2) + paso, abc(3)], X) - f([abc(1), abc(2) - paso, abc(3)], X))/(2 * paso);
  gradC = (f([abc(1), abc(2), abc(3) + paso], X) - f([abc(1), abc(2), abc(3) - paso], X))/(2 * paso);
  #Asigna los gradientes al vector
  val = [gradA, gradB, gradC];
  
endfunction


####################################################
## Problema 1.4                                   ##
## Descenso de gradiente                          ##
####################################################
function [ABC,err]=optimice(f,gf,X,lambda,tol,abc0=[0,0,0]')
  ## f      es el handler de la función a optimizar
  ## gf     es el handler que calcula el gradiente de f
  ## X      es la matriz de datos 
  ## lambda es el tamaño de paso del descenso de gradiente
  ## tol    es el umbral de tolerancia para determinar convergencia
  ## abc0   es un vector [a0,b0,c0] especificando el punto inicial de
  ##        la optimización
  ## ABC    es una matrix de n x 3, donde cada fila corresponde a un
  ##        paso en el proceso de optimización.  Es decir, ABC(:,1)
  ##        corresponde siempre a abc0, y ABC(:,rows(ABC)) corresponde
  ##        a los parámetros óptimos.
  ## err    es el vector conteniendo los errores en cada paso

  if ( (rows(abc0)!=3) || columns(abc0)!=1 )
    error("Vector inicial no tiene forma 3x1");
  endif;
  
  ## Elimine la siguiente inicialización
  #ABC=0; err=0;

  ## Ponga su código aquí:
  error = 100;  #Inicializa variable para el error en cada iteracion
  i = 1;  #iterador
  ABC(1,:) = abc0;
  while(tol < error)
    ABC(i+1,:) = ABC(i,:) - (lambda * gf(ABC(i,:), X)); #Función
    error = f([ABC(i+1,:)],X);  #Almacena el error
    if (i == 1)
      err = error;  #Primer Valor de error
    else
      err = [err, error]; #Siguientes valores de error
    endif
    i++;   
  endwhile;
endfunction

## Llame al optimizador con la interfaz anterior

lambda=0.002;  # Ajuste esto
tol=87.867; # Ajuste esto
#tol = 89;
[ABC,err]=optimice(@f,@gf,X,lambda,tol,[0,1,0]');

####################################################
## Problema 1.5                                   ##
## Imprima el conjunto óptimo de parámetros       ##
####################################################

m = size(ABC,1);  #tamaño del vector
printf('Conjunto optimo: [%d, %d, %d] \n ', ABC(m,:));  #Imprime optimo



####################################################
## Problema 1.6                                   ##
## Muestre el error en función de las iteraciones ##
####################################################

figure(2);  #Nueva Figura
plot(err);  #Grafica el error
xlabel("Iteraciones");  #Etiqueta eje x
ylabel("Error");  #Etiqueta eje y


####################################################
## Problema 1.7                                   ##
## Muestre las curvas inicial, intermedias y      ##
## final ajustadas a los datos                    ##
####################################################
hold on;

#1.7.1
funct = inline('0*x.^2+1*x+0'); #Funcion con a=0, b=1, c=0 -> bx
figure(1);  #Selecciona la figura 1
x = -2:2; #Rango de graficacion
plot(x,funct(x),'0000','LineWidth',3);  #Grafica la linea color negro

#1.7.2
cNum = 2; #Iterador para el numero de curva
rangeX = linspace(-2,2);  #Genera un vector con valores entre el rango dado
while cNum < m
  curve = inline('a*x.^2+b*x+c','x','a','b','c'); #Funcion a ser graficada
  #Grafica todas las curvas con ayuda del ciclo
  plot(rangeX,curve(rangeX,ABC(cNum,1), ABC(cNum,2), ABC(cNum,3)),'Color','cyan');  
  cNum++;  
endwhile

#1.7.3 Grafica la curva en el optimo
plot(rangeX,curve(rangeX,ABC(m,1), ABC(m,2), ABC(m,3)),'Color','red','LineWidth',3);
  
  
