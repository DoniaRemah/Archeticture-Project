import os

# This is an assembler that converts assembly code into machine language in accordance with
# our designs contained within this project.


# The following is a dictionary of commands and their corresponding Opcodes.

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
    "JZ": "000000",
    "JC": "000001",
    "JMP": "000010",
    # Carry Op (001)
    "SETC": "001000",
    "CLRC": "001001",
    # mov (010)
    "MOV": "010000",
    "LDM": "010001",
    # ALU OPERATIONS (011)
    "NOT": "011000",
    "INC": "011001",
    "DEC": "011010",
    "AND": "011011",
    "OR": "011100",
    "SUB": "011101",
    "ADD": "011110",
    "IADD": "011111",
    # NO-OP (100)
    "NOP": "100000",
    "IN": "100001",
    "OUT": "100010",
    # DATA MEMORY (101)
    "LDD": "101000",
    "STD": "101001",
    # STACK MEMORY (110)
    "POP": "110000",
    "PUSH": "110001",
    # ROUTINE (111)
    "CALL": "111000",
    "RETURN": "111100",
    "RTI": "111111"
}

# This variable contains whether the current command has an rdst or not (whether it's the first op or not)
first_rdst = True

# This variable contains whether the current command has an rs1 or not.
has_rs1 = False

# This variable contains whether the current command has an rs2 or not.
has_rs2 = False

# This variable contains whether the current command has an immediate value or not.
immd = False


#Dictionary containing our Registers and their corresponding bit representations
Registers={
    "R0":"000",
    "R1":"001",
    "R2":"010",
    "R3":"011",
    "R4":"100",
    "R5":"101",
    "R6":"110",
    "R7":"111"
}



def main():

    # Removing the target file if already existing
    if os.path.exists("Code\Pipeline\src\Fetch\Testcache.mem"):
        os.remove("Code\Pipeline\src\Fetch\Testcache.mem")

    # Opening assembly instructions
    assembly_ins = open(
        "Code\Pipeline\src\Fetch\TestcasesPhaseOne.txt", encoding='utf-8-sig')

    # Looping over each line

    for line in assembly_ins:

        # checking if line is a comment or space
        if ord(line[0]) < 65 or ord(line[0]) > 90:
            continue

        else:
            # splitting the line on space, to get rid of each line's comment, actual command in loc[0]
            line_split = line.split(" ", 2)
            command = line_split[0]
            
            if len(line_split) > 1:
                operands = line_split[1].split(',')
            else:
                operands = [""]

            toMachineCode(command,operands)
            # if len(operands) > 0:
            #     if operands[0] == "":
            #         print("NOP")
            #     else:
            #         print(operands)
            # else:
            #     print("NOP")


# This function takes in the command, destination, rs1 and rs2 and outputs the
# corresponding machine code to the output file.
def toMachineCode(command, operands):

    checkImmediate(command)
    dst_bits=checkDst(command,operands)
    rs1_bits = checkRs1(command,operands)
    rs2_bits = checkRs2(command,operands)

    immediate_bit = "0"
    if immd == True:
        immediate_bit = "1"

    cache_file = open("Code\Pipeline\src\Fetch\Testcache.mem", "a")
    cache_file.write(dict_commands[command]+immediate_bit+" rs1 "+rs1_bits+" rs2 "+rs2_bits+" rdst "+dst_bits+"\n")

# This function takes in the command and checks whether the command
# has an Rdst and which one it is.
def checkDst(command,operands):

    global first_rdst
    if command == "OUT":
        first_rdst = False
    elif command == "PUSH":
        first_rdst = False
    elif command == "STD":
        first_rdst = False
    else: 
        first_rdst = True

    if first_rdst == True and operands[0]!= "":
        return Registers[operands[0]]
    else:
        return "000"

#This function checks on Rs1 whether it exits and which one it is.x
def checkRs1(command, operands):

    no_rs1 = {"IN","POP","LDM","JZ","JC","JMP","CALL"}

    if command == "OUT" or  command == "PUSH":
        return Registers[operands[0]]
    elif command in no_rs1 or operands[0]== "":
        return "000"
    else:
        return Registers[operands[1]]

#This function checks on Rs2 whether it exits and which one it is.
def checkRs2(command, operands):  
    have_rsc2 = {"AND","ADD","SUB","OR","STD"}
    if command in have_rsc2:
        if command == "STD":
            return Registers[operands[0]]
        else:
            return Registers[operands[2]]
    else :
        return "000"

# This function checks whether one of the operands is an immediate value or not.
def checkImmediate(command):
    global immd
    if command == "IADD":
        immd = True
    elif command == "LDM":
        immd = True
    else:
        immd = False


if __name__ == "__main__":
    main()
