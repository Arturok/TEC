def todos_pares(num):
    if isinstance(num, int):
        if num == 0:
            return True
        else:
            return todos_pares_aux(abs(num))
    else:
        return "ERROR"

def todos_pares_aux(num):
    if num == 0:
        return True
    elif (num%10)%2 != 0:
        return False
    else:
        return todos_pares_aux(num//10)
