

def f(n):
    if n==0:
        return 0
    elif n == 1:
        return 1
    else:
        return 2*f(n-2) + f(n-1)

def lista(n):
    return lista_aux(n,0)

def lista_aux(n,i):
    if i>n:
        return []
    else:
        return [f(i)]+lista_aux(n,i+1)    
