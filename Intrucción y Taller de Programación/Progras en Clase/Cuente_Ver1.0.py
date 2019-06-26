def cuente(num):
    if isinstance(num, int):
        if num != 0:
            num = abs(num)
            return cuente_pares(num), cuente_impares(num)
        else:
            return 1,0
    else:
        return "ERROR"

def cuente_pares(num):
    if num ==0:
        return 0
    elif num % 2 == 0:
        return 1 + cuente_pares(num // 10)
    else:
        return cuente_pares(num // 10)

def cuente_impares(num):
    if num ==0:
        return 0
    elif num % 2 == 1:
        return 1 + cuente_impares(num // 10)
    else:
        return cuente_impares(num // 10)
