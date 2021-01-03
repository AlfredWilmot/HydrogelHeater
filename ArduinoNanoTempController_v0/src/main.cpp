#include <Arduino.h>
#include "my_sensors.h"
#include "Adafruit_SSD1306.h"
#include "Adafruit_GFX.h"

// I2C IR sensor libs
#include "Wire.h"
#include "Adafruit_MLX90614.h"
/* Reference code taken from: https://miliohm.com/non-contact-temperature-sensor-mlx90614-arduino-tutorial/ */
Adafruit_MLX90614 IR_sense = Adafruit_MLX90614();


/*TODO: 
    > Add more indicator LEDs to the board for diagnostics.
    > Can also add information into classes from datasheets to also consider sensor accuracy/ precision.
*/

/* Resources for setting-up Ardunio programming in VS-Code:

-> Tutorial for settin-up PlatformIO for Arduino programming  (https://www.youtube.com/watch?v=dany7ae_0ks) 
-> Explore config files for different MCUs; not jsut Arduino  (https://platformio.org/boards)
-> Config settings for Arduino Nano                           (https://docs.platformio.org/en/latest/boards/atmelavr/nanoatmega328.html)

*/

// Allocating the A0 and A7 ADC pins to the NTC thermistor and I-sense monitor, respectively.
NTC_thermistor my_ntc(Arduino_h::A0);
I_sensor INA283(Arduino_h::A7, 10);

// Setup encoder push-button
EncoderPushButton EC11(2,3,4);
void encoder_ISR_handler()
{
  EC11.encoder_handler();
}


//Arduino_h::attachInterrupt(digitalPinToInterrupt(2), EC11.read_encoder_val(), CHANGE);

  //attachInterrupt(digitalPinToInterrupt(IN_B), test, CHANGE);
  //attachInterrupt(digitalPinToInterrupt(SW), test, RISING);


// Setting up the LCD
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Setting up the pins for the L298N motor-driver (used to drive the peltier element)
#define IN_1 8
#define IN_2 7
#define EN_A 6

// #define IN_3 9
// #define IN_4 10
// #define EN_B 11

// Setting up SPI-based K-type thermocouple (uses MAX6675 chip)
K_type_couple MAX6675(MAX6675_CS);


//target temperature designated by the user
float set_point = 0.0;
// read temperature is determined by the sensor being used
float read_temperature = 0.0;

// other menu control variables
int toggle_sense = 0;
int prev_state = EC11.get_state();


// Control loop variables
#define window_width 10 
float rolling_window[window_width];     // averages consecutive values (behaves like FIFO buffer)
float hyst_gap = 0.1;                   // smallest "acceptable" error (ie +/- 0.1C)
float kp = 20;                         // proportional gain
float ki = 0.2;                         // integral gain
float err = 0;                          // error term (difference between measured value and setpoint for a given time-step)
float hyst_val = 0.1;                   // hysteresis gap (i.e. +/- 0.1C)
float driving_signal = 0;               // value used to drive the output current through the peltier device [0,255]



/* ------------------------------------------------------------------------------------------- */
/* -------------------------------------- ONE-TIME SETUP-------------------------------------- */
/* ------------------------------------------------------------------------------------------- */
void setup()
{

  // preset all the rolling window values to 0 (for the control-loop)
  for (int i=0; i<window_width; i++)
  {
    rolling_window[i] = 0;
  }

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


  //set up Interrupts on encoder pins
  attachInterrupt(digitalPinToInterrupt(2), encoder_ISR_handler, CHANGE);
  attachInterrupt(digitalPinToInterrupt(3), encoder_ISR_handler, CHANGE); 
  attachInterrupt(digitalPinToInterrupt(4), encoder_ISR_handler, CHANGE); 
  //initialize the setpoint to equal the ambient temperature of the thermocouple.
  set_point = MAX6675.read();

}

