#include <stdio.h>
#include <stdlib.h>
#include "objpr.h"
#include "polepr.h"

int main(){

    float a,b,h;

    printf("Podaj wymiary prostokata: \n");
    printf("a= ");
    scanf("%f", &a);
    printf("b= ");
    scanf("%f", &b);
    printf("****************************************\n");
    printf("Pole prostokata wynosi: %.2f", polepr(a,b));
    printf("\n****************************************\n");

    printf("Podaj wymiary prostopaloscianu: \n");
    printf("a= ");
    scanf("%f", &a);
    printf("b= ");
    scanf("%f", &b);
    printf("h= ");
    scanf("%f", &h);
    printf("****************************************\n");
    printf("Objestosc prostopaloscianu wynosi: %.2f", objpr(a,b,h));
    printf("\n****************************************\n");



}