#E: Lista
#S: Booleano indicando si hay entero
#R: Lista no nula

def hay_entero(lista):
    if lista != []:
        return hay_entero_aux(lista)
    else:
        return "Error"

def hay_entero_aux(lista):
    if lista == []:
        return False
    elif isinstance(lista[0], int):
        return True
    else:
        return hay_entero_aux(lista[1: ])
