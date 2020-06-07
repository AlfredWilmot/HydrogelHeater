# -*- coding: utf-8 -*-
"""
Script for exploring circuit implementation of GA10K4A1 NTC
   
    Datasheet:                  https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FGA10K4A1%7FA%7Fpdf%7FEnglish%7FENG_DS_GA10K4A1_A.pdf%7FGA10K4A1A
    Purchase link (digikey):    https://www.digikey.co.uk/product-detail/en/te-connectivity-measurement-specialties/GA10K4A1A/223-1546-ND/5277241

    Thermistor calculator:      https://www.daycounter.com/Calculators/Steinhart-Hart-Thermistor-Calculator.phtml
    Thermistor Guide:           https://www.electronics-tutorials.ws/io/thermistors.html
    
"""


## TODO: 
#       -> make a subplot showing % error between table (reference) values and model values against temperature  


import math
import matplotlib.pyplot as plt
import pandas as pd

# Values for NTC thermistor placed on the bottom right of a wheatstone bridge circuit

v_cc = 5
k = 10**3
R_T = list(range(800,30*k+100,100))[::-1]   # thermistor values: 30k ~ 0C, 10k ~ 25C, 800 ~ 100C
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
    




# Extracting R-T values from GA10K4A1 datasheet and arranging jumbled values into look-up table.
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


# Simple plots 
fig, ax = plt.subplots()
lin_1 = ax.plot(rt_tbl_T[40:80], rt_tbl_R[40:80], label="Datasheet look-up table")
lin_2 = ax.plot(T[:250], R_T[:250], label="Exponential Beta conversion")

ax.set(ylabel='R $(\Omega)$', xlabel='T $(^{o}C)$',
        title='GA10K4A1A NTC: T vs R')

ax.grid()
ax.legend()
plt.show()
