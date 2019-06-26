def invertir(lista):
    if isinstance(lista,list):
        return invertir_aux(lista, [])
    else:
        return "Error"
def invertir_aux(lista, listadefin):
    if lista == []:
        return listadefin
    else:
        return invertir_aux(lista[1:], [lista[0]]+listadefin)

###############################################################################

def intercambia(lista1, lista2, posición):
    if isinstance(lista1,list) and isinstance(lista2,list):
        return intercambia_aux(lista1, lista2, posición, [], [])
    else:
        return "Error"
def intercambia_aux(lista1, lista2, posición, lista1def, lista2def):
    return [lista2[0:posición+1]+lista1[posición+1:]]+[lista1[0:posición+1]+lista2[posición+1:]]


###############################################################################

def split(ele, lista):
    if isinstance(lista,list):
        return split_aux(ele, lista, [], [])
    else:
        return "Error"
def split_aux(ele, lista, listaaux, listadef):
    if lista == []:
        return [listadef]+[listaaux]
    elif lista[0] == ele:
        return split_aux(ele, lista[1:], [], [listadef]+listaaux)
    else:
        return split_aux(ele, lista[1:], listaaux+[lista[0]], listadef)
    
    
            
