#include<stdio.h>
#include<string.h>

int main()
{	
	char sir1[]="andrereea";
	char sir2[]="eeja";
	int index1=0, index2=0;
	printf("%ld\n",strlen(sir1));

cautare:
	if(index1 <(strlen(sir1)) && index2 < (strlen(sir2)) &&  sir1[index1] == sir2[index2]) {
		index1++;
		index2++;
		goto cautare;
	}
	if(index2==strlen(sir2)) {
		printf("%d\n", index1);
	}
	if(index1 < (strlen(sir1)) && index2 < (strlen(sir2)) &&  sir1[index1] != sir2[index2]) {
		index1++;
		index2=0;
		goto cautare;
	}
	if((index1 == strlen(sir1)) && index2==0) {
		printf("nu exista\n" );
	}
	


//	goto cautare;

	return 0;
}