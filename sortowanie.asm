	.data
prompt: .asciz "Enter string:\n"
buf:	.space 100

	.text
	.globl main
main:
	li a7, 4
	la a0, prompt
	ecall

	li a7, 8
	la a0, buf
	li a1, 100
	ecall
	
	la t0, buf
	la t1, buf 	# currently sorted element addr
	mv t2, t1
	addi t1, t1, 1
	lb t3, (t1)
	lb t4, (t2)
	beqz t3, end
	beqz t4, end
	j nest_loop
	
pre_loop:
	addi t2, t2, -1
loop:
	sb t3, +1(t2)
	addi t1, t1, 1
	mv t2, t1	# left element to check addr
	addi t2, t2, -1
	lb t3, (t1)	# sorted int
	beqz t3, end
nest_loop:
	lb t4, (t2)	# checked int
	ble t4, t3, loop
	sb t4, +1(t2)
	#sb t3, (t2)
	beq t2, t0, pre_loop
	addi t2, t2, -1
	j nest_loop
end:
	
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall
