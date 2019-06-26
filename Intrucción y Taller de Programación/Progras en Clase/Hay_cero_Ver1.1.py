def hay_cero(num):
    if isinstance(num, int):
        if num == 0:
            return True
        else:
            return hay_cero_aux(abs(num))
    else:
        return "ERROR"


def hay_cero_aux(num):
    if num == 0:
        return False
    elif num%10 == 0:
        return True
    else:
        return hay_cero_aux(num // 10)
