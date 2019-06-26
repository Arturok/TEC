#############################################################################
def hay_cero(num):
    i=0
    n=cuente(num)
    result=False
    for i in range(n):
        if num%10 == 0:
            result=True
            break
        else:
            num//=10
    return result
        
def cuente(num):
    num = abs(num)
    largo = 0
    while num != 0:
        largo+=1
        num//=10
    return largo

#############################################################################
def factorial(n):
    n=abs(n)
    result = 1
    for i in range(n):
        result*=n-i         
    return result
            
            
#############################################################################
def cuantos_pares(lista):
    result = 0
    for i in lista:
        if i %2 == 0:
            result+=1
    return result

############################################################################
def cuales_pares(lista):
    listare = []
    for i in lista:
        if i%2 == 0:
            listare+=[i]
    return listare
