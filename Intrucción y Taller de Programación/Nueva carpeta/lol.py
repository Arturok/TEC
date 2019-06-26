from tkinter import *

ventana=Tk()
ventana.title("Tablero")
ventana.geometry("400x400+100+100")
ventana.config(bg="Blue")

lblBienve=Label(ventana,text="Bienvenido").place(x=180,y=20)

juego=Canvas(ventana, width=200, height=200)
juego.place(x=50,y=100)
cero0=Label(juego,bg="Green",width=3).grid(row=0,column=0)


