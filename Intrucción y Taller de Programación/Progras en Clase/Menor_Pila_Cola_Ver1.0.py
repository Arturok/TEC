def menor(num):
    if isinstance(num, int):
        return menor_aux(num)
    else:
        return "Error"

def menor_aux(num):
    if 0<num<10:
        return num
    else:
        return compara(num%10, menor_aux(num//10))

def compara(a, b):
    if a < b:
        return a
    else:
        return b




############################################################################
    
    
def cmenor(num):
    if isinstance(num, int):
        return cmenor_aux(num, 0)
    else:
        return "Error"

def cmenor_aux(num, menor):
    if 0<num<10:
        return num
    elif menor+num%10<num%10//10:
        return menor + num %10
    else:
        return cmenor_aux(num//10, menor)
    
