def partir(lista):
    if lista != []:
        return partir_aux(lista, [], [])
    else:
        return "Error"

def partir_aux(lista, sublista, resultado):
    if lista == []:
        return resultado
    elif lista[0] >= 0:
        return partir_aux(lista[1:], sublista+[lista[0]], [resultado+[sublista]])  #Se agrega un "]"
    else:
        return partir_aux(lista[1:], [], [resultado])

