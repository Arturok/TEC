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
        info=str(posicion)+", "+str(descripcion)+", "+str(valor)+", "+str(derecho)+", "+str(estado)
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


from tkinter import *
from time import time, sleep #Importa funcionde tiempo
from threading import Thread ##Thread (hilo), para evitar threading.Thread
import random ##Metodos para generar numeros aleatorios
import threading ##Hilos
import os
import winsound ##para sonido



    

#############################3
menu=Tk()
menu.geometry("1000x500+100+10")
menu.title("MENU: MINIPOLY COSTA RICA")
J1=""
J2=""
J3=""
J4=""
Jugadores=0
def cargarImagen(nombre):
        ruta = os.path.join('Imagenes',nombre)
       
        imagen = PhotoImage(file = ruta)
        return imagen

def juego():
    global J1
    global J2
    global J3
    global J4
    #creaventana principal
    ventana_principal= Toplevel()
    ventana_principal.title("MINIPOLY COSTA RICA")
    ventana_principal.geometry("1300x930+100+10")
    ventana_principal.resizable(width = NO, height = NO)

    banquero=Banco(0,0,0,0,4)
    banquero.cargaBaraja()
    banquero.cargaConfiguracion()
    propiedades=Propiedad()
    
    
    fondo = Canvas(ventana_principal , width=1200,height=1200,bg="black")
    fondo.place(x=0,y=0)
    nl=[]
       
    def tablero():
        global Jugadores
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
    labeltitulo=Label(ventana_principal,image=fondo5,width=660,height=660)
    labeltitulo.image=fondo
    
    labeltitulo.place(x=133,y=133)
    
    lblNJ1=Label(ventana_principal, text=J1,font=("Comic Sans MS",12)).place(x=950,y=100)
    lblNJ2=Label(ventana_principal, text=J2,font=("Comic Sans MS",12)).place(x=1150,y=100)
    lblNJ3=Label(ventana_principal, text=J3,font=("Comic Sans MS",12)).place(x=950,y=500)
    lblNJ4=Label(ventana_principal, text=J4,font=("Comic Sans MS",12)).place(x=1150,y=500)
    if Jugadores == 2:
        lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red").place(x=950,y=60)
        lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green").place(x=1150,y=60)
    elif Jugadores == 3:
        lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red").place(x=950,y=60)
        lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green").place(x=1150,y=60)
        lblJ3=Label(ventana_principal, text="Jugador 3",font=("Comic Sans MS",12),fg="Blue").place(x=950,y=460)
    else:
        lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red").place(x=950,y=60)
        lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green").place(x=1150,y=60)
        lblJ3=Label(ventana_principal, text="Jugador 3",font=("Comic Sans MS",12),fg="Blue").place(x=950,y=460)
        lblJ4=Label(ventana_principal, text="Jugador 4",font=("Comic Sans MS",12),fg="Yellow").place(x=1150,y=460)


    tablero()
    ventana_principal.mainloop()
def inicia():
    global J1
    global J2
    global J3
    global J4
    global Jugadores
    if Jugadores == 2:        
        J1=J1.get()
        J2=J2.get()
    elif Jugadores == 3:
        J1=J1.get()
        J2=J2.get()
        J3=J3.get()
    else:
        J1=J1.get()
        J2=J2.get()
        J3=J3.get()
        J4=J4.get()
    
    juego()
    banquero=Banco()
    banquero.cargaBraja()
    banquero.cargaConfiguracion()
    jugador1=Jugador(J1,0,0,0,0)
    jugador2=Jugador(J2,0,0,0,0)

