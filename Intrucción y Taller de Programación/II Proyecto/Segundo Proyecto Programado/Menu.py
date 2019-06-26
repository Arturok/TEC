


from Tkinter import *

menu=Tk()
menu.geometry("400x400+100+10")
menu.title("Menu")



def dosJugadores():
    menu.withdraw()
    datosDJ = Toplevel()
    datosDJ.title("DOS JUGADORES")
    datosDJ.geometry("400x400+100+10")
    datosDJ.resizable(width=NO,height=NO)
    def atras():
        datosDJ.destroy()
        menu.deiconify()
    lblJugador1=Label(datosDJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosDJ, text="Jugador 2").place(x=150,y=50)
    btnAtras=Button(datosDJ, text="Atras",command=atras).place(x=100,y=200)

        
    
lblJugadores=Label(menu, text="Jugadores").place(x=150,y=50)
btnJudares2=Button(menu, text="2 Jugadores",command=dosJugadores).place(x=150,y=100)
btnJudares3=Button(menu, text="3 Jugadores").place(x=150,y=150)
btnJudares4=Button(menu, text="4 Jugadores").place(x=150,y=200)



menu.mainloop()
