
.global _main;

/* 
Fibonacci sequence generator
Results are stored from 0x80001000
as series of 32bits word each.

tn = tn-1 + tn-2;
t2 = t1 + t0 -> Registers 
*/
.equiv SEQ_LEN, 20
.equiv DEST_MEM_ADDR, 0x80001000

_main:

li a1, SEQ_LEN
li a2, DEST_MEM_ADDR

li t0, 0
li t1, 1

blez a1, keep_looping 
    /* Fibonacci seq len is >= 1 
       Write the first number 0 */
    sw t0, 0(a2)
    addi a1, a1, -1

blez a1, keep_looping
    /* Fibonacci seq len is >= 2 
       Write the second number 1 */
    addi a2, a2, 4
    sw t1, 0(a2)
    addi a1, a1, -1

blez a1, keep_looping
    /* Fibonacci seq len is >= 3 
       Write the following numbers */
Fibonacci:

    add t2, t1, t0
    addi a2, a2, 4
    sw t2, 0(a2)

    mv t0, t1
    mv t1, t2
    addi a1, a1, -1

bnez a1, Fibonacci

keep_looping: 
nop
j keep_looping;
