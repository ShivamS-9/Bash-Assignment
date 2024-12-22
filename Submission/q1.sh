#!/bin/bash

echo -n "Enter name: "
read name
echo -n "Enter DOB: "
read m y
year=$(date +%Y)
month=$(date +%m)
year=$((year - 1 - y))
year=$((year*12))
m=$((10#$m))
month=$((10#$month))
echo Hello $name, your age is $((year+12-m+month)) months
