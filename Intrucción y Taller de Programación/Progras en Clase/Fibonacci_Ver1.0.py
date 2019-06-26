def fib(n):
    if isinstance(n, int) and n>=0:
        return fib_aux(n)
    else:
        return "ERROR"

def fib_aux(n):
    if n==0 or n==1:
        return 1
    else:
        return fib_aux(n-1)+fib_aux(n-2)
