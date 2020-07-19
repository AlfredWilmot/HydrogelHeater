#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <math.h>

const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to

int value  = 0;        // value read from the pot
int prev_val = 0;      // previou measured value

int avg_max  = 20;      // how many samples are averaged over.
int avg_cnt  = avg_max; // tracks samples for averaging.
int avg_sum  = 0;       // running sum.

float I_sense = 0.000038;  //constant current passing through NTC thermistor (30uA)
float R_100k  = 100000;   // 100k Ohms @ 25C
float beta    = 3950;  // B25/50: https://www.makeralot.com/download/Reprap-Hotend-Thermistor-NTC-3950-100K.pdf

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);


float Temp(int value)
{
  float V0 = 5-5*(float(value)/1024);
  float R1 = V0/I_sense;
  float T = 1/((1/beta)*log(R1/R_100k) + (1/298.15)) - 273.15;
  return T;
}

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
  
  // I2C preamble for OLED display.
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Preparing display
  display.display();
  delay(1000);
  display.clearDisplay();
  display.setTextSize(3.5);      // Normal 1:1 pixel scale
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(0, 0);     // Start at top-left corner
  //display.cp437(true);         // Use full 256 char 'Code Page 437' font
}

void loop() {
  // read the analog in value:
  value = analogRead(analogInPin);

  // add to running sum, and decrement sample counter
  if(avg_cnt > 0)
  {
    avg_sum += value;
    avg_cnt --;
  }
  

  // Print averaged values onto display
  if(value != prev_val and avg_cnt == 0)
  {
    
    // print data to the Serial Monitor:
    Serial.println(Temp(value));
    
    // show data on OLED 128x32 display
    display.setCursor(0, 0);
    display.clearDisplay();
    display.println(Temp(avg_sum/avg_max));
    display.display();  

    // reset avg counter and summer
    avg_sum = 0;
    avg_cnt = avg_max;
  }

  prev_val = value;
   
  delay(2);
}
