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
import matplotlib.pyplot as plt
import time
## NOTE: Make sure to install TexLive (I'm using Windows) or this will cause the program to crash --> https://tug.org/texlive/windows.html
# should really check whether the TEX stuff can be seen on the PATH, but I am too lazy to implement that.
#plt.rc('text', usetex=True) #






# ------------------------------
# Arrays for plotting the data coming in from the serial interface with the temperature controller.
# ------------------------------

# Data shown on the "close-up" view graph
sp_data_closeUp   = [] 
msrd_data_closeUp = []

# Data shown on the "global view" graph
sp_data_global    = []
msrd_data_global  = []

# Data for analytics
drv_data = []
err_data = []


# trim band lines
upper_tol_band = []
lower_tol_band = []

# Plotting variables:
closeUpView_len = 10   # The number of samples shown on the "close-up view" plot.
globalView_len  = 1000  # The number of samples shown on the "global view" plot.

# ------------------------------
# Flags/ vars for keeping track of events
#------------------------------
trim_count = 0
trim_len = 5
trim_done = False
prev_SP = 0


# ------------------------------
# Variables for keeping track of time.
# ------------------------------
settling_latency = 0.0              # tracks how long it took for the system to settle within the tolerance band.
oscillator_counter = 0              # tracks how frequently the the system leaves/ reenters the tolerance band.
tol = 0.25                          # tolerance around the SP that the system must stay within (i.e. SP +/- 0.25C)  
prev_sp = 0.0    
waiting_sp_change_timeout = False
sp_change_timeout = 2.0
start_time = 0.0
system_is_settled = False
       
'''
Function for tracking how long it takes for the system to reach and remain within the tolerance band around the setpoint.
'''
def check_settling_latency(sp_val, msrd_val):
    #every time the SP changes, start a timer.
    #once the SP is stable for 2 seconds, the new SP has been defined by the user.
    #track how long it takes for the measured value to reach and stay within the tolerance band around the SP.
    #this will also note how many times the tolerance band was entered/ exited from before the system settled.
    
    
    err = sp_val - msrd_val
    
    # It's ugly, and I shuoldn't need to do this, but fuck me I guess.
    global settling_latency
    global oscillator_counter
    global tol
    global prev_sp
    global waiting_sp_change_timeout
    global sp_change_timeout
    global start_time
    global system_is_settled
    
    
    
    # Did the SP change or is the timeout running?
    if ( (sp_val != prev_sp) or waiting_sp_change_timeout):
        
        # SP just changed, system is not settled within the tol-band anymore.
        system_is_settled = False
        oscillator_counter = 0
        
        # Initiate the timeout if not done already.
        if (not waiting_sp_change_timeout):
            start_time = time.time()
            waiting_sp_change_timeout = True
        
        else:
            
            # Update the system settling time tracker.
            settling_latency = time.time() - start_time
            
            # A valid change of the SP has occurred when the timeout has expired.
            if( settling_latency >= sp_change_timeout):
                waiting_sp_change_timeout = False
    
   
    # Is the error within the tolerance band?
    if abs(err) > tol: 
        
        # if the system was stable, it a'int anymore! Increment the oscillator counter.
        if system_is_settled:
            system_is_settled = False
            oscillator_counter += 1
        
        # update the 
        settling_latency = time.time() - start_time
    
    # The system has settled within the tolerance bands, make note of the settling_latency
    else:
        system_is_settled = True
        
        
        
    
    
    # capture the current SP value for future reference.
    prev_sp = sp_val




'''
Helper function for controlling the lengths of arrays used for plotting.
'''  
def push_to_buffer(buff, buff_len ,val_to_push):
    
    # Adding the serially-received data to the relevant arrays for plotting
    buff.append(val_to_push)
    
    # Ensuring the arrays don't exceed their designated length (can only be as long as the graph is wide). 
    # In this way the arrays behave like FIFO buffers.
    if len(buff) > buff_len:
        del(buff[0])
    
    # This is very lazy and probably going to bite me in the arse, but fuck it
    if buff[0] == 0.0:
        del(buff[0])





