# Compiled with MARS (MIPS Assembler and Runtime Simulator)
.data
    mtnd_str: .asciiz "Input first unsigned integer: "
    mtpd_str: .asciiz "Input second unsigned integer: "
    rslt_str: .asciiz "Result: "
.text
    mtnd:
        li $v0, 4                   # Instruction 4: Print a string
        la $a0, mtnd_str            # Load address - Load string in a0 (argument register)
        syscall                     # Executes the call

        li $v0, 5                   # Instruction 5 : Read an int
        syscall                     # Executes the call

        move $s0, $v0               # Saves the value in s0 (save register)
        blez $s0, mtnd              # If the number is Less or Equal than Zero jump to mtnd

    mtpd:                           # Doing the same thing with the multiplier saving it in s1
        li $v0, 4
        la $a0, mtpd_str
        syscall

        li $v0, 5
        syscall

        move $s1, $v0
        blez $s1, mtpd

      	move $s3, $0                # Initialize s3 register to 0, which will be our result register
        
    molt:
        add $s3, $s3, $s0           # result = result + molteplicand
        subiu $s1, $s1, 1           # subiu: Subctraction of unsigned constant (multiplier = multiplier - 1)
        bgtz $s1, molt              # Loop until multiplier is greather than zero
    
    rslt:
        li $v0, 4                   # Print result string
        la $a0, rslt_str
        syscall
        
        li $v0, 1                   # Instruction 1: Print integer
        move $a0, $s3               # Take the value of s3 register and load it in a0
        syscall                     # Execute call
        
    exit:
        li $v0, 10                  # Intruction 10: Exit
        syscall
