#E: Valor de n
#S: Sumatoria
#R: n >= 0

def f(n,a):
    if n >= 0:
        return f_aux(n,a,0)
    else:
        return "Error"

def f_aux(n,a,i):
    if i > (n-1):
        return 0
    else:
        return a**i + f_aux(n,a,i+1)
