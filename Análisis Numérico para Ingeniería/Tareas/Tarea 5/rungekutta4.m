#Metodo RK4
#[In]
#f > Funcion a evaluar (inline)
#xi > Valor inicial de x
#xf > Valor final de x
#y0 > Valor de y evaluado en parametro inicial de x
#h > Tamanyo de paso
#[Out]
#x > Vector con valores de x en intervalos de h
#y > Vector con soluciones en cada valor de x
function [x,y] = rungekutta4(f,xi,xf,y0,h)
  formula(f);
  x = xi:h:xf;                                            #Almacena valores de x
  solvs = [];                                             #Almacena soluciones de iteraciones
  solvs = [solvs y0];                                     #Concatena valor de y0
  
  for i=1:numel(x)-1
    k1 = f(x(i),solvs(i));                                #Valores constantes de k
    k2 = f(x(i)+h/2,solvs(i)+((k1*h)/2));
    k3 = f(x(i)+h/2,solvs(i)+((k2*h)/2));
    k4 = f(x(i)+h,solvs(i)+k3*h);
    
    solvs = [solvs (solvs(i) + (h*(k1+2*k2+2*k3+k4))/6)]; #Solucion de la iteracion
  endfor
  
  y = solvs;                                              #Valor de retorno, solucion final
endfunction