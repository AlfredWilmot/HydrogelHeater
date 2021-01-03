# -*- coding: utf-8 -*-
#!/usr/bin/env python

"""
Created on Tue Dec 15 14:39:35 2020

@author: alfred

references:
    (pyserial)
    > https://pythonpedia.com/en/tutorial/5744/python-serial-communication-pyserial-
    > https://pyserial.readthedocs.io/en/latest/pyserial.html
    
    (plotting)
    > https://www.youtube.com/watch?v=PlL2cT3rzTg
    
"""

import serial
import serial.tools.list_ports as port_list
import sys
import struct

import matplotlib.pyplot as plt
import numpy as np
import time

def main():
    
    # Gathers a list of available comports
    ports = list(port_list.comports())
    
    
    '''
    Look through available serial ports and attempt to connect to them sequentially.
    Exits cleanly if unable to find a viable port after exhausting all availablle int hte list
    '''
    for p in ports:

        try:
            print ("Attempting to connect to: " + str(p.device))
            
            s = serial.Serial()
            s.port = str(p.device)
            s.baudrate = 9600
            s.timeout = 1
            s.open()
            
        except:
            print("Could not connect to comport")
            
            if p == ports[-1]:
                print("No more available comports to connect to, exiting program.")
                #sys.exit()
                return -1
     
        
    '''
    Setup the plot stuff 
    '''
    plt.close('all')
    plt.figure()
    plt.ion()
    plt.show()

    
    sp_data = [0]
    msrd_data = [0]
    length = 20
    
    '''
    Main loop: reads serial data, and plots it.
    '''
    
    
    while s.isOpen():
        
        try:
            
            
            target_temp = s.readline()     # grab read the serial data-stream
            target_temp.decode()
            
            measured_temp = s.readline()
            measured_temp.decode()
            
            pwm_duty = s.readline()
            pwm_duty.decode()
            
            #data = float(data)
            #print("target_temp   = " + str(float(target_temp)))
            #print("measured_temp = " + str(float(measured_temp)))
            #print("pwm_duty = " + str(int(pwm_duty)))
            
            sp_data.append(float(target_temp))
            msrd_data.append(float(measured_temp))
            
            
            if len(sp_data) > length:
                del(sp_data[0])
            
            if len(msrd_data) > length:
                del(msrd_data[0])
            
            
            #check if a plot is present (if not, user has closed it; so exit the application)
            if plt.fignum_exists(1):
            
                plt.cla()       # clear the plot so that only one is rendered at a time.
                plt.title("Set-point vs measured temperature (^C)")
                plt.xlim(0,20)
                plt.ylim(0,50)
            
                
                plt.plot(sp_data, 'r')
                plt.plot(msrd_data, 'b')
                plt.legend(["set-point", "measured temp"])
                
                err = abs(float(target_temp) - float(measured_temp))
                plt.text(length*0.8,40, "err: " + "{0:.2f}".format(err) + "C")
                
                plt.pause(0.01) # give matplot lib some time to render the plot.
            else:
                print("user closed plot, exiting.")
                s.close()
                #sys.exit()
                return 0
            
            s.flushInput()  # Get rid of values accumulated in the buffer while the plot was rendering: want to plot the latest values.
            
        except KeyboardInterrupt:
            print("Keyboard interrupt, exiting the program")
            plt.close()
            s.close()
            #sys.exit()
            return -1
        
        
        except Exception as e:
             print(str(e))
             
                       
        
        
    
    return 0

if __name__ == '__main__':
    main()