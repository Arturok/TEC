from Tkinter import *
import os

ventana=Tk()
ventana.title("Tablero")
ventana.geometry("600x469+100+100")
ventana.config(bg="Blue")



#Función para cargar imágenes
def cargarImagen(nombre):
    ruta = os.path.join('Imagenes',nombre)
    imagen = PhotoImage(file = ruta)
    return imagen



#Etiquetas de la ventana principal
#lblBienve=Label(ventana,text="Bienvenido").place(x=150,y=10)
#cnvsjuego=Canvas(ventana, width=0, height=0)
#cnvsjuego.place(x=10,y=50)
#Función que crea el tablero
M=[[0,1,0,1,0,1,0,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,0,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,0,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,3,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,0,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,0,1,0,1,0,1,0],
   [1,0,1,0,1,0,1,0,1,0,1,0,1],
   [0,1,0,1,0,1,0,1,0,1,0,1,0],]
def tablero():
    global M
    return tablero_aux(0,0,M[0][0])
   
def tablero_aux(rows,columns,indicador):
    global M   
    if columns==13:
        return tablero_aux(rows+1,0,indicador)
    elif rows == 13:
        return None
    elif M[rows][columns] == 0:
        imagenCuadro = cargarImagen("Cuadro.gif")
        cero0=Label(ventana,image=imagenCuadro)
        cero0.grid(row=rows,column=columns)
        return tablero_aux(rows,columns+1,M[rows][columns])
    elif indicador==1:
        imagenCuadro2 = cargarImagen("Cuadro2.gif")
        cero1=Label(ventana,image=imagenCuadro2)
        cero1.grid(row=rows,column=columns)
        return tablero_aux(rows,columns+1,M[rows][columns])
    else:
        imagenCourage2 = cargarImagen("Courage2.gif")
        cero2=Label(ventana,image=imagenCourage2)
        cero2.grid(row=rows,column=columns)
        return tablero_aux(rows,columns+1,M[rows][columns])


#Boton que inicia el tablero
btnIniciar=Button(ventana,text="Iniciar",command=tablero).place(x=550,y=50)
#Botones e imagenes para los movimientos del jugador
imagenIzqArriba = cargarImagen("IzqArriba.gif")
imagenArriba = cargarImagen("Arriba.gif")
imagenDerArriba = cargarImagen("DerArriba.gif")
imagenIzquierda = cargarImagen("Izquierda.gif")
imagenCourage = cargarImagen("Courage.gif")
imagenDerecha = cargarImagen("Derecha.gif")
imagenIzqAbajo = cargarImagen("IzqAbajo.gif")
imagenAbajo = cargarImagen("Abajo.gif")
imagenDerAbajo = cargarImagen("DerAbajo.gif")
btnIzqArriba=Button(ventana,image=imagenIzqArriba,).place(x=475,y=310)
btnArriba=Button(ventana,image=imagenArriba,).place(x=500,y=310)
btnDerArriba=Button(ventana,image=imagenDerArriba,).place(x=525,y=310)
btnIzquierda=Button(ventana,image=imagenIzquierda,).place(x=475,y=335)
lblCourage=Label(ventana,image=imagenCourage).place(x=500,y=335)
btnDerecha=Button(ventana,image=imagenDerecha,).place(x=525,y=335)
btnIzqAbajo=Button(ventana,image=imagenIzqAbajo,).place(x=475,y=360)
btnAbajo=Button(ventana,image=imagenAbajo,).place(x=500,y=360)
btnDerAbajo=Button(ventana,image=imagenDerAbajo,).place(x=525,y=360)









ventana.mainloop()

    
