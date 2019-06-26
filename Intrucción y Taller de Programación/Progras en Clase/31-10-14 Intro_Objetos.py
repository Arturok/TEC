class estudiante:
    def __init__(self,carnet,nombre,exa1,exa2,proye):
                 self.carnet=carnet
                 self.nombre=nombre
                 self.examen1=exa1
                 self.examen2=exa2
                 self.proyecto=proye
                 self.notafinal=0
    def get_nombre(self):
        return self.nombre

    def get_notas(self):
        return self.examen1, self.examen2, self.proyecto

    def calculeNota(self):
        notas=self.get_notas()
        return notas[0]*0.3 + notas[1]*0.3 + notas[2]*0.4
    def set_nota(self):
        self.notafinal=self.calculeNota()

#ITERATIVA
def promedioI(lista): #recibe lista de instancias
    suma=0
    for alumno in lista:
        suma+=alumno.calculeNota()
    return suma/len(lista)

#RECURSIVA
def promedioR(lista):
    return promedioR_aux(lista,0,len(lista))
def promedioR_aux(lista,suma,n):
        if lista == []:
            return suma/n
        else:
            return promedioR_aux(lista[1:],suma+lista[0].calculeNota(),n)

##############################################################################

class empleado:
    def __init__(self,numemp,nombre,salario,horas):
        self.numeroempleado=numemp
        self.nombre=nombre
        self.salario=salario
        self.horas=horas
    def mostrar(self):
        return "Empleado: " + self.nombre + ", Numero de empleado: " + str(self.numeroempleado)
    def calculoSalario(self):
        return ", Salario: " + str(self.salario * self.horas)
def main(numemp,nombre,salario,horas):
    e1=empleado(numemp,nombre,salario,horas)
    e1.mostrar()
    e1.calculoSalario()
    return e1.mostrar() + e1.calculoSalario()

###############################################################################


class cliente:
    def __init__(self,numcli,nombre,saldo=0,tipo, monto):
        self.numerocliente=numcli
        self.nombre=nombre
        self.saldo=saldo
    def mostrar(self):
        return "Cliente: "+self.nombre+", ID: "+str(self.numerocliente)+", saldo: "+str(self.saldo)

def main2(numcli,nombre,saldo,tipo,monto):
    c1=cliente(numcli,nombre,saldo)
    c1.mostrar()
    return c1.mostrar()
    
    
        
    


    
        

    
