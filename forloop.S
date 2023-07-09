
.globl app_entry;

app_entry:

addi a0, zero, 0 # Initialize sum

addi t0, zero, 0 # Counter with start value 
addi t1, zero, 5 # Counter upper bound

block_start:

bge t0, t1, block_end 
add a0, a0, t0
addi t0, t0, 1
j block_start

block_end:
nop;

