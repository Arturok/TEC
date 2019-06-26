def cuantos_impares(num):
    if isinstance(num,int):
        if num == 0:
            return 0
        else:
            return cuantos_impares_aux(abs(num))
    else:
        return "ERROR"

def cuantos_impares_aux(num):
    if num == 0:
        return 0
    elif (num % 10) % 2 == 1:
        return 1 + cuantos_impares_aux(num // 10)        
    else:
        return cuantos_impares_aux(num // 10)
        
