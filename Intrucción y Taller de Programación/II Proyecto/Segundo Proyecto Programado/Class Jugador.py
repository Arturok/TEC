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
