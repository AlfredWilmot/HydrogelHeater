#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to
int sensorValue  = 0;        // value read from the pot
int prev_val = 0;
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

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
  display.setTextSize(4.5);      // Normal 1:1 pixel scale
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(0, 0);     // Start at top-left corner
  //display.cp437(true);         // Use full 256 char 'Code Page 437' font
}

void loop() {
  // read the analog in value:
  sensorValue = analogRead(analogInPin);

  // print the results to the Serial Monitor:
  Serial.println(sensorValue);

  if(sensorValue != prev_val)
  {
    display.setCursor(0, 0);
    display.clearDisplay();
    display.println(sensorValue);
    display.display();  
  }

  prev_val = sensorValue;
   
  delay(2);
}
