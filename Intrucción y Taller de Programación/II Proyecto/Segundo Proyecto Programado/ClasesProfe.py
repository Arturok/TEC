#Clase Banco
class Banco:
    def __init__(self,numerojuego,juego,baraja,monto,dado):
        self.numerojuego = numerojuego
        self.juego = juego
        self.self.baraja = baraja
        self.monto = monto
        self.dado = dado
    def iniciarJuego(self):
        pass
    def cargarBaraja(self):
        pass
    def cargarConfiguracion(self):
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
#Clase jugador
class Jugador:
    def __init__(self,nombre,turno,acumulado,posicion,propiedades,monto):
        self.nombre = nombre
        self.turno = turno
        self.cumulado = acumulado
        self.posicion = posicion
        self.propiedades = propiedades
        self.monto = monto
    def compra(self,propiedad,valor):
        Propiedad.estado()        
        self.monto-=valor
    def pagarPaso(self):
        pass
    def pagarMulta(self):
        pass
    def cobrar(self):
        pass

class Propiedad:
    def __init__(self,descripcion,posicion,valor,derecho,estado="libre"):
        self.descripcion = descripcion
        self.posicion = posicion
        self.valor = valor
        self.derecho = derecho
        self.estado = estado
    def estado(self):
        self.estado="comprada"
    def datos(self):
        return self.descripcion, self.valor, self.derecho

from Tkinter import *

menu=Tk()
menu.geometry("800x400+100+10")
menu.title("Menu")

lblJugadores=Label(menu, text="Jugadores").place(x=300,y=50)
btnJudares2=Button(menu, text="2 Jugadores").place(x=300,y=100)
btnJudares3=Button(menu, text="3 Jugadores").place(x=300,y=150)
btnJudares4=Button(menu, text="4 Jugadores").place(x=300,y=200)





menu.mainloop()

    
