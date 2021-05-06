
hello：     文件格式 elf32-littleriscv


Disassembly of section .vectors:

00000000 <_stack_start-0x104000>:
   0:	08c0006f          	j	8c <_stext>
   4:	00000013          	nop
   8:	00000013          	nop
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop
  20:	00000013          	nop
  24:	00000013          	nop
  28:	00000013          	nop
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop
  50:	00000013          	nop
  54:	00000013          	nop
  58:	0960006f          	j	ee <ISR_SRAM_ASM>
  5c:	0a60006f          	j	102 <ISR_I2C_ASM>
  60:	0b60006f          	j	116 <ISR_UART_ASM>
  64:	0c60006f          	j	12a <ISR_GPIO_ASM>
  68:	0d60006f          	j	13e <ISR_SPIM0_ASM>
  6c:	0e60006f          	j	152 <ISR_SPIM1_ASM>
  70:	10a0006f          	j	17a <ISR_TA_OVF_ASM>
  74:	0f20006f          	j	166 <ISR_TA_CMP_ASM>
  78:	12a0006f          	j	1a2 <ISR_TB_OVF_ASM>
  7c:	1120006f          	j	18e <ISR_TB_CMP_ASM>
  80:	00c0006f          	j	8c <_stext>
  84:	1320006f          	j	1b6 <illegal_insn_handler>
  88:	1420006f          	j	1ca <ecall_insn_handler>

Disassembly of section .text:

0000008c <_stext>:
      8c:	30501073          	csrw	mtvec,zero
      90:	00000093          	li	ra,0
      94:	8106                	mv	sp,ra
      96:	8186                	mv	gp,ra
      98:	8206                	mv	tp,ra
      9a:	8286                	mv	t0,ra
      9c:	8306                	mv	t1,ra
      9e:	8386                	mv	t2,ra
      a0:	8406                	mv	s0,ra
      a2:	8486                	mv	s1,ra
      a4:	8506                	mv	a0,ra
      a6:	8586                	mv	a1,ra
      a8:	8606                	mv	a2,ra
      aa:	8686                	mv	a3,ra
      ac:	8706                	mv	a4,ra
      ae:	8786                	mv	a5,ra
      b0:	00104117          	auipc	sp,0x104
      b4:	f5010113          	addi	sp,sp,-176 # 104000 <_stack>

000000b8 <_start>:
      b8:	00100717          	auipc	a4,0x100
      bc:	00870713          	addi	a4,a4,8 # 1000c0 <_bss_end>
      c0:	00100797          	auipc	a5,0x100
      c4:	00078793          	mv	a5,a5
      c8:	00f75763          	bge	a4,a5,d6 <main_entry>

000000cc <zero_loop>:
      cc:	00072023          	sw	zero,0(a4)
      d0:	0711                	addi	a4,a4,4
      d2:	fee7dde3          	bge	a5,a4,cc <zero_loop>

000000d6 <main_entry>:
      d6:	4501                	li	a0,0
      d8:	4585                	li	a1,1
      da:	19a010ef          	jal	ra,1274 <uart_set_cfg>
      de:	4501                	li	a0,0
      e0:	4581                	li	a1,0
      e2:	50c000ef          	jal	ra,5ee <main>
      e6:	842a                	mv	s0,a0
      e8:	2e4010ef          	jal	ra,13cc <uart_wait_tx_done>
      ec:	8522                	mv	a0,s0

000000ee <ISR_SRAM_ASM>:
      ee:	711d                	addi	sp,sp,-96
      f0:	ce86                	sw	ra,92(sp)
      f2:	0ec000ef          	jal	ra,1de <store_regs>
      f6:	00000097          	auipc	ra,0x0
      fa:	10208093          	addi	ra,ra,258 # 1f8 <end_except>
      fe:	40e0006f          	j	50c <ISR_SRAM>

00000102 <ISR_I2C_ASM>:
     102:	711d                	addi	sp,sp,-96
     104:	ce86                	sw	ra,92(sp)
     106:	0d8000ef          	jal	ra,1de <store_regs>
     10a:	00000097          	auipc	ra,0x0
     10e:	0ee08093          	addi	ra,ra,238 # 1f8 <end_except>
     112:	4020006f          	j	514 <ISR_I2C>

00000116 <ISR_UART_ASM>:
     116:	711d                	addi	sp,sp,-96
     118:	ce86                	sw	ra,92(sp)
     11a:	0c4000ef          	jal	ra,1de <store_regs>
     11e:	00000097          	auipc	ra,0x0
     122:	0da08093          	addi	ra,ra,218 # 1f8 <end_except>
     126:	48e0006f          	j	5b4 <ISR_UART>

0000012a <ISR_GPIO_ASM>:
     12a:	711d                	addi	sp,sp,-96
     12c:	ce86                	sw	ra,92(sp)
     12e:	0b0000ef          	jal	ra,1de <store_regs>
     132:	00000097          	auipc	ra,0x0
     136:	0c608093          	addi	ra,ra,198 # 1f8 <end_except>
     13a:	3ea0006f          	j	524 <ISR_GPIO>

0000013e <ISR_SPIM0_ASM>:
     13e:	711d                	addi	sp,sp,-96
     140:	ce86                	sw	ra,92(sp)
     142:	09c000ef          	jal	ra,1de <store_regs>
     146:	00000097          	auipc	ra,0x0
     14a:	0b208093          	addi	ra,ra,178 # 1f8 <end_except>
     14e:	3de0006f          	j	52c <ISR_SPIM0>

00000152 <ISR_SPIM1_ASM>:
     152:	711d                	addi	sp,sp,-96
     154:	ce86                	sw	ra,92(sp)
     156:	088000ef          	jal	ra,1de <store_regs>
     15a:	00000097          	auipc	ra,0x0
     15e:	09e08093          	addi	ra,ra,158 # 1f8 <end_except>
     162:	3d20006f          	j	534 <ISR_SPIM1>

00000166 <ISR_TA_CMP_ASM>:
     166:	711d                	addi	sp,sp,-96
     168:	ce86                	sw	ra,92(sp)
     16a:	074000ef          	jal	ra,1de <store_regs>
     16e:	00000097          	auipc	ra,0x0
     172:	08a08093          	addi	ra,ra,138 # 1f8 <end_except>
     176:	3ce0006f          	j	544 <ISR_TA_CMP>

0000017a <ISR_TA_OVF_ASM>:
     17a:	711d                	addi	sp,sp,-96
     17c:	ce86                	sw	ra,92(sp)
     17e:	060000ef          	jal	ra,1de <store_regs>
     182:	00000097          	auipc	ra,0x0
     186:	07608093          	addi	ra,ra,118 # 1f8 <end_except>
     18a:	3b20006f          	j	53c <ISR_TA_OVF>

0000018e <ISR_TB_CMP_ASM>:
     18e:	711d                	addi	sp,sp,-96
     190:	ce86                	sw	ra,92(sp)
     192:	04c000ef          	jal	ra,1de <store_regs>
     196:	00000097          	auipc	ra,0x0
     19a:	06208093          	addi	ra,ra,98 # 1f8 <end_except>
     19e:	3b60006f          	j	554 <ISR_TB_CMP>

000001a2 <ISR_TB_OVF_ASM>:
     1a2:	711d                	addi	sp,sp,-96
     1a4:	ce86                	sw	ra,92(sp)
     1a6:	038000ef          	jal	ra,1de <store_regs>
     1aa:	00000097          	auipc	ra,0x0
     1ae:	04e08093          	addi	ra,ra,78 # 1f8 <end_except>
     1b2:	39a0006f          	j	54c <ISR_TB_OVF>

000001b6 <illegal_insn_handler>:
     1b6:	711d                	addi	sp,sp,-96
     1b8:	ce86                	sw	ra,92(sp)
     1ba:	024000ef          	jal	ra,1de <store_regs>
     1be:	00000097          	auipc	ra,0x0
     1c2:	03a08093          	addi	ra,ra,58 # 1f8 <end_except>
     1c6:	05a0006f          	j	220 <illegal_insn_handler_c>

000001ca <ecall_insn_handler>:
     1ca:	711d                	addi	sp,sp,-96
     1cc:	ce86                	sw	ra,92(sp)
     1ce:	010000ef          	jal	ra,1de <store_regs>
     1d2:	00000097          	auipc	ra,0x0
     1d6:	02608093          	addi	ra,ra,38 # 1f8 <end_except>
     1da:	04e0006f          	j	228 <ecall_insn_handler_c>

000001de <store_regs>:
     1de:	c00e                	sw	gp,0(sp)
     1e0:	c212                	sw	tp,4(sp)
     1e2:	c416                	sw	t0,8(sp)
     1e4:	c61a                	sw	t1,12(sp)
     1e6:	c81e                	sw	t2,16(sp)
     1e8:	ca2a                	sw	a0,20(sp)
     1ea:	cc2e                	sw	a1,24(sp)
     1ec:	ce32                	sw	a2,28(sp)
     1ee:	d036                	sw	a3,32(sp)
     1f0:	d23a                	sw	a4,36(sp)
     1f2:	d43e                	sw	a5,40(sp)
     1f4:	00008067          	ret

000001f8 <end_except>:
     1f8:	4182                	lw	gp,0(sp)
     1fa:	4212                	lw	tp,4(sp)
     1fc:	42a2                	lw	t0,8(sp)
     1fe:	4332                	lw	t1,12(sp)
     200:	43c2                	lw	t2,16(sp)
     202:	4552                	lw	a0,20(sp)
     204:	45e2                	lw	a1,24(sp)
     206:	4672                	lw	a2,28(sp)
     208:	5682                	lw	a3,32(sp)
     20a:	5712                	lw	a4,36(sp)
     20c:	57a2                	lw	a5,40(sp)
     20e:	40f6                	lw	ra,92(sp)
     210:	6125                	addi	sp,sp,96
     212:	30200073          	mret

00000216 <_fini>:
     216:	8082                	ret

00000218 <default_exception_handler_c>:
     218:	1141                	addi	sp,sp,-16
     21a:	c622                	sw	s0,12(sp)
     21c:	0800                	addi	s0,sp,16
     21e:	a001                	j	21e <default_exception_handler_c+0x6>

00000220 <illegal_insn_handler_c>:
     220:	1141                	addi	sp,sp,-16
     222:	c622                	sw	s0,12(sp)
     224:	0800                	addi	s0,sp,16
     226:	a001                	j	226 <illegal_insn_handler_c+0x6>

00000228 <ecall_insn_handler_c>:
     228:	1141                	addi	sp,sp,-16
     22a:	c622                	sw	s0,12(sp)
     22c:	0800                	addi	s0,sp,16
     22e:	a001                	j	22e <ecall_insn_handler_c+0x6>

00000230 <set_pin_function>:
     230:	7179                	addi	sp,sp,-48
     232:	d622                	sw	s0,44(sp)
     234:	1800                	addi	s0,sp,48
     236:	fca42e23          	sw	a0,-36(s0)
     23a:	fcb42c23          	sw	a1,-40(s0)
     23e:	1a1077b7          	lui	a5,0x1a107
     242:	439c                	lw	a5,0(a5)
     244:	fef42623          	sw	a5,-20(s0)
     248:	fdc42783          	lw	a5,-36(s0)
     24c:	4705                	li	a4,1
     24e:	00f717b3          	sll	a5,a4,a5
     252:	fff7c713          	not	a4,a5
     256:	fec42783          	lw	a5,-20(s0)
     25a:	8ff9                	and	a5,a5,a4
     25c:	fef42623          	sw	a5,-20(s0)
     260:	fdc42783          	lw	a5,-36(s0)
     264:	fd842703          	lw	a4,-40(s0)
     268:	00f71733          	sll	a4,a4,a5
     26c:	fec42783          	lw	a5,-20(s0)
     270:	8fd9                	or	a5,a5,a4
     272:	fef42623          	sw	a5,-20(s0)
     276:	1a1077b7          	lui	a5,0x1a107
     27a:	fec42703          	lw	a4,-20(s0)
     27e:	c398                	sw	a4,0(a5)
     280:	0001                	nop
     282:	5432                	lw	s0,44(sp)
     284:	6145                	addi	sp,sp,48
     286:	8082                	ret

00000288 <get_pin_function>:
     288:	7179                	addi	sp,sp,-48
     28a:	d622                	sw	s0,44(sp)
     28c:	1800                	addi	s0,sp,48
     28e:	fca42e23          	sw	a0,-36(s0)
     292:	1a1077b7          	lui	a5,0x1a107
     296:	439c                	lw	a5,0(a5)
     298:	fef42623          	sw	a5,-20(s0)
     29c:	fec42703          	lw	a4,-20(s0)
     2a0:	fdc42783          	lw	a5,-36(s0)
     2a4:	40f757b3          	sra	a5,a4,a5
     2a8:	8b85                	andi	a5,a5,1
     2aa:	fef42623          	sw	a5,-20(s0)
     2ae:	fec42783          	lw	a5,-20(s0)
     2b2:	853e                	mv	a0,a5
     2b4:	5432                	lw	s0,44(sp)
     2b6:	6145                	addi	sp,sp,48
     2b8:	8082                	ret

000002ba <set_gpio_pin_direction>:
     2ba:	7179                	addi	sp,sp,-48
     2bc:	d622                	sw	s0,44(sp)
     2be:	1800                	addi	s0,sp,48
     2c0:	fca42e23          	sw	a0,-36(s0)
     2c4:	fcb42c23          	sw	a1,-40(s0)
     2c8:	1a1017b7          	lui	a5,0x1a101
     2cc:	439c                	lw	a5,0(a5)
     2ce:	fef42623          	sw	a5,-20(s0)
     2d2:	fd842783          	lw	a5,-40(s0)
     2d6:	ef91                	bnez	a5,2f2 <set_gpio_pin_direction+0x38>
     2d8:	fdc42783          	lw	a5,-36(s0)
     2dc:	4705                	li	a4,1
     2de:	00f717b3          	sll	a5,a4,a5
     2e2:	fff7c713          	not	a4,a5
     2e6:	fec42783          	lw	a5,-20(s0)
     2ea:	8ff9                	and	a5,a5,a4
     2ec:	fef42623          	sw	a5,-20(s0)
     2f0:	a819                	j	306 <set_gpio_pin_direction+0x4c>
     2f2:	fdc42783          	lw	a5,-36(s0)
     2f6:	4705                	li	a4,1
     2f8:	00f71733          	sll	a4,a4,a5
     2fc:	fec42783          	lw	a5,-20(s0)
     300:	8fd9                	or	a5,a5,a4
     302:	fef42623          	sw	a5,-20(s0)
     306:	1a1017b7          	lui	a5,0x1a101
     30a:	fec42703          	lw	a4,-20(s0)
     30e:	c398                	sw	a4,0(a5)
     310:	0001                	nop
     312:	5432                	lw	s0,44(sp)
     314:	6145                	addi	sp,sp,48
     316:	8082                	ret

