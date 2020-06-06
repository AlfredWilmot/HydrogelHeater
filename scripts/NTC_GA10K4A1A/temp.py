# -*- coding: utf-8 -*-
"""
Script for exploring NTC circuit implementation
"""

import math
import matplotlib.pyplot as plt
import pandas as pd

v_cc = 5
k = 10**3
R_T = list(range(800,30*k+100,100))[::-1]   # thermistor values: 30k ~ 0C, 10k ~ 25C, 800 ~ 100C
R = 30*k

v_a = v_cc / 2
v_b = []
dV = []

for i,v in enumerate(R_T):
    v_b.append(v_cc * v / (v + R) )
    dV.append(v_a - v_b[i])



rt_tbl = pd.read_csv('GA10K4A1A_RT_table.csv', delimiter=" ", header=None)

rt_tbl_T = []
rt_tbl_R = []

for i in range(0,len(rt_tbl.columns)):

    if i % 2 == 0: 
        rt_tbl_T.append(rt_tbl[i].to_list())    # extract jumbled Temperature values 
    else:
        rt_tbl_R.append(rt_tbl[i].to_list())    # extract jumbled resistance values 
        

# Flatten list of sublists into single list, remove NaNs, and sort into ascending order
# (rt_tbl_R values are reversed b/c NTC resistance decreases with increasing temperature)
rt_tbl_T = sorted([x for sublist in rt_tbl_T for x in sublist if math.isnan(x) == False])
rt_tbl_R = reversed(sorted([x for sublist in rt_tbl_R for x in sublist if math.isnan(x) == False]))