'''
Generates an array that is a rolling average of the input array:
each element is the average of itself and all preceding elements in the array.
'''
def rolling_avg(in_array, tail_n_avg=0):
    
    rolling_avg_array = []
    
    
    # if averaging over the last n values, 
    # then make sure that the last n values in the output array are a rolling average of that subset alone.
    
    for i in range(len(in_array)):
        
        rolling_sum = 0
        
        # generate averages in n-sample steps
        if (tail_n_avg != 0) and (i > tail_n_avg):
            
            for j in range(i+1)[-tail_n_avg:]:
                rolling_sum += in_array[j]
            
            rolling_avg_array.append(rolling_sum/tail_n_avg)

        # otherwise just do a normal rolling average across the entire input array
        else:
            
            for j in range(i+1):
                rolling_sum += in_array[j]
                
            rolling_avg_array.append(rolling_sum/(i+1))
        
    return rolling_avg_array






'''
This is where the magic happens!
'''
def main():
    
    
    
    # ------------------------------
    # Flags/ vars for keeping track of events
    #------------------------------
    global trim_count
    # global trim_len
    global trim_done
    # global prev_SP
    
        

    # Gathers a list of available comports
    ports = list(port_list.comports())
    
    
    '''
    Look through available serial ports and attempt to connect to them sequentially.
    Exits cleanly if unable to find a viable port after exhausting all availablle int hte list
    '''
    no_ports_available = True
    for p in ports:
        
        no_ports_available = False
        
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
     
    if no_ports_available:
        print("No comports connected, make your sure device is connected properly.")
        print("Exiting program.")
        return -1
        
    '''
    Setup the plot stuff 
    '''
    plt.close('all')
    plt.figure()
    plt.ion()
    
    inspct_plt = plt.subplot(221)
    global_plt = plt.subplot(212)
    analyt_plt = plt.subplot(222)
    
    plt.show()

    

    
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

            
            # Ignoring the first few values 
            if trim_count < trim_len:
                trim_count += 1
            else:
                trim_done = True

            
            #check if a plot is present (if not, user has closed it; so exit the application)
            if plt.fignum_exists(1) and trim_done:

                 # clear the plot so that only one is rendered at a time.
                inspct_plt.cla()
                analyt_plt.cla()
                global_plt.cla()
                
                
                # set the title of the plot
                inspct_plt.set_title("Latest " + str(closeUpView_len) + " values")
                global_plt.set_title("Global-view (raw data)")
                analyt_plt.set_title("Analytics")
                

                '''
                Plotting the "close-up view"
                '''
                
                # Limiting the length of the relevant arrays for the "close-up view" of the data.
                push_to_buffer(buff=sp_data_closeUp, 
                               buff_len=closeUpView_len, 
                               val_to_push=float(target_temp))
                
                push_to_buffer(buff=msrd_data_closeUp, 
                               buff_len=closeUpView_len, 
                               val_to_push=float(measured_temp))
                                    
                
                # Plot the measured value against the set-point value
                inspct_plt.plot(sp_data_closeUp, color='orange')
                inspct_plt.plot(msrd_data_closeUp, 'r.')
                
                # Plot the rolling average based on the incoming measurements and the length of the close-up view array.
                inspct_plt.plot(rolling_avg(msrd_data_closeUp), 'k')

                
                
                
                '''
                Plotting the "Global view"
                '''                
                # Limiting the length of the relevant arrays for the "global view" of the data.
                push_to_buffer(buff=sp_data_global, 
                               buff_len=globalView_len, 
                               val_to_push=float(target_temp))
                
                push_to_buffer(buff=msrd_data_global, 
                               buff_len=globalView_len, 
                               val_to_push=float(measured_temp))               
  
                global_plt.plot(sp_data_global, color='orange')
                global_plt.plot(msrd_data_global, 'r.')
                               
                global_plt.plot(rolling_avg(msrd_data_global, closeUpView_len), 'k')


                '''
                Adding tolerance bands to the relevant plots
                '''
                
                upper_band = []
                lower_band = []
                
                
                for sp in sp_data_closeUp:
                    upper_band.append(sp+tol)
                    lower_band.append(sp-tol)
                
                
                inspct_plt.plot(upper_band, '--g')
                inspct_plt.plot(lower_band, '--g')
                
                upper_band = []
                lower_band = []               

                for sp in sp_data_global:
                    upper_band.append(sp+tol)
                    lower_band.append(sp-tol)
                    
                
                global_plt.plot(upper_band, '--g')
                global_plt.plot(lower_band, '--g')

                
                '''
                Plotting the "data analytics" view
                '''
                
                err = float(target_temp) - float(measured_temp)
                
                push_to_buffer(buff=err_data, 
                               buff_len=globalView_len, 
                               val_to_push= err)
                
                # calculating the average error across the range of "close-up" values
                
                avg_err = 0
                
                if len(err_data) < closeUpView_len:
                    avg_err = sum(err_data)/len(err_data)
                else:  
                    avg_err = sum(err_data[-closeUpView_len:])/closeUpView_len
                
                
                # Plotting analytics
                
                tol_info_txt = ""
                
                if abs(err) > tol:
                    analyt_plt.plot(err_data, color="red")
                    analyt_plt.legend(["Avg err over " + str(closeUpView_len) + " samples: " + "{0:.2f}".format(avg_err)])
                    tol_info_txt = " >:("
                else:
                    analyt_plt.plot(err_data, color="green")
                    analyt_plt.legend(["Avg err over " + str(closeUpView_len) + " samples: " + "{0:.2f}".format(avg_err)])
                    tol_info_txt = " <:D"
                    
                
                
                # Tracking how long it takes for the system to settle within the tolerance band.
                check_settling_latency(float(target_temp), float(measured_temp))
                
                my_txt = "Settling latency: " + "{0:.2f}".format(settling_latency) + "s\n" \
                    + "Oscillation count: " + str(oscillator_counter) + tol_info_txt
                
                txt_ax = analyt_plt.text(analyt_plt.get_xlim()[-1]*0.05,analyt_plt.get_ylim()[-1]*0.8, my_txt)
                
                

                
                

                

                '''
                Housekeeping after servicing all the plots
                '''
                analyt_plt.set_ylabel("Temperature [C]")
                inspct_plt.set_ylabel("Temperature [C]")
                global_plt.set_ylabel("Temperature [C]")
                global_plt.set_xlabel("Number of measurements")

                
                inspct_plt.margins(x=0, y=0.8)
                global_plt.margins(x=0, y=0.8)
                analyt_plt.margins(x=0, y=0.8)

                global_plt.legend(["set-point",  \
                                   "measured temp", \
                                    "rolling avg over " + str(closeUpView_len) + " vals", \
                                    "tol band (+/-" + str(tol) +"C)"])
                    
                inspct_plt.legend(["set-point", \
                                   "measured temp", \
                                   "rolling avg over " + str(closeUpView_len) + " vals", \
                                   "tol band (+/-" + str(tol) +"C)"])

            
                # Give matplot lib some time to render the plot.
                plt.pause(0.01) 
                
            elif not trim_done:
                print("trimming the first " + str(trim_len) + " values.")
            else:
                print("user closed plot, exiting.")
                s.close()
                #sys.exit()
                return 0
            
            
            # Get rid of values accumulated in the buffer while the plot was rendering: want to plot the latest values.
            s.flushInput()  
            
        except KeyboardInterrupt:
            print("Keyboard interrupt, exiting the program")
            plt.close()
            s.close()
            #sys.exit()
            return -1
        
        except PermissionError:
            print("Device disconnected, exiting program")
            plt.close()
            s.close()
            return -1
        
        
        except Exception as e:
             print(str(e))
             
    
    return 0





if __name__ == '__main__':
    main()
    
    
    
    
    
    

