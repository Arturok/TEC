################################################################################
#Problema 2: EDO rigida: y'=100-y; 0<=x<=200; y(0)=5
################################################################################
clear all
close all

pkg load odepkg
f2 = inline ("100 - y");                      #Funcion a evaluar

#Constantes usadas
xi = 0;                                       #Rango de x usado:inicio
xf = 200;                                     #Rango de x usado:final
y0 = 5;                                       #valor inicial
h = 1/5;                                      #Tamanyo de paso

#rungekutta4
tic();                                        #Comienza tiempo
  [x_RK4,y_RK4] = rungekutta4(f2, xi, xf, y0, h);
tiempoRK4 = toc();                            #Finaliza tiempo
x_plotRK4 = x_RK4(500:1000);                  #Vector de x a graficar
y_plotRK4 = y_RK4(500:1000);                  #Vector de y a graficar

#ode45
tic();                                        #Comienza tiempo
  [x_ode45,y_ode45] = ode45(f2,[xi,xf],y0);
tiempo_ode45 = toc();                         #Finaliza tiempo
x_plotode45 = x_ode45(6:11);                  #Vector de x a graficar
y_plotode45 = y_ode45(6:11);                  #Vector de y a graficar

#ode23
tic();                                        #Comienza tiempo
  [x_ode23,y_ode23] = ode23(f2,[xi,xf],y0);
tiempo_ode23 = toc();                         #Finaliza tiempo
x_plotode23 = x_ode23(6:11);                  #Vector de x a graficar
y_plotode23 = y_ode23(6:11);                  #Vector de y a graficar

#Grafica de rungekutta4, ode45 y ode23
hold on;
  p1 = plot(x_plotRK4,y_plotRK4);             #Grafica de rungekutta4
  p2 = plot(x_plotode45,y_plotode45);         #Grafica de ode45
  p3 = plot(x_plotode23,y_plotode23);         #Grafica de ode23
  
  #Establecer colores de lineas
  set(p1,'Color','g','LineWidth',2);
  set(p2,'Color','r','LineWidth',2);
  set(p3,'Color','b','LineWidth',2);
  
  #Establecer etiquetas de ejes y titulo
  ylabel('y');
  xlabel('x');
  title('Resultados para rungekutta4, ode45 y ode23');
  
  #Establecer simbologia
  legend('rungekutta4','ode45','ode23');
hold off;

#Muestra los tiempos de cada metodo
disp("----------Tiempo usado por cada metodo----------")
disp("El tiempo para RK4 es: "), disp(tiempoRK4)
disp("El tiempo para ode45 es: "), disp(tiempo_ode45)
disp("El tiempo para ode23 es: "), disp(tiempo_ode23)

#Cantidad de puntos usados por cada metodo
disp("----------Cantidad de puntos usados por cada metodo----------")
disp("La cantidad de puntos usados por RK4 es: "), disp(1001)
disp("La cantidad de puntos usados por ode45 es: "), disp(11)
disp("La cantidad de puntos usados por ode23 es: "), disp(11)

pause();