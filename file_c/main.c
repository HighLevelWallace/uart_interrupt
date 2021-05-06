#include "stdlib.h"
#include "gpio.h"
#include "uart.h"
#include "pulpino.h"
#include "utils.h"
#include "int.h"
#include "string_lib.h"

void ISR_UART(void)
{
	printf("hello world! here's your character: %c\n", *(volatile int *)UART_REG_RBR);
	ICP |= 1 << 24;
}

int main(void)
{
	for (int i = 0; i < 8; i++)
	{
		set_gpio_pin_direction(i, 1);
		set_gpio_pin_value(i, 0);
	}
	int_disable();
	uart_set_cfg(0, 12); //Core clock 24MHz, baud rate 115200 bps
	// int_enable();
	uart_set_interrupt(1);
	IER |= 1 << 24;
	int_enable();
	unsigned int j = 0;

	while (1)
	{
		set_gpio_pin_value((j - 1) & 0x7, 1);
		set_gpio_pin_value(j & 0x7, 0);
		for (int i = 0; i < 100000; ++i)
			;
		j++;
	}
	return 0;
}