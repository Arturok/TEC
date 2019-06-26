###########################################################################

#Primer Problema

def col_mayor(M):
    n=len(M)
    m=len(M[0])
    MT=[]
    for i in range(m):
        VT=[]
        for j in range(n):
            VT.append(M[j][i]) #Se quita una coma que estaba de más
        MT.append(VT)
    return MT, suma(MT)
        
def suma(MT):
    n=len(MT)
    m=len(MT[0])
    VRespuesta=[]
    for i in range(n):
        Suma=0
        for j in range(m):
            Suma+=MT[i][j] #Se agrega la T al nombre de la matriz
        VRespuesta.append(Suma)
    return MT[mayor(VRespuesta)]

def mayor(Vrespuesta):
    n=len(Vrespuesta)
    for i in range(n):
        num=0
        for j in range(1,n):
            if Vrespuesta[i]>=Vrespuesta[j]:
                num=i
            num=j
        break
    return num

#############################################################################

#Segundo Problema parte A


class Estudiante:
    def __init__(self,nombre,carnet,listacursos=None):
        self.nombre=nombre
        self.carnet=carnet
        self.listacursos=listacursos

    def get_carnet(self):
        return self.carnet
    
    def get_nombre(self):
        return self.nombre
    
    def get_cursos(self):
        return self.listacursos
    def agregar_curso(self,codigo,semestre,año, nota):
        V=[codigo,semestre,año,nota]
        if self.listacursos==None:
            self.listacursos=[]
            self.listacursos.append(V)
        else:
            if esta(V):
                return "ERROR"
            else:
                self.listacursos.append(V)
    def esta(self,V):
        n=len(self.listacursos)
        for i in range(n):
            if V[:3] == self.listacursos[1][:3]: #Agrega :
                return True                      #Error de indentacion
        return False


#Segundo Problema parte B

def promedio(carnet,lista):
    if carnet == Estudiante.carnet:
        Estudiante.get_nombre()
        Estudiante.get_carnet()
        Estudiante.get_listacursos()
        n=len(Estudiante.listacursos)
        x=0
        for i in range(n):
            x+=Estudiante.listacursos[i][4]
        return x//n
        
