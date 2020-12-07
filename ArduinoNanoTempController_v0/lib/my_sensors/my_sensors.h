#include <Arduino.h>

#ifndef _MY_SENSORS_H
#define _MY_SENSORS_H

/*Class for settting-up and using the encoder push button.

  Device used:
  https://tech.alpsalpine.com/prod/e/html/encoder/incremental/ec11/ec11b15242b1.html

  Reference material:
  https://dronebotworkshop.com/rotary-encoders-arduino/
  
*/
class EncoderPushButton
{
private:
  int _pulse_count  = 0,    //counts the number of pulses (increments/ decrements for CW/ CCW encoder rotation).
      _pulse_lim    = 100,  //+/- limit of pulse counter.
      _pulse_step   = 5,    //steps for every detected pulse.
      _in_a_new     = 0,    //stores the last known value from  the IN_A pin.
      _in_a_old     = 0,    //stores the value before the last known value from the IN_A pin.
      _sw_state     = 0,    //HIGH --> switch is released, LOW --> switch is pressed.

      // designate pins used by encoder.
      _pin_a,             
      _pin_b,
      _sw;
  bool _transition_flag = false;  // indicates whether the encoder is between rest-positions (otherwise each "tick" counts as two increments).

public:
  EncoderPushButton(int IN_A, int IN_B, int SW);
  int read_sw_state();
  int read_encoder_val();

};





/*Class for interacting with NTC thermistors using ADC inputs.*/
class NTC_thermistor
{
private:

uint8_t _pin;               // pin number associated with a particular ADC.
int _value      = 0,        // value read from the ADC attached to the NTC.
    _prev_val   = 0,        // previou measured value
    _avg_max    = 20,       // how many samples are averaged over.
    _avg_cnt    = _avg_max, // tracks samples for averaging.
    _avg_sum    = 0;        // running sum.
float _I_sense  = 0.000038, //constant current passing through NTC thermistor (30uA)
      _R_100k   = 100000,   // 100k Ohms @ 25C
      _beta     = 3950;     // B25/50: https://www.makeralot.com/download/Reprap-Hotend-Thermistor-NTC-3950-100K.pdf

public:
  NTC_thermistor(const uint8_t  pin);
  float read(bool get_raw = false);
};




/*Class for measuring the output of I-sense amplifiers using and ADC pin. 
These amplifiers measure the potential drop across a resistor through which the current being measured passes.

Author used the INA283 (200V/V Gain).
Application information and and technical specifications can be found in the datasheet: (https://www.ti.com/lit/ds/symlink/ina283.pdf)*/
class I_sensor
{
private:

  uint8_t 
    _pin;           // pin number associated with a particular ADC.
  int 
    _value=0,       // raw adc value.
    _avg=10,        //number of readings that are used to form an average.
    _avg_count=0;   //tracks the number of readings added to sum
  float 
    _shunt_R=0.25,  //value of shunt-resistor used to measure current.
    _accumulator=0; //accumulates subsequent readings
    
public:
  I_sensor(const uint8_t pin, int avg);
  float read(bool get_raw = false);
};


/*--------------------------------------------------------------------------------*/
// K-type thermocouple using MAX6675
/*--------------------------------------------------------------------------------*/
// Source: http://www.electronoobs.com/eng_arduino_tut24_code3.php


#define MAX6675_CS   11
#define MAX6675_SO   12
#define MAX6675_SCK  13

class K_type_couple
{
private:
  uint16_t
    _value = 0;
  uint8_t
    _cs = MAX6675_CS;
public:
  K_type_couple(uint8_t cs_pin);
  double read(void);
};



//double readThermocouple(void);


/*--------------------------------------------------------------------------------*/
// PID loop code
/*--------------------------------------------------------------------------------*/

int PID_loop(float, float);

#endif