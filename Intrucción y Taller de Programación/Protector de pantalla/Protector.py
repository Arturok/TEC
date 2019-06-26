from tkinter import *
import os
import time
from threading import Thread
import threading


#ventanaP = Tk()
#ventanaP.geometry("800x550+100+100")
#ventanaP.title("Prueba")







ventanaDP = Tk()
ventanaDP.geometry("800x550+100+100")
Activado=True


#Función para cargar imágenes
def cargarImagen(nombre):
    ruta = os.path.join('Imagenes',nombre)
    imagen = PhotoImage(file = ruta)
    return imagen
#Cargando imagenes del Descansa Pantallas
imagenFondo1 = cargarImagen("1.png")
imagenFondo2 = cargarImagen("2.png")
imagenFondo3 = cargarImagen("3.png")

#Funcion que hace el ciclo de las imagenes
def descansapantalla():
    global Activado
    lblFondo = Label(ventanaDP, image=imagenFondo1).place(x=0, y=0)
    time.sleep(3)
    image=1
    while Activado:
         try:
             if image==1:
                 lblFondo = Label(ventanaDP, image=imagenFondo2).place(x=0, y=0)
                 image=2
                 time.sleep(3)
             if image==2:
                 lblFondo = Label(ventanaDP, image=imagenFondo3).place(x=0, y=0)
                 image=3
                 time.sleep(3)
             if image==3:
                 lblFondo = Label(ventanaDP, image=imagenFondo1).place(x=0, y=0)
                 image=1
                 time.sleep(3)
         except Exception as txt:
            print("ERROR")
#Funcion del boton boton que Inicia el hilo
def ver_image():
    global Activado
    Activado=True
    ##Crea un hilo
    a = Thread(target=descansapantalla, args=())
    a.start()
#Funcion del boton terminar hilo
def parar_image():
    global Activado
    Activado=False
def regresarDP():
    #Se destruye la ventana About
    ventanaDP.destroy()
    #Reaparece la ventana principal
    Ventana.deiconify()
#Boton para comenzar el hilo
btnVerImage=Button(ventanaDP,text="Comenzar",command=ver_image).place(x=100,y=525)
#Boton que termina el hilo
btnPararImage=Button(ventanaDP,text="Parar",command=parar_image).place(x=200,y=525)
#Boton que regresa a la ventana Principal desde la ventana de Descansa Pantallas
btnVolver = Button(ventanaAbout, text="Regresar",command=regresarDP,bg = "#000000", fg = "#AAAAAA").place(x=700,y=500)
ventanaDP.mainloop()
