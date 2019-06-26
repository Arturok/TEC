def forme4(num):
    if isinstance(num, int):
        return forme4_aux(num, 0)
    else:
        return "ERROR"

def forme4_aux(num, exp):
    if num == 0 : #caso base
        return 0
    elif num % 10 == 4:
        return 4 * 10 ** exp + forme4_aux(num//10, exp+1)
    else:
        return forme4_aux(num//10, exp)
