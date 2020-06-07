# -*- coding: utf-8 -*-
"""
Script for exploring circuit implementation of GA10K4A1 NTC
   
    Datasheet:                  https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FGA10K4A1%7FA%7Fpdf%7FEnglish%7FENG_DS_GA10K4A1_A.pdf%7FGA10K4A1A
    Purchase link (digikey):    https://www.digikey.co.uk/product-detail/en/te-connectivity-measurement-specialties/GA10K4A1A/223-1546-ND/5277241

    Thermistor calculator:      https://www.daycounter.com/Calculators/Steinhart-Hart-Thermistor-Calculator.phtml
    Thermistor Guide:           https://www.electronics-tutorials.ws/io/thermistors.html
    Thermistor selection guide: https://www.vishay.com/docs/33001/seltherm.pdf
    
"""


## TODO: 
#       -> make a subplot showing % error between table (reference) values and model values against temperature  


import math
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import pandas as pd
import numpy as np

# Values for NTC thermistor placed on the bottom right of a wheatstone bridge circuit

v_cc = 5
k = 10**3
R_T = list(range(700,30*k+1,1))[::-1]   # thermistor values: 30k ~ 0C, 10k ~ 25C, 800 ~ 100C
R = 30*k

v_a = v_cc / 2
v_b = []
dV = []


T_0     = 25 + 273.15
R_0     = 10*k
B       = 3694 # "Beta value 25/85" taken from datasheet
B_tol   = 0.5/100 # "Beta tolerance" = 0.5%



T = []

# Converting R_T to theoretical T using exponential beta fcn: https://www.ametherm.com/thermistor/ntc-thermistors-temperature-measurement-with-wheatstone-bridge

for i,v in enumerate(R_T):
    
    v_b.append(v_cc * v / (v + R) )
    dV.append(v_a - v_b[i])
    
    T.append(( ( math.log( R_T[i] / R_0 ) / B) + (1 / T_0) )**-1 - 273.15) 
    




## Extracting R-T values from GA10K4A1 datasheet and arranging jumbled values into look-up table.
# Used as ground-truth to evaluate error of Beta-fucntion.
    
rt_tbl = pd.read_csv('GA10K4A1A_RT_table.csv', delimiter=" ", header=None)

rt_tbl_T = []
rt_tbl_R = []

for i in range(0,len(rt_tbl.columns)):

    if i % 2 == 0: 
        rt_tbl_T.append(rt_tbl[i].to_list())    # extract jumbled Temperature values 
    else:
        rt_tbl_R.append(rt_tbl[i].to_list())    # extract jumbled resistance values 
        
# Flatten list of sublists into single list, remove NaNs, and sort into ascending order
rt_tbl_T = sorted([x for sublist in rt_tbl_T for x in sublist if math.isnan(x) == False])
rt_tbl_R = sorted([x for sublist in rt_tbl_R for x in sublist if math.isnan(x) == False])

# rt_tbl_R values are reversed b/c NTC resistance decreases with increasing temperature
rt_tbl_R = rt_tbl_R[::-1]


# remove superfluous Temperature values (and corresponding R vals) from table
tmp_T = []
tmp_R = []
for i,v in enumerate(rt_tbl_T):
    if v >= 0 and v <= 100:
        tmp_T.append(rt_tbl_T[i])
        tmp_R.append(rt_tbl_R[i])
        
rt_tbl_T = tmp_T
rt_tbl_R = tmp_R






## Plotting table data
fig = plt.figure(constrained_layout=True)
gs = gridspec.GridSpec(2, 1, figure=fig)
ax = fig.add_subplot(gs[0, :])

#lin_2 = ax.plot(T, R_T, label='Exponential$ Beta conversion')
lin_1 = ax.plot(rt_tbl_T, rt_tbl_R, label="Datasheet look-up table")

ax.set(ylabel='R $(\Omega)$', xlabel='T $(^{o}C)$',
        title='GA10K4A1A NTC: T vs R')


# To get error vals:
# 1) get indices from T vals that are closest to the nearest degree (and match corresponding R_T vals)

T_new = []
R_new = []
indx_list = []

T_cnt = 0

delta_prev  = 1
delta_nxt   = 1


for i,v in enumerate(T):
    
    delta_nxt = abs(v - T_cnt)
    
    # converging towards what is roughly a 1C step in the list
    if delta_nxt < delta_prev:
        delta_prev = delta_nxt
    
    # passed the closest 1C step, use previous index, look for next 1C step equivalent
    if delta_nxt > delta_prev:
        T_new.append(T_cnt)
        R_new.append(R_T[i-1])
        indx_list.append(i-1)
        if T_cnt >= 100:
            break
        else:       
            T_cnt += 1
            delta_prev = 1

# plot the data from the Beta model
ax.plot(T_new, R_new, label='Exponential$ Beta conversion')     
    
#Only show data of intereset
ax.set_xlim([0,100])
ax.set_ylim([0,30*k])
ax.grid()
ax.legend()

# plot the error between the beta model and the table data to see how it changes with temperature
ax_err = fig.add_subplot(gs[1, :])
R_err=[]

for i,v in enumerate(R_new):
    R_err.append(100 * abs(R_new[i] - rt_tbl_R[i])/rt_tbl_R[i])


ax_err.plot(T_new, R_err, label='R_T error')  
ax_err.legend()
ax_err.set(ylabel='%R $(\Omega)$', xlabel='T $(^{o}C)$',
        title='GA10K4A1A NTC: R error vs T')

plt.show()
        