
.section .text

.global generate_trap;

.balign 64
my_trap_base:

	// read mcause
	csrr t0, mcause;

	// read mepc
	csrr t1, mepc;

	//increment return address by 4
	addi t1, t1, 4
	csrw mepc, t1

	/* Filter with mcause and
	handle here */

mret;

waitforever:
	add t1, t1, x0;
	j waitforever;

/* generate_trap:
Brief:  Generate a load access fault*/

generate_trap:

	// Map trap base to mtvec
	la t0, my_trap_base;
	csrw mtvec, t0;

	// Generate exception
	addi t0, x0, 1;
    lw t1, 0(t0);/*Read a word from addr 0x1 */

	// Waitforever
	j waitforever;

ret;