/* ------------------------------------------------------------------------------------------- */
/* ---------------------------------------- MAIN LOOP ---------------------------------------- */
/* ------------------------------------------------------------------------------------------- */
void loop()
{

  // sample the encoder counter so the SP can be adjusted in steps of 0.1C.
  set_point += float(EC11.get_turn_count())/10;

  // threshold the set-point
  set_point > 100 ? set_point = 100: set_point = set_point;
  set_point < 0 ? set_point = 0: set_point = set_point;
  
  
  /*
    ----
    MENU
    ----

    > Overview screen
    > encoder button press -> go to "config submenu" -> can configure temperature sensor used, temperature resolution (fine [0.1], coarse [1.0], v_coarse [5.0]), adjust PID params.
    > Rotate encoder (adjusts set-point based on variables set in the config menu)
  
  */





  /*Display analytics*/ 
  // show data on OLED 128x32 display
  display.clearDisplay();

  display.setCursor(0, 0);
  display.print("Encoder: ");
  display.setCursor(100, 0);
  display.print(set_point,1);

  // display.setCursor(0, 10);
  // display.print("ADC I-sense: ");
  // display.setCursor(100, 10);
  // display.print(int(INA283.read()));

  display.setCursor(0, 10);
  display.print("Driving signal: ");
  display.setCursor(100, 10);
  display.print(int(driving_signal));


  if (EC11.get_state() == btn_push and prev_state != btn_push)
  {
    toggle_sense^=1;
    prev_state = btn_push;
  }
  else if (EC11.get_state() != btn_push)
  {
    prev_state = EC11.get_state();
  }
  
  if (toggle_sense)
  {
  display.setCursor(0, 20);
  display.print("IR-sensor: ");
  display.setCursor(100, 20);
  read_temperature = IR_sense.readObjectTempC();
  display.print(read_temperature, 1);
  }
  else
  {
  display.setCursor(0, 20);
  display.print("k-type: ");
  display.setCursor(100, 20);
  read_temperature = MAX6675.read();
  display.print(read_temperature,1);
  }
  
  display.display(); 

  
// This all needs to be combined with the PID loop
  // //move motor CW if encoder val > 0, CCW if < 0, and stop if == 0.
  if (set_point - read_temperature > 0)
  {
    digitalWrite(IN_1,HIGH);
    digitalWrite(IN_2, LOW);
  }
  else if (set_point - read_temperature < 0)
  {
    digitalWrite(IN_1,LOW);
    digitalWrite(IN_2, HIGH);
  }
  else
  {
    digitalWrite(IN_1,LOW);
    digitalWrite(IN_2, LOW);
  }
  
  /*-------------------*/
  /* MAIN CONTROL LOOP */
  /*-------------------*/

  // calculate latest error term
  err = abs(set_point-read_temperature);

  // shift all elements to the right and feed newest err term to the FIFO buffer
  for (int i = window_width-1; i>0; i--)
  {
    rolling_window[i] = rolling_window[i-1];
  }
  rolling_window[0] = err;


  float accumulator = 0,  // running sum of values seen in rolling window.
    avg_err = 0;      // average of values seen in rolling window.


  // calculate the sum and average error from the rolling window.
  for (int i = 0; i < window_width; i++)
  {
    accumulator += rolling_window[i];
  }
  avg_err = accumulator/window_width;


  // Use the gain values to scale the driving signal (want accumulated errors to address )

  if (avg_err > hyst_val)
  {
    driving_signal = (accumulator*ki + avg_err)*kp;
  }
  else
  {
    driving_signal = 0;
  }
  
  //limit output current
  driving_signal > 220 ? driving_signal = 220 : driving_signal = driving_signal; 

  // feed current to peltier device
  analogWrite(EN_A, int(driving_signal));
  
  //transmit data over serial port
  Serial.println(set_point);
  Serial.println(read_temperature);
  //Serial.println(driving_signal);
  }