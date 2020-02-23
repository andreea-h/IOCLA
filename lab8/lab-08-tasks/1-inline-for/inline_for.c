#include <stdio.h>

#define NUM	100

int main(void)
{
	size_t n = NUM;
	size_t sum = 0;

//	size_t i = 0;
//	for (i = 1; i <= n; i++)
//		sum += i;

	__asm__ (
	"xor eax, eax\n\t" /* collect the sum in eax */
	/* use ecx to go through items, start from n */
	"mov ecx, %1\n"
	"add_to_sum:\n\t"
	"add eax, ecx\n\t"
	"loopnz add_to_sum\n\t"
	/* place sum in output register */
	"mov %0, eax\n\t"
	: "=r" (sum) /* output variable *//* (variabila din codul c)*/
	: "r" (n) /* input variable *//* (variabila din codul c)*/
	: "eax", "ecx" ); /* registers used in the assembly code */
        // colbbers - registrele folosite in in cadrul rutinei noastre assembly

	printf("sum(%u): %u\n", n, sum);

	return 0;
}
