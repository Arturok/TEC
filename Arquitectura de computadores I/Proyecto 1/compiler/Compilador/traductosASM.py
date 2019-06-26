from analizadorSintactico import *
from tkinter import Tk
from  tkinter.filedialog import askopenfilename
tags = {}
errT=False
#import sys
#sys.setrecursionlimit(1500)
#iMaxStackSize = 5000
#sys.setrecursionlimit(iMaxStackSize)

def comp2(dn):
    n= len(bin(abs(int(dn)))[2:])
    r=bin(abs(int(2**n-dn)))[2:]
    while(len(r)<len(bin(abs(int(dn)))[2:])):
        r='0'+r
    return r

def ext(n,c,e):
    while(len(n)!=c):
        if(len(n)>c):
            n = n[1:]
        else:
            n=e+n
    return n
def getImmBr(aL,tL):
    i=0
    flag=False
    while(aL!=tL):
        if(aL>tL):
            i-=1
            aL-=1
        else:
            flag=True
            i+=1
            aL+=1
    return i
def traducir(l):
    global tags
    global errT
    #l=[['NOP']]+l
    inst = []
    cL= -1
    regs = {     '$BLACK' : '00000', 'R0' : '00000', '$CR' : '00001', 'R1' : '00001',
                 '$V0':'00010', 'R2' : '00010', '$V1':'00011', 'R3' : '00011',
                 '$HR':'00100', 'R4' : '00100', '$VR':'00101', 'R5' : '00101',
                 '$A0':'00110', 'R6' : '00110', '$A1':'00111', 'R7' : '00111',
                 '$T0':'01000', 'R8' : '01000', '$T1':'01001', 'R9' : '01001',
                 '$T2':'01010', 'R10' : '01010', '$T3':'01011', 'R11' : '01011',
                 '$T4':'01100', 'R12' : '01100', '$T5':'01101', 'R13' : '01101',
                 '$T6':'01110', 'R14' : '01110', '$T7':'01111', 'R15' : '01111',
                 '$T8':'10000', 'R16' : '10000', '$S0':'10001', 'R17' : '10001',
                 '$S1':'10010', 'R18' : '10010', '$S2':'10011', 'R19' : '10011',
                 '$S3':'10100', 'R20' : '10100', '$S4':'10101', 'R21' : '10101',
                 '$S5':'10110', 'R22' : '10110', '$S6':'10111', 'R23' : '10111',
                 '$S7':'11000', 'R24' : '11000', '$T9':'10101', 'R25' : '10101',
                 '$T10':'11010', 'R26' : '11010', '$PP':'11011', 'R27' : '11011',
                 '$GP':'11100', 'R28' : '11100', '$SP':'11101', 'R29' : '11101',
                 '$FP':'11110', 'R30' : '11110', '$RA':'11111', 'R31' : '11111'}
    for x in l:
        inst.append(x)

    for x in inst:
        cL+=1
        if(x[0]=='TAG'):
            if(x[1] in list(tags.keys())):
                errT = True
            tags[x[1]]=cL
            cL-=1
    cM=[]
    
    
    #Instrucciones  
    #ADD Tipo R
    def ADD(rs, rt, rd):
        cMtemp = []
        i='000000' #opcode = 0
        i+=rs #rs
        i+=rt #rt
        i+=rd #rd
        i+='00000' #shamt
        i += '000001' #func = 1
        cMtemp += [i]
        return cMtemp
    #SUB Tipo R
    def SUB(rs, rt, rd):
        cMTemp = []
        i='000000' #opcode = 0 
        i+=rs #rs
        i+=rt #rt
        i+=rd #rd
        i+='00000' #shamt
        i += '001000' #func = 8
        cMTemp += [i] 
        return cMTemp
    
    #ADDI Tipo I
    def ADDI(rs, rt, inmediato):
        cMtemp = []
        i='000001' #opcode = 1
        i+=rs #rs
        i+=rt #rt
        i+=inmediato
        cMtemp+=[i]
        return cMtemp

    #SLL Tipo R
    def SLL(rs, rd, shamt):
        cMtemp = []
        i='000000' #opcode = 0 
        i+=rs #rs
        i+='00000' #rt
        i+=rd #rd
        i+=str(shamt) #shamt
        i += '000110' #func = 6
        cMtemp += [i]
        return cMtemp

     #SRL Tipo R
    def SRL(rs, rd, shamt):
        cMtemp = []
        i='000000' #opcode = 0 
        i+=rs #rs
        i+='00000' #rt
        i+=rd #rd
        i+=str(shamt) #shamt
        i+='000111' #func = 7
        cMtemp += [i]
        return cMtemp

    #Pseudo instrucciones
    def MOVE(rt, rd):
        cMtemp = []
        i='000000' #opcode = 0
        i+='00000' #rs=$Zero
        i+=rt #rt
        i+=rd #rd
        i+='00000' #shamt
        i += '000001' #func = 1
        cMtemp += [i]
        return cMtemp

    #Instruciones especializadas    
    # PTMR Tipo I
    def PTMR(rs, rt, inmediato):
        cMTemp = []
        i='010010' #opcode = 18
        i+=rs #rs
        i+=rt #rt
        i+=inmediato #inm
        cMTemp+=[i] 
        return cMTemp
    
    #PTMU Tipo I
    def PTMU(rs, rt, inmediato):
        cMTemp = []
        i='001111' #opcode = 15
        i+=rs #rs
        i+=rt #rt
        i+=inmediato
        cMTemp+=[i] 
        return cMTemp

    #PTML Tipo I
    def PTML(rs, rt, inmediato):
        cMTemp = []
        i='010000' #opcode = 16
        i+=rs #rs
        i+=rt #rt
        i+=inmediato
        cMTemp+=[i] 
        return cMTemp

    #PTMD Tipo I
    def PTMD(rs, rt, inmediato):
        cMTemp = []
        i='010001' #opcode = 17
        i+=rs #rs
        i+=rt #rt
        i+=inmediato
        cMTemp+=[i] 
        return cMTemp  
        # SPNT Tipo I
    def SPNT(rs, rt, inmediato):
        cMtemp = []
        #PTMD
        cMtemp+=PTMD(rs, rt, inmediato)
        #PTML
        cMtemp+=PTML(rs, rt, inmediato)
        #PTMU x2
        cMtemp+=PTMU(rs, rt, inmediato)
        cMtemp+=PTMU(rs, rt, inmediato)
        #PTMR x2
        cMtemp+=PTMR(rs, rt, inmediato)
        cMtemp+=PTMR(rs, rt, inmediato)
        #PTMD x2
        cMtemp+=PTMD(rs, rt, inmediato)
        cMtemp+=PTMR(rs, rt, inmediato)
        #PTML
        cMtemp+=PTML(rs, rt, inmediato)
        #SLL $V0, $HR, 2
        cMtemp+=SLL('00100', '00010', '00010')
        #SUB
        cMtemp+=SUB('11011', '00010', '11011')
        return cMtemp
    
    cL=-1
    for x in inst:
        cL+=1
        if (x[0]=='NOP'):
            
            i='00000000000000000000000000000000'
            cM+=[i]
        elif(x[0]=='TAG'):
            cL-=1


