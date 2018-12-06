#!/usr/bin/python3.5
import json
import os
import datetime
import collections

#interval in seconds
interval=10

dat=str((datetime.datetime.now() - datetime.timedelta(seconds=1)).time()).split('.')[0]
dat_prv=str((datetime.datetime.now() - datetime.timedelta(seconds=interval)).time()).split('.')[0]
sar = os.popen("sar -s {0} -e {1} | grep Average ".format(dat_prv, dat)).read()
avr = {}
columns = sar.split()
avr.update({"user": float(columns[2]), "nice": float(columns[3]),"system": float(columns[4]),
    "iowait": float(columns[5]), "steal": float(columns[6]), "idle": float(columns[7])})

avr_sort = collections.OrderedDict(sorted(avr.items()))
avr_json = json.dumps(avr_sort)
print (avr_json)
exit(0)
