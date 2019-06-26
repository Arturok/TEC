################################################################################
#Problema 1: Llamado a funcion RK4 con y'=x(y**2); 0<=x<=1; y(0)=1; 1/8<=h<=1/1024
################################################################################

f1 = inline("x*(y**2)","x","y");       #Funcion a evaluar

h = 1/8;                              #Tamanyo de paso
sol_y = [];                           #soluciones de 'y' para h=1/1024
sol_x = [];                           #soluciones de 'x' para h=1/1024
paso = [];                            #"h's" usados
error = [];                           #Errores de las soluciones para cada h
while (h != 1/2048)
  [x,y] = rungekutta4(f1,0,1,1,h);     #Llamado a la funcion RK4
  e = (abs(2 - y(numel(y)))/2)*100;   #Error
  
  error = [error e];                  #Concatena error  
  paso = [paso h];                    #Concatena pasos
  
  if (h == 1/1024)                    #Concatena resultados si y solo h=1/1024
    sol_x = x;
    sol_y = y;
  endif
  
  h = h/2;                            #Modifica paso
endwhile

################################################################################
                                  #Graficacion
################################################################################

################################################################################
#Grafica 1> resultado de y(x) para el intervalo de x, con h=1/1024
################################################################################

figure;
x_plot1 = sol_x;                              #Valores de variable independiente
y_plot1 = sol_y;                              #Valores de variable dependiente

hold on;                                      #Inicia Graficacion

p1 = plot(x_plot1,y_plot1);                   #Instancia linea

set(p1,'Color','b','LineWidth',2);            #Establece color y ancho de linea

ylabel('y(x)');                               #Establece etiqueta de eje y
xlabel('x');                                  #Establece etiqueta de eje x
title('Resultados de y(x) para h=1/1024');    #Establece titulo de grafica

hold off;                                     #Cierra figura

################################################################################
#Grafica 2> error final en x=1 en funcion de h
################################################################################

figure;                                       #Inicia figura
x_plot2 = paso;                               #Valores de variable independiente
y_plot2 = error;                              #Valores de variable dependiente

hold on;                                      #Inicia Graficacion

p2 = semilogy(x_plot2,y_plot2);               #Instancia linea

set(p2,'Color','g','LineWidth',2);            #Establece color y ancho de linea

ylabel('error');                              #Establece etiqueta de eje y
xlabel('h_i');                                #Establece etiqueta de eje x
title('Error de EDO en funcion de h para x=1 (eje y en escala semilogaritmica)'); #Establece titulo de grafica
                                             
hold off;                                     #Cierra figura

pause();