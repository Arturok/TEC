#Se importan las librerias necesarias para realzar la interfaz.
from tkinter import *
import time ##Hora de la computadora
from threading import Thread ##Thread (hilo), para evitar threading.Thread
import random ##Metodos para generar numeros aleatorios
import threading ##Hilos
import os
        
##Variable global
flag_cuadro=True

ventana_principal = Tk()
ventana_principal.title("Taller tKinter")
ventana_principal.minsize(800,700)
ventana_principal.resizable(width = NO, height = NO)
ventana_principal.config(bg = "#FFFFFF")

##Metodo para cargar imagenes
def cargarImagen(nombre):
    ruta = os.path.join('Imagenes',nombre)
    print(ruta)
    imagen = PhotoImage(file = ruta)
    return imagen

##Fondo de la pantalla
imagenFondo = cargarImagen("Fondo.gif")

LabelFondo = Label(ventana_principal, image=imagenFondo)
LabelFondo.place(x=0, y=400)

#crea el entry
#entrada = Entry(widgetContenedor, width)  
entrada = Entry(ventana_principal, width=30, bg = "#caff91")
entrada.place(x=260,y=350)

def mostrar():
    messagebox.showinfo("Mensaje leido en el entry",str(entrada.get()))
    
#Boton imprimir
#botonImprimir = Button(widgetContenedor, text=contenido, command=funcionLlamada, bg = colorDeFondo, fg = colorDeLetra)
botonImprimir = Button(ventana_principal, text="Imprimir",command=mostrar, bg = "#000000", fg = "#ffffff")
botonImprimir.place(x=345,y=410)

##Fondo de boton MondrianEfect
imagenMondrianEfect = cargarImagen("Mondrian.gif")

def VentanaMondrian(): 
    ##Se desvanece la ventana principal
    ventana_principal.withdraw()
    ventanaMondrian = Toplevel()
    ventanaMondrian.title("Taller tKinter")
    ventanaMondrian.minsize(600,600)
    ventanaMondrian.resizable(width=NO,height=NO)
    ##Se coloca un contenedor
    fondo = Canvas(ventanaMondrian , width=600,height=600, bg = "#FFFFFF")
    fondo.place(x=0,y=0)

    ##Metodo que retorna el valor hexadecimal de un color random
    def color():
        lista_colores=["#FF0000","#FFFF00","#00FF00","#00FFFF","#0000FF",
                       "#FF00FF"]
        return lista_colores[random.randrange(0,5)]

    def cuadro():
        global flag_cuadro
        ##Coordenadas en cada movimiento del cuadro
        x_cuadro=0
        y_cuadro=0
        ##Se hace referencia a la bandera flag_cuadro
        while flag_cuadro:
            try:
                ##Coloca un cuadro en cada iteracion
                cuadro = Canvas(fondo , width= random.randrange(20,30),
                                height = random.randrange(20,30), bg = color())
                cuadro.place(x=x_cuadro,y=y_cuadro)
                if(x_cuadro==600):
                    x_cuadro=0
                    y_cuadro+=30
                elif(y_cuadro==540):
                    y_cuadro=0
                else:
                    x_cuadro+=30
                time.sleep(0.1)
            except Exception as txt:
                print ("Error")

    ##Metodo del boton botonIniciarHilo
    def ver_cuadro():
        global flag_cuadro
        flag_cuadro=True
        ##Crea un hilo
        a = Thread(target=cuadro, args=())
        a.start()

    ##Metodo que destruye a los hilos
    def kill_cuadro():
        ##Se modifica la variable global y se finaliza el hilo
        global flag_cuadro
        flag_cuadro=False

    ##Metodo para el boton regresar
    def regresar():
        ##Se mata el hilo que genera los cuadros
        kill_cuadro()
        ##Se destruye esta ventana
        ventanaMondrian.destroy()
        ##Reaparece la ventana principal
        ventana_principal.deiconify()

    #Boton que inicia el hilo que autogenera los cuadros
    botonIniciarHilo = Button(fondo, text="Cuadro",command=ver_cuadro,
                              bg = "#000000", fg = "#ffffff")
    botonIniciarHilo.place(x=100,y=575)

    #Boton que detiene los hilos generadores de cuadros que esten corriendo
    botonDetenerHilos = Button(fondo, text="Quitar Cuadro",command=kill_cuadro,
                               bg = "#000000", fg = "#ffffff")
    botonDetenerHilos.place(x=200,y=575)

    #Boton que regresa a la ventana anterior
    botonVolver = Button(fondo, text="Regresar",command=regresar,
                         bg = "#000000", fg = "#ffffff")
    botonVolver.place(x=540,y=575)


    ventanaMondrian.mainloop()




#Boton que abre la ventana del efecto Mondrian
botonVentanaMondrian = Button(ventana_principal, image=imagenMondrianEfect, command = VentanaMondrian ,bg = "#000000", fg = "#ffffff")
botonVentanaMondrian.place(x=230,y=45)


ventana_principal.mainloop()
