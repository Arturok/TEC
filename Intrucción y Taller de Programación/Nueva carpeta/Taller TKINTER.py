#Se importan las librerias necesarias para realizar la interfaz.
from tkinter import *
import os

ventana_principal = Tk()
ventana_principal.title("Taller tKinter")
ventana_principal.minsize(800,700)
ventana_principal.resizable(width=NO, height=NO)
#ventana_principal.config(bg = "blue")   #bg = Back ground #o colores en hexadecimal



#Método para cargar imágenes
def cargarImagen(nombre):
    ruta = os.path.join('Imagenes',nombre)
    print (ruta)
    imagen = PhotoImage(file = ruta)
    return imagen

#Fondo de la pantalla
imagenFondo = cargarImagen("conejo.gif")

LabelFondo = Label(ventana_principal, image=imagenFondo)
LabelFondo.place(x=0, y=400)
