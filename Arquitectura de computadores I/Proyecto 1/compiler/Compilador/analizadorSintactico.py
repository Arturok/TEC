import ply.yacc as yacc
import os
import codecs
import time
import re
from analizadorLexico import *

precedence = (    ('left','RPC','LPC')    )

precedence = (
    ('left','ID','NUMBER'),
    ('left','REG', 'COMMA'),
    ('left','RPC','LPC')
    )

listap = {} 
errS = False

def p_program(p):#LISTO##LISTO#
    '''program : block'''
    p[0] = {1:p[1]}
    global listap
    listap = p[0]
    
def p_block(p):#LISTO##LISTO#
    '''block : inst block'''
    p[0] = {1:p[1],2:p[2]}

def p_blockEmpty(p):#LISTO##LISTO#
    '''block : empty'''
    p[0] = {1: "NULL"}
    
def p_instTag(p):#LISTO##LISTO#
    '''inst : ID DP'''
    p[0] = {1:"TAG",2: p[1],3:"END"}

def p_instNOP(p):#LISTO##LISTO#
    '''inst : NOP'''
    p[0] = {1:"NOP",2:"END"}


#Tipo R
def p_instADD(p):
    '''inst : ADD REG COMMA REG COMMA REG'''
    p[0] = {1: "ADD", 2: p[2], 3:p[4], 4:p[6], 5:"END"}

def p_instAND(p):
    '''inst : AND REG COMMA REG COMMA REG'''
    p[0] = {1:"AND", 2:p[2], 3:p[4], 4:p[6], 5:"END"}

def p_instNOR(p):
    '''inst : NOR REG COMMA REG COMMA REG'''
    p[0] = {1:"NOR", 2:p[2], 3:p[4], 4:p[6], 5:"END"}

def p_instOR(p):
    '''inst : OR REG COMMA REG COMMA REG'''
    p[0] = {1:"OR", 2:p[2], 3:p[4], 4:p[6], 5:"END"}
    
def p_instSLT(p):
    '''inst : SLT REG COMMA REG COMMA REG'''
    p[0] = {1:"SLT", 2:p[2], 3:p[4], 4:p[6], 5:"END"}
    
def p_instSLL(p):
    '''inst : SLL REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"SLL", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}
    
def p_instSRL(p):
    '''inst : SRL REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"SRL", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

def p_instSUB(p):
    '''inst : SUB REG COMMA REG COMMA REG'''
    p[0] = {1:"SUB", 2:p[2], 3:p[4], 4:p[6], 5:"END"}
    
#Tipo I

def p_instADDI(p):
    '''inst : ADDI REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"ADDI", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

def p_instBEQ(p):
    '''inst : BEQ REG COMMA REG COMMA ID'''
    p[0] = {1:"BEQ", 2:p[2], 3:p[4], 4: p[6], 5:"END"}

def p_instBNE(p):
    '''inst : BNE REG COMMA REG COMMA ID'''
    p[0] = {1:"BNE", 2:p[2], 3:p[4], 4: p[6], 5:"END"}

def p_instLW(p):
    '''inst : LW REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"LW", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

def p_instSLTI(p):
    '''inst : SLTI REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"SLTI", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

def p_instSW(p):
    '''inst : SW REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"SW", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

#Tipo J

def p_instJAL(p):
        '''inst : JAL ID'''
        p[0] = {1: "JAL", 2: p[2],3:"END"}

def p_instJ(p):
        '''inst : J ID'''
        p[0] = {1: "J", 2: p[2],3:"END"}

#PSEUDO INSTRUCCIONES
def p_instMOVE(p):
        '''inst : MOVE REG COMMA REG'''
        p[0] = {1:"MOVE", 2:p[2], 3: p[4], 4:"END"}


#Especializadas
#MPP Tipo I
def p_instMPP(p):
    '''inst : MPP REG COMMA REG'''
    p[0] = {1:"MPP", 2:p[2], 3:p[4], 4:"END"}

#MPPI Tipo J
def p_instMPPI(p):
        '''inst : MPPI NUM NUMBER COMMA NUM NUMBER'''
        p[0] = {1: "MPPI", 2: int(p[3]),3: int(p[6]), 4:"END"}

#PPXL Tipo I
def p_instPPXL(p):
    '''inst : PPXL REG'''
    p[0] = {1:"PPXL", 2:p[2], 3:"END"}

#PTMU Tipo I
def p_instPTMU(p):
    '''inst : PTMU REG'''
    p[0] = {1:"PTMU", 2:p[2], 3:"END"}


#PTML Tipo I
def p_instPTML(p):
    '''inst : PTML REG'''
    p[0] = {1:"PTML", 2:p[2], 3:"END"}


#PTMD Tipo I
def p_instPTMD(p):
    '''inst : PTMD REG'''
    p[0] = {1:"PTMD", 2:p[2], 3:"END"}

#PTMR Tipo I
def p_instPTMR(p):
    '''inst : PTMR REG'''
    p[0] = {1:"PTMR", 2:p[2], 3:"END"}

#PPXLC Tipo I
def p_instPPXLC(p):
    '''inst : PPXLC REG COMMA REG'''
    p[0] = {1:"PPXLC", 2:p[2], 3:p[4], 4:"END"}

#PMPXL Tipo R
def p_instPMPXL(p):
    '''inst : PMPXL REG COMMA REG'''
    p[0] = {1:"PMPXL", 2:p[2], 3:p[4], 4:"END"}

#CS Tipo I
def p_instCS(p):
    '''inst : CS REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"CS", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

#Pseudoinstrucciones
#SPNT Tipo I
def p_instSPNT(p):
    '''inst : SPNT REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"SPNT", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}

#MPNT Tipo I
def p_instMPNT(p):
    '''inst : MPNT REG COMMA REG COMMA NUM NUMBER'''
    p[0] = {1:"MPNT", 2:p[2], 3:p[4], 4: int(p[7]), 5:"END"}


    
def p_empty(p):
    '''empty :'''
    pass

def p_error(p):
    global errS
    errS = True
    print("Error de sintaxis: ",str(p))


   
def recorrer(d):
    global SemanticList
    list(d.keys()).sort()
    for x in list(d.keys()):
            if (isinstance(d[x], dict)):           
                    recorrer(d[x])
            else:
                    if(d[x]!="NULL"):
                            SemanticList += [d[x]]
def getErrS():
    global errS
    return errS
def divInst(lista):
    c = 0
    r = []
    for x in range(len(lista)):
        if  lista[x]=='END':
          r.append(lista[c:x])
          c=x+1
    return r
SemanticList =[]   
def initCompi(nameDoc):
    fp = codecs.open(nameDoc, "r", "utf-8")
    cadena = fp.read()
    print(cadena)
    fp.close()
    analizador = lex.lex()
    analizador.input(cadena)

    parser = yacc.yacc()
    result = parser.parse(cadena)

    global SemanticList
    recorrer(listap)
    return divInst(SemanticList)
    





