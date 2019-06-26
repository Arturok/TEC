def iota(num):
    if num >= 0:
        return iota_aux(num)
    else:
        return "Error"


def iota_aux(num):
    if num == 0:
        return []
    else:
        return iota_aux(num-1)+[num-1]
