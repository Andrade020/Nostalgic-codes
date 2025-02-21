#include <Adafruit_SSD1306.h>
#include <Adafruit_GFX.h>
Adafruit_SSD1306 dsp(-1);//cria o objeto do display para i2c
const int xpin = 0;                  // x-axis of the accelerometer
const int ypin = 1;                  // y-axis
const int zpin = 2;                  // z-axis (only on 3-axis models)

float xt, yt, zt, xmin,ymin,zmin, xM,yM,zM, t=10, axm[10],aym[10],azm[10], Xmed,Ymed,Zmed, Xmedio, Ymedio, Zmedio, ax, ay, az, aceleracao = 0, distancia=0, tempo = 0, timer=0; 
int xsom=0, c, ar; 
void setup()
{
  dsp.begin(SSD1306_SWITCHCAPVCC, 0x3C);//inicia o display com endereco padrao
  dsp.clearDisplay();//limpa a tela
  dsp.setTextColor(WHITE);//define o texto para branco (no display ficara azul)
  dsp.setTextSize(1);//define o tamanho do texto
  dsp.display();//mostra as alteracoes no display, sem isso nao ira mostrar nada!!
  dsp.clearDisplay();
  // initialize the serial communications:
 Serial.begin(9600);
 xmin = analogRead(xpin);  //read from xpin
 ymin = analogRead(ypin);  //read from xpin
 zmin = analogRead(zpin);  //read from xpin
 xM = analogRead(xpin);  //read from xpin
 yM = analogRead(ypin);  //read from xpin
 zM = analogRead(zpin);  //read from xpin
xt = analogRead(xpin);  //read from xpin
 yt = analogRead(ypin);  //read from xpin
 zt = analogRead(zpin);  //read from xpin
}
void loop()
{
 int x = analogRead(xpin);  //read from xpin
  
 int y = analogRead(ypin);  //read from ypin
 
 int z = analogRead(zpin);  //read from zpin
 
float zero_G = 512.0; //ADC is 0~1023  the zero g output equal to Vs/2
                      //ADXL335 power supply by Vs 3.3V
float scale = 102.3;  //ADXL335330 Sensitivity is 330mv/g
                       //330 * 1024/3.3/1000  
tempo=0; 
/*Serial.print(x); 
Serial.print("\t");
Serial.print(y);
Serial.print("\t");
Serial.print(z);  
Serial.print("\n");*/
//Serial.print("\n");

Xmed= 0;
for (c=0; c<20; c++)
{
  x = analogRead(xpin);
  Xmed=Xmed+(float)x; 
  delay(5);
  tempo = tempo + 5; 
}
Xmedio=Xmed/20; 

Ymed= 0;
for (c=0; c<20; c++)
{
  y = analogRead(ypin);
  Ymed=Ymed+(float)y; 
  delay(5); 
  tempo = tempo + 5; 
}
Ymedio=Ymed/20;

Zmed= 0;
for (c=0; c<20; c++)
{
  z = analogRead(zpin);
  Zmed=Zmed+(float)z; 
  delay(5);
  tempo = tempo + 5;  
}
Zmedio=Zmed/20; 

ax=(Xmedio-351)*9.80665/71; 
ay=(Ymedio-354)*9.80665/71; 
az=(Zmedio-365)*9.80665/71; 

delay(t);

tempo = tempo + t;
tempo = tempo/1000;
ar = sqrt(ax*ax + ay*ay + az*az) - 9.80665;
aceleracao = aceleracao + ar;
distancia = (aceleracao * tempo*tempo) /2;

Serial.print(distancia);
Serial.print(" \n ");


timer=timer+tempo+(30/1000); 

 dsp.setCursor(0,0);
 
 dsp.print("distancia: ");
  dsp.println(distancia);

  dsp.print("aceleracao: ");
  dsp.println(ar);

    dsp.print("tempo: ");
  dsp.println(int(timer));
  dsp.display();//mostra as alteracoes no display, sem isso nao ira mostrar nada!!
 // delay(2000);
  dsp.clearDisplay();





}

