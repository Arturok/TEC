import random
import sys
import time
sys.setrecursionlimit(9000)
def azar(inicio, final, cantidad):
    return azar_aux(inicio, final,cantidad, [])

def azar_aux(inicio, final,cantidad,lista):
    if len(lista) == cantidad:
        return lista
    else:
        x = random.randrange(inicio, final)
        return azar_aux(inicio, final,cantidad, lista + [x])



def burbuja(lst): 
    nums = list(lst)
    x=0
    t1=time.time()
    for i in range(len(lst)):
        
        for j in range(i+1, len(lst)):
            x+=1
            if lst[j] < lst[i]:
                lst[j], lst[i] = lst[i], lst[j]
                
                t2=time.time()
                
                
    print(x)
    print(t2-t1)
    return lst
