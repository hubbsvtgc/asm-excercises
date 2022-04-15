.section .text
.global call_assembly

.extern input;
.equ RUN_COUNT, 4

call_assembly:

addi s1, zero, 0;   /* Initialize number of sorted elements */

li t2, RUN_COUNT;

outer_loop_start:

lui a0, %hi(input);

addi a0, a0, %lo(input); /* Base address in a0 */

lw t0, 0(a0); /* Fetch first elment into t0 */

sub s2, t2, s1; /* Inner loop count: outer loop count - sorted elements */

inner_loop_start:

	lw t1, 4(a0);

	blt t0,t1, _noswap;

/* swap */
	sw t1, 0(a0);
	sw t0, 4(a0);
_noswap:

	/* Keep the higher of t0, t1 in t0 */
	slt t3, t0, t1;

	beq t3, zero, _skip;

	add t0, t1, zero;
_skip:

	addi a0, a0, 4; /* Increment the address to next element */

	addi s2, s2, -1;

	bne s2, zero, inner_loop_start;

inner_loop_end:

addi s1, s1, 1;

blt s1, t2, outer_loop_start;

outer_loop_end:

ret;