00000318 <get_gpio_pin_direction>:
     318:	7179                	addi	sp,sp,-48
     31a:	d622                	sw	s0,44(sp)
     31c:	1800                	addi	s0,sp,48
     31e:	fca42e23          	sw	a0,-36(s0)
     322:	1a1017b7          	lui	a5,0x1a101
     326:	439c                	lw	a5,0(a5)
     328:	fef42623          	sw	a5,-20(s0)
     32c:	fec42703          	lw	a4,-20(s0)
     330:	fdc42783          	lw	a5,-36(s0)
     334:	0786                	slli	a5,a5,0x1
     336:	40f757b3          	sra	a5,a4,a5
     33a:	8b85                	andi	a5,a5,1
     33c:	fef42623          	sw	a5,-20(s0)
     340:	fec42783          	lw	a5,-20(s0)
     344:	853e                	mv	a0,a5
     346:	5432                	lw	s0,44(sp)
     348:	6145                	addi	sp,sp,48
     34a:	8082                	ret

0000034c <set_gpio_pin_value>:
     34c:	7179                	addi	sp,sp,-48
     34e:	d622                	sw	s0,44(sp)
     350:	1800                	addi	s0,sp,48
     352:	fca42e23          	sw	a0,-36(s0)
     356:	fcb42c23          	sw	a1,-40(s0)
     35a:	1a1017b7          	lui	a5,0x1a101
     35e:	07a1                	addi	a5,a5,8
     360:	439c                	lw	a5,0(a5)
     362:	fef42623          	sw	a5,-20(s0)
     366:	fd842783          	lw	a5,-40(s0)
     36a:	ef91                	bnez	a5,386 <set_gpio_pin_value+0x3a>
     36c:	fdc42783          	lw	a5,-36(s0)
     370:	4705                	li	a4,1
     372:	00f717b3          	sll	a5,a4,a5
     376:	fff7c713          	not	a4,a5
     37a:	fec42783          	lw	a5,-20(s0)
     37e:	8ff9                	and	a5,a5,a4
     380:	fef42623          	sw	a5,-20(s0)
     384:	a819                	j	39a <set_gpio_pin_value+0x4e>
     386:	fdc42783          	lw	a5,-36(s0)
     38a:	4705                	li	a4,1
     38c:	00f71733          	sll	a4,a4,a5
     390:	fec42783          	lw	a5,-20(s0)
     394:	8fd9                	or	a5,a5,a4
     396:	fef42623          	sw	a5,-20(s0)
     39a:	1a1017b7          	lui	a5,0x1a101
     39e:	07a1                	addi	a5,a5,8
     3a0:	fec42703          	lw	a4,-20(s0)
     3a4:	c398                	sw	a4,0(a5)
     3a6:	0001                	nop
     3a8:	5432                	lw	s0,44(sp)
     3aa:	6145                	addi	sp,sp,48
     3ac:	8082                	ret

000003ae <get_gpio_pin_value>:
     3ae:	7179                	addi	sp,sp,-48
     3b0:	d622                	sw	s0,44(sp)
     3b2:	1800                	addi	s0,sp,48
     3b4:	fca42e23          	sw	a0,-36(s0)
     3b8:	1a1017b7          	lui	a5,0x1a101
     3bc:	0791                	addi	a5,a5,4
     3be:	439c                	lw	a5,0(a5)
     3c0:	fef42623          	sw	a5,-20(s0)
     3c4:	fec42703          	lw	a4,-20(s0)
     3c8:	fdc42783          	lw	a5,-36(s0)
     3cc:	40f757b3          	sra	a5,a4,a5
     3d0:	8b85                	andi	a5,a5,1
     3d2:	fef42623          	sw	a5,-20(s0)
     3d6:	fec42783          	lw	a5,-20(s0)
     3da:	853e                	mv	a0,a5
     3dc:	5432                	lw	s0,44(sp)
     3de:	6145                	addi	sp,sp,48
     3e0:	8082                	ret

000003e2 <set_gpio_pin_irq_en>:
     3e2:	7179                	addi	sp,sp,-48
     3e4:	d622                	sw	s0,44(sp)
     3e6:	1800                	addi	s0,sp,48
     3e8:	fca42e23          	sw	a0,-36(s0)
     3ec:	fcb42c23          	sw	a1,-40(s0)
     3f0:	1a1017b7          	lui	a5,0x1a101
     3f4:	07b1                	addi	a5,a5,12
     3f6:	439c                	lw	a5,0(a5)
     3f8:	fef42623          	sw	a5,-20(s0)
     3fc:	fd842783          	lw	a5,-40(s0)
     400:	ef91                	bnez	a5,41c <set_gpio_pin_irq_en+0x3a>
     402:	fdc42783          	lw	a5,-36(s0)
     406:	4705                	li	a4,1
     408:	00f717b3          	sll	a5,a4,a5
     40c:	fff7c793          	not	a5,a5
     410:	fec42703          	lw	a4,-20(s0)
     414:	8ff9                	and	a5,a5,a4
     416:	fef42623          	sw	a5,-20(s0)
     41a:	a819                	j	430 <set_gpio_pin_irq_en+0x4e>
     41c:	fdc42783          	lw	a5,-36(s0)
     420:	4705                	li	a4,1
     422:	00f717b3          	sll	a5,a4,a5
     426:	fec42703          	lw	a4,-20(s0)
     42a:	8fd9                	or	a5,a5,a4
     42c:	fef42623          	sw	a5,-20(s0)
     430:	1a1017b7          	lui	a5,0x1a101
     434:	07b1                	addi	a5,a5,12
     436:	fec42703          	lw	a4,-20(s0)
     43a:	c398                	sw	a4,0(a5)
     43c:	0001                	nop
     43e:	5432                	lw	s0,44(sp)
     440:	6145                	addi	sp,sp,48
     442:	8082                	ret

00000444 <set_gpio_pin_irq_type>:
     444:	7179                	addi	sp,sp,-48
     446:	d622                	sw	s0,44(sp)
     448:	1800                	addi	s0,sp,48
     44a:	fca42e23          	sw	a0,-36(s0)
     44e:	fcb42c23          	sw	a1,-40(s0)
     452:	1a1017b7          	lui	a5,0x1a101
     456:	07c1                	addi	a5,a5,16
     458:	439c                	lw	a5,0(a5)
     45a:	fef42623          	sw	a5,-20(s0)
     45e:	1a1017b7          	lui	a5,0x1a101
     462:	07d1                	addi	a5,a5,20
     464:	439c                	lw	a5,0(a5)
     466:	fef42423          	sw	a5,-24(s0)
     46a:	fd842783          	lw	a5,-40(s0)
     46e:	8b85                	andi	a5,a5,1
     470:	ef91                	bnez	a5,48c <set_gpio_pin_irq_type+0x48>
     472:	fdc42783          	lw	a5,-36(s0)
     476:	4705                	li	a4,1
     478:	00f717b3          	sll	a5,a4,a5
     47c:	fff7c793          	not	a5,a5
     480:	fec42703          	lw	a4,-20(s0)
     484:	8ff9                	and	a5,a5,a4
     486:	fef42623          	sw	a5,-20(s0)
     48a:	a819                	j	4a0 <set_gpio_pin_irq_type+0x5c>
     48c:	fdc42783          	lw	a5,-36(s0)
     490:	4705                	li	a4,1
     492:	00f717b3          	sll	a5,a4,a5
     496:	fec42703          	lw	a4,-20(s0)
     49a:	8fd9                	or	a5,a5,a4
     49c:	fef42623          	sw	a5,-20(s0)
     4a0:	fd842783          	lw	a5,-40(s0)
     4a4:	8b89                	andi	a5,a5,2
     4a6:	ef91                	bnez	a5,4c2 <set_gpio_pin_irq_type+0x7e>
     4a8:	fdc42783          	lw	a5,-36(s0)
     4ac:	4705                	li	a4,1
     4ae:	00f717b3          	sll	a5,a4,a5
     4b2:	fff7c793          	not	a5,a5
     4b6:	fe842703          	lw	a4,-24(s0)
     4ba:	8ff9                	and	a5,a5,a4
     4bc:	fef42423          	sw	a5,-24(s0)
     4c0:	a819                	j	4d6 <set_gpio_pin_irq_type+0x92>
     4c2:	fdc42783          	lw	a5,-36(s0)
     4c6:	4705                	li	a4,1
     4c8:	00f717b3          	sll	a5,a4,a5
     4cc:	fe842703          	lw	a4,-24(s0)
     4d0:	8fd9                	or	a5,a5,a4
     4d2:	fef42423          	sw	a5,-24(s0)
     4d6:	1a1017b7          	lui	a5,0x1a101
     4da:	07c1                	addi	a5,a5,16
     4dc:	fec42703          	lw	a4,-20(s0)
     4e0:	c398                	sw	a4,0(a5)
     4e2:	1a1017b7          	lui	a5,0x1a101
     4e6:	07d1                	addi	a5,a5,20
     4e8:	fe842703          	lw	a4,-24(s0)
     4ec:	c398                	sw	a4,0(a5)
     4ee:	0001                	nop
     4f0:	5432                	lw	s0,44(sp)
     4f2:	6145                	addi	sp,sp,48
     4f4:	8082                	ret

000004f6 <get_gpio_irq_status>:
     4f6:	1141                	addi	sp,sp,-16
     4f8:	c622                	sw	s0,12(sp)
     4fa:	0800                	addi	s0,sp,16
     4fc:	1a1017b7          	lui	a5,0x1a101
     500:	07e1                	addi	a5,a5,24
     502:	439c                	lw	a5,0(a5)
     504:	853e                	mv	a0,a5
     506:	4432                	lw	s0,12(sp)
     508:	0141                	addi	sp,sp,16
     50a:	8082                	ret

0000050c <ISR_SRAM>:
     50c:	1141                	addi	sp,sp,-16
     50e:	c622                	sw	s0,12(sp)
     510:	0800                	addi	s0,sp,16
     512:	a001                	j	512 <ISR_SRAM+0x6>

00000514 <ISR_I2C>:
     514:	1141                	addi	sp,sp,-16
     516:	c622                	sw	s0,12(sp)
     518:	0800                	addi	s0,sp,16
     51a:	a001                	j	51a <ISR_I2C+0x6>
     51c:	1141                	addi	sp,sp,-16
     51e:	c622                	sw	s0,12(sp)
     520:	0800                	addi	s0,sp,16
     522:	a001                	j	522 <ISR_I2C+0xe>

00000524 <ISR_GPIO>:
     524:	1141                	addi	sp,sp,-16
     526:	c622                	sw	s0,12(sp)
     528:	0800                	addi	s0,sp,16
     52a:	a001                	j	52a <ISR_GPIO+0x6>

0000052c <ISR_SPIM0>:
     52c:	1141                	addi	sp,sp,-16
     52e:	c622                	sw	s0,12(sp)
     530:	0800                	addi	s0,sp,16
     532:	a001                	j	532 <ISR_SPIM0+0x6>

00000534 <ISR_SPIM1>:
     534:	1141                	addi	sp,sp,-16
     536:	c622                	sw	s0,12(sp)
     538:	0800                	addi	s0,sp,16
     53a:	a001                	j	53a <ISR_SPIM1+0x6>

0000053c <ISR_TA_OVF>:
     53c:	1141                	addi	sp,sp,-16
     53e:	c622                	sw	s0,12(sp)
     540:	0800                	addi	s0,sp,16
     542:	a001                	j	542 <ISR_TA_OVF+0x6>

00000544 <ISR_TA_CMP>:
     544:	1141                	addi	sp,sp,-16
     546:	c622                	sw	s0,12(sp)
     548:	0800                	addi	s0,sp,16
     54a:	a001                	j	54a <ISR_TA_CMP+0x6>

0000054c <ISR_TB_OVF>:
     54c:	1141                	addi	sp,sp,-16
     54e:	c622                	sw	s0,12(sp)
     550:	0800                	addi	s0,sp,16
     552:	a001                	j	552 <ISR_TB_OVF+0x6>

00000554 <ISR_TB_CMP>:
     554:	1141                	addi	sp,sp,-16
     556:	c622                	sw	s0,12(sp)
     558:	0800                	addi	s0,sp,16
     55a:	a001                	j	55a <ISR_TB_CMP+0x6>

0000055c <int_disable>:
     55c:	1101                	addi	sp,sp,-32
     55e:	ce22                	sw	s0,28(sp)
     560:	1000                	addi	s0,sp,32
     562:	300027f3          	csrr	a5,mstatus
     566:	fef42623          	sw	a5,-20(s0)
     56a:	fec42783          	lw	a5,-20(s0)
     56e:	9bdd                	andi	a5,a5,-9
     570:	fef42623          	sw	a5,-20(s0)
     574:	fec42783          	lw	a5,-20(s0)
     578:	30079073          	csrw	mstatus,a5
     57c:	4781                	li	a5,0
     57e:	30079073          	csrw	mstatus,a5
     582:	0001                	nop
     584:	4472                	lw	s0,28(sp)
     586:	6105                	addi	sp,sp,32
     588:	8082                	ret

0000058a <int_enable>:
     58a:	1101                	addi	sp,sp,-32
     58c:	ce22                	sw	s0,28(sp)
     58e:	1000                	addi	s0,sp,32
     590:	300027f3          	csrr	a5,mstatus
     594:	fef42623          	sw	a5,-20(s0)
     598:	fec42783          	lw	a5,-20(s0)
     59c:	0087e793          	ori	a5,a5,8
     5a0:	fef42623          	sw	a5,-20(s0)
     5a4:	fec42783          	lw	a5,-20(s0)
     5a8:	30079073          	csrw	mstatus,a5
     5ac:	0001                	nop
     5ae:	4472                	lw	s0,28(sp)
     5b0:	6105                	addi	sp,sp,32
     5b2:	8082                	ret

