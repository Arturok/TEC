def suma_coc(n):
    if not isinstance(n,int):
        return "Error"
    n=abs(n)
    i=0
    suma=0
    while i<=n:
       
        suma+=1/(i+1)
        i+=1
    return suma


###############################################################################################
def aparece(dig, num):
    if not isinstance(dig, int) and not 0<=dig<=9 and not isinstance(num, int):
        return "error"
    dig=abs(dig)
    num=abs(num)
    apa=0
    while num != 0:
        if dig == num%10:
            apa+=1
        num//=10
    return apa


##############################################################################################
def todos_div(num, dig):
    if not isinstance(num, int) and not 0<=dig<=9 and not isinstance(dig, int):
        return "Error"
    num = abs(num)
    dig = abs(dig)
    div=False
    while num != 0:
        if num%10%dig == 0:
            div=True
            
        else:
            div=False
            break
        num//=10
        
    return div

##############################################################################################
def iguales(num):
    if not isinstance(num, int) or  num <=10:
        return "Error"
    num=abs(num)
    igual=False
    while num != 0:
        if num%10 == num//10**(largo(num)):
            igual=True
        break
    return igual

def largo(num):
    num=abs(num//10)
    larg=0
    while num!=0:
        larg+=1
        num//=10
    return larg



##############################################################################################
def factorial(n):
    if not isinstance(n, int) or  n < 0:
        return "Error"
    n=abs(n)
    result=1
    while n > 0:
        result*=n
        n-=1
    return result


    
##############################################################################################
def fib(n):
    if not isinstance(n, int) or  n < 0:
        return "Error"
