class Nodo:
    def __init__(self, next=None, informacion= None):
        self.next = next
        self.informacion = informacion
    def __str__(self):
        return str(self.informacion)
        
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




















def cargarPropiedades():
    archivo1=open("prop.txt",'r')
    Tablero=Propiedad()
    linea=archivo1.readline()
    while linea != "":
        Tablero.insertarPropiedad(linea)
        linea=archivo1.readline()
    archivo1.close()
        
    tablero = Propiedad()

        
        
