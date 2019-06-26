#E:Número
#S:Número invertido
#R:

def invertir(num):
    if isinstance(num, int):
        if num >= 0:
            return invertir_aux(num, cuente(abs(num)))
        else:
            return (invertir_aux(abs(num), cuente(abs(num)))* -1)
    else:
        return "Error"

    
def invertir_aux(num,exp):
    if num == 0:
        return 0
    else:
        return (num%10*10**(exp-1)) + invertir_aux(num//10, exp-1)

def cuente(num):
    if num == 0:
        return 0
    else:
        return 1 + cuente(num//10)
