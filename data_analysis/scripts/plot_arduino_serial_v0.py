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

## NOTE: Make sure to install TexLive (I'm using Windows) or this will cause the program to crash --> https://tug.org/texlive/windows.html
# should really check whether the TEX stuff can be seen on the PATH, but I am too lazy to implement that.
#plt.rc('text', usetex=True) #


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

    
    # Arrays for plotting the data coming in from the serial interface with the temperature controller (set-point, measured-val, driving-signal [0,255])
    sp_data   = [0]
    msrd_data = [0]
    drv_data  = [0]
    
    # Plotting variables:
    length = 50           # The maximum length of the above arrays-- dictates the number of samples shown on graph at any given time
    view_window_gap = 0.25  # The viewing window gap around the observed values (eg. 0.25 => the window border is 25% wider than the measured vals)
    
    # Hysteresis values (manually copied over from Arduino controller code; make sure they match the latest values!)
    err_hyst            = 0.1
    outer_hyst          = 1.0
    dilated_outer_hyst  = 1.5
    
    '''
    Main loop: reads serial data, and plots it.
    '''
    while s.isOpen():
        
        try:
            
            # The controller set-point defined by the user via the rotary-encoder input.
            target_temp = s.readline()
            target_temp.decode()
            
            # The temperature measured by whichever sensor is selected.
            measured_temp = s.readline()
            measured_temp.decode()
            
            # The driving signal generated by the control-loop
            driving_signal = s.readline()
            driving_signal.decode()
            
            # Adding the serially-received data to the relevant arrays for plotting
            sp_data.append(float(target_temp))
            msrd_data.append(float(measured_temp))
            #drv_data.append(int(driving_signal))
            
            # Ensuring the arrays don't exceed their designated length (can only be as long as the graph is wide). In this way the arrays behave like FIFO buffers.
            if len(sp_data) > length:
                del(sp_data[0])
                
            if len(msrd_data) > length:
                del(msrd_data[0])
                
            if len(drv_data) > length:
                del(drv_data[0])
            
            
            
            #check if a plot is present (if not, user has closed it; so exit the application)
            if plt.fignum_exists(1):
                
                 # clear the plot so that only one is rendered at a time.
                plt.cla()
        
                # set the title of the plot
                plt.title("Set-point vs measured temperature (^C)")
                
                # TODO: this should reflect the time-step (presently just a counter of the incoming readings)
                plt.xlim(0,length)
                
                
                # Dynamically reconfiguring the y-values, depending on the values received from ther serial interface
                min_val = 0
                max_val = 0
                
                if min(msrd_data) < min(sp_data):
                    min_val = min(msrd_data)
                else:
                    min_val = min(target_temp)
                
                if max(msrd_data) > max(sp_data):
                    max_val = max(msrd_data)
                else:
                    max_val = max(sp_data)
                
                print("min_val: " + "{0:.2f}".format(min_val))
                print("max_val: " + "{0:.2f}".format(max_val))
                
                plt.ylim(min_val*(1-view_window_gap), max_val*(1+view_window_gap))
                
                
                # Plot the measured value against the set-point value
                plt.plot(sp_data, 'r')
                plt.plot(msrd_data, 'b')

                
                # Text to be displayed on the graph
                plt.legend(["set-point", "measured temp"])
                
                err = abs(float(target_temp) - float(measured_temp))
                plt.text(length*0.9, max_val*0.9, "err: " + "{0:.2f}".format(err) + "C")
                
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