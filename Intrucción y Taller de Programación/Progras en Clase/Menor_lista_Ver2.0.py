def menor(lista):
    if lista != []:
        return menor_aux(lista)
    else:
        return "Error"

def menor_aux(lista):
    if lista[1:]==[]:
        return lista[0]
    else:
        return compara(lista[0], menor_aux(lista[1:]))

def compara(a, b):
    if a<b:
        return a
    else:
        return b
    
    
