
def leerdocumento():
    archi=open('prop.txt','r')
    promedio=[]
    
    for i in archi.readlines():
        
        datos = i.strip("\n -").split(",")
        promedio=promedio+datos
        
    
    promedio=promedio[1:]
    promedio=promedio[1:]
    respuesta=[]
    i=0
    while i<=183:
        if i%2==0:
            respuesta=respuesta+[promedio[i]]
        i=i+1
    print (respuesta)
    archi.close()
leerdocumento()

    
    
