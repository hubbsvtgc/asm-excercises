
.section .text
.global _main

_main:

addi t0, x0, 3; 
addi t1, x0, 5;

add t2, t0, t1;

offset:
jal x0, offset;


