/*
* LED Blinker
* Assuming that GPIO_BASE is mapped to a GPIO core, which in turn is
* connected to LEDs, this will light the LEDs one at a time.
* Useful as smoke test to see that serv is running correctly
*/
#ifndef GPIO_BASE
#define GPIO_BASE 0x40000000
#endif

#ifndef DELAY
#define DELAY 0x10 /* Loop 100000 times before inverting the LED */
#endif
	
	/*
	a0 = GPIO Base address
	t0 = Value
	t1 = Timer max value
	t2 = Current timer value

	*/

.globl _start
_start:
	/* Load GPIO base address to a0 */
	lui a0, %hi(GPIO_BASE)
	addi a0, a0, %lo(GPIO_BASE)

	/* Set timer value to control blink speed */
	li t1, DELAY

	/* Clear t0 */
	addi	t0, zero, 0
bl1:
	/* Write to LEDs */
	sb t0, 0(a0)

	/* invert LED */
	addi t0, t0, 1

	/* Reset timer */
	and t2, zero, zero

	j bl1

