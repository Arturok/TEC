def cuente_dig(num, dig):
    if isinstance(num, int) and isinstance(dig, int):
        if num == 0:
            return 0
        else:
            return cuente_dig_aux(num, dig)
    else:
        return "ERROR"

def cuente_dig_aux(num, dig):
    if num == 0:
        return 0
    elif abs num%10 == dig:
        return 1 + cuente_dig_aux(num//10, dig)
    else:
        return cuente_dig_aux(num//10, dig)
    
