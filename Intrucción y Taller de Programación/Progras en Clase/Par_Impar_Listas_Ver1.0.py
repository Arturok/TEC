#E: Lista
#S: Lista de pares, Lista de impares
#R: Lista no nula

def par_impar(lista):
    if lista != []:
        return par_impar_pares(lista), par_impar_impares(lista)
    else:
        return "Error"

def par_impar_pares(lista):
    if lista == []:
        return []
    elif lista[0]%2 == 0:
        return [lista[0]]+par_impar_pares(lista[1: ])
    else:
        return par_impar_pares(lista[1: ])

def par_impar_impares(lista):
    if lista == []:
        return []
    elif lista[0]%2 == 1:
        return [lista[0]]+par_impar_impares(lista[1: ])
    else:
        return par_impar_impares(lista[1: ])
                                        
                                          
    
