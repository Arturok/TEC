def todos_div(num, dig):
    num = abs(num)
    dig = abs(dig)
    if isinstance(num, int) and isinstance(dig, int):
        return todos_div_aux(num, dig)
    else:
        return "ERROR"

def todos_div_aux(num, dig):
    if num == 0:
        return True
    elif ((num%10)%dig) == 0:
        return todos_div_aux(num//10, dig)
    else:
        return False
