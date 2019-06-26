#E: Digito y número
#S: tupla con cantidad de digitos divisibles y no divisibles
#R: enteros, primer entrada tienes que ser un unico digito




def cuente(dig, num):
    if isinstance(dig, int) and isinstance(num, int):
        if 0<=dig and dig <= 9:
            return cuente_div(dig, num), cuente_nodiv(dig, num)
        else:
            return "Error: Digito tiene más de un caracter"
    else:
        return "Error: numero o digito no es entero"

def cuente_div(dig, num):
    if num == 0:
        return 0
    elif num %10 == 0:
        return cuente_div(dig, num//10)
    elif (num%10)%dig == 0:
        return 1 + cuente_div(dig, num//10)
    else:
        return cuente_div(dig, num//10)


def cuente_nodiv(dig, num):
    if num == 0:
        return 0
    elif num%10 == 0:
        return 1+cuente_nodiv(dig, num//10)
    elif (num%10)%dig == 1:
        return 1 + cuente_nodiv(dig, num//10)
    else:
        return cuente_nodiv(dig, num//10)
