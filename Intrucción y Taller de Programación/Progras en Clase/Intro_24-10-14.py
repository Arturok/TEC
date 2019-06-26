def transpuesta(M):
    n=len(M[1])
    m=len(M[0])
    if n != m:
        return "Error"
    MT=[]
    for i in range(n):
        VT=[]
        for j in range(len(M)):
            VT+=([M[j][i]])
        MT.append(VT)
    return MT

##############################################################################

def multi(V,M):
    n=len(V)
    if n != len(M):
        return "Error"
    for i in range(V):
        pass
