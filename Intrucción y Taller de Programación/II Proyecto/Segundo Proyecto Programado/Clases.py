#Clase Nodo
class Nodo(object):
    def __init__(self, elemento):
        self.__elemento=elemento
        #Puntero que servira para "unir" a los Nodos cuando se cree la lista
        self.__pSig = None

    def getElemento(self):
        return self.__elemento


#Clase Lista Circular Simple
class ListaCircularSimple(object):
    def __init__(self):
        self.__primero = None
        self.__ultimo = None

    def getVacio(self):
        if self._primero == None:
            return True
    #Insertar al Nodo al Inicio
    def setNodoAlInicio(self,elemento):
        nuevo = CN.Nodo(elemento)
        if self.getVacio() == True:
            self.__primero = self.__ultimo = nuevo
            self.__ultimo.pSig = self.__primero
        else:
            self.__ultimo.pSig = nuevo
            nuevo.pSig = self.__primero
            self.__primero = Nuevo
    #Insertar al Nodo al Final
    def setNodoAlFinal(self,elemento):
        nuevo = CN.Nodo(elemento)
        if self.getVacio() == True:
            self.__primero = self.__ultimo = nuevo
            self.__ultimo.pSig = self.__primero
        else:
            self.__ultimo.pSig = nuevo
            self.__ultimo = nuevo
            self.__ultimo.pSig = self.__primero
    #Eliminar Nodo al Inicio de la lista
    def eliminarPrimero(self):
        if self.getVacio() == True:
            print("Lista vacia. Imposible eliminar")
           
    
