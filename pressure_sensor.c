#include <Adafruit_GFX.h>      // vale a pena baixar as bibliotecas
#include <Adafruit_PCD8544.h> // para isso, vá em sketch->incluir biblioteca->adicionar arquivo zip

#include <Wire.h>
#include <Nanoshield_ADC.h>
// pin 8 - Serial clock out (SCLK)
// pin 9 - Serial data out (DIN)
// pin 10 - Data/Command select (D/C)
// pin 11 - LCD chip select (CS/CE)
// pin 12 - LCD reset (RST)

Adafruit_PCD8544 display = Adafruit_PCD8544(8, 9, 10, 11, 12);

Nanoshield_ADC adc;
int channel = 0;
float value; 
float valor;
float pct;
void setup()
{
  Serial.begin(9600);
  Serial.print("16-bit ADC Nanoshield Test - Read 4-20mA sensor (channel A");
  Serial.print(channel);
  Serial.println(")");
  adc.begin();

  // Adjust gain to two (2.048V range) to get maximum resolution for 4-20mA range
  adc.setGain(GAIN_TWO);
}

void loop()
{
   display.begin();
  display.setContrast(60); //Ajusta o contraste do display

  display.clearDisplay();   //Apaga o buffer e o display
  display.setTextSize(1.5);  //Seta o tamanho do texto
  display.setTextColor(BLACK); //Seta a cor do texto
  display.setCursor(0,0);  //Seta a posição do cursor
 
 // display.print(channel);
  //  display.print("%");
  //Serial.print(adc.read4to20mA(channel), 6);
  value=adc.read4to20mA(channel);
  valor=((value-4)*6.25);
  pct=valor; 
 
  //Serial.println("mA");             // para abrir o serial basta teclar ctrl+shif+m
  Serial.print("valor  ");
  Serial.println(valor);
   Serial.print("value  ");
  Serial.println(value);
  if(value< 4){
    display.print("Corrente Baixa! ");
    
    }
    else{
  
   display.print("Sa: ");
   display.print(pct);
   display.print(" MP");
    }
  delay(100);
  display.display();     // apaga o display 
}