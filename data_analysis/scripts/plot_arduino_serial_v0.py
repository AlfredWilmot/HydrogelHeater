# -*- coding: utf-8 -*-
#!/usr/bin/env python

"""
Created on Tue Dec 15 14:39:35 2020

@author: alfred

references:
    > https://pythonpedia.com/en/tutorial/5744/python-serial-communication-pyserial-
"""

import serial
import serial.tools.list_ports as port_list
import sys

def main():
    
    # Gathers a list of available comports
    ports = list(port_list.comports())
    
    
    # Attempts to connect to each comport sequentially 
    for p in ports:

        try:
            print ("Attempting to connect to: " + str(p.device))
            s = serial.Serial(p.device)
            
        except:
            print("Could not connect to comport")
            
            if p == ports[-1]:
                print("No more available comports to connect to, exiting program.")
                sys.exit()
     
   
    
    while True:
        
        try:
            data = s.readline()
            print(data)
            
        except KeyboardInterrupt:
            print("Keyboard interrupt, exiting the program")
            s.close()
            sys.exit()

if __name__ == '__main__':
    main()