

 #include <Adafruit_SSD1306.h>
#include <Adafruit_GFX.h>
Adafruit_SSD1306 dsp(-1);

const int xpin=A0;
int ypin=A1;
int zpin=A2;
 float distance; 
int powerpin=A3;
int gnd=A4;

float threshhold=80.0, t=0;

float xval[100]={0};
float yval[100]={0};
float zval[100]={0};
float xavg;
  float yavg;
  float zavg;
  
int steps,flag=0;
void setup()
{ 

dsp.begin(SSD1306_SWITCHCAPVCC, 0x3C);//inicia o display com endereco padrao
  dsp.clearDisplay();//limpa a tela
  dsp.setTextColor(WHITE);//define o texto para branco (no display ficara azul)
  dsp.setTextSize(1);//define o tamanho do texto
  dsp.display();//mostra as alteracoes no display, sem isso nao ira mostrar nada!!
  dsp.clearDisplay();
  
Serial.begin(9600);
//pinMode(powerpin,OUTPUT);
//pinMode(gnd,OUTPUT);
//digitalWrite(powerpin,HIGH);
//digitalWrite(gnd,LOW);
//pinMode(13,OUTPUT);
calibrate();


}



void loop()
{
  int acc=0;
  float totvect[100]={0};
float totave[100]={0};
 //float sum1,sum2,sum3=0;
  float xaccl[100]={0};
   float yaccl[100]={0};
    float zaccl[100]={0};
   // float x,y,z;
   
  
for (int i=0;i<100;i++)
{
xaccl[i]=float(analogRead(xpin));
delay(1);


//delay(100);
//x=sum1/100.0;

//Serial.println(xavg);


yaccl[i]=float(analogRead(ypin));
delay(1);

//sum2=yaccl[i]+sum2;

//y=sum2/100.0;

//Serial.println(yavg);
//delay(100);

zaccl[i]=float(analogRead(zpin));
delay(1);

//sum3=zaccl[i]+sum3;
//z=sum3/100;


 totvect[i] = sqrt(((xaccl[i]-xavg)* (xaccl[i]-xavg))+ ((yaccl[i] - yavg)*(yaccl[i] - yavg)) + ((zval[i] - zavg)*(zval[i] - zavg)));
 totave[i] = (totvect[i] + totvect[i-1]) / 2 ;
 //acc=acc+totave[i];
 Serial.println(totave[i]);
 delay(200);

//cal steps 
if (totave[i]>threshhold && flag==0)
{
  steps=steps+1;
  flag=1;
 
}
 else if (totave[i] > threshhold && flag==1)
{
//do nothing 
}
  if (totave[i] <threshhold  && flag==1)
  {flag=0;}
  Serial.println('\n');
  Serial.print("distance=");
 distance=steps*0.6; 
  Serial.println(distance);



dsp.setCursor(0,0);
 
 dsp.print("distancia: ");
  dsp.println(distance);
 


t=t+0.33; 
dsp.print("tempo: ");
  dsp.println(int(t));
  
  dsp.display();
 delay(50);
// stepcal(totave);
 dsp.clearDisplay();
}


//float tim=acc/100;
//Serial.println(tim);

 delay(1000);
// stepcal(totave);
 dsp.clearDisplay();

}






/*void stepcal(float arr[100])
{   


// int threshhold=80; 
 float jack=0;
//delay(100)
//Serial.println(xavg);
for (int i=0;i<100;i++)
{
jack=jack+arr[i];


}
float m=jack/100;

//Serial.println(yavg);
//delay(100);


 //detect pushups or count  for number of dumbles
 
 //crossing the threshold and 
 
 //cross 20 in down and 80 in up 
 
 /*add one to counter and set a flag high to indicate it is above a threshhold value 

if a flag is high and threshhold is crossed :do nothing }
if signal falls below threshhold set flag to -1 indicating it is blow threshhold


if (m>threshhold && flag==0)
{
  steps=steps+1;
  flag=1;
  Serial.println('\n');
  Serial.print("steps=");
  Serial.println(steps);
}

else if (m > threshhold && flag==1)
{
//do nothing 
}
  if (m <threshhold  && flag==1)
  {flag=0;}
  Serial.println('\n');
  Serial.print("steps=");
  Serial.println(steps);
}  */
  
  

//calculate total accerelation vector







void calibrate()

{

  digitalWrite(13,HIGH);
  
  float sum=0;
  float sum1=0;
  float sum2=0;
for (int i=0;i<100;i++)
{
xval[i]=float(analogRead(xpin));

sum=xval[i]+sum;
}
delay(100);
xavg=sum/100.0;

Serial.println(xavg);

for (int j=0;j<100;j++)
{
xval[j]=float(analogRead(xpin));

sum1=xval[j]+sum1;
}
yavg=sum1/100.0;

Serial.println(yavg);
delay(100);
for (int i=0;i<100;i++)
{
zval[i]=float(analogRead(zpin));

sum2=zval[i]+sum2;
}
zavg=sum2/100.0;
delay(100);

Serial.println(zavg);

digitalWrite(13,LOW);

}

