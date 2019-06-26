from tkinter import*
from time import time, sleep #Importa funcionde tiempo
from threading import Thread ##Thread (hilo), para evitar threading.Thread
import random ##Metodos para generar numeros aleatorios
import threading ##Hilos
import os
#import winsound ##para sonido

def juego():
    #creaventana principal
    ventana_principal= Tk()
    ventana_principal.title("TAREA CORTA")
    ventana_principal.geometry("1200x931+100+10")
    #ventana_principal.minsize(1200,917)
    ventana_principal.resizable(width = NO, height = NO)
    ventana_principal.config(bg = "#FFFFFF")

    fondo2 = Canvas(ventana_principal , width=1200,height=1200,bg="red")
    fondo2.place(x=622,y=-10)
    fondo = Canvas(ventana_principal , width=1200,height=1200,bg="black")
    fondo.place(x=0,y=0)
    jugador=84
    creacion=0
    humano="yellow"

    global balas
    balas=5
    n="green"
    nivel=1
    robote=[]
    roboto=[]
    nl=[]
    robot="blue"
    fila1=[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]
    def cargarImagen(nombre):
        ruta = os.path.join('Imagenes',nombre)
        print(ruta)
        imagen = PhotoImage(file = ruta)
        return imagen
    def gato():
        
       

        
        ind=0
        c1=1
        c2=0
        while ind < 24:
            nl.append(Button(fondo))
            nl[ind].grid(row=c2,column=c1)
            ind+=1
            if c1==0 and c2<=6:
                c2=c2-1
            elif c2==6:
                c1=c1-1
            
            elif c1==6:
                c2=c2+1
            else: c1+=1
        autor = cargarImagen("parlante.gif")
        arenal = cargarImagen("arenal.gif")
        hotel_costa = cargarImagen("hotel_costa.gif")
        juan_santamaria = cargarImagen("juan_santamaria.gif")
        rio_celeste = cargarImagen("rio_celeste.gif")
        salida = cargarImagen("salida.gif")
        
        nl[0].config(image=(salida),width=127,height=127),nl[8].config(image=autor,width=127,height=127), nl[16].config(image=autor,width=127,height=127)
        nl[1].config(image=(arenal),width=127,height=127),nl[9].config(image=autor,width=127,height=127),  nl[17].config(image=autor,width=127,height=127)
        nl[2].config(image=(autor),width=127,height=127),nl[10].config(image=autor,width=127,height=127), nl[18].config(image=autor,width=127,height=127)
        nl[3].config(image=(autor),width=127,height=127),nl[11].config(image=autor,width=127,height=127), nl[19].config(image=autor,width=127,height=127)
        nl[4].config(image=(autor),width=127,height=127),nl[12].config(image=autor,width=127,height=127), nl[20].config(image=autor,width=127,height=127)
        nl[5].config(image=(autor),width=127,height=127),nl[13].config(image=autor,width=127,height=127), nl[21].config(image=autor,width=127,height=127)
        nl[6].config(image=(autor),width=127,height=127),nl[14].config(image=autor,width=127,height=127), nl[22].config(image=autor,width=127,height=127) 
        nl[7].config(image=(autor),width=127,height=127),nl[15].config(image=autor,width=127,height=127), nl[23].config(image=autor,width=127,height=127)

        nl[0].image = salida
        nl[1].image = arenal
        nl[2].image = autor
        nl[3].image = autor
        nl[4].image = autor
        nl[5].image = autor
        nl[6].image = autor
        nl[7].image = autor
        nl[8].image = autor
        nl[9].image = autor
        nl[10].image = autor
        nl[11].image = autor
        nl[12].image = autor
        nl[13].image = autor
        nl[14].image = autor
    fondo5 = cargarImagen("fondo5.gif")    
    labeltitulo=Label(ventana_principal,image=fondo5,width=660,height=660,bg="white")
    labeltitulo.image=fondo
    labeltitulo.place(x=133,y=133)

        
    gato()
    ventana_principal.mainloop()

juego()