#Tipo: R 
        elif(x[0]=='ADD'):
            cM+=ADD(regs[x[2]], regs[x[3]], regs[x[1]])

        elif(x[0]=='AND'):
            i='000000' #opcode = 0
            i+=regs[x[2]] #rs
            i+=regs[x[3]] #rt
            i+=regs[x[1]] #rd
            i+='00000' #shamt
            i += '000010' #func = 2
            cM += [i]

        elif(x[0]== 'NOR'):
            i='000000' #opcode = 0 
            i+=regs[x[2]] #rs
            i+=regs[x[3]] #rt
            i+=regs[x[1]] #rd
            i+='00000' #shamt
            i += '000011' #func = 3
            cM += [i]

        elif(x[0]== 'OR'):
            i='000000' #opcode = 0 
            i+=regs[x[2]] #rs
            i+=regs[x[3]] #rt
            i+=regs[x[1]] #rd
            i+='00000' #shamt
            i += '000100' #func = 4
            cM += [i]

        elif(x[0]== 'SLT'):
            i='000000' #opcode = 0 
            i+=regs[x[2]] #rs
            i+=regs[x[3]] #rt
            i+=regs[x[1]] #rd
            i+='00000' #shamt
            i += '000101' #func = 5
            cM += [i]

        elif(x[0]== 'SLL'):
            cM+=SLL(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],5,'0'))

        elif(x[0]== 'SRL'):
            cM+=SRL(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],5,'0'))   

        elif(x[0]== 'SUB'):
            cM+=SUB(regs[x[2]], regs[x[3]], regs[x[1]])
            
        
