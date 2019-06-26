import ply.lex as lex
import re
import codecs
import os
import sys

clase = 0

errL = False
isComment = 0

# Tokens para catalogar los lexemas
tokens = ['ID','RPC','LPC','NUMBER','REG','COMMA','MINUS','NUM','DP']


#kword = ['ADD','ADDI','SUB','MUL','B','BEQ','BNE','MOV','NOP','EOR','STR','LDR','CMP','ORR','AND','LSL','BGT','BLT','PRM','UMB','SUBS','DIV']
kword = ['NOP', 'ADD', 'ADDI', 'AND', 'BEQ', 'BNE', 'J', 'JAL', 'LW', 'NOR', 'OR', 'SLT', 'SLTI', 'SLL', 'SRL', 'SW', 'SUB', 'BLT', 'BGT', 'BLE', 'BGE', 'LI', 'MOVE',
         'MPP', 'MPPI', 'PPXL', 'PTMU', 'PTML', 'PTMD', 'PTMR', 'PPXLC', 'PMPXL', 'CS', 'SPNT', 'MPNT']


tokens = tokens+ kword
## 'ORR','AND','LSL','BGT','BLT','PRM','UMB'
t_RPC = r'\]'
t_LPC = r'\['
t_COMMA = r','
t_MINUS = r'\-'
t_NUM = r'\#'
t_DP = r'\:'

def t_ADDI(t):
    r'ADDI|addi'
    t.value = t.value.upper()
    return t

def t_ADD(t):
    r'ADD|add'
    t.value = t.value.upper()
    return t

def t_AND(t):
    r'AND|and'
    t.value = t.value.upper()
    return t

def t_BEQ(t):
    r'BEQ|beq'
    t.value = t.value.upper()
    return t

def t_BNE(t):
    r'BNE|bne'
    t.value = t.value.upper()
    return t

def t_JAL(t):
    r'JAL|jal'
    t.value = t.value.upper()
    return t

def t_J(t):
    r'J|J'
    t.value = t.value.upper()
    return t

def t_LW(t):
    r'LW|lw'
    t.value = t.value.upper()
    return t

def t_NOR(t):
    r'NOR|nor'
    t.value = t.value.upper()
    return t

def t_OR(t):
    r'OR|or'
    t.value = t.value.upper()
    return t

def t_SLTI(t):
    r'SLTI|slti'
    t.value = t.value.upper()
    return t

def t_SLT(t):
    r'SLT|slt'
    t.value = t.value.upper()
    return t

def t_SLL(t):
    r'SLL|sll'
    t.value = t.value.upper()
    return t

def t_SRL(t):
    r'SRL|srl'
    t.value = t.value.upper()
    return t

def t_SW(t):
    r'SW|sw'
    t.value = t.value.upper()
    return t


def t_SUB(t):
    r'SUB|sub'
    t.value = t.value.upper()
    return t

#def t_BLT(t):
#    r'BLT|blt'
#    t.value = t.value.upper()
#    return t

#def t_BGT(t):
#    r'BGT|bgt'
#    t.value = t.value.upper()
#    return t

#def t_BLE(t):
#    r'BLE|ble'
#    t.value = t.value.upper()
#    return t

#def t_BGE(t):
#    r'BGE|bge'
#    t.value = t.value.upper()
#    return t

#def t_LI(t):
#    r'LI|li'
#    t.value = t.value.upper()
#    return t

def t_MOVE(t):
    r'MOVE|move'
    t.value = t.value.upper()
    return t

def t_MPPI(t):
    r'MPPI|mppi'
    t.value = t.value.upper()
    return t

def t_MPP(t):
    r'MPP|mpp'
    t.value = t.value.upper()
    return t

def t_PPXLC(t):
    r'PPXLC|ppxlc'
    t.value = t.value.upper()
    return t

def t_PPXL(t):
    r'PPXL|ppxl'
    t.value = t.value.upper()
    return t

def t_PTMU(t):
    r'PTMU|ptmu'
    t.value = t.value.upper()
    return t

def t_PTML(t):
    r'PTML|ptml'
    t.value = t.value.upper()
    return t

def t_PTMD(t):
    r'PTMD|ptmd'
    t.value = t.value.upper()
    return t

def t_PTMR(t):
    r'PTMR|ptmr'
    t.value = t.value.upper()
    return t

def t_PMPXL(t):
    r'PMPXL|pmpxl'
    t.value = t.value.upper()
    return t

def t_CS(t):
    r'CS|cs'
    t.value = t.value.upper()
    return t
#Pseudo Instrucciones
def t_SPNT(t):
    r'SPNT|spnt'
    t.value = t.value.upper()
    return t

def t_MPNT(t):
    r'MPNT|mpnt'
    t.value = t.value.upper()
    return t


##################################################
def t_ID(t):
    r'[a-qs-zA-QS-Z][a-zA-Z0-9]*'
    return t

def t_REG(t):
    r'\$[a-zA-Z]*[0-9]*|\$[blackphrvgsf]*|[rR][0-9]*'
    t.value = t.value.upper()
    return t


def t_COMMENT(t):
    r';.*'
    global isComment
    isComment += 1
    t.lexer.skip(1)

def t_NUMBER(t):
    r'\d+|\-\d+'
    return t

def t_error(t):
    global errL
    errL = True
    print("Aqui hay un error",t.value[0])
    t.lexer.skip(1)
    
def t_nonespace(t):
    r'\s+'
    pass

def getErrL():
    global errL
    return errL