000005b4 <ISR_UART>:
     5b4:	1141                	addi	sp,sp,-16
     5b6:	c606                	sw	ra,12(sp)
     5b8:	c422                	sw	s0,8(sp)
     5ba:	0800                	addi	s0,sp,16
     5bc:	1a1007b7          	lui	a5,0x1a100
     5c0:	439c                	lw	a5,0(a5)
     5c2:	85be                	mv	a1,a5
     5c4:	001007b7          	lui	a5,0x100
     5c8:	00078513          	mv	a0,a5
     5cc:	25ed                	jal	cb6 <printf>
     5ce:	1a1047b7          	lui	a5,0x1a104
     5d2:	07b1                	addi	a5,a5,12
     5d4:	4394                	lw	a3,0(a5)
     5d6:	1a1047b7          	lui	a5,0x1a104
     5da:	07b1                	addi	a5,a5,12
     5dc:	01000737          	lui	a4,0x1000
     5e0:	8f55                	or	a4,a4,a3
     5e2:	c398                	sw	a4,0(a5)
     5e4:	0001                	nop
     5e6:	40b2                	lw	ra,12(sp)
     5e8:	4422                	lw	s0,8(sp)
     5ea:	0141                	addi	sp,sp,16
     5ec:	8082                	ret

000005ee <main>:
     5ee:	1101                	addi	sp,sp,-32
     5f0:	ce06                	sw	ra,28(sp)
     5f2:	cc22                	sw	s0,24(sp)
     5f4:	1000                	addi	s0,sp,32
     5f6:	fe042623          	sw	zero,-20(s0)
     5fa:	a831                	j	616 <main+0x28>
     5fc:	4585                	li	a1,1
     5fe:	fec42503          	lw	a0,-20(s0)
     602:	3965                	jal	2ba <set_gpio_pin_direction>
     604:	4581                	li	a1,0
     606:	fec42503          	lw	a0,-20(s0)
     60a:	3389                	jal	34c <set_gpio_pin_value>
     60c:	fec42783          	lw	a5,-20(s0)
     610:	0785                	addi	a5,a5,1
     612:	fef42623          	sw	a5,-20(s0)
     616:	fec42703          	lw	a4,-20(s0)
     61a:	479d                	li	a5,7
     61c:	fee7d0e3          	bge	a5,a4,5fc <main+0xe>
     620:	3f35                	jal	55c <int_disable>
     622:	45b1                	li	a1,12
     624:	4501                	li	a0,0
     626:	44f000ef          	jal	ra,1274 <uart_set_cfg>
     62a:	4505                	li	a0,1
     62c:	5c1000ef          	jal	ra,13ec <uart_set_interrupt>
     630:	1a1047b7          	lui	a5,0x1a104
     634:	4394                	lw	a3,0(a5)
     636:	1a1047b7          	lui	a5,0x1a104
     63a:	01000737          	lui	a4,0x1000
     63e:	8f55                	or	a4,a4,a3
     640:	c398                	sw	a4,0(a5)
     642:	37a1                	jal	58a <int_enable>
     644:	fe042423          	sw	zero,-24(s0)
     648:	fe842783          	lw	a5,-24(s0)
     64c:	17fd                	addi	a5,a5,-1
     64e:	8b9d                	andi	a5,a5,7
     650:	4585                	li	a1,1
     652:	853e                	mv	a0,a5
     654:	39e5                	jal	34c <set_gpio_pin_value>
     656:	fe842783          	lw	a5,-24(s0)
     65a:	8b9d                	andi	a5,a5,7
     65c:	4581                	li	a1,0
     65e:	853e                	mv	a0,a5
     660:	31f5                	jal	34c <set_gpio_pin_value>
     662:	fe042223          	sw	zero,-28(s0)
     666:	a031                	j	672 <main+0x84>
     668:	fe442783          	lw	a5,-28(s0)
     66c:	0785                	addi	a5,a5,1
     66e:	fef42223          	sw	a5,-28(s0)
     672:	fe442703          	lw	a4,-28(s0)
     676:	67e1                	lui	a5,0x18
     678:	69f78793          	addi	a5,a5,1695 # 1869f <__DTOR_END__+0x170c3>
     67c:	fee7d6e3          	bge	a5,a4,668 <main+0x7a>
     680:	fe842783          	lw	a5,-24(s0)
     684:	0785                	addi	a5,a5,1
     686:	fef42423          	sw	a5,-24(s0)
     68a:	bf7d                	j	648 <main+0x5a>

0000068c <divu10>:
     68c:	7179                	addi	sp,sp,-48
     68e:	d622                	sw	s0,44(sp)
     690:	1800                	addi	s0,sp,48
     692:	fca42e23          	sw	a0,-36(s0)
     696:	fdc42783          	lw	a5,-36(s0)
     69a:	0017d713          	srli	a4,a5,0x1
     69e:	fdc42783          	lw	a5,-36(s0)
     6a2:	8389                	srli	a5,a5,0x2
     6a4:	97ba                	add	a5,a5,a4
     6a6:	fef42623          	sw	a5,-20(s0)
     6aa:	fec42783          	lw	a5,-20(s0)
     6ae:	8391                	srli	a5,a5,0x4
     6b0:	fec42703          	lw	a4,-20(s0)
     6b4:	97ba                	add	a5,a5,a4
     6b6:	fef42623          	sw	a5,-20(s0)
     6ba:	fec42783          	lw	a5,-20(s0)
     6be:	83a1                	srli	a5,a5,0x8
     6c0:	fec42703          	lw	a4,-20(s0)
     6c4:	97ba                	add	a5,a5,a4
     6c6:	fef42623          	sw	a5,-20(s0)
     6ca:	fec42783          	lw	a5,-20(s0)
     6ce:	83c1                	srli	a5,a5,0x10
     6d0:	fec42703          	lw	a4,-20(s0)
     6d4:	97ba                	add	a5,a5,a4
     6d6:	fef42623          	sw	a5,-20(s0)
     6da:	fec42783          	lw	a5,-20(s0)
     6de:	838d                	srli	a5,a5,0x3
     6e0:	fef42623          	sw	a5,-20(s0)
     6e4:	fec42703          	lw	a4,-20(s0)
     6e8:	87ba                	mv	a5,a4
     6ea:	078a                	slli	a5,a5,0x2
     6ec:	97ba                	add	a5,a5,a4
     6ee:	0786                	slli	a5,a5,0x1
     6f0:	873e                	mv	a4,a5
     6f2:	fdc42783          	lw	a5,-36(s0)
     6f6:	8f99                	sub	a5,a5,a4
     6f8:	fef42423          	sw	a5,-24(s0)
     6fc:	fe842783          	lw	a5,-24(s0)
     700:	0799                	addi	a5,a5,6
     702:	0047d713          	srli	a4,a5,0x4
     706:	fec42783          	lw	a5,-20(s0)
     70a:	97ba                	add	a5,a5,a4
     70c:	853e                	mv	a0,a5
     70e:	5432                	lw	s0,44(sp)
     710:	6145                	addi	sp,sp,48
     712:	8082                	ret

00000714 <remu10>:
     714:	1101                	addi	sp,sp,-32
     716:	ce22                	sw	s0,28(sp)
     718:	1000                	addi	s0,sp,32
     71a:	fea42623          	sw	a0,-20(s0)
     71e:	fec42703          	lw	a4,-20(s0)
     722:	1999a7b7          	lui	a5,0x1999a
     726:	99978793          	addi	a5,a5,-1639 # 19999999 <_stack+0x19895999>
     72a:	02f70733          	mul	a4,a4,a5
     72e:	fec42783          	lw	a5,-20(s0)
     732:	8385                	srli	a5,a5,0x1
     734:	973e                	add	a4,a4,a5
     736:	fec42783          	lw	a5,-20(s0)
     73a:	838d                	srli	a5,a5,0x3
     73c:	97ba                	add	a5,a5,a4
     73e:	83f1                	srli	a5,a5,0x1c
     740:	fef42623          	sw	a5,-20(s0)
     744:	001007b7          	lui	a5,0x100
     748:	0b078713          	addi	a4,a5,176 # 1000b0 <remu10_table>
     74c:	fec42783          	lw	a5,-20(s0)
     750:	97ba                	add	a5,a5,a4
     752:	0007c783          	lbu	a5,0(a5)
     756:	853e                	mv	a0,a5
     758:	4472                	lw	s0,28(sp)
     75a:	6105                	addi	sp,sp,32
     75c:	8082                	ret

0000075e <putchar>:
     75e:	1101                	addi	sp,sp,-32
     760:	ce06                	sw	ra,28(sp)
     762:	cc22                	sw	s0,24(sp)
     764:	1000                	addi	s0,sp,32
     766:	fea42623          	sw	a0,-20(s0)
     76a:	fec42783          	lw	a5,-20(s0)
     76e:	0ff7f793          	andi	a5,a5,255
     772:	853e                	mv	a0,a5
     774:	42b000ef          	jal	ra,139e <uart_sendchar>
     778:	fec42783          	lw	a5,-20(s0)
     77c:	853e                	mv	a0,a5
     77e:	40f2                	lw	ra,28(sp)
     780:	4462                	lw	s0,24(sp)
     782:	6105                	addi	sp,sp,32
     784:	8082                	ret

00000786 <qprintchar>:
     786:	1101                	addi	sp,sp,-32
     788:	ce06                	sw	ra,28(sp)
     78a:	cc22                	sw	s0,24(sp)
     78c:	1000                	addi	s0,sp,32
     78e:	fea42623          	sw	a0,-20(s0)
     792:	feb42423          	sw	a1,-24(s0)
     796:	fec42783          	lw	a5,-20(s0)
     79a:	c39d                	beqz	a5,7c0 <qprintchar+0x3a>
     79c:	fec42783          	lw	a5,-20(s0)
     7a0:	439c                	lw	a5,0(a5)
     7a2:	fe842703          	lw	a4,-24(s0)
     7a6:	0ff77713          	andi	a4,a4,255
     7aa:	00e78023          	sb	a4,0(a5)
     7ae:	fec42783          	lw	a5,-20(s0)
     7b2:	439c                	lw	a5,0(a5)
     7b4:	00178713          	addi	a4,a5,1
     7b8:	fec42783          	lw	a5,-20(s0)
     7bc:	c398                	sw	a4,0(a5)
     7be:	a039                	j	7cc <qprintchar+0x46>
     7c0:	fe842783          	lw	a5,-24(s0)
     7c4:	0ff7f793          	andi	a5,a5,255
     7c8:	853e                	mv	a0,a5
     7ca:	3f51                	jal	75e <putchar>
     7cc:	0001                	nop
     7ce:	40f2                	lw	ra,28(sp)
     7d0:	4462                	lw	s0,24(sp)
     7d2:	6105                	addi	sp,sp,32
     7d4:	8082                	ret

000007d6 <qprints>:
     7d6:	7179                	addi	sp,sp,-48
     7d8:	d606                	sw	ra,44(sp)
     7da:	d422                	sw	s0,40(sp)
     7dc:	d226                	sw	s1,36(sp)
     7de:	d04a                	sw	s2,32(sp)
     7e0:	ce4e                	sw	s3,28(sp)
     7e2:	cc52                	sw	s4,24(sp)
     7e4:	1800                	addi	s0,sp,48
     7e6:	fca42e23          	sw	a0,-36(s0)
     7ea:	fcb42c23          	sw	a1,-40(s0)
     7ee:	fcc42a23          	sw	a2,-44(s0)
     7f2:	fcd42823          	sw	a3,-48(s0)
     7f6:	4481                	li	s1,0
     7f8:	02000a13          	li	s4,32
     7fc:	fd442783          	lw	a5,-44(s0)
     800:	02f05e63          	blez	a5,83c <qprints+0x66>
     804:	4901                	li	s2,0
     806:	fd842983          	lw	s3,-40(s0)
     80a:	a019                	j	810 <qprints+0x3a>
     80c:	0905                	addi	s2,s2,1
     80e:	0985                	addi	s3,s3,1
     810:	0009c783          	lbu	a5,0(s3)
     814:	ffe5                	bnez	a5,80c <qprints+0x36>
     816:	fd442783          	lw	a5,-44(s0)
     81a:	00f94563          	blt	s2,a5,824 <qprints+0x4e>
     81e:	fc042a23          	sw	zero,-44(s0)
     822:	a039                	j	830 <qprints+0x5a>
     824:	fd442783          	lw	a5,-44(s0)
     828:	412787b3          	sub	a5,a5,s2
     82c:	fcf42a23          	sw	a5,-44(s0)
     830:	fd042783          	lw	a5,-48(s0)
     834:	8b89                	andi	a5,a5,2
     836:	c399                	beqz	a5,83c <qprints+0x66>
     838:	03000a13          	li	s4,48
     83c:	fd042783          	lw	a5,-48(s0)
     840:	8b85                	andi	a5,a5,1
     842:	ef9d                	bnez	a5,880 <qprints+0xaa>
     844:	a819                	j	85a <qprints+0x84>
     846:	85d2                	mv	a1,s4
     848:	fdc42503          	lw	a0,-36(s0)
     84c:	3f2d                	jal	786 <qprintchar>
     84e:	0485                	addi	s1,s1,1
     850:	fd442783          	lw	a5,-44(s0)
     854:	17fd                	addi	a5,a5,-1
     856:	fcf42a23          	sw	a5,-44(s0)
     85a:	fd442783          	lw	a5,-44(s0)
     85e:	fef044e3          	bgtz	a5,846 <qprints+0x70>
     862:	a839                	j	880 <qprints+0xaa>
     864:	fd842783          	lw	a5,-40(s0)
     868:	0007c783          	lbu	a5,0(a5)
     86c:	85be                	mv	a1,a5
     86e:	fdc42503          	lw	a0,-36(s0)
     872:	3f11                	jal	786 <qprintchar>
     874:	0485                	addi	s1,s1,1
     876:	fd842783          	lw	a5,-40(s0)
     87a:	0785                	addi	a5,a5,1
     87c:	fcf42c23          	sw	a5,-40(s0)
     880:	fd842783          	lw	a5,-40(s0)
     884:	0007c783          	lbu	a5,0(a5)
     888:	fff1                	bnez	a5,864 <qprints+0x8e>
     88a:	a819                	j	8a0 <qprints+0xca>
     88c:	85d2                	mv	a1,s4
     88e:	fdc42503          	lw	a0,-36(s0)
     892:	3dd5                	jal	786 <qprintchar>
     894:	0485                	addi	s1,s1,1
     896:	fd442783          	lw	a5,-44(s0)
     89a:	17fd                	addi	a5,a5,-1
     89c:	fcf42a23          	sw	a5,-44(s0)
     8a0:	fd442783          	lw	a5,-44(s0)
     8a4:	fef044e3          	bgtz	a5,88c <qprints+0xb6>
     8a8:	87a6                	mv	a5,s1
     8aa:	853e                	mv	a0,a5
     8ac:	50b2                	lw	ra,44(sp)
     8ae:	5422                	lw	s0,40(sp)
     8b0:	5492                	lw	s1,36(sp)
     8b2:	5902                	lw	s2,32(sp)
     8b4:	49f2                	lw	s3,28(sp)
     8b6:	4a62                	lw	s4,24(sp)
     8b8:	6145                	addi	sp,sp,48
     8ba:	8082                	ret