#Tipo: I    
        elif(x[0]=='ADDI'):
            cM+=ADDI(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))

        elif(x[0]=='BEQ'):
            i='000011' #opcode = 3
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            if not (x[3] in list(tags.keys())):
                errT = True
            else:
                imm = tags[x[3]]
                if(imm>=0):
                    x = ext(comp2(-((len(cM)*4+4)-(imm*4)))[3:],16, '1')
                    print('x= ' + str(comp2(-((len(cM)*4+4)-(imm*4)))))
                    i+=ext(x,16,'1')
                else:
                    i+=ext(comp2(abs(imm)),16,'0')
            cM+=[i]

        elif(x[0]=='BNE'):
            i='000100' #opcode = 4
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            #i+=ext(bin(abs(int(x[3])))[2:],16,'0')

            if not(x[3] in list(tags.keys())):
                errT = True
            else:
                imm = tags[x[3]]
                if(imm>=0):
                    x = ext(comp2(-((len(cM)*4+4)-(imm*4)))[3:],16, '1')
                    print('x= ' + str(comp2(-((len(cM)*4+4)-(imm*4)))))
                    i+=ext(x,16,'1')
                else:
                    i+=ext(comp2(abs(imm)),16,'0')
            cM+=[i]

        elif(x[0]=='LW'):
            i='000111' #opcode = 7
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            i+=ext(bin(abs(int(x[3])))[2:],16,'0')
            cM+=[i]

        elif(x[0]=='SLTI'):
            i='001001' #opcode = 9
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            i+=ext(bin(abs(int(x[3])))[2:],16,'0')
            cM+=[i]

        elif(x[0]=='SW'):
            i='001010' #opcode = 10
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            i+=ext(bin(abs(int(x[3])))[2:],16,'0')
            cM+=[i]


#Tipo J
        elif(x[0]=='J'):
            i='000101' #opcode = 5
            if not(x[1] in list(tags.keys())):
                errT = True
            else:
                imm = tags[x[1]]
                if(imm>=0):
                    newimm = ext(bin(imm)[2:],26,'0')
                    i+= newimm[2:]+'00'
                else:
                    newimm=ext(bin(abs(imm)),26,'0')
                    i+= newimm[2:]+'00'
            cM+=[i] 

        elif(x[0]=='JAL'):
            i='000110' #opcode = 6
            if not(x[1] in list(tags.keys())):
                errT = True
            else:
                imm = tags[x[1]]
                if(imm>=0):
                    newimm = ext(bin(imm)[2:],26,'0')
                    i+= newimm[2:]+'00'
                else:
                    newimm=ext(bin(abs(imm)),26,'0')
                    i+= newimm[2:]+'00'
            cM+=[i]

#PSEUDO INSTRUCCIONES
        elif(x[0]=='MOVE'):
            cM+=MOVE(regs[x[2]], regs[x[1]])

#Especializadas
        #MPP Tipo R
        elif(x[0]=='MPP'):
            i='001100' #opcode = 12
            i+=regs[x[1]] #rs
            i+=regs[x[2]] #rt
            i+='11011' #RD=$PP=R27
            i+='00000' #shamt = 0
            i+='000000' #func = 0
            cM+=[i]        

        #MPPI Tipo J
        elif(x[0]=='MPPI'):
            i='001101' #opcode = 13
            i+=ext(bin(abs(int(x[1])))[2:],10,'0')
            i+=ext(bin(abs(int(x[2])))[2:],16,'0')
            cM+=[i] 

        #PPXL Tipo I
        elif(x[0]=='PPXL'):
            i='001110' #opcode = 14
            i+='00000' #rs
            i+=regs[x[1]]  #rt
            i+='0000000000000000'
            cM+=[i] 
        
        #PTMU Tipo I PTMU RS, $PP, #0
        elif(x[0]=='PTMU'):
            cM+=PTMU(regs[x[1]], '11011', '0000000000000000')

        #PTML Tipo I
        elif(x[0]=='PTML'):
            cM+=PTML(regs[x[1]], '11011', '0000000000000000')

        #PTMD Tipo I
        elif(x[0]=='PTMD'):
            cM+=PTMD(regs[x[1]], '11011', '0000000000000000')
        
        #PTMR Tipo I
        elif(x[0]=='PTMR'):
            cM+=PTMR(regs[x[1]], '11011', '0000000000000000')


            #PPXLC Tipo I 
        elif(x[0]== 'PPXLC'):
            i='010011' #opcode = 19
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            i+='0000000000000000'
            cM += [i] 


        #PMPXL Tipo R
        elif(x[0]== 'PMPXL'):
            i='010100' #opcode = 20
            i+=regs[x[1]] #rs
            i+=regs[x[2]] #rt
            i+='11011' #rd
            i+='00000' #shamt
            i += '000000' #func = 0
            cM += [i] 

                
        #CS Tipo I
        elif(x[0]=='CS'):
            i='010101' #opcode = 21
            i+=regs[x[2]] #rs
            i+=regs[x[1]] #rt
            i+=ext(bin(abs(int(x[3])))[2:],16,'0')
            cM+=[i] 
