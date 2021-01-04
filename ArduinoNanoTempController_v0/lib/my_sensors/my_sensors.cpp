#include "my_sensors.h"
#include "SPI.h"
/*--------------------------------------------------------------------------------*/
// Encoder push-button code
/*--------------------------------------------------------------------------------*/

// Some useful notes on interrupts: https://gammon.com.au/interrupts

EncoderPushButton::EncoderPushButton(int IN_A, int IN_B, int SW)
{
  //configuring internal pup resistors (20k to 5V)
  pinMode(SW, INPUT_PULLUP); 
  pinMode(IN_A, INPUT_PULLUP); 
  pinMode(IN_B, INPUT_PULLUP);   

  //setup the on-board LED.
  pinMode(LED_BUILTIN, OUTPUT);

  //designate encoder pins
  _sw = SW;
  _pin_a = IN_A;
  _pin_b = IN_B;

  //pre-loading the "old value" so there's something for the new value to compare to.
  _prev_val |= (digitalRead(IN_A) << 1);
  _prev_val |= (digitalRead(IN_B) << 0);

}





/*Attempts to "safely" check the state of the encoder*/
int EncoderPushButton::get_state(bool reset_state)
{

  if (!digitalRead(_sw))
  {
    _enc_state = btn_push;
  }

  int tmp = _enc_state;

  if (reset_state)
  {
    _enc_state = unmoved;
  }
  
  return tmp;
}


/* Safely sets the turn-count varaible by ensuring no other contexts are accessing it*/
int EncoderPushButton::get_turn_count(bool reset_count)
{

  int tmp;

  tmp = _count;

  if (reset_count)
  {
    _count = 0;
  }

  return tmp;
}