000008bc <qprinti>:
     8bc:	7159                	addi	sp,sp,-112
     8be:	d686                	sw	ra,108(sp)
     8c0:	d4a2                	sw	s0,104(sp)
     8c2:	d2a6                	sw	s1,100(sp)
     8c4:	d0ca                	sw	s2,96(sp)
     8c6:	cece                	sw	s3,92(sp)
     8c8:	1880                	addi	s0,sp,112
     8ca:	faa42623          	sw	a0,-84(s0)
     8ce:	fab42423          	sw	a1,-88(s0)
     8d2:	fac42223          	sw	a2,-92(s0)
     8d6:	fad42023          	sw	a3,-96(s0)
     8da:	f8e42e23          	sw	a4,-100(s0)
     8de:	f8f42c23          	sw	a5,-104(s0)
     8e2:	87c2                	mv	a5,a6
     8e4:	f8f40ba3          	sb	a5,-105(s0)
     8e8:	4981                	li	s3,0
     8ea:	4901                	li	s2,0
     8ec:	fa842783          	lw	a5,-88(s0)
     8f0:	fcf42e23          	sw	a5,-36(s0)
     8f4:	fa842783          	lw	a5,-88(s0)
     8f8:	e39d                	bnez	a5,91e <qprinti+0x62>
     8fa:	03000793          	li	a5,48
     8fe:	faf40c23          	sb	a5,-72(s0)
     902:	fa040ca3          	sb	zero,-71(s0)
     906:	fb840793          	addi	a5,s0,-72
     90a:	f9842683          	lw	a3,-104(s0)
     90e:	f9c42603          	lw	a2,-100(s0)
     912:	85be                	mv	a1,a5
     914:	fac42503          	lw	a0,-84(s0)
     918:	3d7d                	jal	7d6 <qprints>
     91a:	87aa                	mv	a5,a0
     91c:	a8fd                	j	a1a <qprinti+0x15e>
     91e:	fa042783          	lw	a5,-96(s0)
     922:	c38d                	beqz	a5,944 <qprinti+0x88>
     924:	fa442703          	lw	a4,-92(s0)
     928:	47a9                	li	a5,10
     92a:	00f71d63          	bne	a4,a5,944 <qprinti+0x88>
     92e:	fa842783          	lw	a5,-88(s0)
     932:	0007d963          	bgez	a5,944 <qprinti+0x88>
     936:	4985                	li	s3,1
     938:	fa842783          	lw	a5,-88(s0)
     93c:	40f007b3          	neg	a5,a5
     940:	fcf42e23          	sw	a5,-36(s0)
     944:	fb840493          	addi	s1,s0,-72
     948:	04fd                	addi	s1,s1,31
     94a:	00048023          	sb	zero,0(s1)
     94e:	fa442703          	lw	a4,-92(s0)
     952:	47c1                	li	a5,16
     954:	06f71c63          	bne	a4,a5,9cc <qprinti+0x110>
     958:	a0a1                	j	9a0 <qprinti+0xe4>
     95a:	fdc42783          	lw	a5,-36(s0)
     95e:	8bbd                	andi	a5,a5,15
     960:	fcf42c23          	sw	a5,-40(s0)
     964:	fd842703          	lw	a4,-40(s0)
     968:	47a5                	li	a5,9
     96a:	00e7db63          	bge	a5,a4,980 <qprinti+0xc4>
     96e:	f9744783          	lbu	a5,-105(s0)
     972:	fc678793          	addi	a5,a5,-58
     976:	fd842703          	lw	a4,-40(s0)
     97a:	97ba                	add	a5,a5,a4
     97c:	fcf42c23          	sw	a5,-40(s0)
     980:	fd842783          	lw	a5,-40(s0)
     984:	0ff7f793          	andi	a5,a5,255
     988:	14fd                	addi	s1,s1,-1
     98a:	03078793          	addi	a5,a5,48
     98e:	0ff7f793          	andi	a5,a5,255
     992:	00f48023          	sb	a5,0(s1)
     996:	fdc42783          	lw	a5,-36(s0)
     99a:	8391                	srli	a5,a5,0x4
     99c:	fcf42e23          	sw	a5,-36(s0)
     9a0:	fdc42783          	lw	a5,-36(s0)
     9a4:	fbdd                	bnez	a5,95a <qprinti+0x9e>
     9a6:	a035                	j	9d2 <qprinti+0x116>
     9a8:	fdc42503          	lw	a0,-36(s0)
     9ac:	33a5                	jal	714 <remu10>
     9ae:	87aa                	mv	a5,a0
     9b0:	0ff7f793          	andi	a5,a5,255
     9b4:	14fd                	addi	s1,s1,-1
     9b6:	03078793          	addi	a5,a5,48
     9ba:	0ff7f793          	andi	a5,a5,255
     9be:	00f48023          	sb	a5,0(s1)
     9c2:	fdc42503          	lw	a0,-36(s0)
     9c6:	31d9                	jal	68c <divu10>
     9c8:	fca42e23          	sw	a0,-36(s0)
     9cc:	fdc42783          	lw	a5,-36(s0)
     9d0:	ffe1                	bnez	a5,9a8 <qprinti+0xec>
     9d2:	02098a63          	beqz	s3,a06 <qprinti+0x14a>
     9d6:	f9c42783          	lw	a5,-100(s0)
     9da:	c38d                	beqz	a5,9fc <qprinti+0x140>
     9dc:	f9842783          	lw	a5,-104(s0)
     9e0:	8b89                	andi	a5,a5,2
     9e2:	cf89                	beqz	a5,9fc <qprinti+0x140>
     9e4:	02d00593          	li	a1,45
     9e8:	fac42503          	lw	a0,-84(s0)
     9ec:	3b69                	jal	786 <qprintchar>
     9ee:	0905                	addi	s2,s2,1
     9f0:	f9c42783          	lw	a5,-100(s0)
     9f4:	17fd                	addi	a5,a5,-1
     9f6:	f8f42e23          	sw	a5,-100(s0)
     9fa:	a031                	j	a06 <qprinti+0x14a>
     9fc:	14fd                	addi	s1,s1,-1
     9fe:	02d00793          	li	a5,45
     a02:	00f48023          	sb	a5,0(s1)
     a06:	f9842683          	lw	a3,-104(s0)
     a0a:	f9c42603          	lw	a2,-100(s0)
     a0e:	85a6                	mv	a1,s1
     a10:	fac42503          	lw	a0,-84(s0)
     a14:	33c9                	jal	7d6 <qprints>
     a16:	87aa                	mv	a5,a0
     a18:	97ca                	add	a5,a5,s2
     a1a:	853e                	mv	a0,a5
     a1c:	50b6                	lw	ra,108(sp)
     a1e:	5426                	lw	s0,104(sp)
     a20:	5496                	lw	s1,100(sp)
     a22:	5906                	lw	s2,96(sp)
     a24:	49f6                	lw	s3,92(sp)
     a26:	6165                	addi	sp,sp,112
     a28:	8082                	ret

00000a2a <qprint>:
     a2a:	7139                	addi	sp,sp,-64
     a2c:	de06                	sw	ra,60(sp)
     a2e:	dc22                	sw	s0,56(sp)
     a30:	da26                	sw	s1,52(sp)
     a32:	d84a                	sw	s2,48(sp)
     a34:	d64e                	sw	s3,44(sp)
     a36:	0080                	addi	s0,sp,64
     a38:	fca42623          	sw	a0,-52(s0)
     a3c:	fcb42423          	sw	a1,-56(s0)
     a40:	fcc42223          	sw	a2,-60(s0)
     a44:	4481                	li	s1,0
     a46:	ac3d                	j	c84 <qprint+0x25a>
     a48:	fc842783          	lw	a5,-56(s0)
     a4c:	0007c703          	lbu	a4,0(a5)
     a50:	02500793          	li	a5,37
     a54:	20f71763          	bne	a4,a5,c62 <qprint+0x238>
     a58:	fc842783          	lw	a5,-56(s0)
     a5c:	0785                	addi	a5,a5,1
     a5e:	fcf42423          	sw	a5,-56(s0)
     a62:	4981                	li	s3,0
     a64:	894e                	mv	s2,s3
     a66:	fc842783          	lw	a5,-56(s0)
     a6a:	0007c783          	lbu	a5,0(a5)
     a6e:	22078263          	beqz	a5,c92 <qprint+0x268>
     a72:	fc842783          	lw	a5,-56(s0)
     a76:	0007c703          	lbu	a4,0(a5)
     a7a:	02500793          	li	a5,37
     a7e:	1ef70463          	beq	a4,a5,c66 <qprint+0x23c>
     a82:	fc842783          	lw	a5,-56(s0)
     a86:	0007c703          	lbu	a4,0(a5)
     a8a:	02d00793          	li	a5,45
     a8e:	02f71063          	bne	a4,a5,aae <qprint+0x84>
     a92:	fc842783          	lw	a5,-56(s0)
     a96:	0785                	addi	a5,a5,1
     a98:	fcf42423          	sw	a5,-56(s0)
     a9c:	4985                	li	s3,1
     a9e:	a801                	j	aae <qprint+0x84>
     aa0:	fc842783          	lw	a5,-56(s0)
     aa4:	0785                	addi	a5,a5,1
     aa6:	fcf42423          	sw	a5,-56(s0)
     aaa:	0029e993          	ori	s3,s3,2
     aae:	fc842783          	lw	a5,-56(s0)
     ab2:	0007c703          	lbu	a4,0(a5)
     ab6:	03000793          	li	a5,48
     aba:	fef703e3          	beq	a4,a5,aa0 <qprint+0x76>
     abe:	a015                	j	ae2 <qprint+0xb8>
     ac0:	87ca                	mv	a5,s2
     ac2:	078a                	slli	a5,a5,0x2
     ac4:	97ca                	add	a5,a5,s2
     ac6:	0786                	slli	a5,a5,0x1
     ac8:	893e                	mv	s2,a5
     aca:	fc842783          	lw	a5,-56(s0)
     ace:	0007c783          	lbu	a5,0(a5)
     ad2:	fd078793          	addi	a5,a5,-48
     ad6:	993e                	add	s2,s2,a5
     ad8:	fc842783          	lw	a5,-56(s0)
     adc:	0785                	addi	a5,a5,1
     ade:	fcf42423          	sw	a5,-56(s0)
     ae2:	fc842783          	lw	a5,-56(s0)
     ae6:	0007c703          	lbu	a4,0(a5)
     aea:	02f00793          	li	a5,47
     aee:	00e7fa63          	bgeu	a5,a4,b02 <qprint+0xd8>
     af2:	fc842783          	lw	a5,-56(s0)
     af6:	0007c703          	lbu	a4,0(a5)
     afa:	03900793          	li	a5,57
     afe:	fce7f1e3          	bgeu	a5,a4,ac0 <qprint+0x96>
     b02:	fc842783          	lw	a5,-56(s0)
     b06:	0007c703          	lbu	a4,0(a5)
     b0a:	07300793          	li	a5,115
     b0e:	02f71b63          	bne	a4,a5,b44 <qprint+0x11a>
     b12:	fc442783          	lw	a5,-60(s0)
     b16:	00478713          	addi	a4,a5,4
     b1a:	fce42223          	sw	a4,-60(s0)
     b1e:	0007a083          	lw	ra,0(a5)
     b22:	00008463          	beqz	ra,b2a <qprint+0x100>
     b26:	8786                	mv	a5,ra
     b28:	a029                	j	b32 <qprint+0x108>
     b2a:	001007b7          	lui	a5,0x100
     b2e:	02878793          	addi	a5,a5,40 # 100028 <__DTOR_END__+0xfea4c>
     b32:	86ce                	mv	a3,s3
     b34:	864a                	mv	a2,s2
     b36:	85be                	mv	a1,a5
     b38:	fcc42503          	lw	a0,-52(s0)
     b3c:	3969                	jal	7d6 <qprints>
     b3e:	87aa                	mv	a5,a0
     b40:	94be                	add	s1,s1,a5
     b42:	aa25                	j	c7a <qprint+0x250>
     b44:	fc842783          	lw	a5,-56(s0)
     b48:	0007c703          	lbu	a4,0(a5)
     b4c:	06400793          	li	a5,100
     b50:	02f71563          	bne	a4,a5,b7a <qprint+0x150>
     b54:	fc442783          	lw	a5,-60(s0)
     b58:	00478713          	addi	a4,a5,4
     b5c:	fce42223          	sw	a4,-60(s0)
     b60:	438c                	lw	a1,0(a5)
     b62:	06100813          	li	a6,97
     b66:	87ce                	mv	a5,s3
     b68:	874a                	mv	a4,s2
     b6a:	4685                	li	a3,1
     b6c:	4629                	li	a2,10
     b6e:	fcc42503          	lw	a0,-52(s0)
     b72:	33a9                	jal	8bc <qprinti>
     b74:	87aa                	mv	a5,a0
     b76:	94be                	add	s1,s1,a5
     b78:	a209                	j	c7a <qprint+0x250>
     b7a:	fc842783          	lw	a5,-56(s0)
     b7e:	0007c703          	lbu	a4,0(a5)
     b82:	07500793          	li	a5,117
     b86:	02f71663          	bne	a4,a5,bb2 <qprint+0x188>
     b8a:	fc442783          	lw	a5,-60(s0)
     b8e:	00478713          	addi	a4,a5,4
     b92:	fce42223          	sw	a4,-60(s0)
     b96:	439c                	lw	a5,0(a5)
     b98:	85be                	mv	a1,a5
     b9a:	06100813          	li	a6,97
     b9e:	87ce                	mv	a5,s3
     ba0:	874a                	mv	a4,s2
     ba2:	4681                	li	a3,0
     ba4:	4629                	li	a2,10
     ba6:	fcc42503          	lw	a0,-52(s0)
     baa:	3b09                	jal	8bc <qprinti>
     bac:	87aa                	mv	a5,a0
     bae:	94be                	add	s1,s1,a5
     bb0:	a0e9                	j	c7a <qprint+0x250>
     bb2:	fc842783          	lw	a5,-56(s0)
     bb6:	0007c703          	lbu	a4,0(a5)
     bba:	07800793          	li	a5,120
     bbe:	02f71663          	bne	a4,a5,bea <qprint+0x1c0>
     bc2:	fc442783          	lw	a5,-60(s0)
     bc6:	00478713          	addi	a4,a5,4
     bca:	fce42223          	sw	a4,-60(s0)
     bce:	439c                	lw	a5,0(a5)
     bd0:	85be                	mv	a1,a5
     bd2:	06100813          	li	a6,97
     bd6:	87ce                	mv	a5,s3
     bd8:	874a                	mv	a4,s2
     bda:	4681                	li	a3,0
     bdc:	4641                	li	a2,16
     bde:	fcc42503          	lw	a0,-52(s0)
     be2:	39e9                	jal	8bc <qprinti>
     be4:	87aa                	mv	a5,a0
     be6:	94be                	add	s1,s1,a5
     be8:	a849                	j	c7a <qprint+0x250>
     bea:	fc842783          	lw	a5,-56(s0)
     bee:	0007c703          	lbu	a4,0(a5)
     bf2:	05800793          	li	a5,88
     bf6:	02f71663          	bne	a4,a5,c22 <qprint+0x1f8>
     bfa:	fc442783          	lw	a5,-60(s0)
     bfe:	00478713          	addi	a4,a5,4
     c02:	fce42223          	sw	a4,-60(s0)
     c06:	439c                	lw	a5,0(a5)
     c08:	85be                	mv	a1,a5
     c0a:	04100813          	li	a6,65
     c0e:	87ce                	mv	a5,s3
     c10:	874a                	mv	a4,s2
     c12:	4681                	li	a3,0
     c14:	4641                	li	a2,16
     c16:	fcc42503          	lw	a0,-52(s0)
     c1a:	314d                	jal	8bc <qprinti>
     c1c:	87aa                	mv	a5,a0
     c1e:	94be                	add	s1,s1,a5
     c20:	a8a9                	j	c7a <qprint+0x250>
     c22:	fc842783          	lw	a5,-56(s0)
     c26:	0007c703          	lbu	a4,0(a5)
     c2a:	06300793          	li	a5,99
     c2e:	04f71663          	bne	a4,a5,c7a <qprint+0x250>
     c32:	fc442783          	lw	a5,-60(s0)
     c36:	00478713          	addi	a4,a5,4
     c3a:	fce42223          	sw	a4,-60(s0)
     c3e:	439c                	lw	a5,0(a5)
     c40:	0ff7f793          	andi	a5,a5,255
     c44:	fcf40e23          	sb	a5,-36(s0)
     c48:	fc040ea3          	sb	zero,-35(s0)
     c4c:	fdc40793          	addi	a5,s0,-36
     c50:	86ce                	mv	a3,s3
     c52:	864a                	mv	a2,s2
     c54:	85be                	mv	a1,a5
     c56:	fcc42503          	lw	a0,-52(s0)
     c5a:	3eb5                	jal	7d6 <qprints>
     c5c:	87aa                	mv	a5,a0
     c5e:	94be                	add	s1,s1,a5
     c60:	a829                	j	c7a <qprint+0x250>
     c62:	0001                	nop
     c64:	a011                	j	c68 <qprint+0x23e>
     c66:	0001                	nop
     c68:	fc842783          	lw	a5,-56(s0)
     c6c:	0007c783          	lbu	a5,0(a5)
     c70:	85be                	mv	a1,a5
     c72:	fcc42503          	lw	a0,-52(s0)
     c76:	3e01                	jal	786 <qprintchar>
     c78:	0485                	addi	s1,s1,1
     c7a:	fc842783          	lw	a5,-56(s0)
     c7e:	0785                	addi	a5,a5,1
     c80:	fcf42423          	sw	a5,-56(s0)
     c84:	fc842783          	lw	a5,-56(s0)
     c88:	0007c783          	lbu	a5,0(a5)
     c8c:	da079ee3          	bnez	a5,a48 <qprint+0x1e>
     c90:	a011                	j	c94 <qprint+0x26a>
     c92:	0001                	nop
     c94:	fcc42783          	lw	a5,-52(s0)
     c98:	c791                	beqz	a5,ca4 <qprint+0x27a>
     c9a:	fcc42783          	lw	a5,-52(s0)
     c9e:	439c                	lw	a5,0(a5)
     ca0:	00078023          	sb	zero,0(a5)
     ca4:	87a6                	mv	a5,s1
     ca6:	853e                	mv	a0,a5
     ca8:	50f2                	lw	ra,60(sp)
     caa:	5462                	lw	s0,56(sp)
     cac:	54d2                	lw	s1,52(sp)
     cae:	5942                	lw	s2,48(sp)
     cb0:	59b2                	lw	s3,44(sp)
     cb2:	6121                	addi	sp,sp,64
     cb4:	8082                	ret

