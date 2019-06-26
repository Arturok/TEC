#E: Lista
#S: Digito menor de la Lista
#R: No usar Func. Min, ni usando variables

def menor(lista):
    if lista != []:
        return menor_aux(lista)
    else:
        return "Error"
def menor_aux(lista):
    if lista == []:
        return []
    elif lista[0] > lista[1]:
        return menor_aux(lista[1: ])
    else:
        return menor_aux(lista[0]+lista[2])