#PSEUDOINSTRUCCIONES ESPECIALIZADAS
        
        #SPNT Tipo I
        elif(x[0]=='SPNT'):
            cM += SPNT(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))

        #MPNT Tipo I
        elif(x[0]=='MPNT'):
            #MOVE $V0, $PP
            cM+=MOVE('11011', '00010')
            #ADDI $PP, $PP, -4
            cM+=ADDI('11011', '11011', '1111111111111100')
            #SLL $V1, $HR, 2
            cM+=SLL('00100', '00011', '00010')
            #SUB $PP, $PP, $V1
            cM+=SUB('00011', '11011','11011')
            #SPNT $RT
            cM+=SPNT(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #SUB $PP, $PP, $V1 X2
            cM+=SUB('00011', '11011','11011')
            cM+=SUB('00011', '11011','11011')
            #PTMR $RT X3
            cM+=PTMR(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMR(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMR(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #PTML $RT
            cM+=PTML(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #ADD $PP, $PP, $V1
            cM+=ADD('00011', '11011','11011')
            #SPNT $RT
            cM+=SPNT(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #ADDI $PP, $PP, 8
            cM+=ADDI( '11011','11011', '0000000000001000')
            #PTMD $RT X3
            cM+=PTMD(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMD(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMD(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #PTML $RT
            cM+=PTML(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #ADDI $PP, $PP, -8
            cM+=ADDI( '11011','11011', '1111111111111000')
            #SPNT $RT
            cM+=SPNT(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #ADD $PP, $PP, $V1 X2
            cM+=ADD('00011', '11011','11011')
            cM+=ADD('00011', '11011','11011')
            #PTML $RT X3
            cM+=PTML(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTML(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTML(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #PTMU $RT
            cM+=PTMU(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #SUB $PP, $PP, $V1
            cM+=SUB('00011', '11011','11011')
            #SPNT $RT
            cM+=SPNT(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #ADDI $PP, $PP, -8
            cM+=ADDI( '11011','11011', '1111111111111000')
            #PTMU $RT X3
            cM+=PTMU(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMU(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            cM+=PTMU(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #PTMR $RT
            cM+=PTMR(regs[x[2]], regs[x[1]], ext(bin(abs(int(x[3])))[2:],16,'0'))
            #MOVE $PP, $VO
            cM+=MOVE('00010', '11011')






        

                    
        else:
            errT = True
    return cM




def toHex(b):
    r=[]
    for x in b:
        r+=[ext(hex(int(x,2))[2:],8,'0')]
    return r
def initTrans():
    global errT
    global tags
    tags = {}
    errT=False
    Tk().withdraw() 

    #filename = "/Users/esteb/Documents/Proyecto1-Arqui/Compilador/cv.s"
    filename = askopenfilename()
    print(filename)
    c = initCompi(filename)
    b = traducir(c)
    h = toHex(b)
    if not(getErrL() or getErrS() or errT):
        p = open ('codeBin.rs','w')
        f = open ('codeHex.rs','w')
        for x in range(len(h)):
            f.write(h[x]+'\n')
            p.write(b[x]+'\n')
        p.close()
        f.close()
        input("Compilacion exitosa")
    else:
        input("Error en compilacion")

    input("1: " + getErrL())
    input("2: " + getErrS())
    input("7: " + errT)
    
#try:
initTrans()
#except:
input("No se encontro el archivo")
