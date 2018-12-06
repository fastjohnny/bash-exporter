#!/usr/bin/python3.5
import json
import os
import datetime
import collections

#interval in seconds
interval=10

dat=str((datetime.datetime.now() - datetime.timedelta(seconds=1)).time()).split('.')[0]
dat_prv=str((datetime.datetime.now() - datetime.timedelta(seconds=interval)).time()).split('.')[0]
print(dat)
print(dat_prv)
sar = os.popen('sar -s {0} -e {1}'.format(dat_prv, dat)).read()
print(sar)
lines = sar.split("\n")

num_lines = 0
avr = {}
for line in lines[2:]:
     num_lines = num_lines + 1
     columns = line.split()
     if num_lines == interval+1:
       avr.update({"user": float(columns[2]), "nice": float(columns[3]),"system": float(columns[4]),
           "iowait": float(columns[5]), "steal": float(columns[6]), "idle": float(columns[7])})

avr_sort = collections.OrderedDict(sorted(avr.items()))
avr_json = json.dumps(avr_sort)
print (avr_json)
exit(0)
