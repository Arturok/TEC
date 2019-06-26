def elimine(ele, lista):
    if 0<=ele<10:
        return elimine_aux(ele, lista, [])
    else:
        return "Error"

def elimine_aux(ele, lista, lista2):
    if lista == []:
        return lista2
    elif lista[0] == ele:
        return lista2+lista[1:]    
    else:
        return elimine_aux(ele, lista[1:], lista2+[lista[0]])


###############################################################################################################################################################

def elimine_todas(ele, lista):
    if 0<=ele<10:
        return elimine_todas_aux(ele, lista, [])
    else:
        return "Error"

def elimine_todas_aux(ele, lista, lista2):
    if lista == []:
        return lista2
    elif lista[0] == ele:
        return elimine_todas_aux(ele, lista[1:], lista2)  
    else:
        return elimine_todas_aux(ele, lista[1:], lista2+[lista[0]])