00000cb6 <printf>:
     cb6:	715d                	addi	sp,sp,-80
     cb8:	d606                	sw	ra,44(sp)
     cba:	d422                	sw	s0,40(sp)
     cbc:	1800                	addi	s0,sp,48
     cbe:	fca42e23          	sw	a0,-36(s0)
     cc2:	c04c                	sw	a1,4(s0)
     cc4:	c410                	sw	a2,8(s0)
     cc6:	c454                	sw	a3,12(s0)
     cc8:	c818                	sw	a4,16(s0)
     cca:	c85c                	sw	a5,20(s0)
     ccc:	01042c23          	sw	a6,24(s0)
     cd0:	01142e23          	sw	a7,28(s0)
     cd4:	02040793          	addi	a5,s0,32
     cd8:	fcf42c23          	sw	a5,-40(s0)
     cdc:	fd842783          	lw	a5,-40(s0)
     ce0:	1791                	addi	a5,a5,-28
     ce2:	fef42423          	sw	a5,-24(s0)
     ce6:	fe842783          	lw	a5,-24(s0)
     cea:	863e                	mv	a2,a5
     cec:	fdc42583          	lw	a1,-36(s0)
     cf0:	4501                	li	a0,0
     cf2:	3b25                	jal	a2a <qprint>
     cf4:	fea42623          	sw	a0,-20(s0)
     cf8:	fec42783          	lw	a5,-20(s0)
     cfc:	853e                	mv	a0,a5
     cfe:	50b2                	lw	ra,44(sp)
     d00:	5422                	lw	s0,40(sp)
     d02:	6161                	addi	sp,sp,80
     d04:	8082                	ret

00000d06 <puts>:
     d06:	7179                	addi	sp,sp,-48
     d08:	d606                	sw	ra,44(sp)
     d0a:	d422                	sw	s0,40(sp)
     d0c:	1800                	addi	s0,sp,48
     d0e:	fca42e23          	sw	a0,-36(s0)
     d12:	fe042623          	sw	zero,-20(s0)
     d16:	a839                	j	d34 <puts+0x2e>
     d18:	fec42783          	lw	a5,-20(s0)
     d1c:	00178713          	addi	a4,a5,1
     d20:	fee42623          	sw	a4,-20(s0)
     d24:	873e                	mv	a4,a5
     d26:	fdc42783          	lw	a5,-36(s0)
     d2a:	97ba                	add	a5,a5,a4
     d2c:	0007c783          	lbu	a5,0(a5)
     d30:	853e                	mv	a0,a5
     d32:	3435                	jal	75e <putchar>
     d34:	fec42783          	lw	a5,-20(s0)
     d38:	fdc42703          	lw	a4,-36(s0)
     d3c:	97ba                	add	a5,a5,a4
     d3e:	0007c783          	lbu	a5,0(a5)
     d42:	fbf9                	bnez	a5,d18 <puts+0x12>
     d44:	4529                	li	a0,10
     d46:	3c21                	jal	75e <putchar>
     d48:	fec42783          	lw	a5,-20(s0)
     d4c:	853e                	mv	a0,a5
     d4e:	50b2                	lw	ra,44(sp)
     d50:	5422                	lw	s0,40(sp)
     d52:	6145                	addi	sp,sp,48
     d54:	8082                	ret

00000d56 <strcmp>:
     d56:	7179                	addi	sp,sp,-48
     d58:	d622                	sw	s0,44(sp)
     d5a:	1800                	addi	s0,sp,48
     d5c:	fca42e23          	sw	a0,-36(s0)
     d60:	fcb42c23          	sw	a1,-40(s0)
     d64:	fdc42703          	lw	a4,-36(s0)
     d68:	fd842783          	lw	a5,-40(s0)
     d6c:	8fd9                	or	a5,a5,a4
     d6e:	8b8d                	andi	a5,a5,3
     d70:	e7c9                	bnez	a5,dfa <strcmp+0xa4>
     d72:	fdc42783          	lw	a5,-36(s0)
     d76:	fef42623          	sw	a5,-20(s0)
     d7a:	fd842783          	lw	a5,-40(s0)
     d7e:	fef42423          	sw	a5,-24(s0)
     d82:	a089                	j	dc4 <strcmp+0x6e>
     d84:	fec42783          	lw	a5,-20(s0)
     d88:	4398                	lw	a4,0(a5)
     d8a:	feff07b7          	lui	a5,0xfeff0
     d8e:	eff78793          	addi	a5,a5,-257 # fefefeff <_stack+0xfeeebeff>
     d92:	973e                	add	a4,a4,a5
     d94:	fec42783          	lw	a5,-20(s0)
     d98:	439c                	lw	a5,0(a5)
     d9a:	fff7c793          	not	a5,a5
     d9e:	8f7d                	and	a4,a4,a5
     da0:	808087b7          	lui	a5,0x80808
     da4:	08078793          	addi	a5,a5,128 # 80808080 <_stack+0x80704080>
     da8:	8ff9                	and	a5,a5,a4
     daa:	c399                	beqz	a5,db0 <strcmp+0x5a>
     dac:	4781                	li	a5,0
     dae:	a041                	j	e2e <strcmp+0xd8>
     db0:	fec42783          	lw	a5,-20(s0)
     db4:	0791                	addi	a5,a5,4
     db6:	fef42623          	sw	a5,-20(s0)
     dba:	fe842783          	lw	a5,-24(s0)
     dbe:	0791                	addi	a5,a5,4
     dc0:	fef42423          	sw	a5,-24(s0)
     dc4:	fec42783          	lw	a5,-20(s0)
     dc8:	4398                	lw	a4,0(a5)
     dca:	fe842783          	lw	a5,-24(s0)
     dce:	439c                	lw	a5,0(a5)
     dd0:	faf70ae3          	beq	a4,a5,d84 <strcmp+0x2e>
     dd4:	fec42783          	lw	a5,-20(s0)
     dd8:	fcf42e23          	sw	a5,-36(s0)
     ddc:	fe842783          	lw	a5,-24(s0)
     de0:	fcf42c23          	sw	a5,-40(s0)
     de4:	a819                	j	dfa <strcmp+0xa4>
     de6:	fdc42783          	lw	a5,-36(s0)
     dea:	0785                	addi	a5,a5,1
     dec:	fcf42e23          	sw	a5,-36(s0)
     df0:	fd842783          	lw	a5,-40(s0)
     df4:	0785                	addi	a5,a5,1
     df6:	fcf42c23          	sw	a5,-40(s0)
     dfa:	fdc42783          	lw	a5,-36(s0)
     dfe:	0007c783          	lbu	a5,0(a5)
     e02:	cb99                	beqz	a5,e18 <strcmp+0xc2>
     e04:	fdc42783          	lw	a5,-36(s0)
     e08:	0007c703          	lbu	a4,0(a5)
     e0c:	fd842783          	lw	a5,-40(s0)
     e10:	0007c783          	lbu	a5,0(a5)
     e14:	fcf709e3          	beq	a4,a5,de6 <strcmp+0x90>
     e18:	fdc42783          	lw	a5,-36(s0)
     e1c:	0007c783          	lbu	a5,0(a5)
     e20:	873e                	mv	a4,a5
     e22:	fd842783          	lw	a5,-40(s0)
     e26:	0007c783          	lbu	a5,0(a5)
     e2a:	40f707b3          	sub	a5,a4,a5
     e2e:	853e                	mv	a0,a5
     e30:	5432                	lw	s0,44(sp)
     e32:	6145                	addi	sp,sp,48
     e34:	8082                	ret

00000e36 <memset>:
     e36:	7179                	addi	sp,sp,-48
     e38:	d622                	sw	s0,44(sp)
     e3a:	1800                	addi	s0,sp,48
     e3c:	fca42e23          	sw	a0,-36(s0)
     e40:	fcb42c23          	sw	a1,-40(s0)
     e44:	fcc42a23          	sw	a2,-44(s0)
     e48:	fdc42783          	lw	a5,-36(s0)
     e4c:	fef42623          	sw	a5,-20(s0)
     e50:	a015                	j	e74 <memset+0x3e>
     e52:	fec42783          	lw	a5,-20(s0)
     e56:	00178713          	addi	a4,a5,1
     e5a:	fee42623          	sw	a4,-20(s0)
     e5e:	fd842703          	lw	a4,-40(s0)
     e62:	0ff77713          	andi	a4,a4,255
     e66:	00e78023          	sb	a4,0(a5)
     e6a:	fd442783          	lw	a5,-44(s0)
     e6e:	17fd                	addi	a5,a5,-1
     e70:	fcf42a23          	sw	a5,-44(s0)
     e74:	fd442783          	lw	a5,-44(s0)
     e78:	ffe9                	bnez	a5,e52 <memset+0x1c>
     e7a:	fdc42783          	lw	a5,-36(s0)
     e7e:	853e                	mv	a0,a5
     e80:	5432                	lw	s0,44(sp)
     e82:	6145                	addi	sp,sp,48
     e84:	8082                	ret

