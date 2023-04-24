import os

# This is an assembler that converts assembly code into machine language in accordance with 
# our designs contained within this project.


#The following is a dictionary of commands and their corresponding Opcodes.

# In the following Order:

# Branching (000)
# Carry Op (001)
# mov (010)
# ALU OPERATIONS (011)			
# NO-OP (100)			
# DATA MEMORY (101)			
# STACK MEMORY (110)			
# ROUTINE (111)			



dict_commands = {
    # Branching (000)
    "JZ":"000000",
    "JC":"000001",
    "JUMP":"000010",
    # Carry Op (001)
    "SETC":"001000",
    "CLRC":"001001",
    # mov (010)
    "MOV":"010000",
    "LDM":"010001",
    # ALU OPERATIONS (011)	
    "NOT":"011000",
    "INC":"011001",
    "DEC":"011010",
    "AND":"011011",
    "OR":"011100",
    "SUB":"011101",
    "ADD":"011110",
    "IADD":"011111",
    # NO-OP (100)
    "NOP":"100000",
    "IN":"100001",
    "OUT":"100010",
    # DATA MEMORY (101)
    "LDD":"101000",
    "STD":"101001",
    # STACK MEMORY (110)
    "POP":"110000",
    "PUSH":"110001",
    # ROUTINE (111)
    "CALL":"111000",
    "RETURN":"111100",
    "RTI":"111111"
}

#Removing the target file if already existing
os.remove("Code\Pipeline\src\Fetch\Testcache.mem")

assembly_ins = open("Code\Pipeline\src\Fetch\TestcasesPhaseOne.txt", encoding='utf-8-sig')
cache_file = open("Code\Pipeline\src\Fetch\Testcache.mem", "a")


for line in assembly_ins:
    if ord(line[0]) < 65 or ord(line[0]) > 90:
        continue
    else:
        command = line.split(" ",2)
        cache_file.write(dict_commands[command[0]]+"\n")
        if len(command)>1:
            operands = command[1].split(',')
        


        

