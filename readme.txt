-To run the assembler, open visual studio code and click on the run button at the top right. Make sure that the testcase has the same exact name as the one included in this folder.

-Or you can run the assembler.exe but make sure that the assembler.py as well as the testcase file are in the same directory.

-This assembler operates on the assumption that the instruction is 100% correct, in the following format:

ins op1,op2,op3\n
or 
ins op1,op2,op3\t

!! It does not operate if there's a space after the operands.!!

-This way of operation is based on the uploaded test case to the elearn.

-The output file is called testcache.mem



########## MODIFIED ASM FILES TO MATCH FORMAT OF OUR ASSEMBLER. (INSTRUCTIONS ARE NOT CHANGED- ONLY FORMAT)

########## TO ALTERNATE RUNNING THE DATAHAZARD.ASM AND CONTROL HAZARD.ASM MODIFY LINE 92 IN THE ASSEMBLER (FILE PATH TO READ INSTRUCTIONS FROM)



