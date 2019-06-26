#Tarea2.m
#@author Arturo Chinchilla
#02/28/2018
#version 1.0

function Tarea2()
#Ask for var values
printf("Desea usar valores predefinidos? (x=1, Lambda=0.99): \n");
options = input("1 para si\n2 para no\n");
if (options == 1)
  x=1;
  Lambda=0.99;
else
  x = input("Digite el valor de x: ");
  Lambda = input("Digite el valor de Lambda: ");
endif

#Define the function, derivate and other variables
usedFunction = inline('0.3*x*x*x*x-0.15*x*x');
derivedFunction = (1.2*x*x*x-0.3*x);
h0 = 1;
hmin = 0.00000000000001;

#Vector to store the iteration's results for plot
forwardDiff = [];
backwardDiff = [];
centeredDiff = [];
H = [];
nu = 0;

#Loop for iterations
while(h0 > hmin)
  nu++;
  h0 = h0*Lambda;
  forwardDiff = [forwardDiff; (usedFunction(x+h0)-usedFunction(x))/h0];
  backwardDiff = [backwardDiff; (usedFunction(x)-usedFunction(x-h0))/h0];
  centeredDiff = [centeredDiff; (usedFunction(x+h0)-usedFunction(x-h0))/(2*h0)];
  H = [H; h0];
endwhile

#Calculate the error
printf("Cantidad de iteraciones: %d\n",nu);
errorForward = abs(forwardDiff - derivedFunction)/derivedFunction;
errorBackward = abs(backwardDiff-derivedFunction)/derivedFunction;
errorCentered = abs(centeredDiff - derivedFunction)/derivedFunction;

#Plotting
f=figure;
set(f,"visible", "on");
hold
title("Error calculado en funcion del tamaño del paso");
xlabel("h_i");
ylabel("Error_{relativo}");
loglog(H, errorForward, 'r');
loglog(H, errorBackward, 'g');
loglog(H, errorCentered, 'b');
legend('Hacia adelante', 'Hacia atras', 'Centrada');

pause();
endfunction

Tarea2();

