def tiene_par(num):
    if isinstance(num,int):
        if num == 0:
            return True
        else:
            return tiene_par_aux(abs(num))
    else:
        return "ERROR"

def tiene_par_aux(num):
    if num == 0:
        return False
    elif (num % 10) % 2 == 0:
        return True
    else:
        return tiene_par_aux(num // 10)
