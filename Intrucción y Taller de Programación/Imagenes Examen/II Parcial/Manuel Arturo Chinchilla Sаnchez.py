#Problema 1
def frecuencias(lista): #Agregue :
    return frecuencias_aux(lista, [], 0)
def frecuencias_aux(lista, listadef, n):
    if n==len(lista):
        return listadef
    else:
        return frecuencias_aux(lista,listadef+[busca(lista,0,n)],n+1)
def busca(lista, num, n):
    if lista==[]:
        return num
    elif lista[0]==n:
        return busca(lista[1:],num+1,n)
    else:
        return busca(lista[1:],num,n)

##########################################################################
#Problema 2

def split(num):
    if isinstance(num, int):
        return split_aux(num, 0, [], 0) #Agregue return
    else:
        return "Error"
def split_aux(num, num2, lista, exp):
    if num == 0:
        return [num2]+lista
    elif num%10 != 0:
        return split_aux(num//10, num2+num%10*10**exp, lista, exp+1)
    else:
        return split_aux(num//10,0,[num2]+lista, 0)

##########################################################################
#Problema 3

def coincide(lista):
    return coincide_aux(lista, 2, False)
def coincide_aux(lista, posicion, resultado):
    if posicion == len(lista):
        return resultado
    elif lista[posicion]==sum(lista, posicion, 0, 0):
        return coincide_aux(lista, len(lista), True)
    else:
        return coincide_aux(lista, posicion+1, resultado)
def sum(lista, posicion, posicion2, suma):
    if posicion2==posicion:
        return suma
    else:
        return sum(lista[1:], posicion, posicion2+1, suma+lista[0])
    
##########################################################################
#Problema 4

def serie(n):
    if isinstance(n, int) and n>=2:
        return serie_aux(n,2, [2], 2)
    else:
        return "Error"
def serie_aux(n, num, lista, indicador):
    if num >= n:
        return lista
    elif indicador == 2:
        return serie_aux(n, num+3, lista+[num+3], 3)#Cambie lista+[n+3] por lista+[num+3]
    else:
        return serie_aux(n, num+2, lista+[num+2], 2) #Agregue ], Cambie lista+[n+2] por lista+[num+2]
