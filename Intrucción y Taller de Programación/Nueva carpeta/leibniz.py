def restard(num, dig):
    if isinstance(num,int) and 0<=dig<10:
        return restard_aux(num, dig, 0, 0)
    else:
        return "Error"
def restard_aux(num, dig, exp, resultado):
    if num == 0:
        return resultado
    elif num%10-dig<0:
        return restard_aux(num//10, dig, exp+1, resultado)
    else:
        return restard_aux(num//10, dig, exp+1, resultado+(num%10-dig)*10**exp)
