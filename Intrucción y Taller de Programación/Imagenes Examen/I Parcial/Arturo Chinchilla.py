###############################################################################################################################################


#PROBLEMA 1

def restard(dig, num):
    if isinstance(num, int) and 0<=dig<9: #se escribe correctamente los simbolos <=
        return restard_aux(dig, num, 0)
    else:
        return "Error"

def restard_aux(dig, num, exp):
    if num == 0:
        return 0
    elif num%10-dig >= 0:  #se escribe correctamente los simbolos >=
        return (num%10-dig)*10**exp + restard_aux(dig, num//10, exp+1)  #se escribe correctamente el nombre de la Función Auxiliar
    else:
        return restard_aux(dig, num//10,exp+1)  #se escribe correctamente el nombre de la Función Auxiliar

###############################################################################################################################################


#PROBLEMA 2

def revise_num(num):
    if isinstance(num, int):
        if num == 0:
            return (revise_num_menor(num+1), revise_num_mayor(num))  #se escribe correctamente el nombre de la Función Auxiliar
        else:
            return (revise_num_menor(num), revise_num_mayor(num))  #se escribe correctamente el nombre de la Función Auxiliar
    else:
        return "Error"

def revise_num_menor(num):
    if num == 0:
        return 0
    elif num%10>=0 and num%10<5:   #se escribe correctamente los simbolos >=
        return 1 + revise_num_menor(num//10)
    else:
        return revise_num_menor(num//10)

def revise_num_mayor(num):
    if num == 0:
        return 0
    elif num%10>=5 and num%10<10:  #se escribe correctamente los simbolos >=
        return 1 + revise_num_mayor(num//10)
    else:
        return revise_num_mayor(num//10)

###############################################################################################################################################


#PROBLEMA 3

def separa(lista):
    if isinstance(lista, list) and lista != []:  #Se agrega :
        return [separa_impar(lista), separa_par(lista)]
    else:
        return "Error"

def separa_impar(lista):
    if lista == []:
        return []
    else:
        return [lista[1]] + separa_impar(lista[2: ])

def separa_par(lista):
    if lista == []:
        return []
    else:
        return [lista[0]] + separa_par(lista[3: ])  #se corrige el nombre de la Función Auxiliar

###############################################################################################################################################


#PROBLEMA 4
    
def intersec(lista1, lista2):
    if isinstance(lista1, list) and isinstance(lista2, list):
        return intersec_aux(lista1, lista2)
    else:
        return "Error"

def intersec_aux(lista1, lista2):
    if lista1 == []:
        return []
    elif lista2 == []:
        return intersec_aux(lista1[1: ], lista2)
    elif lista1[0] == lista2[0]:
        return [lista1[0]] + intersec_aux(lista1[1: ], lista2)  #se corrige el nombre de la Función Auxiliar
    else:
        return intersec_aux(lista1, lista2[1: ])  #se corrige el nombre de la Función Auxiliar

###############################################################################################################################################
