def cambia(num):
    if isinstance(num, int):
        return cambia_aux(num, 0, 0)
    else:
        return "Error"

def cambia_aux(num, resultado, exp):
    if num == 0:
        return resultado
    elif num%10 != 4 or num%10 != 8:
        return cambia_aux(num//10, resultado+num%10*10**exp, exp+1)
    else:
        return cambia_aux(num//10, resultado,exp+1)
