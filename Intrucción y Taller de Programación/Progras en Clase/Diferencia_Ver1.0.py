def diferencia(num, dig):
    if dig <=9:
        return diferencia_mayor(num, dig, 0), diferencia_menor(num, dig, 0)
    else:
        return "ERROR"


def diferencia_mayor(num, dig, exp):
    if num == 0:
        return 0
    elif num%10 > dig:
        return num%10*10**exp + diferencia_mayor(num//10, dig, exp+1)
    else:
        return diferencia_mayor(num//10, dig, exp)


def diferencia_menor(num, dig, exp):
    if num == 0:
        return 0
    elif num%10 <= dig:
        return num%10*10**exp + diferencia_menor(num//10, dig, exp+1)
    else:
        return diferencia_menor(num//10, dig, exp)
    
