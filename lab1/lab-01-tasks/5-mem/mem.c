#include <stdio.h>

int main(void)
{
    unsigned int a = 4127;
    int b = -27714;
    unsigned int c = 0x12345678;
    char d[] = {'I', 'O', 'C', 'L', 'A'};
    size_t i;
    unsigned char *p;
    int vect[]={10,20,15,7};
    p = (unsigned char *) &vect;
    for (i = 0; i < sizeof(vect); i++)
        printf(" 0x%02X", p[i]);
    printf("\n");

    p = (unsigned char *) &a;
    printf("a: 0x%04X 0x%02X 0x%02x 0x%05x\n", p[0], p[1], p[2], p[3]);

    p = (unsigned char *) &b;
    printf("b:");
    for (i = 0; i < sizeof(b); i++)
        printf(" 0x%08X", p[i]);
    printf("\n");

    p = (unsigned char *) &c;
    printf("c:");
    for (i = 0; i < sizeof(c); i++)
        printf(" 0x%08X", p[i]);
    printf("\n");

    p = (unsigned char *) &d;
    printf("d:");
    for (i = 0; i < sizeof(d); i++)
        printf(" 0x%08X", p[i]);
    printf("\n");

    return 0;
}
