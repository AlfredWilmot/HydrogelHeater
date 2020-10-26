/*
  Rotary encoder used:
  https://tech.alpsalpine.com/prod/e/html/encoder/incremental/ec11/ec11b15242b1.html

  Reference material:
  https://dronebotworkshop.com/rotary-encoders-arduino/
  
*/

// rotary encocer pins
#define IN_A 2  //pulse-train A
#define IN_B 3  //pulse-train B
#define SW 4    //momentary switch, D4
#define LED 13    //on-board indicator LED

int count = 0;  //count pulses
int IN_A_new;   
int IN_A_old;

void setup() {
  
  //configuring internal pup resistors (20k to 5V)
  pinMode(SW, INPUT_PULLUP); 
  pinMode(IN_A, INPUT_PULLUP); 
  pinMode(IN_B, INPUT_PULLUP); 
  pinMode(LED, OUTPUT);

  //start serial connection
  Serial.begin(9600);

  //assign the initial state of the IN_A pin to IN_A_old
  IN_A_old = digitalRead(IN_A);
  
}

void loop() {

  /*---------------------------------------*/
  //read the push-button state
  int sensorVal = digitalRead(SW);

  //update indicator LED
  if (sensorVal == HIGH) 
  {
    digitalWrite(LED, LOW);
  } 
  else 
  {
    digitalWrite(LED, HIGH);
  }
  /*---------------------------------------*/

  IN_A_new = digitalRead(IN_A);
  
  if (IN_A_new != IN_A_old)
  { 
    if (digitalRead(IN_B) != IN_A_new) 
    { 
      // Encoder is rotating CCW
      count --;
      digitalWrite(LED, HIGH);
      delay(100);
      digitalWrite(LED, LOW);
      delay(100);
     } 
     else 
     {
      // Encoder is rotating CW
      count ++;
      digitalWrite(LED, HIGH);
      delay(100);
      digitalWrite(LED, LOW);
      delay(100);
      digitalWrite(LED, HIGH);
      delay(100);
      digitalWrite(LED, LOW);
     }






  }

  
}
