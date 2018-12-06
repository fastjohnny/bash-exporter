#!/bin/bash
set -x
LOG='/var/log/stress'
for i in {1..1000}; do
  inter=`echo $RANDOM | cut -b1-2`
  strs=`echo $RANDOM | cut -b1-2`
  cycl=`echo $RANDOM | cut -b1`
  date >> $LOG
  echo "inter $inter cycl $cycl" >> $LOG
  echo "strs $strs" >> $LOG
  
  for i in {1..$cycl}; do
    sleep $inter
    stress --cpu 50 --timeout $strs
  done
done
