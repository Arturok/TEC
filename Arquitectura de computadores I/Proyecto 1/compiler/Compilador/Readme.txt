1- Ejecutar traductorASM.py desde el IDLE
2- Seleccionar el archivo *.s con las instrucciones en ASM
3- Este le genera los archivos codeBin.rs y codeHex.rs con los códigos en Hex y Bin.

MPP RS, RT -> Se asume RD=$PP
MPPI #12, #12 -> La dirección de salto está dada 10 bits + 16 bits
PPXL RS -> Se asume que RT=0, Inmediato=0
PTMU/L/D/R RS -> Se asume RT=$PP, Inmediato=0
PPXLC RS, RT
PMPXL RS, RT -> Se asume RD=$PP


EJEMPLOS:
Loop:
ADD R0, R2, R3
ADDI R1, R2, #12
Loop2:
AND R1, R2, R3
J Loop2
BNE R2, R3, Loop
BEQ R2, R3, Loop2
LW R1, R2, #4
NOR R1, R2, R3
OR R1, R2, R3
SLT R1, R2, R3
SLTI R1, R2, #12
SLL R1, R2, #12
SRL R1, R2, #12
SW R1, R2, #12
SUB R1, R2, R2
MPP R1, R2
MPPI #2, #3
PPXL R1
PTMU R1
PTML R1
PTMD R1
PTMR R1
PPXLC R1, R2
PMPXL R1, R2
CS R1, R2, #12
SPNT R1, R2, #3
MPNT R1, R2, #7



