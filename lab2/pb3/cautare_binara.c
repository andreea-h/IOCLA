#include<stdio.h>

int main()
{
	int v[]={1,4,6,10,15,19,20};
	int x=5;
	int r=6;
	int l=0;
	int gasit = 7;
	int mid;

cautare:
	mid = l + (r-l)/2;
	if(l>=r)
		gasit = -1;
	if(v[mid]==x)
		gasit = mid;
	if(v[mid]>x && gasit==7) {
		r=mid-1;
		goto cautare;
	}
	if(v[mid]<x && gasit==7){
		l=mid+1;
		goto cautare;
	}

	if(gasit == -1)
		printf("nu exista\n");
	else
		printf("%d\n", v[gasit]);
	return 0;
}