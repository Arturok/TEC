#E: Número
#S: Booleano indicando si sus elementos son alternados entre pares e impares, siendo el dígito menos significativo impar
#R: Entero

def alternado(num):
    if isinstance(num, int) and num > 9:
        return alternado_impar(num)
    else:
        return "Error"

def alternado_impar(num):
    if num == 0:
        return True
    elif (num % 10) % 2 == 1:
        return alternado_par(num//10)
    else:
        return False

def alternado_par(num):
    if num == 0:
        return True
    elif (num % 10) % 2 == 0:
        return alternado_impar(num//10)
    else:
        return False
