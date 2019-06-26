#clase Banco
class Banco():
    def __init__(self,numjuego,juego,baraja,monto,dado):
        self.numjuego = numjuego
        self.juego = juego
        self.baraja = baraja
        self.monto = monto
        self.dado = dado
    def iniciarJuego(self):
        pass
    def cargaBaraja(self):
        pass
    def cargaConfiguracion(self):
        pass
    def jugada(self):
        pass
    def comunicarResultado(self):
        pass
    def realizarCobro(self):
        pass
    def realizarPago(self):
        pass
    def ganador(self):
        pass

#Clase Jugador
class Jugador:
    def __init__(self,nombre,turno,acumulado,posicion,propiedades,monto):
        self.head = None
        self.nombre = nombre
        self.turno = turno
        self.acumulado = acumulado
        self.posicion = posicion
        self.propiedades = propiedades
        self.monto = monto
        self.largo = 0
   
    def realizaCompra(self):            
        self.monto-=valor        
    def pagarPaso(self):
        self.monto-=derecho
    def pagarMulta(self):
        self.valor-=multa
    def cobrar(self):
        self.valor+=cobro

#Clase Nodo
class Nodo:
    def __init__(self, next=None, informacion= None):
        self.next = next
        self.informacion = informacion
    def __str__(self):
        return str(self.informacion)
#Clase Propiedad
class Propiedad:
    def __init__(self):
        self.head = None #Puntero 
        self.largo = 0
    def insertarPropiedad(self,posicion, descripcion, valor, derecho, estado="Libre"):
        self.descripcion = descripcion
        self.valor = valor
        self.derecho = derecho
        self.largo+=1
        info=str(posicion)+", "+str(descripcion)+", "+str(valor)+", "+str(derecho)
        if self.head == None:
            self.head=Nodo(informacion = info)
        else:
            temp = self.head
            while temp.next != None:
                temp = temp.next
            temp.next = Nodo(informacion = info)
    def printx(self):
        temp=self.head
        while temp != None:
            print(temp.informacion)
            temp=temp.next   
        
    def cambiaEstado(self):
        self.estado="comprada"
        
    def obtenerDatos(self):
        
        return self.descripcion, self.valor, self.derecho

##INTERFAZ


from Tkinter import *
from time import time, sleep #Importa funcionde tiempo
from threading import Thread ##Thread (hilo), para evitar threading.Thread
import random ##Metodos para generar numeros aleatorios
import threading ##Hilos
import os
import winsound ##para sonido

def juego():
    #creaventana principal
    ventana_principal= Tk()
    ventana_principal.title("MINIPOLY COSTA RICA")
    ventana_principal.geometry("1200x931+100+10")
    ventana_principal.resizable(width = NO, height = NO)
    ventana_principal.config(bg = "#FFFFFF")

    fondo2 = Canvas(ventana_principal , width=1200,height=1200,bg="red")
    fondo2.place(x=622,y=-10)
    fondo = Canvas(ventana_principal , width=1200,height=1200,bg="black")
    fondo.place(x=0,y=0)
    jugador=84
    creacion=0
    humano="yellow"

    
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


    

#############################3
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
    def aceptar():
        datosDJ.destroy()
        juego()
            
    lblJugador1=Label(datosDJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosDJ, text="Jugador 2").place(x=150,y=150)
    txtJugador1=Entry(datosDJ).place(x=220, y=50)
    txtJugador1=Entry(datosDJ).place(x=220, y=150)
    btnAtras=Button(datosDJ, text="Atras",command=atras).place(x=120,y=310)
    btnAceptar=Button(datosDJ, text="Aceptar",command=aceptar).place(x=210,y=310)
def tresJugadores():
    menu.withdraw()
    datosTJ = Toplevel()
    datosTJ.title("DOS JUGADORES")
    datosTJ.geometry("400x400+100+10")
    datosTJ.resizable(width=NO,height=NO)
    def atras():
        datosTJ.destroy()
        menu.deiconify()
    def aceptar():
        datosTJ.destroy()
        juego()
    lblJugador1=Label(datosTJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosTJ, text="Jugador 2").place(x=150,y=130)
    lblJugador3=Label(datosTJ, text="Jugador 3").place(x=150,y=210)
    txtJugador1=Entry(datosTJ).place(x=220, y=50)
    txtJugador2=Entry(datosTJ).place(x=220, y=130)
    txtJugador3=Entry(datosTJ).place(x=220, y=210)
    btnAtras=Button(datosTJ, text="Atras",command=atras).place(x=120,y=310)
    btnAceptar=Button(datosTJ, text="Aceptar",command=aceptar).place(x=210,y=310)
def cuatroJugadores():
    menu.withdraw()
    datosCJ = Toplevel()
    datosCJ.title("DOS JUGADORES")
    datosCJ.geometry("400x400+100+10")
    datosCJ.resizable(width=NO,height=NO)
    def atras():
        datosCJ.destroy()
        menu.deiconify()
    def aceptar():
        datosCJ.destroy()
        juego()
    lblJugador1=Label(datosCJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosCJ, text="Jugador 2").place(x=150,y=120)
    lblJugador3=Label(datosCJ, text="Jugador 3").place(x=150,y=190)
    lblJugador4=Label(datosCJ, text="Jugador 4").place(x=150,y=260)
    txtJugador1=Entry(datosCJ).place(x=220, y=50)
    txtJugador2=Entry(datosCJ).place(x=220, y=120)
    txtJugador3=Entry(datosCJ).place(x=220, y=190)
    txtJugador4=Entry(datosCJ).place(x=220, y=260)
    btnAtras=Button(datosCJ, text="Atras",command=atras).place(x=120,y=310)
    btnAceptar=Button(datosCJ, text="Aceptar",command=aceptar).place(x=210,y=310)

        
    
lblJugadores=Label(menu, text="Jugadores").place(x=150,y=50)
btnJudares2=Button(menu, text="2 Jugadores",command=dosJugadores).place(x=150,y=100)
btnJudares3=Button(menu, text="3 Jugadores",command=tresJugadores).place(x=150,y=150)
btnJudares4=Button(menu, text="4 Jugadores",command=cuatroJugadores).place(x=150,y=200)



menu.mainloop()



