import os
import sys
import re

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
    "RET": "111100",
    "RTI": "111111"
}

# This variable contains whether the current command has an rdst or not (whether it's the first op or not)
first_rdst = True

# This variable contains whether the current command has an immediate value or not.
immd = False

# Dictionary containing our Registers and their corresponding bit representations
Registers = {
    "R0": "000",
    "R1": "001",
    "R2": "010",
    "R3": "011",
    "R4": "100",
    "R5": "101",
    "R6": "110",
    "R7": "111"
}

no_Operands = {"RTI", "RET", "NOP", "SETC", "CLRC"}

Lines_Counter = 0
org_memory_value = 0


def main():

    global Lines_Counter
    global org_memory_value
    # Removing the target file if already existing
    if os.path.exists("ControlCache.mem"):
        os.remove("ControlCache.mem")

    # Opening assembly instructions
    assembly_file_dir = "Phase2\Control Hazard.asm"
    assembly_ins = open(assembly_file_dir, encoding='utf-8-sig')

    # Creating File to write in
    with open("ControlCache.mem", "a", encoding='utf-8-sig') as cache_file:
        cache_file.write("xxxxxxxxxxxxxxxx\n")
        Lines_Counter = Lines_Counter+1
    # Looping over each line

    for line in assembly_ins:

        # Checking if command is .org and looping till we reach the required location
        if line[0] == ".":
            ord_split = re.split(r'\s+', line)
            ord_split_value = re.split(r'\s+', ord_split[1])
            while org_memory_value != int(ord_split_value[0], 16):
                if org_memory_value <= int(ord_split_value[0], 16):
                    with open("ControlCache.mem", "a", encoding='utf-8-sig') as cache_file:
                        cache_file.write("xxxxxxxxxxxxxxxx\n")
                    Lines_Counter = Lines_Counter+1
                    org_memory_value = org_memory_value+1
                else:
                    org_memory_value = int(ord_split_value[0], 16)
            continue

        # Checking if the value is a hex number
        elif ord(line[0]) >= 48 and ord(line[0]) <= 57:
            address_value = bin(
                int(re.split(r'\s+', line)[0], 16))[2:].zfill(16)

            # Writing in the specified memory location
            with open("ControlCache.mem", "r", encoding='utf-8') as file:
                data = file.readlines()
                data[org_memory_value] = address_value+"\n"

            with open("ControlCache.mem", 'w', encoding='utf-8') as file:
                file.writelines(data)

            with open("ControlCache.mem", "a", encoding='utf-8-sig') as cache_file:
                cache_file.write("xxxxxxxxxxxxxxxx\n")
                Lines_Counter = Lines_Counter+1
                org_memory_value = org_memory_value+1
            continue

        # checking if line is a comment or space
        elif ord(line[0]) < 65 or ord(line[0]) > 90:
            continue

        # NORMAL INSTRUCTION
        # splitting the line on space, to get rid of each line's comment, actual command in loc[0]
        line_split = re.split(r'\s+', line)

        # Splitting command on t if it's a command with no operands
        command = re.split(r'\s+', line_split[0])[0].strip()

        if command not in no_Operands:
            pre_operands = re.split(r'\s+', line_split[1])[0]
            operands = pre_operands.strip().split(',')
        else:
            operands = [""]

        toMachineCode(command, operands)
    cache_file.close


# This function takes in the command, destination, rs1 and rs2 and outputs the
# corresponding machine code to the output file.
def toMachineCode(command, operands):

    global Lines_Counter
    global org_memory_value
    immediate_bit = checkImmediate(command)
    dst_bits = checkDst(command, operands)
    rs1_bits = checkRs1(command, operands)
    rs2_bits = checkRs2(command, operands)

    # Writing in the specified memory location
    with open("ControlCache.mem", "r", encoding='utf-8') as file:
        data = file.readlines()
        if org_memory_value <= len(data)-1:
            # data[org_memory_value]= di"\n""xxxxxxxxxxxxxxxx\n"ct_commands[command]+immediate_bit+" rs1 "+rs1_bits+" rs2 "+rs2_bits+" rdst "+dst_bits+"\n"
            data[org_memory_value] = dict_commands[command] + \
                immediate_bit+rs1_bits+rs2_bits+dst_bits+"\n"
            with open("ControlCache.mem", 'w', encoding='utf-8') as file:
                file.writelines(data)
        else:
            with open("ControlCache.mem", 'a', encoding='utf-8') as file:
                # file.writelines(dict_commands[command]+immediate_bit+" rs1 "+rs1_bits+" rs2 "+rs2_bits+" rdst "+dst_bits+"\n")
                file.writelines(
                    dict_commands[command]+immediate_bit+rs1_bits+rs2_bits+dst_bits+"\n")
        Lines_Counter = Lines_Counter+1
        org_memory_value = org_memory_value+1

    # cache_file = open("Testcache.mem", "a")
    # cache_file.write(dict_commands[command]+immediate_bit+" rs1 "+rs1_bits+" rs2 "+rs2_bits+" rdst "+dst_bits+"\n")
    # Lines_Counter = Lines_Counter+1
    # org_memory_value = org_memory_value+1

    if immd == True:

        if command == "LDM":
            hex_value = operands[1]
        elif command == "IADD":
            hex_value = operands[2]

        immediate_Value = bin(int(hex_value, 16))[2:].zfill(16)
        # Writing in the specified memory location

        with open("ControlCache.mem", "r", encoding='utf-8') as file:
            data = file.readlines()

            if org_memory_value <= len(data)-1:
                data[org_memory_value] = immediate_Value+"\n"
                with open("ControlCache.mem", 'w', encoding='utf-8') as file:
                    file.writelines(data)
                    with open("ControlCache.mem", 'w', encoding='utf-8') as file:
                        file.writelines(data)
                        Lines_Counter = Lines_Counter+1
                        org_memory_value = org_memory_value+1
            else:
                with open("ControlCache.mem", 'a', encoding='utf-8') as file:
                    # file.writelines(dict_commands[command]+immediate_bit+" rs1 "+rs1_bits+" rs2 "+rs2_bits+" rdst "+dst_bits+"\n")
                    file.writelines(immediate_Value+"\n")
                    Lines_Counter = Lines_Counter+1
                    org_memory_value = org_memory_value+1


# This function takes in the command and checks whether the command
# has an Rdst and which one it is.
def checkDst(command, operands):

    global first_rdst
    if command == "OUT":
        first_rdst = False
    elif command == "PUSH":
        first_rdst = False
    elif command == "STD":
        first_rdst = False
    else:
        first_rdst = True

    if first_rdst == True and operands[0] != "":
        first_rdst = False
        return Registers[operands[0]]
        first_rdst = False
    else:
        return "000"

# This function checks on Rs1 whether it exits and which one it is.x


def checkRs1(command, operands):

    no_rs1 = {"IN", "POP", "LDM", "JZ", "JC", "JMP", "CALL"}
    if command == "OUT" or command == "PUSH":
        return Registers[operands[0]]
    elif command in no_rs1 or operands[0] == "":
        return "000"
    else:
        return Registers[operands[1]]

# This function checks on Rs2 whether it exits and which one it is.


def checkRs2(command, operands):
    have_rsc2 = {"AND", "ADD", "SUB", "OR", "STD"}
    if command in have_rsc2:
        if command == "STD":
            return Registers[operands[0]]
        else:
            return Registers[operands[2]]
    else:
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

    immediate_bit = "0"
    if immd == True:
        immediate_bit = "1"
    return immediate_bit


if __name__ == "__main__":
    main()
