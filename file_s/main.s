	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	int_disable, @function
int_disable:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
 #APP
# 49 "./file_c/int.h" 1
	csrr a5, mstatus
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	andi	a5,a5,-9
	sw	a5,-20(s0)
	lw	a5,-20(s0)
 #APP
# 51 "./file_c/int.h" 1
	csrw mstatus, a5
# 0 "" 2
 #NO_APP
	li	a5,0
 #APP
# 52 "./file_c/int.h" 1
	csrw 0x300, a5
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	int_disable, .-int_disable
	.align	1
	.type	int_enable, @function
int_enable:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
 #APP
# 72 "./file_c/int.h" 1
	csrr a5, mstatus
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	ori	a5,a5,8
	sw	a5,-20(s0)
	lw	a5,-20(s0)
 #APP
# 74 "./file_c/int.h" 1
	csrw mstatus, a5
# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	int_enable, .-int_enable
	.section	.rodata
	.align	2
.LC0:
	.string	"hello world! here's your character: %c\n"
	.text
	.align	1
	.globl	ISR_UART
	.type	ISR_UART, @function
ISR_UART:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a5,437256192
	lw	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,437272576
	addi	a5,a5,12
	lw	a3,0(a5)
	li	a5,437272576
	addi	a5,a5,12
	li	a4,16777216
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	ISR_UART, .-ISR_UART
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L5
.L6:
	li	a1,1
	lw	a0,-20(s0)
	call	set_gpio_pin_direction
	li	a1,0
	lw	a0,-20(s0)
	call	set_gpio_pin_value
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L5:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L6
	call	int_disable
	li	a1,12
	li	a0,0
	call	uart_set_cfg
	li	a0,1
	call	uart_set_interrupt
	li	a5,437272576
	lw	a3,0(a5)
	li	a5,437272576
	li	a4,16777216
	or	a4,a3,a4
	sw	a4,0(a5)
	call	int_enable
	sw	zero,-24(s0)
.L9:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	andi	a5,a5,7
	li	a1,1
	mv	a0,a5
	call	set_gpio_pin_value
	lw	a5,-24(s0)
	andi	a5,a5,7
	li	a1,0
	mv	a0,a5
	call	set_gpio_pin_value
	sw	zero,-28(s0)
	j	.L7
.L8:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L7:
	lw	a4,-28(s0)
	li	a5,98304
	addi	a5,a5,1695
	ble	a4,a5,.L8
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	j	.L9
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
