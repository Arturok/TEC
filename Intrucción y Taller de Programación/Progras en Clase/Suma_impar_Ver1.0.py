def suma_impar(num):
    if isinstance(num, int):
        if num == 0:
            return 0
        else:
            return suma_impar_aux(abs(num))
    else:
        return "ERROR"

def suma_impar_aux(num):
    if num == 0:
        return 0
    elif (num%10)%2 == 1:
        return (num%10) + suma_impar_aux(num // 10)
    else:
        return suma_impar_aux(num // 10)
