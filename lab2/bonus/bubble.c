#include<stdio.h>
//bubble sort cu goto-uri
int main()
{
	int v[]={1,40,6,10,150,19,-20};
	int i=0;
	int n=7;
	int ok=0;
	int j=0;
/*
bubble:
	if(i<n-1 && v[i] > v[i+1]) {
		int aux = v[i];
		v[i] = v[i+1];
		v[i+1] = aux;
		i++;
		ok=1; //inca interschimb valori
		j=0;
		goto bubble;
	}
	if(v[i] > v[i+1] && i==n-1) {

		i++;
	//	printf("ana%d\n",i);
		goto bubble;
	}
	if(i==n-1) {
		i=0;
		goto bubble;
	}
	if(v[i] < v[i+1]) {
		j++; //numar valorile consecutive plasate in ordine
		ok=0;
		goto bubble;
	}
	if(ok==0 && j==n-1) {
		printf("ura!!!!!!!!!!!!!!!" );
	}
*/
	int t=0;
bubble:
	if(v[i] > v[i+1]) {
		int aux = v[i];
		v[i] = v[i+1];
		v[i+1] = aux;
		t++;
	}
	if(i<n-1) {
		i++;
		goto bubble;
	}
	if(i==n-1 && t!=0) {
		i=0;
		t=0;
		goto bubble;
	}
	if(i==n-1 && t==0) {
		printf("\n");
	}


	

	//goto bubble;
	for(i=0;i<7;i++)
		printf("%d ",v[i]);
	printf("\n");



	return 0;
}