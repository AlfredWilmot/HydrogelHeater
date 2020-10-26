#include <Arduino.h>
#include "my_sensors.h"
#include "Adafruit_SSD1306.h"
#include "Adafruit_GFX.h"

/*TODO: 
    > Add more indicator LEDs to the board for diagnostics.
    > Can also add information into classes from datasheets to also consider sensor accuracy/ precision.
*/

/* Resources for setting-up ARdunio programming in VS-Code:

-> Tutorial for settin-up PlatformIO for Arduino programming  (https://www.youtube.com/watch?v=dany7ae_0ks) 
-> Explore config files for different MCUs; not jsut Arduino  (https://platformio.org/boards)
-> Config settings for Arduino Nano                           (https://docs.platformio.org/en/latest/boards/atmelavr/nanoatmega328.html)

*/

// Allocating the A0 and A7 ADC pins to the NTC thermistor and I-sense monitor, respectively.
NTC_thermistor my_ntc(Arduino_h::A0);
I_sensor INA283(Arduino_h::A7, 10);

// Setup encoder push-button
EncoderPushButton EC11(2,3,4);

// Setting up the LCD
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Setting up the pins for the L298N motor-driver (used to drive the peltier element)
#define IN_1 8
#define IN_2 7
#define EN_A 6

#define IN_3 9
#define IN_4 10
#define EN_B 11

void setup()
{

  // Setup motor-driver pins
  pinMode(EN_A,OUTPUT);
  pinMode(IN_1,OUTPUT);
  pinMode(IN_2,OUTPUT);


  // Setup serial comms.
  Serial.begin(9600);
  pinMode(LED_BUILTIN,OUTPUT);

  // I2C preamble for OLED display.
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Preparing display
  display.display();
  delay(1000);
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(0, 0);     // Start at top-left corner
  //display.cp437(true);         // Use full 256 char 'Code Page 437' font
}

void loop()
{

  int tmp = EC11.read_encoder_val();

  //move motor CW if encoder val > 0, CCW if < 0, and stop if == 0.
  if (tmp > 0)
  {
    digitalWrite(IN_1,HIGH);
    digitalWrite(IN_2, LOW);
  }
  else if (tmp < 0)
  {
    digitalWrite(IN_1,LOW);
    digitalWrite(IN_2, HIGH);
  }
  else
  {
    digitalWrite(IN_1,LOW);
    digitalWrite(IN_2, LOW);
  }
  
  //motor speed (i.e. current draw is determined by the magnitude of the encoder counter)
  analogWrite(EN_A, int( (255/100)*abs(tmp) ));
  
  // check the switch
  EC11.read_sw_state();

  // show data on OLED 128x32 display
  display.clearDisplay();

  display.setCursor(0, 0);
  display.print("Encoder: ");
  display.setCursor(100, 0);
  display.print(tmp);
  
  display.setCursor(0, 10);
  display.print("ADC I-sense: ");
  display.setCursor(100, 10);
  display.print(int(INA283.read()));
  
  display.setCursor(0, 20);
  display.print("NTC-thermistor: ");
  display.setCursor(100, 20);
  display.print(my_ntc.read(), 1);
  display.display(); 
  delay(10);
  }