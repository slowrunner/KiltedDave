#!/bin/bash

d=`(date +"%Y-%m-%d")`
echo -e $d
cp life.log ${d}_life.log
cp odometer.log ${d}_odometer.log
cp wheel.log ${d}_wheel.log
cp speak.log ${d}_speak.log
cp run.log ${d}_run.log
