##########################################################################
#PROBLEMA 1

def ultimo_par(lista):
    if lista == []:
        return "Error"
    result=0
    while lista != []:
        if lista[0]%2 == 0:
            result = lista[0]
        lista=lista[1:]
    return result

#########################################################################
#PROBLEMA 2

def cambie_segundo(V):
    return cambie_segundo_aux(V,[])

def cambie_segundo_aux(V,VN):
    if V == []:
        return VN
    elif compara(VN,V[0]) == False:
        return cambie_segundo_aux(V[1:],VN+[V[0]])
    else:
        return cambie_segundo_aux(V[1:],VN+[-1])

def compara(VN,num):
    if VN == []:
        return False
    elif num == VN[0]: #Agrego :
        return True
    else:
        return compara(VN[1:],num)

#########################################################################
#PROBLEMA 3

def negativos(M):
    return negativos_aux(M,0,0,len(M),len(M[0]),[])

def negativos_aux(M,i,j,n,m,V):
    if j == m:
        return V
    elif i==n:
        return negativos_aux(M,0,j+1,n,m,V)
    elif M[i][j] < 0:
        return negativos_aux(M,i+1,j,n,m,V+[[i,j]])
    else:
        return negativos_aux(M,i+1,j,n,m,V)

#########################################################################
#PROBLEMA 4

def partir(num):
    if not isinstance(num, int) or num == 0:
        return "Error"
    num = abs(num)
    lista = []
    num2 = 0
    exp = 0
    while num != 0:
        if num%10 != 0:
            num2+=num%10*10**exp
            num//=10
            exp+=1
        else:
            lista=[num2]+lista
            num2=0
            exp=0
            num//=10
    lista=[num2]+lista
    return lista
        
