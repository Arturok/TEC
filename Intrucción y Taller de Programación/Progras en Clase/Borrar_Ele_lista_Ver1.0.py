def borrar(num, ele, lista):
    if isinstance(lista, list) and lista!=[]:
        return borrar_aux(num, ele, lista)
    else:
        return "Error"

def borrar_aux(num, ele, lista):
    if lista == []:
        return []
    elif lista[0] == ele and num !=0:
        return borrar_aux(num-1, ele, lista[1:])
    else:
        return [lista[0]]+borrar_aux(num, ele, lista[1:])
