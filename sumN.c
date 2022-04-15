

.global sumN;

/**
  * @brief Find the sum of first N natural numbers
  *
  * @param[in] a0 holds the N value
  * @param[in] a1 holds the address to store result
  *
  * @return a0 returns the status
  *    0:success,-1:invalid input,-2:overflow
  **/

sumN:

	// Input N validation
	blt x0, a0, valid_n;
	addi a0, x0, -1;
	add t0, x0, a0;
	jal x0, end;
valid_n:

	// Initialize t0
	addi t1, x0, 0;

	// Loop N times
loop_start:
	beq a0, x0, loop_end;
	add t0, t1, a0;
	// Overflow check
	bltu t1, t0, no_overflow;
	add t0, t1, x0;
	addi a0, x0, -2;
	jal x0, end;
no_overflow:
	add t1, t0, x0;
	addi a0, a0, -1;
	jal x0, loop_start;
loop_end:

end:
	// Write sum
	sw t0, 0(a1);
	ret; //jalr x0, 0(ra);
	
