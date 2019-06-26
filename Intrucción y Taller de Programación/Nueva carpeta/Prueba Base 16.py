
#Convertir cualquier base a Decimal
def base(num):
    if compara1(convierte(convertir(num)))==True:
       return "Su número en base 10 es: "+str(base_aux(convierte(convertir(num)), cuenta(convierte(convertir(num)))-1))
    else:
       return "Error: Verifique sus datos, su numero no está en base: "+str(base)

def base_aux(num, exp):
    if num == []:
        return 0
    else:
        return int(num[0])*16**exp + base_aux(num[1:], exp-1)
   

def compara1(num):
    if num == []:
        return True
    elif 0<= int(num[0]) < 16:
        return compara1(num[1:])
    else:
        return False
def convertir(num):
    if num=="":
        return []
    else:
    
        return [num[0]]+convertir(num[1:])
def convierte(num):
    if num==[]:
        return []
    if num[0]==int:
        return [int(num[0])]+convierte(num[1:])
    if num[0]=="A":
        return [10]+convierte(num[1:])
    if num[0]=="B":
        return [11]+convierte(num[1:])
    if num[0]=="C":
        return [12]+convierte(num[1:])
    if num[0]=="D":
        return [13]+convierte(num[1:])
    if num[0]=="E":
        return [14]+convierte(num[1:])
    if num[0]=="F":
        return [15]+convierte(num[1:])
   
    
def cuenta(num):
    return len(num)
