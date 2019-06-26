#!/usr/bin/octave-cli

## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 2

## NOMBRE: Manuel Arturo Chinchilla Sanchez
## CARNE:  2013009344


## Cargue los datos de distancias
##
## Cada columna de D tiene las distancias a un sensor fijo en el
## espacio. 
D=load("-ascii","dists.dat");

## Las posiciones de los emisores están dadas por las _columnas_
## de la matriz S
E=load("-ascii","emisors.dat");

## Función calcula posición a partir de distancias a emisores.
##
## dists:     Distancias del punto a cada emisor como vector fila.
## emisorPos: Posiciones de los emisores, cada emisor en una columna.
## option:    Si solo hay 3 emisores, cuál de las dos soluciones retorna
## La posición i de dists contiene la distancia al emisor en la
## columna i.
##
function p=calcPosition(dists,emisorPos,option=1)

  ## Número de emisores usados
  dim = min(columns(emisorPos),length(dists));

  ## ##################
  ## ## Problema 2.1 ##
  ## ##################
  ## Construya la matriz M
  for i=1:dim
    #Construye cada vector de la Matriz M
    M(i,:) = [1, -2*emisorPos(1,i), -2*emisorPos(2,i), -2*emisorPos(3,i)];
  endfor
   

  ## ##################
  ## ## Problema 2.2 ##
  ## ##################
  ## Construya el vector b

  for i=1:size(dists,2)
    #construye el vector b con ayuda del cliclo
    b(i)=dists(i)^2-(emisorPos(1)+emisorPos(2)+emisorPos(3));
  endfor
  
  ## ##################
  ## ## Problema 2.3 ##
  ## ##################

  ## Calcule la matriz seudo-inversa utilizando SVD
  #iM=pinv(M); ## CAMBIE ESTO!! (se busca calcular esto con SVD

  #printf('Matriz seudoinversa con SVD \n');
  [U,W,V] = svd(M); #Funcion svd de Octave
  U = resize(U,rows(M), columns(M));  #Resize de U en mxn de M
  W = resize(W, columns(M),columns(M)); #Resize de W en nxn de M
  #Calcula el vector de [diag(1/Wj)]
  for i=1:columns(W)
    for j=1:rows(W)
      if (i==j)
        if (W(i,j)==0)  #Si el valor en la diagonal W es 0
          vW(i) = 0; #Evita division entre 0
        else
          vW(i) = (1/W(i,j)); #realiza operacion 1/Wj
        endif
      endif    
    endfor
  endfor
  iM = V.*vW*transpose(U);

  ## Verifique que iM y pinv(M) son lo mismo
  if (norm(iM-pinv(M),"fro") > 1e-6)
    error("Matriz inversa calculada con SVD incorrecta");
  endif

  ## ##################
  ## ## Problema 2.4 ##
  ## ##################
  
  ## Calcule la solución particular
  #hatp=zeros(4,1); ## CAMBIE ESTO!!
  bT = transpose(b);  #cambia vector fila a columna
  hatp = linsolve(M,bT);  #encuentra la solucion para p
  
  ## El caso de 3 dimensiones tiene dos posibles soluciones:
  if (dim==3)

    ## ##################
    ## ## Problema 2.5 ##
    ## ##################

    ## Con 3 emisores, calcule las dos posibles posiciones

    ## PONGA SU CÓDIGO AQUÍ
    onesVector = ones(rows(M),1); #Vector de unos
    nullVector = linsolve(M,onesVector); #Ax=1 -> x=nullVector, A=M
    p = iM .* b;  #hatp 
    pigTailp = p + *nullVector;  #Calcula pig tail p
    
    x1 = pigTailp(1,1);
    x2 = pigTailp(2,1)^2+pigTailp(3,1)^2+pigTailp(4,1)^2;
  
    
    
  else 
    ## ##################
    ## ## Problema 2.6 ##
    ## ##################

    ## Caso general

    ## PONGA SU CÓDIGO AQUÍ
    #fEsfera = inline('4/3*pi*r.^3');
    #surf(fEsfera(dists(1)));
    
    
  endif
  
endfunction

## Calcule la trayectoria de posiciones para una matriz de
## distancias que contiene en cada fila el vector de distancias
## a cada emisor.
## 
## Sea N el número de datos y S el número de emisores
## dists:     matriz de distancias de tamaño N x S
## emisorPos: matrix de tamaño 3xS
## option:    si S==3, entonces cuál de las dos soluciones devolver
##            option=1 implica usar + en cuadrática, y otra cosa usa -
function p=calcPositions(dists,emisorPos,option=1)
  n=min(columns(emisorPos),columns(dists));
  k=rows(dists);

  ## Reserve memoria para todos los puntos en la trayectoria
  p=zeros(k,3);
  
  ## Para todos los puntos en la trayectoria
  for i=1:k
    ## Calcule la posición del punto, dadas las distancias a los emisores
    p(i,:)=calcPosition(dists(i,1:n),emisorPos(:,1:n),option)';
  endfor

endfunction

## Función calcula distancia de un punto a todos los emisores
## pos:       Posición del objeto (en las filas)
## emisorPos: Posiciones de los emisores, en las columnas.
function d=calcDistances(pos,emisorPos)
  ## ##################
  ## ## Problema 2.7 ##
  ## ##################

  ## Calcule la distancia a cada emisor, dada la posición "pos" del
  ## objeto y las posiciones de los emisores.
  
  ## PONGA SU CÓDIGO AQUÍ
endfunction


## #######################
## ## Pruebas unitarias ##
## #######################

## Calculando una posición a partir de 3 sensores
display("Usando 3 emisores\n");
p=calcPosition(D(1,1:3),E)

## Calculando una posición a partir de 4 sensores
display("Usando 4 emisores\n");
p=calcPosition(D(1,1:4),E)

## Calculando una posición a partir de 5 sensores
display("Usando 5 emisores\n");
p=calcPosition(D(1,1:5),E)

## ########################
## ## Número de emisores ##
## ########################
n=5; ## Cambie aquí el número de emisores a usar

## Calcule las posiciones a partir de las distancias
p=calcPositions(D(:,1:n),E);

## Distancias a posiciones estimadas
ed=calcDistances(p,E);

## Errores
err=(ed-D);

## Promedio de errores
sum(err)/rows(err)

## Muestre los errores de las distancias a los primeros tres emisores
figure(1,"name","Errors")
hold off;
plot(err(:,1),"r");
hold on;
plot(err(:,2),"b");
plot(err(:,3),"k");

## Grafique las posiciones encontradas
figure(2,"name","Trayectoria estimada y emisores");
hold off;

## Grafique la trayectoria en azul
plot3(p(:,1),p(:,2),p(:,3),'b');
xlabel("x");
ylabel("y");
zlabel("z");

hold on;

if (n==3)  
  ## Si n==3 hay otros posibles valores para la trayectoria
  p=calcPositions(D(:,1:n),E,2);
  plot3(p(:,1),p(:,2),p(:,3),'r');
  
  ## A la fuerza use n=5 para ver la trayectoria verdadera
  p=calcPositions(D(:,1:5),E);
  plot3(p(:,1),p(:,2),p(:,3),'go');
endif

## Grafique los emisores en postes
plot3([E(1,1:n);E(1,1:n)],[E(2,1:n);E(2,1:n)],[E(3,1:n);zeros(1,n)],"linewidth",3);
plot3(E(1,1:n),E(2,1:n),E(3,1:n),'rx');
