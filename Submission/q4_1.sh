#!/bin/bash
inp=$1
out=$2
grep -v "j" $inp >> $out
