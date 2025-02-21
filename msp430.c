
#include "msp430g2553.h"
#include <inttypes.h>
#include "intrinsics.h"
#include <stdio.h>

uint8_t dado_rx;	// define a variavel que recebe os dados da serial
int t=0;
// recebe um caracter pela interface serial. Guarda este valor na variavel 'dado_rx'
// Quando um caracter chega pela interface serial, gera uma interrupcao e armazena na variavel dado_rx
#pragma vector=USCIAB0RX_VECTOR
__interrupt void rx_uart()
{
    
    dado_rx = UCA0RXBUF;
   
}

// transmite um caracter pela interface serial
void tx_byte(char dado)
{
    while(!(IFG2 & UCA0TXIFG));		// espera enquanto a interface serial está ocupada (enviando um dado)
    UCA0TXBUF = dado;			// inicia a transmissao do dado
}


// transmite uma string pela interface serial, usando a funcao tx_byte();
void tx_frase(char * frase)
{
    int i=0;
    for(i=0;*(frase+i);i++)	// enquanto nao encontra o fim da string ('\0') transmite o caracter da posicao i
        tx_byte(*(frase+i));
}

void tempInit()
{
    ADC10CTL0=SREF_1 + REFON + ADC10ON + ADC10SHT_3 ; //1.5V ref,Ref on,64 clocks for sample
    ADC10CTL1=INCH_10+ ADC10DIV_3; //temp sensor is at 10 and clock/4
}
float tempOut()
{
    //int t=0;
    __delay_cycles(1000);              //wait 4 ref to settle
    ADC10CTL0 |= ENC + ADC10SC;      //enable conversion and start conversion
    while(ADC10CTL1 & BUSY);         //wait..i am converting..pum..pum..
    t=ADC10MEM;                       //store val in t
    ADC10CTL0&=~ENC;                     //disable adc conv
    return(int) ((t * 27069L - 18169625L) >> 16); //convert and pass
}
void frase(){
if((P1IN&BIT3)==0){
      char tfrase[60];
    
     
      sprintf(tfrase,"\n Bolsonaro 2018");
      tx_frase(tfrase);
    }
}

void comando(char dado)
{
    if(dado=='V'){
      P1OUT |= BIT0;
     }
    if(dado=='v'){
      P1OUT &= ~BIT0;
     }
    if(dado=='C'){
      P1OUT |= BIT6;
    }
    if(dado=='c'){
      P1OUT &= ~BIT6;
    }
    if(dado=='T'){
      char temperatura[10];
      sprintf(temperatura,"%f\n\r",tempOut());
      tx_frase(temperatura);
    }
    if(dado=='t'){
      char tx[10];
      float tp; 
      tp= tempOut()*9/5+32;
     
      sprintf(tx,"%f\n\r",tp);
      tx_frase(tx);
    }
    
    
}

void main( void )
{
  volatile int temp;    //initialise  
  // Desativando o watchdog
    WDTCTL = WDTPW + WDTHOLD;
    temp=0;
    tempInit();//initialise adc
    // Configurando o clock em 1MHz. Ajusta o clock para 1MHz para gerar a temporizacao correta para a interface serial
    BCSCTL1 = CALBC1_1MHZ;
    DCOCTL = CALDCO_1MHZ;
    
    P1DIR |= BIT0 + BIT6;
    P1DIR &= ~BIT3;
    P1REN |= BIT3;
    P1OUT|=BIT3;
    P1OUT &= ~(BIT0 + BIT6);
    
    // Configurando a interface serial em 9600, 8n1
    UCA0CTL1 |= UCSWRST;        // Coloca UART em reset
    UCA0CTL0 = 0x00;		// Sem paridade, bit menos significativo primeiro, 8 bits de dados, 1 stop bit, modo UART, modo assincrono
    UCA0CTL1 |= UCSSEL_2;       // Seleciona SMCLK como o sinal de clock da interface serial
    UCA0BR0 = 0x68;             // Seleciona taxa de 9600
    UCA0BR1 = 0x00;		// Seleciona taxa de 9600
    UCA0MCTL = 0x02;		// Seleciona taxa de 9600
    
    // Configura pinos de RX e TX
    P1SEL |= BIT1 + BIT2;	// Seleciona a funcao de TX e RX da serial para os pinos P1.1 e P1.2
    P1SEL2 |= BIT1 + BIT2;	// Seleciona a funcao de TX e RX da serial para os pinos P1.1 e P1.2
 
    UCA0CTL1 &= ~UCSWRST;        // Retira UART do reset
    
    // configura interrupcaoes da interface serial (recepcao)
    IE2 |= BIT0;		// Ativa a interrucao da interface serial (recepcao)
    IFG2 &= ~UCA0RXIFG;		// limpa o flag de interrupcao da interface serial (recepcao)

    tempInit();
    __enable_interrupt();	// habilita as interrupcoes
    
    tx_frase("\n\rEL08D-T11 Microcontroladores 2\n\r");	// envia uma frase de teste
    
    

    
    while(1)
    {
      
      if((P1IN&BIT3)==0){
      char tfrase[60];
      sprintf(tfrase,"\n Bolsonaro 2018");
      tx_frase(tfrase);
      __delay_cycles(100000);
    }
      if(dado_rx != 0) // verifica se existe um caracter a ser transmitido
      {
        comando(dado_rx);	// transmite o caracter recebido
        dado_rx = 0;		// 0 significa que nao tem caracter novo recebido
      }
    }
}