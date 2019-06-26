def par2(num):
    exp=0
    if isinstance(num, int):
        return par2_mayor(par2_pares(num, exp))+(par2_mayor2(par2_pares(num, exp), par2_mayor(par2_pares(num, exp)))*10)
    else:
        return "Error"


def par2_pares(num, exp):
    if num==0:
        return 0
    elif num%10%2==0:
        return num%10*10**exp + par2_pares(num//10, exp+1)  
    else:
        return par2_pares(num//10, exp)

def par2_mayor(pares):
    if pares==0:
        return 0
    elif pares%10>par2_mayor(pares//10):
        return pares%10
    else:
        return par2_mayor(pares//10)

def par2_mayor2(pares2, mayor):
    if pares2%10==mayor:
        return par2_mayor2(pares2//10, mayor)
    elif pares2==0:
        return 0
    elif pares2%10>par2_mayor2(pares2//10, mayor):
        return pares2%10
    else:
        return par2_mayor2(pares2//10, mayor)


        
