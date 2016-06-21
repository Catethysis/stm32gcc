#include <stdint.h>
#include "stm32f407xx.h"

void delay() {
	for(volatile uint32_t counter = 0; counter < 200000; counter++);
}

void main () {
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	GPIOD->MODER |= GPIO_MODER_MODER12_0 | GPIO_MODER_MODER13_0 | GPIO_MODER_MODER14_0 | GPIO_MODER_MODER15_0;

	while(1) {
		GPIOD->ODR = GPIO_ODR_ODR_12; delay();
		GPIOD->ODR = GPIO_ODR_ODR_13; delay();
		GPIOD->ODR = GPIO_ODR_ODR_14; delay();
		GPIOD->ODR = GPIO_ODR_ODR_15; delay();
	}
}