def digitos(n):
    if isinstance(n, int):
        return digitos_aux(n, 0, 0)
    else:
        return "Error"


def digitos_aux(n, pares, impares):
    if n == 0:
        return [pares, impares]
    elif n%2 == 0:
        return digitos_aux(n//10, pares+1, impares)
    else:
        return digitos_aux(n//10, pares, impares+1)

######################################################################

def intersec(num1, num2):
    if isinstance(num1, int) and isinstance(num2, int):
        return intersec_aux(num1, num2, 0, 0)
    else:
        return "Error"
    
def intersec_aux(num1, num2, exp, resultado):
    if num1 == 0:
        return resultado
    elif compara(num1%10, num2) == True:
        return intersec_aux(num1//10, num2, exp+1, resultado+(num1%10*10**exp))
    else:
        return intersec_aux(num1//10, num2, exp, resultado)
   

def compara(a, b):
    if b == 0:
        return False
    elif a == b%10:
        return True
    else:
        return compara(a, b//10)
    