00000e86 <strcpy>:
     e86:	7179                	addi	sp,sp,-48
     e88:	d622                	sw	s0,44(sp)
     e8a:	1800                	addi	s0,sp,48
     e8c:	fca42e23          	sw	a0,-36(s0)
     e90:	fcb42c23          	sw	a1,-40(s0)
     e94:	fdc42783          	lw	a5,-36(s0)
     e98:	fef42623          	sw	a5,-20(s0)
     e9c:	fd842783          	lw	a5,-40(s0)
     ea0:	fef42423          	sw	a5,-24(s0)
     ea4:	a01d                	j	eca <strcpy+0x44>
     ea6:	fe842783          	lw	a5,-24(s0)
     eaa:	0007c703          	lbu	a4,0(a5)
     eae:	fec42783          	lw	a5,-20(s0)
     eb2:	00e78023          	sb	a4,0(a5)
     eb6:	fec42783          	lw	a5,-20(s0)
     eba:	0785                	addi	a5,a5,1
     ebc:	fef42623          	sw	a5,-20(s0)
     ec0:	fe842783          	lw	a5,-24(s0)
     ec4:	0785                	addi	a5,a5,1
     ec6:	fef42423          	sw	a5,-24(s0)
     eca:	fe842783          	lw	a5,-24(s0)
     ece:	0007c783          	lbu	a5,0(a5)
     ed2:	fbf1                	bnez	a5,ea6 <strcpy+0x20>
     ed4:	fdc42783          	lw	a5,-36(s0)
     ed8:	853e                	mv	a0,a5
     eda:	5432                	lw	s0,44(sp)
     edc:	6145                	addi	sp,sp,48
     ede:	8082                	ret

00000ee0 <strlen>:
     ee0:	7179                	addi	sp,sp,-48
     ee2:	d622                	sw	s0,44(sp)
     ee4:	1800                	addi	s0,sp,48
     ee6:	fca42e23          	sw	a0,-36(s0)
     eea:	fdc42783          	lw	a5,-36(s0)
     eee:	fef42623          	sw	a5,-20(s0)
     ef2:	fe042423          	sw	zero,-24(s0)
     ef6:	fec42783          	lw	a5,-20(s0)
     efa:	eb81                	bnez	a5,f0a <strlen+0x2a>
     efc:	4781                	li	a5,0
     efe:	a00d                	j	f20 <strlen+0x40>
     f00:	fe842783          	lw	a5,-24(s0)
     f04:	0785                	addi	a5,a5,1
     f06:	fef42423          	sw	a5,-24(s0)
     f0a:	fec42783          	lw	a5,-20(s0)
     f0e:	00178713          	addi	a4,a5,1
     f12:	fee42623          	sw	a4,-20(s0)
     f16:	0007c783          	lbu	a5,0(a5)
     f1a:	f3fd                	bnez	a5,f00 <strlen+0x20>
     f1c:	fe842783          	lw	a5,-24(s0)
     f20:	853e                	mv	a0,a5
     f22:	5432                	lw	s0,44(sp)
     f24:	6145                	addi	sp,sp,48
     f26:	8082                	ret

00000f28 <spi_setup_slave>:
     f28:	1141                	addi	sp,sp,-16
     f2a:	c606                	sw	ra,12(sp)
     f2c:	c422                	sw	s0,8(sp)
     f2e:	0800                	addi	s0,sp,16
     f30:	4581                	li	a1,0
     f32:	4511                	li	a0,4
     f34:	afcff0ef          	jal	ra,230 <set_pin_function>
     f38:	4581                	li	a1,0
     f3a:	4515                	li	a0,5
     f3c:	af4ff0ef          	jal	ra,230 <set_pin_function>
     f40:	4581                	li	a1,0
     f42:	4519                	li	a0,6
     f44:	aecff0ef          	jal	ra,230 <set_pin_function>
     f48:	4581                	li	a1,0
     f4a:	451d                	li	a0,7
     f4c:	ae4ff0ef          	jal	ra,230 <set_pin_function>
     f50:	4581                	li	a1,0
     f52:	450d                	li	a0,3
     f54:	adcff0ef          	jal	ra,230 <set_pin_function>
     f58:	0001                	nop
     f5a:	40b2                	lw	ra,12(sp)
     f5c:	4422                	lw	s0,8(sp)
     f5e:	0141                	addi	sp,sp,16
     f60:	8082                	ret

00000f62 <spi_setup_master>:
     f62:	1101                	addi	sp,sp,-32
     f64:	ce06                	sw	ra,28(sp)
     f66:	cc22                	sw	s0,24(sp)
     f68:	1000                	addi	s0,sp,32
     f6a:	fea42623          	sw	a0,-20(s0)
     f6e:	4581                	li	a1,0
     f70:	453d                	li	a0,15
     f72:	abeff0ef          	jal	ra,230 <set_pin_function>
     f76:	4581                	li	a1,0
     f78:	4539                	li	a0,14
     f7a:	ab6ff0ef          	jal	ra,230 <set_pin_function>
     f7e:	4581                	li	a1,0
     f80:	4535                	li	a0,13
     f82:	aaeff0ef          	jal	ra,230 <set_pin_function>
     f86:	4581                	li	a1,0
     f88:	4531                	li	a0,12
     f8a:	aa6ff0ef          	jal	ra,230 <set_pin_function>
     f8e:	fec42783          	lw	a5,-20(s0)
     f92:	00f05663          	blez	a5,f9e <spi_setup_master+0x3c>
     f96:	4581                	li	a1,0
     f98:	4541                	li	a0,16
     f9a:	a96ff0ef          	jal	ra,230 <set_pin_function>
     f9e:	fec42703          	lw	a4,-20(s0)
     fa2:	4785                	li	a5,1
     fa4:	00e7d663          	bge	a5,a4,fb0 <spi_setup_master+0x4e>
     fa8:	4581                	li	a1,0
     faa:	452d                	li	a0,11
     fac:	a84ff0ef          	jal	ra,230 <set_pin_function>
     fb0:	fec42703          	lw	a4,-20(s0)
     fb4:	4789                	li	a5,2
     fb6:	00e7d663          	bge	a5,a4,fc2 <spi_setup_master+0x60>
     fba:	4581                	li	a1,0
     fbc:	4501                	li	a0,0
     fbe:	a72ff0ef          	jal	ra,230 <set_pin_function>
     fc2:	fec42703          	lw	a4,-20(s0)
     fc6:	478d                	li	a5,3
     fc8:	00e7d663          	bge	a5,a4,fd4 <spi_setup_master+0x72>
     fcc:	4581                	li	a1,0
     fce:	4505                	li	a0,1
     fd0:	a60ff0ef          	jal	ra,230 <set_pin_function>
     fd4:	0001                	nop
     fd6:	40f2                	lw	ra,28(sp)
     fd8:	4462                	lw	s0,24(sp)
     fda:	6105                	addi	sp,sp,32
     fdc:	8082                	ret

00000fde <spi_setup_cmd_addr>:
     fde:	7179                	addi	sp,sp,-48
     fe0:	d622                	sw	s0,44(sp)
     fe2:	1800                	addi	s0,sp,48
     fe4:	fca42e23          	sw	a0,-36(s0)
     fe8:	fcb42c23          	sw	a1,-40(s0)
     fec:	fcc42a23          	sw	a2,-44(s0)
     ff0:	fcd42823          	sw	a3,-48(s0)
     ff4:	02000713          	li	a4,32
     ff8:	fd842783          	lw	a5,-40(s0)
     ffc:	40f707b3          	sub	a5,a4,a5
    1000:	fdc42703          	lw	a4,-36(s0)
    1004:	00f717b3          	sll	a5,a4,a5
    1008:	fef42623          	sw	a5,-20(s0)
    100c:	1a1027b7          	lui	a5,0x1a102
    1010:	07a1                	addi	a5,a5,8
    1012:	fec42703          	lw	a4,-20(s0)
    1016:	c398                	sw	a4,0(a5)
    1018:	1a1027b7          	lui	a5,0x1a102
    101c:	07b1                	addi	a5,a5,12
    101e:	fd442703          	lw	a4,-44(s0)
    1022:	c398                	sw	a4,0(a5)
    1024:	fd842783          	lw	a5,-40(s0)
    1028:	03f7f693          	andi	a3,a5,63
    102c:	fd042783          	lw	a5,-48(s0)
    1030:	00879713          	slli	a4,a5,0x8
    1034:	6791                	lui	a5,0x4
    1036:	f0078793          	addi	a5,a5,-256 # 3f00 <__DTOR_END__+0x2924>
    103a:	8f7d                	and	a4,a4,a5
    103c:	1a1027b7          	lui	a5,0x1a102
    1040:	07c1                	addi	a5,a5,16
    1042:	8f55                	or	a4,a4,a3
    1044:	c398                	sw	a4,0(a5)
    1046:	0001                	nop
    1048:	5432                	lw	s0,44(sp)
    104a:	6145                	addi	sp,sp,48
    104c:	8082                	ret

0000104e <spi_setup_dummy>:
    104e:	1101                	addi	sp,sp,-32
    1050:	ce22                	sw	s0,28(sp)
    1052:	1000                	addi	s0,sp,32
    1054:	fea42623          	sw	a0,-20(s0)
    1058:	feb42423          	sw	a1,-24(s0)
    105c:	fe842783          	lw	a5,-24(s0)
    1060:	07c2                	slli	a5,a5,0x10
    1062:	86be                	mv	a3,a5
    1064:	fec42703          	lw	a4,-20(s0)
    1068:	67c1                	lui	a5,0x10
    106a:	17fd                	addi	a5,a5,-1
    106c:	8ff9                	and	a5,a5,a4
    106e:	00f6e733          	or	a4,a3,a5
    1072:	1a1027b7          	lui	a5,0x1a102
    1076:	07d1                	addi	a5,a5,20
    1078:	c398                	sw	a4,0(a5)
    107a:	0001                	nop
    107c:	4472                	lw	s0,28(sp)
    107e:	6105                	addi	sp,sp,32
    1080:	8082                	ret

00001082 <spi_set_datalen>:
    1082:	7179                	addi	sp,sp,-48
    1084:	d622                	sw	s0,44(sp)
    1086:	1800                	addi	s0,sp,48
    1088:	fca42e23          	sw	a0,-36(s0)
    108c:	1a1027b7          	lui	a5,0x1a102
    1090:	07c1                	addi	a5,a5,16
    1092:	439c                	lw	a5,0(a5)
    1094:	fef42623          	sw	a5,-20(s0)
    1098:	fdc42783          	lw	a5,-36(s0)
    109c:	07c2                	slli	a5,a5,0x10
    109e:	873e                	mv	a4,a5
    10a0:	fec42783          	lw	a5,-20(s0)
    10a4:	86be                	mv	a3,a5
    10a6:	67c1                	lui	a5,0x10
    10a8:	17fd                	addi	a5,a5,-1
    10aa:	8ff5                	and	a5,a5,a3
    10ac:	8fd9                	or	a5,a5,a4
    10ae:	fef42623          	sw	a5,-20(s0)
    10b2:	1a1027b7          	lui	a5,0x1a102
    10b6:	07c1                	addi	a5,a5,16
    10b8:	fec42703          	lw	a4,-20(s0)
    10bc:	c398                	sw	a4,0(a5)
    10be:	0001                	nop
    10c0:	5432                	lw	s0,44(sp)
    10c2:	6145                	addi	sp,sp,48
    10c4:	8082                	ret

000010c6 <spi_start_transaction>:
    10c6:	1101                	addi	sp,sp,-32
    10c8:	ce22                	sw	s0,28(sp)
    10ca:	1000                	addi	s0,sp,32
    10cc:	fea42623          	sw	a0,-20(s0)
    10d0:	feb42423          	sw	a1,-24(s0)
    10d4:	fe842783          	lw	a5,-24(s0)
    10d8:	07a1                	addi	a5,a5,8
    10da:	4705                	li	a4,1
    10dc:	00f71733          	sll	a4,a4,a5
    10e0:	6785                	lui	a5,0x1
    10e2:	f0078793          	addi	a5,a5,-256 # f00 <strlen+0x20>
    10e6:	00f776b3          	and	a3,a4,a5
    10ea:	fec42783          	lw	a5,-20(s0)
    10ee:	4705                	li	a4,1
    10f0:	00f717b3          	sll	a5,a4,a5
    10f4:	0ff7f713          	andi	a4,a5,255
    10f8:	1a1027b7          	lui	a5,0x1a102
    10fc:	8f55                	or	a4,a4,a3
    10fe:	c398                	sw	a4,0(a5)
    1100:	0001                	nop
    1102:	4472                	lw	s0,28(sp)
    1104:	6105                	addi	sp,sp,32
    1106:	8082                	ret

00001108 <spi_get_status>:
    1108:	1101                	addi	sp,sp,-32
    110a:	ce22                	sw	s0,28(sp)
    110c:	1000                	addi	s0,sp,32
    110e:	1a1027b7          	lui	a5,0x1a102
    1112:	439c                	lw	a5,0(a5)
    1114:	fef42623          	sw	a5,-20(s0)
    1118:	fec42783          	lw	a5,-20(s0)
    111c:	853e                	mv	a0,a5
    111e:	4472                	lw	s0,28(sp)
    1120:	6105                	addi	sp,sp,32
    1122:	8082                	ret

