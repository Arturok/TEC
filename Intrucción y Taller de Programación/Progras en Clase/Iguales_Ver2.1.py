def iguales(num):
    num = abs(num)
    if isinstance(num, int):
        return num % 10 == num // (10**(largo(num)-1))
    else:
        return "ERROR"
    
def largo(num):
    if num == 0:
        return 0
    else:
        return 1 + largo(num // 10)
