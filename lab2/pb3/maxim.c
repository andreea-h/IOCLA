#include <stdio.h>



int main()
{
	int v[]={5, 2, 8, 1, 9, 4};
	int max=0;
	int i=0;
maxim:
	if(max<v[i]) {
		max = v[i];
	}
	if(i<6) {
	i++;
	goto maxim;
	}
	printf("%d\n",max);
	return 0;
}