00001124 <spi_write_fifo>:
    1124:	7179                	addi	sp,sp,-48
    1126:	d622                	sw	s0,44(sp)
    1128:	1800                	addi	s0,sp,48
    112a:	fca42e23          	sw	a0,-36(s0)
    112e:	fcb42c23          	sw	a1,-40(s0)
    1132:	fd842783          	lw	a5,-40(s0)
    1136:	8795                	srai	a5,a5,0x5
    1138:	7ff7f793          	andi	a5,a5,2047
    113c:	fef42623          	sw	a5,-20(s0)
    1140:	fd842783          	lw	a5,-40(s0)
    1144:	8bfd                	andi	a5,a5,31
    1146:	c791                	beqz	a5,1152 <spi_write_fifo+0x2e>
    1148:	fec42783          	lw	a5,-20(s0)
    114c:	0785                	addi	a5,a5,1
    114e:	fef42623          	sw	a5,-20(s0)
    1152:	fe042423          	sw	zero,-24(s0)
    1156:	a80d                	j	1188 <spi_write_fifo+0x64>
    1158:	0001                	nop
    115a:	1a1027b7          	lui	a5,0x1a102
    115e:	439c                	lw	a5,0(a5)
    1160:	87e1                	srai	a5,a5,0x18
    1162:	0f87f793          	andi	a5,a5,248
    1166:	fbf5                	bnez	a5,115a <spi_write_fifo+0x36>
    1168:	fe842783          	lw	a5,-24(s0)
    116c:	078a                	slli	a5,a5,0x2
    116e:	fdc42703          	lw	a4,-36(s0)
    1172:	973e                	add	a4,a4,a5
    1174:	1a1027b7          	lui	a5,0x1a102
    1178:	07e1                	addi	a5,a5,24
    117a:	4318                	lw	a4,0(a4)
    117c:	c398                	sw	a4,0(a5)
    117e:	fe842783          	lw	a5,-24(s0)
    1182:	0785                	addi	a5,a5,1
    1184:	fef42423          	sw	a5,-24(s0)
    1188:	fe842703          	lw	a4,-24(s0)
    118c:	fec42783          	lw	a5,-20(s0)
    1190:	fcf744e3          	blt	a4,a5,1158 <spi_write_fifo+0x34>
    1194:	0001                	nop
    1196:	0001                	nop
    1198:	5432                	lw	s0,44(sp)
    119a:	6145                	addi	sp,sp,48
    119c:	8082                	ret

0000119e <spi_read_fifo>:
    119e:	7179                	addi	sp,sp,-48
    11a0:	d622                	sw	s0,44(sp)
    11a2:	1800                	addi	s0,sp,48
    11a4:	fca42e23          	sw	a0,-36(s0)
    11a8:	fcb42c23          	sw	a1,-40(s0)
    11ac:	fd842783          	lw	a5,-40(s0)
    11b0:	8795                	srai	a5,a5,0x5
    11b2:	7ff7f793          	andi	a5,a5,2047
    11b6:	fef42623          	sw	a5,-20(s0)
    11ba:	fd842783          	lw	a5,-40(s0)
    11be:	8bfd                	andi	a5,a5,31
    11c0:	c791                	beqz	a5,11cc <spi_read_fifo+0x2e>
    11c2:	fec42783          	lw	a5,-20(s0)
    11c6:	0785                	addi	a5,a5,1
    11c8:	fef42623          	sw	a5,-20(s0)
    11cc:	fe042423          	sw	zero,-24(s0)
    11d0:	a815                	j	1204 <spi_read_fifo+0x66>
    11d2:	0001                	nop
    11d4:	1a1027b7          	lui	a5,0x1a102
    11d8:	439c                	lw	a5,0(a5)
    11da:	87c1                	srai	a5,a5,0x10
    11dc:	0ff7f793          	andi	a5,a5,255
    11e0:	dbf5                	beqz	a5,11d4 <spi_read_fifo+0x36>
    11e2:	1a1027b7          	lui	a5,0x1a102
    11e6:	02078713          	addi	a4,a5,32 # 1a102020 <_stack+0x19ffe020>
    11ea:	fe842783          	lw	a5,-24(s0)
    11ee:	078a                	slli	a5,a5,0x2
    11f0:	fdc42683          	lw	a3,-36(s0)
    11f4:	97b6                	add	a5,a5,a3
    11f6:	4318                	lw	a4,0(a4)
    11f8:	c398                	sw	a4,0(a5)
    11fa:	fe842783          	lw	a5,-24(s0)
    11fe:	0785                	addi	a5,a5,1
    1200:	fef42423          	sw	a5,-24(s0)
    1204:	fe842703          	lw	a4,-24(s0)
    1208:	fec42783          	lw	a5,-20(s0)
    120c:	fcf743e3          	blt	a4,a5,11d2 <spi_read_fifo+0x34>
    1210:	0001                	nop
    1212:	0001                	nop
    1214:	5432                	lw	s0,44(sp)
    1216:	6145                	addi	sp,sp,48
    1218:	8082                	ret

0000121a <reset_timer>:
    121a:	1141                	addi	sp,sp,-16
    121c:	c622                	sw	s0,12(sp)
    121e:	0800                	addi	s0,sp,16
    1220:	1a1037b7          	lui	a5,0x1a103
    1224:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack+0x19fff000>
    1228:	0001                	nop
    122a:	4432                	lw	s0,12(sp)
    122c:	0141                	addi	sp,sp,16
    122e:	8082                	ret

00001230 <start_timer>:
    1230:	1141                	addi	sp,sp,-16
    1232:	c622                	sw	s0,12(sp)
    1234:	0800                	addi	s0,sp,16
    1236:	1a1037b7          	lui	a5,0x1a103
    123a:	0791                	addi	a5,a5,4
    123c:	4705                	li	a4,1
    123e:	c398                	sw	a4,0(a5)
    1240:	0001                	nop
    1242:	4432                	lw	s0,12(sp)
    1244:	0141                	addi	sp,sp,16
    1246:	8082                	ret

00001248 <stop_timer>:
    1248:	1141                	addi	sp,sp,-16
    124a:	c622                	sw	s0,12(sp)
    124c:	0800                	addi	s0,sp,16
    124e:	1a1037b7          	lui	a5,0x1a103
    1252:	0791                	addi	a5,a5,4
    1254:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack+0x19fff000>
    1258:	0001                	nop
    125a:	4432                	lw	s0,12(sp)
    125c:	0141                	addi	sp,sp,16
    125e:	8082                	ret

00001260 <get_time>:
    1260:	1141                	addi	sp,sp,-16
    1262:	c622                	sw	s0,12(sp)
    1264:	0800                	addi	s0,sp,16
    1266:	1a1037b7          	lui	a5,0x1a103
    126a:	439c                	lw	a5,0(a5)
    126c:	853e                	mv	a0,a5
    126e:	4432                	lw	s0,12(sp)
    1270:	0141                	addi	sp,sp,16
    1272:	8082                	ret

00001274 <uart_set_cfg>:
    1274:	1101                	addi	sp,sp,-32
    1276:	ce22                	sw	s0,28(sp)
    1278:	1000                	addi	s0,sp,32
    127a:	fea42623          	sw	a0,-20(s0)
    127e:	87ae                	mv	a5,a1
    1280:	fef41523          	sh	a5,-22(s0)
    1284:	1a1077b7          	lui	a5,0x1a107
    1288:	0791                	addi	a5,a5,4
    128a:	4398                	lw	a4,0(a5)
    128c:	1a1077b7          	lui	a5,0x1a107
    1290:	0791                	addi	a5,a5,4
    1292:	00276713          	ori	a4,a4,2
    1296:	c398                	sw	a4,0(a5)
    1298:	1a1007b7          	lui	a5,0x1a100
    129c:	07b1                	addi	a5,a5,12
    129e:	08300713          	li	a4,131
    12a2:	c398                	sw	a4,0(a5)
    12a4:	fea45783          	lhu	a5,-22(s0)
    12a8:	83a1                	srli	a5,a5,0x8
    12aa:	07c2                	slli	a5,a5,0x10
    12ac:	83c1                	srli	a5,a5,0x10
    12ae:	873e                	mv	a4,a5
    12b0:	1a1007b7          	lui	a5,0x1a100
    12b4:	0791                	addi	a5,a5,4
    12b6:	0ff77713          	andi	a4,a4,255
    12ba:	c398                	sw	a4,0(a5)
    12bc:	fea45703          	lhu	a4,-22(s0)
    12c0:	1a1007b7          	lui	a5,0x1a100
    12c4:	0ff77713          	andi	a4,a4,255
    12c8:	c398                	sw	a4,0(a5)
    12ca:	1a1007b7          	lui	a5,0x1a100
    12ce:	07a1                	addi	a5,a5,8
    12d0:	0a700713          	li	a4,167
    12d4:	c398                	sw	a4,0(a5)
    12d6:	1a1007b7          	lui	a5,0x1a100
    12da:	07b1                	addi	a5,a5,12
    12dc:	470d                	li	a4,3
    12de:	c398                	sw	a4,0(a5)
    12e0:	1a1007b7          	lui	a5,0x1a100
    12e4:	0791                	addi	a5,a5,4
    12e6:	439c                	lw	a5,0(a5)
    12e8:	0f07f713          	andi	a4,a5,240
    12ec:	1a1007b7          	lui	a5,0x1a100
    12f0:	0791                	addi	a5,a5,4
    12f2:	00276713          	ori	a4,a4,2
    12f6:	c398                	sw	a4,0(a5)
    12f8:	0001                	nop
    12fa:	4472                	lw	s0,28(sp)
    12fc:	6105                	addi	sp,sp,32
    12fe:	8082                	ret

00001300 <uart_send>:
    1300:	7179                	addi	sp,sp,-48
    1302:	d622                	sw	s0,44(sp)
    1304:	1800                	addi	s0,sp,48
    1306:	fca42e23          	sw	a0,-36(s0)
    130a:	fcb42c23          	sw	a1,-40(s0)
    130e:	a891                	j	1362 <uart_send+0x62>
    1310:	0001                	nop
    1312:	1a1007b7          	lui	a5,0x1a100
    1316:	07d1                	addi	a5,a5,20
    1318:	439c                	lw	a5,0(a5)
    131a:	0207f793          	andi	a5,a5,32
    131e:	dbf5                	beqz	a5,1312 <uart_send+0x12>
    1320:	fe042623          	sw	zero,-20(s0)
    1324:	a035                	j	1350 <uart_send+0x50>
    1326:	fdc42783          	lw	a5,-36(s0)
    132a:	00178713          	addi	a4,a5,1 # 1a100001 <_stack+0x19ffc001>
    132e:	fce42e23          	sw	a4,-36(s0)
    1332:	0007c703          	lbu	a4,0(a5)
    1336:	1a1007b7          	lui	a5,0x1a100
    133a:	c398                	sw	a4,0(a5)
    133c:	fd842783          	lw	a5,-40(s0)
    1340:	17fd                	addi	a5,a5,-1
    1342:	fcf42c23          	sw	a5,-40(s0)
    1346:	fec42783          	lw	a5,-20(s0)
    134a:	0785                	addi	a5,a5,1
    134c:	fef42623          	sw	a5,-20(s0)
    1350:	fec42703          	lw	a4,-20(s0)
    1354:	03f00793          	li	a5,63
    1358:	00e7e563          	bltu	a5,a4,1362 <uart_send+0x62>
    135c:	fd842783          	lw	a5,-40(s0)
    1360:	f3f9                	bnez	a5,1326 <uart_send+0x26>
    1362:	fd842783          	lw	a5,-40(s0)
    1366:	f7cd                	bnez	a5,1310 <uart_send+0x10>
    1368:	0001                	nop
    136a:	0001                	nop
    136c:	5432                	lw	s0,44(sp)
    136e:	6145                	addi	sp,sp,48
    1370:	8082                	ret

00001372 <uart_getchar>:
    1372:	1141                	addi	sp,sp,-16
    1374:	c622                	sw	s0,12(sp)
    1376:	0800                	addi	s0,sp,16
    1378:	0001                	nop
    137a:	1a1007b7          	lui	a5,0x1a100
    137e:	07d1                	addi	a5,a5,20
    1380:	439c                	lw	a5,0(a5)
    1382:	0017f713          	andi	a4,a5,1
    1386:	4785                	li	a5,1
    1388:	fef719e3          	bne	a4,a5,137a <uart_getchar+0x8>
    138c:	1a1007b7          	lui	a5,0x1a100
    1390:	439c                	lw	a5,0(a5)
    1392:	0ff7f793          	andi	a5,a5,255
    1396:	853e                	mv	a0,a5
    1398:	4432                	lw	s0,12(sp)
    139a:	0141                	addi	sp,sp,16
    139c:	8082                	ret

0000139e <uart_sendchar>:
    139e:	1101                	addi	sp,sp,-32
    13a0:	ce22                	sw	s0,28(sp)
    13a2:	1000                	addi	s0,sp,32
    13a4:	87aa                	mv	a5,a0
    13a6:	fef407a3          	sb	a5,-17(s0)
    13aa:	0001                	nop
    13ac:	1a1007b7          	lui	a5,0x1a100
    13b0:	07d1                	addi	a5,a5,20
    13b2:	439c                	lw	a5,0(a5)
    13b4:	0207f793          	andi	a5,a5,32
    13b8:	dbf5                	beqz	a5,13ac <uart_sendchar+0xe>
    13ba:	1a1007b7          	lui	a5,0x1a100
    13be:	fef44703          	lbu	a4,-17(s0)
    13c2:	c398                	sw	a4,0(a5)
    13c4:	0001                	nop
    13c6:	4472                	lw	s0,28(sp)
    13c8:	6105                	addi	sp,sp,32
    13ca:	8082                	ret

000013cc <uart_wait_tx_done>:
    13cc:	1141                	addi	sp,sp,-16
    13ce:	c622                	sw	s0,12(sp)
    13d0:	0800                	addi	s0,sp,16
    13d2:	0001                	nop
    13d4:	1a1007b7          	lui	a5,0x1a100
    13d8:	07d1                	addi	a5,a5,20
    13da:	439c                	lw	a5,0(a5)
    13dc:	0407f793          	andi	a5,a5,64
    13e0:	dbf5                	beqz	a5,13d4 <uart_wait_tx_done+0x8>
    13e2:	0001                	nop
    13e4:	0001                	nop
    13e6:	4432                	lw	s0,12(sp)
    13e8:	0141                	addi	sp,sp,16
    13ea:	8082                	ret

000013ec <uart_set_interrupt>:
    13ec:	1101                	addi	sp,sp,-32
    13ee:	ce22                	sw	s0,28(sp)
    13f0:	1000                	addi	s0,sp,32
    13f2:	87aa                	mv	a5,a0
    13f4:	fef407a3          	sb	a5,-17(s0)
    13f8:	1a1007b7          	lui	a5,0x1a100
    13fc:	07b1                	addi	a5,a5,12
    13fe:	0007c783          	lbu	a5,0(a5) # 1a100000 <_stack+0x19ffc000>
    1402:	0ff7f713          	andi	a4,a5,255
    1406:	1a1007b7          	lui	a5,0x1a100
    140a:	07b1                	addi	a5,a5,12
    140c:	07f77713          	andi	a4,a4,127
    1410:	0ff77713          	andi	a4,a4,255
    1414:	00e78023          	sb	a4,0(a5) # 1a100000 <_stack+0x19ffc000>
    1418:	1a1007b7          	lui	a5,0x1a100
    141c:	0791                	addi	a5,a5,4
    141e:	fef44703          	lbu	a4,-17(s0)
    1422:	00e78023          	sb	a4,0(a5) # 1a100000 <_stack+0x19ffc000>
    1426:	0001                	nop
    1428:	4472                	lw	s0,28(sp)
    142a:	6105                	addi	sp,sp,32
    142c:	8082                	ret

