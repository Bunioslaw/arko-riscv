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
	
	la t0, buf	# currently inspected address
	li t1, '0'
	li t2, '9'
	addi t0, t0, -1
next:
	addi t0, t0, 1	
loop:
	lb t3, (t0)	# inspected char
	beqz t3, end
	bgt t3, t2, next
	blt t3, t1, next
	mv t6, t0
nest_loop:
	lb t4, +1(t6)
	sb t4, (t6)
	beqz t4, loop
	addi t6, t6, 1
	j nest_loop
end:
	
	li a7, 4
	la a0, buf
	ecall
	
	li a7, 10
	ecall