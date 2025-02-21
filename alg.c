#include<stdio.h>
void main()
{
int ns[3];
 printf("digite o primeiro numero \n");
 printf("\n");
scanf("%i", &ns[1] );
 printf("digite o segundo numero \n");
 printf("\n");
scanf("%i", &ns[2] );
 printf("digite o terceiro numero \n");
 printf("\n");
scanf("%i", &ns[3] );
 if(ns[1]>ns[2] && ns[1]>ns[3]){ 
	printf("o primeiro numero eh o maior\n");
	
}
 if(ns[2]>ns[1] && ns[2]>ns[3]){ 
	printf("o segundo numero eh o maior\n");

}
  if(ns[3]>ns[2] && ns[3]>ns[1]){
	printf("o terceiro numero eh o maior \n");

}
 
}
