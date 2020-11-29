#include "my_sensors.h"

/*--------------------------------------------------------------------------------*/
// Encoder push-button code
/*--------------------------------------------------------------------------------*/

EncoderPushButton::EncoderPushButton(int IN_A, int IN_B, int SW)
{
  //configuring internal pup resistors (20k to 5V)
  pinMode(SW, INPUT_PULLUP); 
  pinMode(IN_A, INPUT_PULLUP); 
  pinMode(IN_B, INPUT_PULLUP);   

  //setup the on-board LED.
  pinMode(LED_BUILTIN, OUTPUT);

  //designate encoder pins
  this->_sw = SW;
  this->_pin_a = IN_A;
  this->_pin_b = IN_B;

  //pre-loading the "old value" so there's something for the new value to compare to.
  this->_in_a_old = digitalRead(IN_A);

}





/*Read and return the push-button state.
  Pushing the button will reset the counter.*/
int EncoderPushButton::read_sw_state()
{
  // check pin.
  this->_sw_state = digitalRead(this->_sw);

  // use on-board LED to indicate state.
  if (this->_sw_state == HIGH) 
  {
    digitalWrite(LED_BUILTIN, LOW);
  } 
  else 
  {
    digitalWrite(LED_BUILTIN, HIGH);
    this->_pulse_count = 0;
  }
  return this->_sw_state;
}





/* Will vary from -100 (fully CCW) to +100 (fully CW) as soft limits.*/
int EncoderPushButton::read_encoder_val()
{
  this->_in_a_new = digitalRead(this->_pin_a);
  
  // Checking to see if the encoder is moving.
  if (this->_in_a_new != this->_in_a_old)
  { 

    //prevents unwanted incremnets between 
    if (!this->_transition_flag)
    {
      digitalWrite(LED_BUILTIN, HIGH);
      this->_transition_flag = true;
      return this->_pulse_count;
    }
    

    // Checking the direction of the encoder's roation.
    if (digitalRead(this->_pin_b) != (this->_in_a_new))
    { 
      // Encoder is rotating CCW
      this->_pulse_count -= this->_pulse_step;
    } 
    else 
    {
      // Encoder is rotating CW
      this->_pulse_count += this->_pulse_step;
    }
  }
  
  //ensure that the pulse count doesn't exceed the designated limit.
  if (this->_pulse_count > this->_pulse_lim)
  {
    this->_pulse_count = this->_pulse_lim;
  }
  else if (this->_pulse_count < -this->_pulse_lim)
  {
    this->_pulse_count = -this->_pulse_lim;
  }
  
  
  //update the "old" value.
  this->_in_a_old = this->_in_a_new;

  // wait for button debounce.
  delay(2);

  digitalWrite(LED_BUILTIN, LOW);
  this->_transition_flag = false;
  return this->_pulse_count;
}





/*--------------------------------------------------------------------------------*/
// NTC-thermistor code
/*--------------------------------------------------------------------------------*/

/*Initialize the NTC sensor object, and store the allocated ADC pin.*/
NTC_thermistor::NTC_thermistor(uint8_t pin)
{
  this->_pin = pin;
}





/* samples the NTC ADC, then returns either the raw ADC value or the calculated tempearture.*/
float NTC_thermistor::read(bool get_raw)
{
  // sample ADC
  this->_value = analogRead(this->_pin);

  if (get_raw)
  {
    return float(_value);
  }
  else
  {
    float V0 = 5-5*(float(_value)/1024);
    float R1 = V0/_I_sense;
    float T = 1/((1/_beta)*log(R1/_R_100k) + (1/298.15)) - 273.15;
    return T;
  }
}





/*--------------------------------------------------------------------------------*/
// Shunt I-sensor code
/*--------------------------------------------------------------------------------*/

/*Initialize the I-sense sensor object, and store the allocated ADC pin.*/
I_sensor::I_sensor(uint8_t pin, int avg)
{
  //allocate the pin and set number of measurements to be averaged across.
  this->_pin = pin;
  this->_avg = avg;

  //initialize the sensor value.
  this->_value = analogRead(this->_pin);

}



/* samples the I-sensor, then returns either the raw ADC value or the calculated current.*/
float I_sensor::read(bool get_raw)
{
  int tmp = analogRead(this->_pin);

  if (this->_avg_count < this->_avg)
  {
    this->_accumulator += tmp;
    this->_avg_count++;
  }
  else
  {
    this->_value = int(this->_accumulator / this->_avg);
    this->_avg_count = 0;
    this->_accumulator = 0;
  }
  
  
  

  if (get_raw)
  {
    return float(this->_value);
  }
  else
  {
    /*TODO calculate current from I-sense reading*/
  }
  

  return float(this->_value);
}



/*--------------------------------------------------------------------------------*/
// K-type thermocouple using MAX6675
/*--------------------------------------------------------------------------------*/
// Source: http://www.electronoobs.com/eng_arduino_tut24_code3.php

//The function that reads the SPI data from MAX6675
double readThermocouple() {

  uint16_t v;
  pinMode(MAX6675_CS, OUTPUT);
  pinMode(MAX6675_SO, INPUT);
  pinMode(MAX6675_SCK, OUTPUT);
  
  digitalWrite(MAX6675_CS, LOW);
  delay(1);

  // Read in 16 bits,
  //  15    = 0 always
  //  14..2 = 0.25 degree counts MSB First
  //  2     = 1 if thermocouple is open circuit  
  //  1..0  = uninteresting status
  
  v = shiftIn(MAX6675_SO, MAX6675_SCK, MSBFIRST);
  v <<= 8;
  v |= shiftIn(MAX6675_SO, MAX6675_SCK, MSBFIRST);
  
  digitalWrite(MAX6675_CS, HIGH);
  if (v & 0x4) 
  {    
    // Bit 2 indicates if the thermocouple is disconnected
    return NAN;     
  }

  // The lower three bits (0,1,2) are discarded status bits
  v >>= 3;

  // The remaining bits are the number of 0.25 degree (C) counts
  return v*0.25;
}



/*--------------------------------------------------------------------------------*/
// PID loop code
/*--------------------------------------------------------------------------------*/
// Source: http://www.electronoobs.com/eng_arduino_tut24_code3.php



int PID_loop(float set_temp, float read_temp)
{

  //Next we calculate the error between the setpoint and the real value
  PID_error = set_temp - read_temp + 3;
  //Calculate the P value
  PID_p = 0.01*kp * PID_error;
  //Calculate the I value in a range on +-3
  PID_i = 0.01*PID_i + (ki * PID_error);
  
  //For derivative we need real time to calculate speed change rate
  timePrev = Time;                            // the previous time is stored before the actual time read
  Time = millis();                            // actual time read
  elapsedTime = (Time - timePrev) / 1000; 
  //Now we can calculate the D calue
  PID_d = 0.01*kd*((PID_error - previous_error)/elapsedTime);
  //Final total PID value is the sum of P + I + D
  PID_value = PID_p + PID_i + PID_d;

  //We define PWM range between 0 and 255
  if(PID_value < 0)
  {    PID_value = 0;    }
  if(PID_value > 255)  
  {    PID_value = 255;  }

  previous_error = PID_error;     //Remember to store the previous error for next loop.

  return PID_value;

}