0000142e <exit>:
    142e:	1101                	addi	sp,sp,-32
    1430:	ce06                	sw	ra,28(sp)
    1432:	cc22                	sw	s0,24(sp)
    1434:	1000                	addi	s0,sp,32
    1436:	fea42623          	sw	a0,-20(s0)
    143a:	fec42503          	lw	a0,-20(s0)
    143e:	2011                	jal	1442 <eoc>
    1440:	a001                	j	1440 <exit+0x12>

00001442 <eoc>:
    1442:	1101                	addi	sp,sp,-32
    1444:	ce22                	sw	s0,28(sp)
    1446:	1000                	addi	s0,sp,32
    1448:	fea42623          	sw	a0,-20(s0)
    144c:	fec42783          	lw	a5,-20(s0)
    1450:	c799                	beqz	a5,145e <eoc+0x1c>
    1452:	1a1077b7          	lui	a5,0x1a107
    1456:	07d1                	addi	a5,a5,20
    1458:	4705                	li	a4,1
    145a:	c398                	sw	a4,0(a5)
    145c:	a031                	j	1468 <eoc+0x26>
    145e:	1a1077b7          	lui	a5,0x1a107
    1462:	07d1                	addi	a5,a5,20
    1464:	0007a023          	sw	zero,0(a5) # 1a107000 <_stack+0x1a003000>
    1468:	1a1077b7          	lui	a5,0x1a107
    146c:	0791                	addi	a5,a5,4
    146e:	4398                	lw	a4,0(a5)
    1470:	1a1077b7          	lui	a5,0x1a107
    1474:	0791                	addi	a5,a5,4
    1476:	00476713          	ori	a4,a4,4
    147a:	c398                	sw	a4,0(a5)
    147c:	0001                	nop
    147e:	4472                	lw	s0,28(sp)
    1480:	6105                	addi	sp,sp,32
    1482:	8082                	ret

00001484 <sleep_busy>:
    1484:	7179                	addi	sp,sp,-48
    1486:	d622                	sw	s0,44(sp)
    1488:	1800                	addi	s0,sp,48
    148a:	fca42e23          	sw	a0,-36(s0)
    148e:	fe042623          	sw	zero,-20(s0)
    1492:	a039                	j	14a0 <sleep_busy+0x1c>
    1494:	0001                	nop
    1496:	fec42783          	lw	a5,-20(s0)
    149a:	0785                	addi	a5,a5,1
    149c:	fef42623          	sw	a5,-20(s0)
    14a0:	fdc42783          	lw	a5,-36(s0)
    14a4:	fec42703          	lw	a4,-20(s0)
    14a8:	fef746e3          	blt	a4,a5,1494 <sleep_busy+0x10>
    14ac:	0001                	nop
    14ae:	0001                	nop
    14b0:	5432                	lw	s0,44(sp)
    14b2:	6145                	addi	sp,sp,48
    14b4:	8082                	ret

000014b6 <cpu_perf_set>:
    14b6:	1101                	addi	sp,sp,-32
    14b8:	ce06                	sw	ra,28(sp)
    14ba:	cc22                	sw	s0,24(sp)
    14bc:	1000                	addi	s0,sp,32
    14be:	fea42623          	sw	a0,-20(s0)
    14c2:	feb42423          	sw	a1,-24(s0)
    14c6:	001007b7          	lui	a5,0x100
    14ca:	03078513          	addi	a0,a5,48 # 100030 <__DTOR_END__+0xfea54>
    14ce:	839ff0ef          	jal	ra,d06 <puts>
    14d2:	0001                	nop
    14d4:	40f2                	lw	ra,28(sp)
    14d6:	4462                	lw	s0,24(sp)
    14d8:	6105                	addi	sp,sp,32
    14da:	8082                	ret

000014dc <cpu_perf_get>:
    14dc:	7179                	addi	sp,sp,-48
    14de:	d606                	sw	ra,44(sp)
    14e0:	d422                	sw	s0,40(sp)
    14e2:	1800                	addi	s0,sp,48
    14e4:	fca42e23          	sw	a0,-36(s0)
    14e8:	fe042623          	sw	zero,-20(s0)
    14ec:	fdc42703          	lw	a4,-36(s0)
    14f0:	47bd                	li	a5,15
    14f2:	0ae7ed63          	bltu	a5,a4,15ac <cpu_perf_get+0xd0>
    14f6:	fdc42783          	lw	a5,-36(s0)
    14fa:	00279713          	slli	a4,a5,0x2
    14fe:	001007b7          	lui	a5,0x100
    1502:	07078793          	addi	a5,a5,112 # 100070 <__DTOR_END__+0xfea94>
    1506:	97ba                	add	a5,a5,a4
    1508:	439c                	lw	a5,0(a5)
    150a:	8782                	jr	a5
    150c:	780027f3          	csrr	a5,0x780
    1510:	fef42623          	sw	a5,-20(s0)
    1514:	a06d                	j	15be <cpu_perf_get+0xe2>
    1516:	781027f3          	csrr	a5,0x781
    151a:	fef42623          	sw	a5,-20(s0)
    151e:	a045                	j	15be <cpu_perf_get+0xe2>
    1520:	782027f3          	csrr	a5,0x782
    1524:	fef42623          	sw	a5,-20(s0)
    1528:	a859                	j	15be <cpu_perf_get+0xe2>
    152a:	783027f3          	csrr	a5,0x783
    152e:	fef42623          	sw	a5,-20(s0)
    1532:	a071                	j	15be <cpu_perf_get+0xe2>
    1534:	784027f3          	csrr	a5,0x784
    1538:	fef42623          	sw	a5,-20(s0)
    153c:	a049                	j	15be <cpu_perf_get+0xe2>
    153e:	785027f3          	csrr	a5,0x785
    1542:	fef42623          	sw	a5,-20(s0)
    1546:	a8a5                	j	15be <cpu_perf_get+0xe2>
    1548:	786027f3          	csrr	a5,0x786
    154c:	fef42623          	sw	a5,-20(s0)
    1550:	a0bd                	j	15be <cpu_perf_get+0xe2>
    1552:	787027f3          	csrr	a5,0x787
    1556:	fef42623          	sw	a5,-20(s0)
    155a:	a095                	j	15be <cpu_perf_get+0xe2>
    155c:	788027f3          	csrr	a5,0x788
    1560:	fef42623          	sw	a5,-20(s0)
    1564:	a8a9                	j	15be <cpu_perf_get+0xe2>
    1566:	789027f3          	csrr	a5,0x789
    156a:	fef42623          	sw	a5,-20(s0)
    156e:	a881                	j	15be <cpu_perf_get+0xe2>
    1570:	78a027f3          	csrr	a5,0x78a
    1574:	fef42623          	sw	a5,-20(s0)
    1578:	a099                	j	15be <cpu_perf_get+0xe2>
    157a:	78b027f3          	csrr	a5,0x78b
    157e:	fef42623          	sw	a5,-20(s0)
    1582:	a835                	j	15be <cpu_perf_get+0xe2>
    1584:	78c027f3          	csrr	a5,0x78c
    1588:	fef42623          	sw	a5,-20(s0)
    158c:	a80d                	j	15be <cpu_perf_get+0xe2>
    158e:	78d027f3          	csrr	a5,0x78d
    1592:	fef42623          	sw	a5,-20(s0)
    1596:	a025                	j	15be <cpu_perf_get+0xe2>
    1598:	78e027f3          	csrr	a5,0x78e
    159c:	fef42623          	sw	a5,-20(s0)
    15a0:	a839                	j	15be <cpu_perf_get+0xe2>
    15a2:	78f027f3          	csrr	a5,0x78f
    15a6:	fef42623          	sw	a5,-20(s0)
    15aa:	a811                	j	15be <cpu_perf_get+0xe2>
    15ac:	fdc42583          	lw	a1,-36(s0)
    15b0:	001007b7          	lui	a5,0x100
    15b4:	05478513          	addi	a0,a5,84 # 100054 <__DTOR_END__+0xfea78>
    15b8:	efeff0ef          	jal	ra,cb6 <printf>
    15bc:	0001                	nop
    15be:	fec42783          	lw	a5,-20(s0)
    15c2:	853e                	mv	a0,a5
    15c4:	50b2                	lw	ra,44(sp)
    15c6:	5422                	lw	s0,40(sp)
    15c8:	6145                	addi	sp,sp,48
    15ca:	8082                	ret

000015cc <__CTOR_LIST__>:
	...

000015d4 <__CTOR_END__>:
	...

Disassembly of section .rodata:

00100000 <.rodata>:
  100000:	6568                	flw	fa0,76(a0)
  100002:	6c6c                	flw	fa1,92(s0)
  100004:	6f77206f          	j	172efa <_stack+0x6eefa>
  100008:	6c72                	flw	fs8,28(sp)
  10000a:	2164                	fld	fs1,192(a0)
  10000c:	6820                	flw	fs0,80(s0)
  10000e:	7265                	lui	tp,0xffff9
  100010:	2765                	jal	1007b8 <_bss_end+0x6f8>
  100012:	6f792073          	csrs	0x6f7,s2
  100016:	7275                	lui	tp,0xffffd
  100018:	6320                	flw	fs0,64(a4)
  10001a:	6168                	flw	fa0,68(a0)
  10001c:	6172                	flw	ft2,28(sp)
  10001e:	72657463          	bgeu	a0,t1,100746 <_bss_end+0x686>
  100022:	203a                	fld	ft0,392(sp)
  100024:	6325                	lui	t1,0x9
  100026:	000a                	c.slli	zero,0x2
  100028:	6e28                	flw	fa0,88(a2)
  10002a:	6c75                	lui	s8,0x1d
  10002c:	296c                	fld	fa1,208(a0)
  10002e:	0000                	unimp
  100030:	5f757063          	bgeu	a0,s7,100610 <_bss_end+0x550>
  100034:	6570                	flw	fa2,76(a0)
  100036:	6672                	flw	fa2,28(sp)
  100038:	735f 7465 203a      	0x203a7465735f
  10003e:	6f6e                	flw	ft10,216(sp)
  100040:	2074                	fld	fa3,192(s0)
  100042:	6d69                	lui	s10,0x1a
  100044:	6c70                	flw	fa2,92(s0)
  100046:	6d65                	lui	s10,0x19
  100048:	6e65                	lui	t3,0x19
  10004a:	6574                	flw	fa3,76(a0)
  10004c:	2064                	fld	fs1,192(s0)
  10004e:	6579                	lui	a0,0x1e
  100050:	0074                	addi	a3,sp,12
  100052:	0000                	unimp
  100054:	20525343          	fmadd.s	ft6,ft4,ft5,ft4,unknown
  100058:	6425                	lui	s0,0x9
  10005a:	6e20                	flw	fs0,88(a2)
  10005c:	7920746f          	jal	s0,1077ee <_stack+0x37ee>
  100060:	7465                	lui	s0,0xffff9
  100062:	7320                	flw	fs0,96(a4)
  100064:	7075                	c.lui	zero,0xffffd
  100066:	6f70                	flw	fa2,92(a4)
  100068:	7472                	flw	fs0,60(sp)
  10006a:	6465                	lui	s0,0x19
  10006c:	000a                	c.slli	zero,0x2
  10006e:	0000                	unimp
  100070:	150c                	addi	a1,sp,672
  100072:	0000                	unimp
  100074:	1516                	slli	a0,a0,0x25
  100076:	0000                	unimp
  100078:	1520                	addi	s0,sp,680
  10007a:	0000                	unimp
  10007c:	152a                	slli	a0,a0,0x2a
  10007e:	0000                	unimp
  100080:	1534                	addi	a3,sp,680
  100082:	0000                	unimp
  100084:	153e                	slli	a0,a0,0x2f
  100086:	0000                	unimp
  100088:	1548                	addi	a0,sp,676
  10008a:	0000                	unimp
  10008c:	1552                	slli	a0,a0,0x34
  10008e:	0000                	unimp
  100090:	155c                	addi	a5,sp,676
  100092:	0000                	unimp
  100094:	1566                	slli	a0,a0,0x39
  100096:	0000                	unimp
  100098:	1570                	addi	a2,sp,684
  10009a:	0000                	unimp
  10009c:	157a                	slli	a0,a0,0x3e
  10009e:	0000                	unimp
  1000a0:	1584                	addi	s1,sp,736
  1000a2:	0000                	unimp
  1000a4:	158e                	slli	a1,a1,0x23
  1000a6:	0000                	unimp
  1000a8:	1598                	addi	a4,sp,736
  1000aa:	0000                	unimp
  1000ac:	15a2                	slli	a1,a1,0x28
	...

Disassembly of section .data:

001000b0 <remu10_table>:
  1000b0:	0100                	addi	s0,sp,128
  1000b2:	0202                	c.slli64	tp
  1000b4:	05040303          	lb	t1,80(s0) # 19050 <__DTOR_END__+0x17a74>
  1000b8:	0605                	addi	a2,a2,1
  1000ba:	08080707          	0x8080707
  1000be:	0009                	c.nop	2

Disassembly of section .stack:

00103000 <_stack-0x1000>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	jal	490 <set_gpio_pin_irq_type+0x4c>
   2:	0000                	unimp
   4:	7200                	flw	fs0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	001f 0000 1004      	0x10040000001f
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	fld	ft6,376(sp)
  16:	6932                	flw	fs2,12(sp)
  18:	7032                	flw	ft0,44(sp)
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	jal	fffff9c6 <_stack+0xffefb9c6>
  1e:	3070                	fld	fa2,224(s0)
  20:	635f 7032 0030      	0x307032635f
  26:	0108                	addi	a0,sp,128
  28:	0b0a                	slli	s6,s6,0x2

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	fld	fs0,96(a0)
   c:	2e30                	fld	fa2,88(a2)
   e:	2e32                	fld	ft8,264(sp)
  10:	0030                	addi	a2,sp,8
