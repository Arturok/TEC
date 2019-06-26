from hamming import *
from HammingArturo import *
try:
    # for Python2
    from Tkinter import *   ## notice capitalized T in Tkinter 
    from Tkinter import messagebox
except ImportError:
    # for Python3
    from tkinter import *   ## notice lowercase 't' in tkinter here
    from tkinter import messagebox

import os

#Funcion cargar imagen
def cargarImg(nombre):
    ruta=os.path.join('img',nombre)
    imagen=PhotoImage(file=ruta)
    return imagen

def toggle():
    if(B_setHammin["text"] == "IMPAR"):
        B_setHammin.config(bg='#7fa8d4')
        B_setHammin.config(fg="black")
        B_setHammin.config(text="PAR")
    else:
        B_setHammin.config(bg='grey')
        B_setHammin.config(fg="black")
        B_setHammin.config(text="IMPAR")



def fill_table():
    value=entryHexa.get().upper()
    binValue=hexa2bin(value)
    binValue=binValue.replace(" ","")
    tipo_paridad=1
    for i in primerTabla:
        i.config(bg="white")

    for i in segundaTabla:
        i.config(bg="white")

    if(B_setHammin["text"]=="IMPAR"):
        tipo_paridad=0
    for i in primerTabla:
        i.delete(0,END)

    if(not("No Valido" in binValue or len(value)>3)):
        ignorar=[0,1,3,7,15]
        index=0

        for i in range(17):
            if not (i in ignorar):
                primerTabla[i].insert(END,binValue[index])
                print(i)
                index+=1
        fill_p1(binValue,tipo_paridad)
        fill_p2(binValue,tipo_paridad)
        fill_p3(binValue,tipo_paridad)
        fill_p4(binValue,tipo_paridad)
        fill_p5(binValue,tipo_paridad)
        fill_ConParidad(value,tipo_paridad)


    else:
        messagebox.showinfo("ERROR","Por favor revisar el dato ingresado")

def fill_table2():
    if(validar_entrys()):
        hamming = ""
        hamming2 = ""
        tipo_paridad=1
        if(B_setHammin["text"]=="IMPAR"):
            tipo_paridad=0
        #Obtiene el dato sin bits de paridad
        for i in range(17):
            hamming += primerTabla[i+102].get()


        binValue = obtenerDatos(hamming)
        binValue2 = obtenerDatos(hamming)
        #Limpia
        for i in segundaTabla:
            i.delete(0,END)
        #imprime los datos con el error
        fill_ErrorRecibido(tipo_paridad)
        fill_p1Error(binValue,tipo_paridad)
        fill_p2Error(binValue,tipo_paridad)
        fill_p3Error(binValue,tipo_paridad)
        fill_p4Error(binValue,tipo_paridad)
        fill_p5Error(binValue,tipo_paridad)
        fill_ConError(binValue2,tipo_paridad)

        R_paridad.config(text = calculoParidad(hamming))


        for i in range(17):
            hamming2 += segundaTabla[i+102].get()
        print("Hamming2: " + hamming2)
        print("Paridad2: " + calculoParidad(hamming2))
        R_alterado.config(text = calculoParidad(hamming2))
        error = compara(calculoParidad(hamming), calculoParidad(hamming2))

        R_comparado.config(text = error)

        R_posicion.config(text = binToDec(error))
        for i in primerTabla:
            i.config(bg="white")

        for i in segundaTabla:
            i.config(bg="white")

        if(int(binToDec(error))>0):
            primerTabla[101+int(binToDec(error))].config(bg="red")
            segundaTabla[101+int(binToDec(error))].config(bg="red")
    else:
        messagebox.showinfo("ERROR","El digito ingresado no es correcto")



def validar_entrys():
    result=True
    for i in primerTabla[102:]:
        if(i.get()=="0" or i.get() == "1"):
            pass
        else:
            result=False
            break
    return result

