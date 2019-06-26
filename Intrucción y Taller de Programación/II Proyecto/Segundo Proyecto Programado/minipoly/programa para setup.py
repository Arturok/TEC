def leerdocumento2():
    archi=open('setup.txt','r')
    promedio2=[]
    
    for i in archi.readlines():
        
        datos2 = i.strip("\n -").split(",")
        promedio2=promedio2+datos2
        
    
    promedio2=promedio2[1:]
    promedio2=promedio2[1:]
    respuesta2=[]
    n=0
    while n<=7:
        if n%2==0:
            respuesta2=respuesta2+[promedio2[n]]
        n=n+1
    print (respuesta2)
    archi.close()
leerdocumento2()

    
