def leerdocumento3():
    archi=open('setup.txt','r')
    promedio3=[]
    
    for i in archi.readlines():
        
        datos3 = i.strip("\n -").split(",")
        promedio3=promedio3+datos3
        
    
    promedio3=promedio3[1:]
    promedio3=promedio3[1:]
    respuesta3=[]
    m=0
    while m<=7:
        if m%2==0:
            respuesta3=respuesta3+[promedio3[m]]
        m=m+1
    print (respuesta3)
    archi.close()
leerdocumento3()
