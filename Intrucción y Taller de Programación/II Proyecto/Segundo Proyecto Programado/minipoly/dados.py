from Tkinter import*
import random 
import time
v = Tk()
v.geometry("400x400+0+0")
fondo2 = Canvas(v , width=1200,height=1200,bg="red")
fondo2.place(x=0,y=0)
labeltitulo=Label(v,text="hola",width=60,height=60)
labeltitulo.place(x=0, y=0)
def dado():
    v=0
    while v<10:
       labeltitulo.config(text=str(random.randrange(1,7)))
       fondo2.after(2)
       v=v+1
    labeltitulo.config(text=str(random.randrange(1,7)))

    


dado()