/* Will vary from -100 (fully CCW) to +100 (fully CW) as soft limits.*/
void EncoderPushButton::encoder_handler()
{
  
  //one single "tick" of the encoder corresponds to a 2-bit resolution of values [0..3]
  int latest_val = 0;
  latest_val |= (digitalRead(_pin_a) << 1);
  latest_val |= (digitalRead(_pin_b) << 0);

  // CW rotation  --> 3,1,0,2
  // CCW rotation --> 3,2,0,1

  //ignore repeated readings (noise)
  if(latest_val != _prev_val)
  {
    if ( (latest_val == 3 && _prev_val == 2) || (latest_val == 1 && _prev_val == 3) || (latest_val == 0 && _prev_val == 1) || (latest_val == 2 && _prev_val == 0) )
    {
      _sub_count++;
      _enc_state = cw_turn;
    }
    else
    {
      _sub_count--;
      _enc_state = ccw_turn;
    }

    //encoder resting value is high for both pins (0b11 = 3)
    if(latest_val == 3 && (_sub_count%4 == 0) )
    {
      
      _sub_count = 0; //reset sub-count

      if(_prev_val == 1) //implies CW rotation
      {
        _count++;
      }
      if(_prev_val == 2) //implies CCW rotation
      {
        _count--;
      }
    }
    _prev_val = latest_val;
  }

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
// useful resources:  https://www.best-microcontroller-projects.com/arduino-shiftin.html
//                    http://arduinolearning.com/code/max6675-and-arduino-example.php
//                    

K_type_couple::K_type_couple(uint8_t cs_pin)
{

  this->_value = 0.0;
  this->_cs = cs_pin;

  // start the conversion timer.
  this-> _conversion_timer = millis();

  // configuring the SPI pins.
  pinMode(cs_pin, OUTPUT);
  digitalWrite(cs_pin,HIGH);
  pinMode(MAX6675_SO, INPUT);
  pinMode(MAX6675_SCK, OUTPUT);
  digitalWrite(MAX6675_SCK, LOW);

}



//The function that reads the SPI data from MAX6675
double K_type_couple::read(void) {

  /*  Sample the sensor when a new temperature conversion is ready.
      Otherwise, just return the last known temperature value.*/
  if ((millis() - this-> _conversion_timer) >= this-> _conversion_timeout)
  {
    // reset the conversion timer
    this-> _conversion_timer = millis();

    // sample sensor to get the latest temperature vale.
    uint16_t v;

    v &= 0x00;

    // Telling sensor that you want to read the latest temperature value from it.
    digitalWrite(MAX6675_SCK, LOW);
    digitalWrite(MAX6675_CS, LOW);
    delay(1);

    // Read in 16 bits,
    //  15    = 0 always
    //  14..2 = 0.25 degree counts MSB First
    //  2     = 1 if thermocouple is open circuit  
    //  1..0  = uninteresting status
    
    // SPI using digital IO pins (CLK timing isn't critical for this application)
    uint16_t i;
    for (i=0; i<16;++i)
    {
      digitalWrite(MAX6675_SCK, HIGH); //falling edge
      v |= digitalRead(MAX6675_SO) << (15-i); //MSB first according to MAX6675 datasheet.
      digitalWrite(MAX6675_SCK, LOW); //rising edge
    }

    
    digitalWrite(MAX6675_CS, HIGH);

    if (v & 0x4) 
    {    
      // Bit 2 indicates if the thermocouple is disconnected
      return NAN;     
    }

    // The lower three bits (0,1,2) are discarded status bits
    v >>= 3;

    // The remaining bits are the number of 0.25 degree (C) counts; store in the private variable.
    this->_value = v*0.25;

  }
  
  return this->_value;
}


/*--------------------------------------------------------------------------------*/
// Control loop code
/*--------------------------------------------------------------------------------*/


// Control loop variables
#define window_width 10 
float rolling_window[window_width] = {0,0,0,0,0,0,0,0,0,0};     // averages consecutive values (behaves like FIFO buffer)
float hyst_val = 0.1;                   // smallest "acceptable" error (ie +/- 0.1C)
float kp = 0.01;                         // proportional gain
float ki = 0.1;                         // integral gain
float err = 0;                          // error term (difference between measured value and setpoint for a given time-step)
float accumulator = 0;                  // running sum of values seen in rolling window.
float avg_err = 0;                      // average of values seen in rolling window.
float prev_err = 0;                     // used for tracking changes in the error term over time


// value used to drive the output current through the peltier device [0,255]
float driving_signal = 0;






/*----- Controller based on a PI implementation with a rolling-average window -----*/
int rolling_average_controller(float sp_val, float rd_val)
{
   // calculate latest error term
  err = abs(sp_val-rd_val);

  // shift all elements to the right and feed newest err term to the FIFO buffer
  for (int i = window_width-1; i>0; i--)
  {
    rolling_window[i] = rolling_window[i-1];
  }
  rolling_window[0] = err;

  // reset variables
  accumulator = 0;
  avg_err = 0;      

  // calculate the sum and average error from the rolling window.
  for (int i = 0; i < window_width; i++)
  {
    accumulator += rolling_window[i];
  }
  avg_err = accumulator/window_width;


  // Use the gain values to scale the driving signal (want accumulated errors to address )

  if (avg_err > hyst_val)
  {
    // ddriving signal will ramp-up until the SP value is reached (will ramp down if the measured val is below the SP)
    float corrective_term = (accumulator*ki + avg_err)*kp;
    sp_val > rd_val ? driving_signal += corrective_term : driving_signal -= corrective_term;
  }
  else
  {
    driving_signal = driving_signal;
  }
  
  //limit output current
  driving_signal > 220 ? driving_signal = 220 : driving_signal = driving_signal; 
  driving_signal < -220 ? driving_signal = -220: driving_signal = driving_signal;

  return int(driving_signal);

}


// if the rate of change of error is too steep, drive the accumulation in the opposite direction to prevent overshoot
// variables for tracking the rate of change of error: diminish the accumulator for steeper rates of error change
float elapsedTime=0, Time=0, timePrev=0;
float prev_delta = 0; //previous time-detla (compare with latest one to infer how quickly the error is changing)

bool reset_accumulator = true;

/* Controller based on cumulative error */
int cumulative_error_compensation(float sp_val, float rd_val)
{
  // want the cumulative error to build-up when the error term is either not decreasing or is beyond the hysteresis threshold (e.g. SP +/- 0.1C).
  // the driving signal should remain static at whatever value is needed to maintain the desired SP once it is reached.
  // add the (bidirectional) cummulative error to the driving signal value.

  kp = 50;
  ki = 2;
  float outer_hyst = 1;
  float dilated_outer_hyst = 1.5;
  float inner_hyst = 0.1;
  float max_output = 220;


  // calculate latest error term (is it increasing or decreasing?)
  err = sp_val-rd_val;

  bool outer_hyst_condition           = abs(err) >= outer_hyst;
  bool dilated_outer_hyst_condition   = abs(err) >= dilated_outer_hyst;

  if ( (outer_hyst_condition && reset_accumulator) || (dilated_outer_hyst_condition && !reset_accumulator))
  { 
    accumulator = err*kp;
    reset_accumulator = true;
  }
  else
  {

    // only reset the accumulator when going from outside the outter_hyst to within it.
    // if (reset_accumulator)
    // {
    //   accumulator = 0;
    // }
    
    reset_accumulator = false;

    // if the error is increasing, drive the accumulator in the direction to counteract it.
    if (abs(err) >= abs(prev_err)+inner_hyst)
    {
      accumulator += err*ki;
    }
    // if it's decreasing then maintain the current value.
    else
    {
      accumulator = accumulator;
    }
  }

  



  // when the driven signal reaches an outer hysteresis threshold aroudn the SP, reset the driving signal and switch to the accumulator

  // capture the latest error value for future reference.
  prev_err = err;

  // set the driving current based on the cumulative error   
  //limit output current
  accumulator > max_output  ? accumulator = max_output : accumulator = accumulator; 
  accumulator < -max_output ? accumulator = -max_output: accumulator = accumulator;

  return int(accumulator);
}


