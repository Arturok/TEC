#Primero.m
#@author Arturo Chinchilla
#02/20/2018
#version 1.0
function [act, err1 , err2, terms] = Primero()
  format long
  n = input('Ingrese un numero entero de cifras significativas (entre 1 y 15): ');
  x = input('Ingrese un valor real correspondiente al exponente: '); 
  if(n>15 || n<1)
    printf("Error: la cantidad de cifras significativas debe de ser un entero entre o y 15 (inclusive) \n");
    return;
  endif
#Correct program flow
  act = 0.0;
  prev = 0.0;
  terms = 0;
  n = 0.5*(10**(2-n));
  err2=100.0;
  fact = 0.0;
  while (n < err2)
    prev = act;
    fact = factorial(terms);
    act += x**terms/fact;
    err2 = (1 - prev/act) * 100;
    terms++;
  endwhile
  err1 = (1 - act/exp(x)) * 100;
  trueVal = exp(x);
  printf("Resultado calculado de e^%d = ",x);
  disp(act);
  printf("Resultado verdadero de e^%d = ",x);
  disp(trueVal);
  printf("Error relativo porcentual verdadero =  ");
  disp(err1);
  printf("Error relativo porcentual aproximado =  ");
  disp(err2);
  printf("Cantidad de terminos utilizados =  ");
  disp(terms);
endfunction
Primero();