def fill_p1(binary,par):
    ignorar=[1,3,5,7,9,11,13,15]
    newValor=llenarP1(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if not (i in ignorar):
            primerTabla[i+17].insert(END,newValor[index])
            index+=1

def fill_p1Error(binary,par):
    ignorar=[1,3,5,7,9,11,13,15]
    newValor=llenarP1(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if not (i in ignorar):
            segundaTabla[i+17].insert(END,newValor[index])
            index+=1



def fill_p2(binary,par):
    ignorar=[0,3,4,7,8,11,12,15,16]
    newValor=llenarP2(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if not(i in ignorar):
            primerTabla[i+34].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1

def fill_p2Error(binary,par):
    ignorar=[0,3,4,7,8,11,12,15,16]
    newValor=llenarP2(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if not(i in ignorar):
            segundaTabla[i+34].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1


def fill_p3(binary,par):
    ignorar=[3,4,5,6,11,12,13,14]
    newValor=llenarP3(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            primerTabla[i+51].insert(END,newValor[index])

            index+=1

def fill_p3Error(binary,par):
    ignorar=[3,4,5,6,11,12,13,14]
    newValor=llenarP3(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            segundaTabla[i+51].insert(END,newValor[index])

            index+=1


def fill_p4(binary,par):
    ignorar=[7,8,9,10,11,12,13,14]
    newValor=llenarP4(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            primerTabla[i+68].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1

def fill_p4Error(binary,par):
    ignorar=[7,8,9,10,11,12,13,14]
    newValor=llenarP4(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            segundaTabla[i+68].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1

def fill_p5(binary,par):
    ignorar=[15,16]
    newValor=llenarP5(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            primerTabla[i+85].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1

def fill_p5Error(binary,par):
    ignorar=[15,16]
    newValor=llenarP5(binary,par)
    index=0
    print("VAlOR: ",newValor)
    for i in range(17):
        if (i in ignorar):
            segundaTabla[i+85].insert(END,newValor[index])
            #print("index: "+str(index))
            index+=1



def fill_ConParidad(hexa,par):
    a=hexa2bin(hexa)
    print("a: " + a.replace(" ",""))
    b=setBitsParidad(a.replace(" ",""))
    c=setParidadHamming(b,par)
    print("c: " + c)
    for i in range(17):
        primerTabla[i+102].insert(END,c[i])

def fill_ConError(bin,par):
    print("bin: " + bin)
    b=setBitsParidad(bin)
    c=setParidadHamming(b,par)
    print("c2: " + c)
    for i in range(17):
        segundaTabla[i+102].insert(END,c[i])

def fill_ErrorRecibido(par):
    for i in range(17):
        segundaTabla[i].insert(END,primerTabla[i+102].get())




def create_entry_square(x,y,lista):
    posX=x
    posY=y
    for i in range(7):
        for j in range(17):
            num_entry=Entry(C_root,width=3,font=("Ubuntu Medium",12),justify='center',bg="white")
            num_entry.place(x=posX,y=posY)
            lista.append(num_entry)
            posX+=35
        posX=x
        posY+=25

def callback(num):
    value=num.get().upper()
    if(len(value)>3):
        messagebox.showinfo("WARNING","Solo los 3 primeros dígitos serán tomados en cuenta")
        value=value[:3]
    entryBin.delete(0, END)
    binValue=hexa2bin(value)
    if("No Valido" in binValue):
        messagebox.showinfo("ERROR","El número ingresado no es hexadecimal")
    entryBin.insert("end",binValue)

def labels(posX,posY):
    p_position=[0,1,3,7,15]
    y=posY
    x=posX
    count_p=1
    count_d=1
    for i in range(17):
        temp=Label(C_root, width=3, font=("Ubuntu Medium",12),justify='center',bg="white",fg="black")
        temp.place(x=x+i*35,y=y)
        if(i in p_position):
            temp["text"]="p"+str(count_p)
            temp.config(state="disable")
            count_p+=1
        else:
            temp["text"]="d"+str(count_d)
            temp.config(state="disable")
            count_d+=1

sizeX=1080
sizeY=690

root = Tk()
root.title('Codigo Hamming')
root.minsize(sizeX,sizeY)
root.resizable(width=NO,height=NO)
#Canvas de root
C_root=Canvas(width=sizeX,height=sizeY, bg='black')
C_root.place(x=0,y=0)
#Fondo de la pantalla principal
fondoImg=cargarImg('fondo.gif')
F_root=Label(C_root,width=sizeX,height=sizeY,image=fondoImg,bg='black')
F_root.place(x=0,y=0)
#String variable
hexa = StringVar()
hexa.trace("w", lambda name, index, mode, hexa=hexa: callback(hexa))
#Inputs del usuario
entryHexa=Entry(C_root,width=6, font=("Ubuntu Medium",18), textvariable=hexa)
entryHexa.place(x=170,y=130)
entryBin=Entry(C_root,width=18, font=("Ubuntu Medium",18))
entryBin.place(x=425,y=130)
primerTabla=[]
segundaTabla=[]
resultado=[]

labels(170,250-25)
labels(170,450)
#Create the grid of entrys
create_entry_square(170,250,primerTabla)
create_entry_square(170,475,segundaTabla)
Dato_sinParidad =  Label(C_root,width=10, font=("Ubuntu Medium",12),justify='center',text = "Sin Paridad:",bg="white",fg="black")
Dato_sinParidad.place(x=70,y=250)
Dato_conParidad =  Label(C_root, width=10, font=("Ubuntu Medium",12),justify='center',text = "Con Paridad:",bg="white",fg="black")
Dato_conParidad.place(x=70,y=400)
posy=275
for i in range(5):
    p=Label(C_root, width=10, font=("Ubuntu Medium",12),justify='center',text = "p"+str(i+1),bg="white",fg="black")
    p.place(x=70,y=posy+25*i)


Dato_sinParidad =  Label(C_root,width=10, font=("Ubuntu Medium",12),justify='center',text = "Recibido:",bg="white",fg="black")
Dato_sinParidad.place(x=70,y=475)
Dato_conParidad =  Label(C_root, width=10, font=("Ubuntu Medium",12),justify='center',text = "Con Paridad:",bg="white",fg="black")
Dato_conParidad.place(x=70,y=625)
posy=500
for i in range(5):
    p=Label(C_root, width=10, font=("Ubuntu Medium",12),justify='center',text = "p"+str(i+1),bg="white",fg="black")
    p.place(x=70,y=posy+25*i)


paridad = Label(C_root, width=10, font=("Ubuntu Medium",12),justify='center',text = "Paridad:",bg="white",fg="black")
paridad.place(x=820,y=450)
R_paridad = Label(C_root,width=10, font=("Ubuntu Medium",12),justify='center',text = "",bg="white",fg="black")
R_paridad.place(x=935,y=450)

alterado = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "Alterado:",bg="white",fg="black")
alterado.place(x=820,y=500)
R_alterado = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "",bg="white",fg="black")
R_alterado.place(x=935,y=500)

comparado = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "Comparado:",bg="white",fg="black")
comparado.place(x=820,y=550)
R_comparado = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "",bg="white",fg="black")
R_comparado.place(x=935,y=550)

posicion = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "Posicion:",bg="white",fg="black")
posicion.place(x=820,y=600)
R_posicion = Label(C_root, width=10,font=("Ubuntu Medium",12),justify='center',text = "",bg="white",fg="black")
R_posicion.place(x=935,y=600)



B_setHammin=Button(C_root,text='PAR', command=toggle,bg='#7fa8d4',font=('Agency FB',14),fg='black')
B_setHammin.place(x=850,y=130)

B_tabla=Button(C_root,text='CREAR TABLA',command=fill_table,bg='black',font=('Agency FB',16),fg='white')
B_tabla.place(x=820,y=230)

B_error=Button(C_root,text='ENCONTRAR ERROR',command=fill_table2,bg='black',font=('Agency FB',16),fg='white')
B_error.place(x=820,y=290)


root.mainloop()
