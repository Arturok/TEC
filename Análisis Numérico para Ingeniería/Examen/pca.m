## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 3

## NOMBRE: Manuel Arturo Chinchilla Sanchez
## CARNE:  2013009344

3;

## Cargue los datos 
X=load("-ascii","pcadata.dat");
N=columns(X);

################################################
## Problema 3.1                               ##
## Grafique los datos                         ##
################################################
figure(1); #Figura 1
scatter3(X(1,:),X(2,:),X(3,:), "blue", "x");  #Grafica tridimencionalmente
hold; #Mantiene la imagen en la figura

################################################
## Problema 3.2                               ##
## Calcule la media de los datos              ##
################################################

dim = columns(X); #Cantidad de columnas en X
mediaXYZ = dim .\ sum(X,2); #Ecuacion de Valor medio

################################################
## Problema 3.3                               ##
## Muestre la media en rojo                   ##
################################################

figure(1);  #Figura 1
#Grafica el punto en 3D
scatter3 (mediaXYZ(1),mediaXYZ(2),mediaXYZ(3), "red", "filled");
hold off;  #Mantiene la imagen anterior de los puntos


################################################
## Problema 3.4                               ##
## Calcule los datos sin media                ##
################################################
figure(2);  #Figura 2
#A cada vector dimensional en X se le esta su media
mediaX = X(1,:) - mediaXYZ(1);  
mediaY = X(2,:) - mediaXYZ(2);
mediaZ = X(3,:) - mediaXYZ(3);
#Grafica en #D los puntos sin media
scatter3 (mediaX,mediaY,mediaZ, "blue", "x");
hold on;  #Mantiene la imagen



################################################
## Problema 3.5                               ##
## Calcule la matriz de covarianza            ##
################################################

covMat = cov ([mediaX',mediaY',mediaZ']);


################################################
## Problema 3.6                               ##
## Encuentre los eigenvalores y eigenvectores ##
################################################

[EVec,EVal]=eig(covMat);


################################################
## Problema 3.7                               ##
## Reordene los eigenvectores para PCA        ##
################################################

EVec = EVec';
EVectemp = EVec;
EVec(1,:) = EVectemp(3,:);
EVec(3,:) = EVectemp(1,:);


########################################################################
## Problema 3.8                                                       ##
## Cuáles son los ejes principales y qué varianza tiene los datos     ##
########################################################################

mns = strcat("Los ejes principales son  con valores de", num2str(lamb(3)) ," y ", num2str(lamb(2))," respectivamente");
display(mns);


########################################################################
## Problema 3.9                                                       ##
## Calcule la proyección de los datos al plano engendrado por los dos ##
## eigenvectores                                                      ##
########################################################################


EVecP = [EVec(1,:);EVec(2,:)];  #EigenVectores para la pproyeccion
Proyeccion = EVecP*[mediaX;mediaY;mediaZ]; #Se calcula la proyeccion


## Grafique la proyección
figure(3);  #nueva figura
scatter (Proyeccion(1,:),Proyeccion(2,:),"blue","x");#gRAFICA 3D
hold off;

########################################################################
## Problema 3.10                                                      ##
## Calcule los datos reconstrudos a partir de los datos proyectados   ##
########################################################################
figure(4);  #Figura 4
Xreconst = (EVecP'*Proyeccion); #Calcula Matriz reconstruida

#Suma la media a cada vector reconstruido
Xreconst(1,:) = Xreconst(1,:) + mediaXYZ(1);
Xreconst(2,:) = Xreconst(2,:) + mediaXYZ(2);
Xreconst(3,:) = Xreconst(3,:) + mediaXYZ(3);
 

#Grafica la matriz reconstruida
scatter3(Xreconst(1,:),Xreconst(2,:),Xreconst(3,:),"m","s");
hold on;

#grafica la matriz original
scatter3 (X(1,:),X(2,:),X(3,:), "b", "x");
hold off;