def dosJugadores():
   global J1
   global J2
   global Jugadores
    
   Jugadores=2
   menu.withdraw()
   datosDJ = Toplevel()
   datosDJ.title("DOS JUGADORES")
   datosDJ.geometry("500x500+100+10")
   datosDJ.resizable(width=NO,height=NO)
   
   fondo7 = Canvas(datosDJ , width=500,height=500,bg="black")
   fondo7.place(x=-100,y=-200)
   def atras():
      datosDJ.destroy()
      menu.deiconify()
   def aceptar():
      datosDJ.destroy()
      inicia()
   #lblFondo=Canvas(datosDJ).place(x=0,y=0)
   
   fondo6 = cargarImagen("FondoJugadores2.gif")    
   labeltitulo3=Label(fondo7,image=fondo6,width=660,height=660)
   labeltitulo3.image=fondo6
   labeltitulo3.place(x=0,y=0)
   
   
    
   lblJugador1=Label(datosDJ, text="Jugador 1",font=("Comic Sans MS",22)).place(x=170,y=50)
   lblJugador2=Label(datosDJ, text="Jugador 2",font=("Comic Sans MS",22)).place(x=170,y=150)    
   J1=StringVar()
   txtJugador1=Entry(datosDJ,textvariable=J1,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=100)
   J2=StringVar()
   txtJugador1=Entry(datosDJ,textvariable=J2,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=200)
   btnAtras=Button(datosDJ, text="Atras",command=atras,font=("Comic Sans MS",12),bg="grey").place(x=120,y=450)
   btnAceptar=Button(datosDJ, text="Aceptar",command=aceptar,font=("Comic Sans MS",12),bg="grey").place(x=270,y=450)
   
   
   
def tresJugadores():
    global J1
    global J2
    global J3
    global Jugadores
     
    Jugadores=3
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
        inicia()
    lblJugador1=Label(datosTJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosTJ, text="Jugador 2").place(x=150,y=130)
    lblJugador3=Label(datosTJ, text="Jugador 3").place(x=150,y=210)
    J1=StringVar()
    txtJugador1=Entry(datosTJ,textvariable=J1).place(x=220, y=50)
    J2=StringVar()
    txtJugador2=Entry(datosTJ,textvariable=J2).place(x=220, y=130)
    J3=StringVar()
    txtJugador3=Entry(datosTJ,textvariable=J3).place(x=220, y=210)
    btnAtras=Button(datosTJ, text="Atras",command=atras).place(x=120,y=310)
    btnAceptar=Button(datosTJ, text="Aceptar",command=aceptar).place(x=210,y=310)
def cuatroJugadores():
    global J1
    global J2
    global J3
    global J4
    global Jugadores
    Jugadores=4
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
        inicia()
    lblJugador1=Label(datosCJ, text="Jugador 1").place(x=150,y=50)
    lblJugador2=Label(datosCJ, text="Jugador 2").place(x=150,y=120)
    lblJugador3=Label(datosCJ, text="Jugador 3").place(x=150,y=190)
    lblJugador4=Label(datosCJ, text="Jugador 4").place(x=150,y=260)
    J1=StringVar()
    txtJugador1=Entry(datosCJ,textvariable=J1).place(x=220, y=50)
    J2=StringVar()
    txtJugador2=Entry(datosCJ,textvariable=J2).place(x=220, y=120)
    J3=StringVar()
    txtJugador3=Entry(datosCJ,textvariable=J3).place(x=220, y=190)
    J4=StringVar()
    txtJugador4=Entry(datosCJ,textvariable=J4).place(x=220, y=260)
    btnAtras=Button(datosCJ, text="Atras",command=atras).place(x=120,y=310)
    btnAceptar=Button(datosCJ, text="Aceptar",command=aceptar).place(x=210,y=310)

imagenFondo=cargarImagen("FondoJugadores.gif")        
imagen2Jugadores=cargarImagen("2Jugadores.gif")
imagen3Jugadores=cargarImagen("3Jugadores.gif")
imagen4Jugadores=cargarImagen("4Jugadores.gif")
lblfondo=Label(menu,image=imagenFondo).place(x=0,y=0)
lblJugadores=Label(menu, text="Jugadores",font=("Comic Sans MS",22),bg="white").place(x=425,y=30)
btnJudares2=Button(menu, image=imagen2Jugadores,command=dosJugadores).place(x=450,y=100)
btnJudares3=Button(menu, image=imagen3Jugadores,command=tresJugadores).place(x=425,y=200)
btnJudares4=Button(menu, image=imagen4Jugadores,command=cuatroJugadores).place(x=400,y=300)




menu.mainloop()



